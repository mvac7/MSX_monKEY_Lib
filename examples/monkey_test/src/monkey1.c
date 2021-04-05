/* =============================================================================
  Monkey MSX Library Test 01
  Version: 1.0 (5 April 2021)
  Author: mvac7
  Architecture: MSX
  Format: ROM
  Programming language: C and Z80 assembler
  
  Requirements:
  - Small Device C Compiler (SDCC) v3.9    http://sdcc.sourceforge.net/
  - Hex2bin v2.5                           http://hex2bin.sourceforge.net/
    
History of versions:

============================================================================= */

#include "../include/newTypes.h"
#include "../include/msxBIOS.h"
#include "../include/msxSystemVars.h"

#include "../include/MONKEY_MSX.h"



#define  HALT __asm halt __endasm   //wait for the next interrupt

#define YHIDDEN  217


//  definition of functions  ---------------------------------------------------
void WAIT(uint cicles);
char INKEY();

void CLS();

void VPRINT(byte column, byte line, char* text);  //print in screen 1 or 2
void VPOKEARRAY(uint vaddr, char* text);

void LOCATE(char x, char y);
void PRINT(char* text);

char PEEK(uint address);
uint PEEKW(uint address);

void COLOR(char ink, char background, char border);
void VPOKE(unsigned int vaddr, char value);
char VPEEK(unsigned int vaddr);
void FillVRAM(unsigned int vaddr, unsigned int length, char value);
void CopyToVRAM(unsigned int addr, unsigned int vaddr, unsigned int length);

void setFont();

void setSprites8x8Patterns();
void setSprites16x16Patterns();

void showSprites();

void testSPRITES();
void testSpritePosition();





// constants  ------------------------------------------------------------------

const char text01[] = "Monkey Library Test1 ROM"; 
const char text02[] = "    v1.0 (05/April/2021)";


const char sprcol[8]={12,2,3,7,6,8,9,14};


// Cosine
// Length=255; Min=0; Max=240; Freq=1; Phase=0
const char posX[]={
0xF0,0xF0,0xF0,0xF0,0xEF,0xEF,0xEF,0xEE,0xEE,0xED,0xEC,0xEC,0xEB,0xEA,0xE9,0xE8,
0xE7,0xE6,0xE4,0xE3,0xE2,0xE0,0xDF,0xDD,0xDC,0xDA,0xD8,0xD6,0xD5,0xD3,0xD1,0xCF,
0xCD,0xCA,0xC8,0xC6,0xC4,0xC1,0xBF,0xBD,0xBA,0xB8,0xB5,0xB3,0xB0,0xAD,0xAB,0xA8,
0xA5,0xA3,0xA0,0x9D,0x9A,0x97,0x95,0x92,0x8F,0x8C,0x89,0x86,0x83,0x80,0x7D,0x7A,
0x77,0x74,0x71,0x6E,0x6B,0x69,0x66,0x63,0x60,0x5D,0x5A,0x57,0x54,0x52,0x4F,0x4C,
0x49,0x47,0x44,0x41,0x3F,0x3C,0x39,0x37,0x34,0x32,0x30,0x2D,0x2B,0x29,0x27,0x24,
0x22,0x20,0x1E,0x1C,0x1B,0x19,0x17,0x15,0x14,0x12,0x10,0x0F,0x0E,0x0C,0x0B,0x0A,
0x09,0x08,0x07,0x06,0x05,0x04,0x03,0x03,0x02,0x02,0x01,0x01,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x01,0x01,0x02,0x02,0x03,0x03,0x04,0x05,0x06,0x07,0x08,0x09,
0x0A,0x0B,0x0C,0x0E,0x0F,0x10,0x12,0x14,0x15,0x17,0x19,0x1B,0x1C,0x1E,0x20,0x22,
0x24,0x27,0x29,0x2B,0x2D,0x30,0x32,0x34,0x37,0x39,0x3C,0x3F,0x41,0x44,0x47,0x49,
0x4C,0x4F,0x52,0x54,0x57,0x5A,0x5D,0x60,0x63,0x66,0x69,0x6B,0x6E,0x71,0x74,0x77,
0x7A,0x7D,0x80,0x83,0x86,0x89,0x8C,0x8F,0x92,0x95,0x97,0x9A,0x9D,0xA0,0xA3,0xA5,
0xA8,0xAB,0xAD,0xB0,0xB3,0xB5,0xB8,0xBA,0xBD,0xBF,0xC1,0xC4,0xC6,0xC8,0xCA,0xCD,
0xCF,0xD1,0xD3,0xD5,0xD6,0xD8,0xDA,0xDC,0xDD,0xDF,0xE0,0xE2,0xE3,0xE4,0xE6,0xE7,
0xE8,0xE9,0xEA,0xEB,0xEC,0xEC,0xED,0xEE,0xEE,0xEF,0xEF,0xEF,0xF0,0xF0,0xF0,0xF0};

  
  
