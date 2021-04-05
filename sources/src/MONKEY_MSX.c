/* ============================================================================= 
  MSX monKEY Library
  Version: 1.0 (05/April/2021)
  Authors: mvac7 and Fubukimaru 
  Architecture: MSX
  Format: C Object (SDCC .rel)
  Programming language: C and Z80 assembler

  Description:
    Open Source library with functions for show up to 32 monkeys in the scrren. 
    
    It uses the functions from the MSX BIOS, so it is designed to create 
    applications in ROM format.
    
  Requirements:
  - Small Device C Compiler (SDCC) v3.9    http://sdcc.sourceforge.net/
  - Hex2bin v2.5                           http://hex2bin.sourceforge.net/
    
  History of versions:
    v1.0 (05/April/2021) First version.         
============================================================================= */ 

#include "../include/MONKEY_MSX.h"

#include "../include/msxSystemVars.h"
#include "../include/msxBIOS.h"


#define  YHIDDEN  0xD1  // concealment of the sprite outside the limits of the screen in TMS9918A modes 


char  SEED;


/* =============================================================================
 InitializeMonkeys
 Description: 
             Start the Monkey's World
             Set Screen 1 with 16x16 sprites and write monkey sprite patterns
             to VRAM.
 Input:       -
 Output:      -
============================================================================= */
void InitializeMonkeys() __naked
{
__asm
  push IX
  ld   A,#1  ;SCREEN 1 
  call CHGMOD
  
  ld   HL,#RG1SAV ; --- read vdp(1) from mem
  ld   B,(HL)
  set  1,B ; 16x16
  ld   C,#0x01
  call WRTVDP
  
  ld   HL,#MONKEY_SPRITES      
  ld   DE,#BASE9                 
  ld   BC,#96  
  call LDIRVM
  

  pop  IX
  ret
  
; SpriteSet Pattern Data - Size:16x16
; Sprite range: 0 to 2
; Size= 96
MONKEY_SPRITES:
.db 0x00,0x30,0x70,0x41,0x62,0x63,0x7F,0x3F,0x07,0x07,0x07,0x0F,0x0F,0x0E,0x06,0x1E
.db 0x00,0x00,0x00,0xC0,0x20,0x7C,0x7E,0xE6,0xE6,0xE2,0xE6,0xF0,0xF8,0x18,0x1E,0x00
.db 0x30,0x70,0x40,0x61,0x62,0x7F,0x3F,0x07,0x07,0x07,0x07,0x0F,0x1F,0x18,0x38,0x00
.db 0x00,0x00,0x00,0xC0,0x20,0x60,0x7C,0xFE,0xE6,0xE6,0xE2,0xF6,0xF0,0x70,0x60,0x78
.db 0x40,0xC0,0xC0,0xE0,0x70,0x30,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
.db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

__endasm;
}



/* =============================================================================
 ClearMonkeys
 Description: 
             The monkeys go off screen.
             Initialises all sprite data The sprite pattern is cleared to
             null, the sprite number to the sprite plane number, the
             sprite colour to the foregtound colour. The vertical location
             of the sprite is set to 209 (mode 0 to 3) or 217 (mode 4 to 8).
 Input:       -
 Output:      -
============================================================================= */
void ClearMonkeys() __naked
{
__asm
  push IX
  
;call CLRSPR

  ld   HL,#BASE8


  ld   B,#32
loop_ClearOAM:
  ld   A,#YHIDDEN 
  call WRTVRM 

  inc  HL
  inc  HL  
  inc  HL 
  inc  HL 
  
  djnz loop_ClearOAM


  pop  IX
  ret
__endasm;
}    



/* =============================================================================
 ShowMonkey
 Description: Display a monkey
 Input:       [char] monkey plane (0-31) 
              [char] x 
              [char] y
              [char] color (0-15)
 Output:      -
============================================================================= */
void ShowMonkey(char monkey, char x, char y, char color) __naked
{
monkey;x;y;color;
__asm
  push IX
  ld   IX,#0
  add  IX,SP

  ld   A,4(IX) ;monkey video-plane
  call CALATR
  
  ld   A,6(IX) ;y
  call WRTVRM
  
  inc  HL  
  ld   A,5(IX) ;x
  call WRTVRM
  
  inc  HL  
  ld   A,#0
  call WRTVRM  ;pattern
  
  inc  HL
  ld   A,7(IX) ;color
  call WRTVRM
  
  pop  IX
  ret
  


; set sprite pattern number
; Multiply * 4 when its a 16x16 sprite.
; E - Sprite Number  
;SPRPATNOV:  ;sprite pattern no calc vram address
;  call GSPSIZ          ;0x008A get sprite size in bytes 
;  cp   #32             ;16x16
;  jr   NZ,WRTPAT

  ;IF 16x16
;  SLA  E
;  SLA  E ;multiply x 4  

;WRTPAT:
;  LD   A,E
;  JP   WRTVRM
  
__endasm;
}



//void ShowRandomMonkey(char monkey)
//void ShowCrazyMonkey(char monkey)



/* =============================================================================
 UpdateMonkeyFrame
 Description: 
              Give life to the monkey!
 Input:       [char] monkey plane (0-31) 
              [char] monkey frame (0-1)
 Output:      -
============================================================================= */
void UpdateMonkeyFrame(char monkey, char frame) __naked
{
monkey;frame;
__asm
  push IX
  ld   IX,#0
  add  IX,SP

  ld   A,4(IX) ;monkey video-plane
  call CALATR
  
  inc  HL  
  inc  HL
    
  ld   A,5(IX)
  SLA  A
  SLA  A
  call WRTVRM  ;pattern
  
  
  pop  IX
  ret
__endasm;
}



/* =============================================================================
 GiveMeANumber
 Description: 
              Ask a monkey for a number
 Input:       [char] monkey plane (0-31) 
              [char] monkey frame (0-1)
 Output:      -
============================================================================= */  
char GiveMeANumber() __naked
{
__asm
  push IX
  ld   IX,#0
  add  IX,SP
  
  call RANDOM
  ld   L,A
  
  pop  IX
  ret   


RANDOM:  
  ld   A,(_SEED)
  
  SRA  A  

  add	 A,A
  add	 A,A
	
  ld   B,A	
  ld   A,R
  add  A,B

  inc  A 
    
  and  C  ;aplica la mascara     
  
  ld   (_SEED),A
   
  ret
__endasm;
}


