# MSX monKEY Library

```
Author: mvac7 and Fubukimaru 
Architecture: MSX
Format: C Object (SDCC .rel)
Programming language: C and Z80 assembler
```



## Description

> "YOU'RE BANANAS!"
- Monkee 2021

Open Source library with functions for showing up to 32 monkeys in the screen.

It uses the functions from the MSX BIOS, so it is designed to create applications in ROM format.
  
Use them for developing MSX applications using [Small Device C Compiler (SDCC)](http://sdcc.sourceforge.net/) cross compiler.

In the source code (\examples), you can find applications for testing and learning purposes.
[Check out the demo NOW!](https://webmsx.org/?ROM=https://github.com/mvac7/MSX_monKEY_Lib/raw/main/examples/monkey_test/bin/MONKEY1.ROM)

Enjoy it!

MAKE MONKEE HAPPY



## History of versions

- v1.0 (4 April 2021) First version. [mona's day · Catalonia Fest] 



## Requirements

* Small Device C Compiler (SDCC) v3.9 http://sdcc.sourceforge.net/
* Hex2bin v2.5 http://hex2bin.sourceforge.net/ 




## Functions

* void **InitializeMonkeys**() - Start the Monkeys' World - Set Screen 1 with 16x16 sprites and write monkey sprite patterns to VRAM.
* void **ClearMonkeys**() - The monkeys go off the screen.
* void **ShowMonkey**(char monkey, char x, char y, char color) - Display one monkey.
* void **UpdateMonkeyFrame**(char monkey, char frame) - Give life to the monkey! (monkey=0-31;frame=0-1)
* char **GiveMeANumber**() - Ask a monkey for a number.