// Sine
// Length=255; Min=0; Max=192; Freq=1; Phase=0
const char posY[]={
0x58,0x5A,0x5C,0x5E,0x61,0x63,0x65,0x67,0x69,0x6B,0x6D,0x70,0x72,0x74,0x76,0x78,
0x7A,0x7C,0x7E,0x80,0x82,0x84,0x85,0x87,0x89,0x8B,0x8D,0x8E,0x90,0x92,0x93,0x95,
0x96,0x98,0x99,0x9B,0x9C,0x9E,0x9F,0xA0,0xA1,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,
0xA9,0xAA,0xAB,0xAC,0xAC,0xAD,0xAD,0xAE,0xAE,0xAF,0xAF,0xAF,0xB0,0xB0,0xB0,0xB0,
0xB0,0xB0,0xB0,0xB0,0xB0,0xAF,0xAF,0xAF,0xAE,0xAE,0xAD,0xAD,0xAC,0xAB,0xAB,0xAA,
0xA9,0xA8,0xA7,0xA6,0xA5,0xA4,0xA3,0xA2,0xA1,0xA0,0x9E,0x9D,0x9C,0x9A,0x99,0x97,
0x96,0x94,0x92,0x91,0x8F,0x8D,0x8C,0x8A,0x88,0x86,0x84,0x83,0x81,0x7F,0x7D,0x7B,
0x79,0x77,0x75,0x73,0x71,0x6F,0x6C,0x6A,0x68,0x66,0x64,0x62,0x60,0x5D,0x5B,0x59,
0x57,0x55,0x53,0x50,0x4E,0x4C,0x4A,0x48,0x46,0x44,0x41,0x3F,0x3D,0x3B,0x39,0x37,
0x35,0x33,0x31,0x2F,0x2D,0x2C,0x2A,0x28,0x26,0x24,0x23,0x21,0x1F,0x1E,0x1C,0x1A,
0x19,0x17,0x16,0x14,0x13,0x12,0x10,0x0F,0x0E,0x0D,0x0C,0x0B,0x0A,0x09,0x08,0x07,
0x06,0x05,0x05,0x04,0x03,0x03,0x02,0x02,0x01,0x01,0x01,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x02,0x02,0x03,0x03,0x04,0x04,0x05,0x06,0x07,
0x07,0x08,0x09,0x0A,0x0B,0x0C,0x0D,0x0F,0x10,0x11,0x12,0x14,0x15,0x17,0x18,0x1A,
0x1B,0x1D,0x1E,0x20,0x22,0x23,0x25,0x27,0x29,0x2B,0x2C,0x2E,0x30,0x32,0x34,0x36,
0x38,0x3A,0x3C,0x3E,0x40,0x43,0x45,0x47,0x49,0x4B,0x4D,0x4F,0x52,0x54,0x56,0x58};


// Functions -------------------------------------------------------------------


//
void main(void)
{
  //SCREEN(1);
  //COLOR(15,4,5);
  InitializeMonkeys();
  
__asm
  ld   HL,#0xF3B0 ;LINLEN system variable
  ld   A,#32
  ld   (HL),A     ;WIDTH(32)  
__endasm;
  

  testSPRITES();
  

   


//END --------------------------------------------------------------------------  
  
  
  
  WAIT(30*10);
  
  

//EXIT MSXDOS
/*  screen(0);
    
__asm
 	ld b,4(ix)
	ld c,#0x62
	call 5 
__endasm;*/
//end EXIT

}




