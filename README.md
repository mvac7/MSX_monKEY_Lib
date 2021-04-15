# MSX monKEY Library

```
Author: mvac7 and Fubukimaru 
Architecture: MSX
Format: C Object (SDCC .rel)
Programming language: C and Z80 assembler
```



## Description

Welcome to the Monkeeverse.

Tired of doing the human throughout the day?

Do you have an MSX computer and your dream is to be able to make applications with pixelated monkeys?

Congratulations!

This is your library.

* You can display up to 32 monkeys on your MSX screen.
* Animate your monkeys with 2 fabulous frames.
* Ask the monkey to give you a number from 0 to 255.
* Make all the monkeys disappear with the snap of your fingers.
* And all this free! (This is open source)
* Developed by twelve monkeys from the Monkee Lab located on Monkey Island.
 
**ATTENTION!** Some of these specifications may be exaggerated or not exist. What do you expect from something made by monkeys?


```
It uses the functions from the MSX BIOS, so it is designed to create applications in ROM format.
  
Use them for developing MSX applications using Small Device C Compiler cross compiler (SDCC).

In the source code (\examples), you can find applications for testing and learning purposes.
```

[Check out the demo NOW!](https://webmsx.org/?ROM=https://github.com/mvac7/MSX_monKEY_Lib/raw/main/examples/monkey_test/bin/MONKEY1.ROM)
  
**MAKE MONKEE HAPPY!**

*Monkey Lib CEO*

  

### NOTICE No Monkeys Were Harmed in the Making of This Library.
  

## Some comments from famous monkeys

> "YOU'RE BANANAS!"  
*Monkee 2021* :monkey_face:
  

> "To be or not to be a monkey. This is the monkeequestion."  
*Prince Hamonkeelet* :monkey_face:
  

> "Be monkey, my friend."  
*Monkee Lee* :monkey_face:
  

> "YOU MANIACS! YOU BLEW IT UP!"  
*any ape* :monkey_face:
  

## History of versions

- v1.0 (4 April 2021) First version. [mona's day · Catalonia Fest] 



## Requirements

* A computer that works, if it can be, with a keyboard and a floppy drive.
* [Small Device C Compiler (SDCC) v3.9](http://sdcc.sourceforge.net/)
* [Hex2bin v2.5](http://hex2bin.sourceforge.net/) 
* Some [Fr3eL Libraries](https://github.com/mvac7/SDCC_MSX_fR3eL)
* Time to do crazy things.
* Many bananas.



## Functions

* void **InitializeMonkeys()** - *Start the Monkeys' World - Set Screen 1 with 16x16 sprites and write monkey sprite patterns to VRAM.*
* void **ClearMonkeys()** - *The monkeys go off the screen.
* void **ShowMonkey(char monkey, char x, char y, char color)** - *Display one monkey.*
* void **UpdateMonkeyFrame(char monkey, char frame)** - *Give life to the monkey! (monkey=0-31;frame=0-1)*
* char **GiveMeANumber()** - *Ask a monkey for a number.*


## How to use ... whatever this is!

Sorry for the inconvenience.

Right now we have infinite monkeys typing this tutorial.

We hope they can have it, before the apes take over the planet.

```
8KZPNcPJvvW2tTaSaBQduaBD1Qb3FvNH5RRvMft9QmdY245L99XvHuCIC6qq8Ajps5ux3cQAdbaYBnC6
S5XmVbfaQax6mJVW7hqZQBanN4naS0GLjhe0IFCKauq1Yc8bVztMSUvHivsH7IiJgNB5OUzb5Ku8P02I
bnu0CmX15iFzvbhExGZcQxWc3zZfzg937ListubC6Q9odO0IziJkh3BlfbMqytz0fu8Uk1m4RU0011RR
P9E0Oy3V9cISbN78Be4qlj9fUkKYsSGCge0RXeQHEYdC0EnNyejzoUCMUGhjkJEEGfjWInykAwI4Lbb4
EAAzY0zfNUUwaQndDHUejnBnwJv1yejY0Zn8lpZwMelUVO3Ofquk02aCK5tEauto0dYT3E71UjhzmQQR
gbdl1HJLhUoXamiGaaaaaHuk3DTVXucfgrl02GPFE5GKpAlv2jPp9t6PCqeTZZR6lQvsAddeqF50KyeU
sBDoC0t7GYuEQoOy17yMKn1Vhrc2eaFksF9J172CAWB8VVTF0gotomNMME4zWhDxauXWDl9IzzwZNQv3
vnsd6U2rGFNHSYtgB0GN61C5E7u1p7032bN2OC6GAEQVrPOZIMBQVjdlIuHi7ZoobUODbt8kEN4WSujq
we8eyZZkkjM8qCD2leiQI2cEidafPyL7RR5CoD8VYEdCn3DSJmZUcfmrKFHk2HjbnsxLO6NnOjWMubL7
UPgpn7pJRdAkAcolorblURYRbbM4k1hazT3tvvitt3r08mbW4bPcYYZFet0NUvVyq8bAPikbKql1ZaAY
9NrnSUYY4pm1r8m207YFpP9IO9AOWjpfx4MnSRf69tk5MLvCT0l8lDgIJm90TwkaNMiQzJ4ylJyGWp6S
36GRxr3ktGHPxOk430dGTSozsYcRc2sNNZSY2DCpF6BkUvHT1vMFYQfAkt0a5opEEOrDpW8sTLaggPml
tnaje3nBJmW0Q2VLIpifM9mwrat2WwKOWgJucuDWOuh7fQD4zycwSKf8pXP08RZiLZb6bUzbDfJ6ZPvA
xyz8OnggHH6DVUvdjGhwqZC3m3kfpfQmHRB9dQj7gYOmSXHFEhRHDp1sFOffhE4hk0rgWab358mhZTXA
9f0ZBwhx9IASLBDUYEPl08bC4MqcJNtVkOYz7avAU9ixxSVuJD6aV3208FYcqDoh01tZ9gr5lPn4eXsM
hiTMSyd0Bn9iIMsxAgR8EUcG98iowUh3giVeMEANumb3rRPTNeSadkAZzm5FIM9ihDuKh9yOrunGOkgQ
tZMPMrxlKcTnZ59uvET93eVFOvi816NFzRR99d366nVAyLsX70l9r1Wbj9d8ftsKSZPsEmCZDiE50v5n
WEElMxk31VF0iI87vS9KuGTfutQaYbHgAx4CVEn1lug4rdet0kiodecUyon0mbr3n0kieR0ac0rd4rm3
v0idm4in(){InitializeeMonkeys(())))));;
```
