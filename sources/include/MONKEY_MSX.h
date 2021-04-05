/* ============================================================================= 
  MONKEY MSX Library
  Version: 1.0 (05/April/2021)
  Authors: mvac7 and Fubukimaru 
============================================================================= */

#ifndef  __MONKEY_MSX_H__
#define  __MONKEY_MSX_H__


// boolean
#ifndef _BOOLEAN
#define _BOOLEAN
  typedef enum {false = 0, true = 1} boolean;
#endif

// VRAM address tables screen 1 TXT32
#define BASE5 0x1800 // base 5 name table
#define BASE6 0x2000 // base 6 color table
#define BASE7 0x0000 // base 7 character pattern table
#define BASE8 0x1B00 // base 8 sprite attribute table
#define BASE9 0x3800 // base 9 sprite pattern table




/* =============================================================================
 InitializeMonkeys
 Description: 
             Start the Monkey's World
             Set Screen 1 with 16x16 sprites and write monkey sprite patterns
             to VRAM.
 Input:       -
 Output:      -
============================================================================= */
void InitializeMonkeys();



/* =============================================================================
 ClearMonkeys
 Description: 
             The monkeys go off the screen.
             Initialises all sprite data The sprite pattern is cleared to
             null, the sprite number to the sprite plane number, the
             sprite colour to the foregtound colour. The vertical location
             of the sprite is set to 209 (mode 0 to 3) or 217 (mode 4 to 8).
 Input:       -
 Output:      -
============================================================================= */
void ClearMonkeys();



/* =============================================================================
 ShowMonkey
 Description: Display one monkey
 Input:       [char] monkey plane (0-31) 
              [char] x 
              [char] y
              [char] color (0-15)
 Output:      -
============================================================================= */
void ShowMonkey(char monkey, char x, char y, char color);



//void ShowRandomMonkey(char monkey);
//void ShowCrazyMonkey(char monkey);



/* =============================================================================
 UpdateMonkeyFrame
 Description: 
              Give life to the monkey!
 Input:       [char] monkey plane (0-31) 
              [char] monkey frame (0-1)
 Output:      -
============================================================================= */
void UpdateMonkeyFrame(char monkey, char frame);




/* =============================================================================
 GiveMeANumber
 Description: 
              Ask a monkey for a number
 Input:       [char] monkey plane (0-31) 
              [char] monkey frame (0-1)
 Output:      -
============================================================================= */  
char GiveMeANumber();



#endif