/* =============================================================================
One character input (waiting)
============================================================================= */
char INKEY() __naked
{
__asm
  push IX
  ld   IX,#0
  add  IX,SP
    
  call CHGET
  
  ld   L,A
  pop  IX
  ret
__endasm;
}



// Generates a pause in the execution of n interruptions.
// PAL: 50=1second. ; NTSC: 60=1second. 
void WAIT(uint cicles)
{
  uint i;
  for(i=0;i<cicles;i++) HALT;
}


void CLS()
{
  FillVRAM (BASE5, 0x300, 32);
}


//print in screen 1 or 2
void VPRINT(byte column, byte line, char* text)
{
  uint vaddr = BASE5 + (line*32)+column; // calcula la posicion en la VRAM
  VPOKEARRAY(vaddr, text);
}



void VPOKEARRAY(uint vaddr, char* text)
{
  while(*(text)) VPOKE(vaddr++,*(text++));
}



/* =============================================================================
   Set a position the cursor in to the specified location
   Posiciona el cursor hasta la ubicacion especificada
   x(byte) - column (0 to 31 or 39)
   y(byte) - line   (0 to 23)
============================================================================= */
void LOCATE(char x, char y) __naked
{
  x;y;
__asm
  push IX
  ld   IX,#0
  add  IX,SP
  
  ld   A,4(IX) ;x
  inc  A       ;incrementa las posiciones para que se situen correctamente en la pantalla
  ld   H,A
  ld   A,5(IX) ;y
  inc  A
  ld   L,A   
  call POSIT
  
  pop  IX
  ret
__endasm;

}



/* =============================================================================
   Print a text in screen
============================================================================= */
void PRINT(char* text) __naked
{ 
  text;
__asm
  push IX
  ld   IX,#0
  add  IX,SP
  
  ld   L,4(ix)
  ld   H,5(ix)
  
nextCHAR:  
  ld   A,(HL)
  or   A
  jr   Z,ENDnext   
  call CHPUT //Displays one character (BIOS)
  inc  HL
  jr   nextCHAR
  
ENDnext:  
  pop  IX
  ret
__endasm; 
}




char PEEK(uint address) __naked
{
  address;
__asm
  push IX
  ld   IX,#0
  add  IX,SP
  
  ld   L,4(IX)
  ld   H,5(IX)
  
  ld   L,(HL)
  
  pop  IX
  ret  
__endasm;
}




uint PEEKW(uint address) __naked
{
  address;
__asm
  push IX
  ld   IX,#0
  add  IX,SP
  
  ld   L,4(ix)
  ld   H,5(ix)
  ld   E,(HL)
  inc  HL
  ld   D,(HL)
  ex   DE,HL  
  
  pop  IX
  ret  
__endasm;
}



/* =============================================================================
 COLOR
 Description: Specifies the ink, foreground and background colors. 
 Input      : [char] ink color
              [char] background color
              [char] border color
 Output     : -     
============================================================================= */
void COLOR(char ink, char background, char border) __naked
{
ink;
background; 
border;
__asm
  push IX
  ld   IX,#0
  add  IX,SP

  ld   A,4(IX)
  ld   (FORCLR),A
  
  ld   A,5(IX)
  ld   (BAKCLR),A
  
  ld   A,6(IX)
  ld   (BDRCLR),A 
  
  call CHGCLR

  pop  IX
  ret
__endasm;
}



/* =============================================================================
 VPOKE
 Description: Writes a byte to the video RAM. 
 Input      : [unsigned int] VRAM address
              [char] value
 Output     : - 
============================================================================= */
void VPOKE(unsigned int vaddr, char value) __naked
{
vaddr;
value;
__asm
  push IX
  ld   IX,#0
  add  IX,SP
  
  ld   L,4(IX)
  ld   H,5(IX)
   
  ld   A,6(IX)
  
  call WRTVRM
  
  pop  IX
  ret
__endasm;
}



/* =============================================================================
 VPEEK
 Description: Reads data from the video RAM. 
 Input      : [unsigned int] VRAM address
 Output     : [char] value
============================================================================= */ 
char VPEEK(unsigned int vaddr) __naked
{
vaddr;
__asm
  push IX
  ld   IX,#0
  add  IX,SP
  
  ld   L,4(IX)
  ld   H,5(IX) 
   
  call RDVRM
  
  ld   L,A
  
  pop  IX
  ret
__endasm;
}



/* =============================================================================
 FillVRAM                               
 Description: Fill a large area of the VRAM of the same byte.
 Input      : [unsigned int] address of VRAM
              [unsigned int] blocklength
              [char] Value to fill.
 Output     : - 
============================================================================= */
void FillVRAM(unsigned int vaddr, unsigned int length, char value) __naked
{
vaddr;
length;
value;
__asm
  push IX
  ld   IX,#0
  add  IX,SP
      
  ld   L,4(IX) ; vaddress
  ld   H,5(IX)
    
  ld   C,6(IX) ;length
  ld   B,7(IX)
    
  ld   A,8(IX) ;value
  
  call FILVRM
    
  pop  IX
  ret
__endasm;
}



/* =============================================================================
 CopyToVRAM
 Description: Block transfer from memory to VRAM 
 Input      : [unsigned int] address of RAM
              [unsigned int] address of VRAM
              [unsigned int] blocklength
 Output     : - 
============================================================================= */
void CopyToVRAM(unsigned int addr, unsigned int vaddr, unsigned int length) __naked
{
addr;
vaddr;
length;
__asm
  push IX
  ld   IX,#0
  add  IX,SP 

  ld   L,4(IX) ;ram address 
  ld   H,5(IX)
      
  ld   E,6(IX) ;VRAM address
  ld   D,7(IX)
  
  ld   C,8(IX) ;length
  ld   B,9(IX)
  
  call LDIRVM
  
  pop  IX
  ret
__endasm;
}




void setFont()
{
  uint ROMfont = PEEKW(CGTABL);

  CopyToVRAM(ROMfont,BASE7,0x800);       //MSX font pattern

  FillVRAM(BASE6,32,0xF4);           //colors

  return;
}




// TEST SPRITES  ###############################################################
void testSPRITES()
{
  char cursorLine=0;
  char key;
  
  char frame=0;
  
  uint i=0;
  char grade = 0;
  char posMonkey;
  char plane;
  
  VPRINT(0,cursorLine++, text01);
  VPRINT(0,cursorLine++, text02);
  
  //cursorLine++;
  
  VPRINT(0,cursorLine++, "-----------------Test Functions");
  
 
  
  VPRINT(0,cursorLine++, "ShowMonkey(plane,x,y,color)"); 
  showSprites();
  WAIT(100);
 
 
  VPRINT(0,cursorLine++, "UpdateMonkeyFrame(plane,frame)"); 
  for(i=0;i<20;i++)
  {
    WAIT(16);
    for(plane=0;plane<32;plane++) UpdateMonkeyFrame(plane,1);
    WAIT(16);
    for(plane=0;plane<32;plane++) UpdateMonkeyFrame(plane,0);
  }
  
  //test clear sprites data
  VPRINT(0,cursorLine++, "ClearMonkeys()");
  ClearMonkeys();
  WAIT(100);

  

  VPRINT(0,cursorLine++, "Monkeys Dancing");
  for(i=0;i<2048;i++)
  {
    HALT;    
    
    for(plane=0;plane<32;plane++)
    {
      posMonkey = grade + (plane*8);
      ShowMonkey(plane, posX[posMonkey], posY[posMonkey], 8);
      
      UpdateMonkeyFrame(plane,frame>>4);           
    }
    
    frame++;
    if (frame>31) frame = 0; 
    
    grade++;
  }
  
  
  
  
  
  cursorLine+=3;
  VPRINT(0,cursorLine, "Press any key.");
  LOCATE(14,cursorLine);
  key = INKEY();
  
  cursorLine++;
  cursorLine++;
  VPRINT(0,cursorLine,"End of the test...");

}








void showSprites()
{
  char x=0;
  char plane=0;
  char posY=0;
  
  for(plane=0;plane<32;plane++)
  {
    posY = (plane/4)*16;
    posY += 48;
    ShowMonkey(plane, x*16, posY, 8);
    x++;
    if (x>3) x=0;
  }
}








