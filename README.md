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



**NOTICE** `No Monkeys Were Harmed in the Making of This Library.`


## Some comments from famous monkeys

> "YOU'RE BANANAS!"
- Monkee 2021 :monkey_face:

> "To be or not to be a monkey. This is the monkeequestion."
- Prince Hamonkeylet :monkey_face:

> "Be monkey, my friend." 
- Monkee Lee :monkey_face:


## History of versions

- v1.0 (4 April 2021) First version. [mona's day · Catalonia Fest] 



## Requirements

* A computer that works, if it can be, with a keyboard and a floppy drive.
* [Small Device C Compiler (SDCC) v3.9](http://sdcc.sourceforge.net/)
* [Hex2bin v2.5](http://hex2bin.sourceforge.net/) 
* Some [Fr3eL Libraries](https://github.com/mvac7/SDCC_MSX_fR3eL)
* Being diagnosed with [Peter Pan syndrome](https://en.wikipedia.org/wiki/Peter_Pan_syndrome).
* Time to do crazy things.
* Many bananas.



## Functions

* void **InitializeMonkeys**() - Start the Monkeys' World - Set Screen 1 with 16x16 sprites and write monkey sprite patterns to VRAM.
* void **ClearMonkeys**() - The monkeys go off the screen.
* void **ShowMonkey**(char monkey, char x, char y, char color) - Display one monkey.
* void **UpdateMonkeyFrame**(char monkey, char frame) - Give life to the monkey! (monkey=0-31;frame=0-1)
* char **GiveMeANumber**() - Ask a monkey for a number.


## How to use ... whatever this is!

Sorry for the inconvenience.

Right now we have infinite monkeys typing this tutorial.

We hope they can have it, before the apes take over the planet.

nyImYqtDamwLkOBiGeMJzFDhwGyzsNKnxZGweLKdnhvFkUMNMKuJQMNJgNUGEGrLxiFvjKxoqRg0ubuF
OMmrTdQIDScoPykshIjRXUdGyCVWnbFwUNaUDLAltzGBjfKAAWQyTNrhuGvnpvbpGQAabWlGJLBlfEAx
yTstdlobYMMGwzeMonkeyZNVruPpUpkVAAqgnqGMIOvBDiTWhuhJvOKbLGgethYrMSKzySgBPDERancv
qNJxJoRVSgdnMWSTxxXQguKWdNjNubGabuDWFuppVMrzQgpRVPjSyjjasYQxrrqlqhggQnvZYiCEWaim
SQfcEMxTYrMDblPpCWqklCoNAdxjBmXWEVbbananaszzBBSkPgbJeNxXnzMRglkBHtYZGbvrENKtlZhR
aPEsTdLzhtmaXLdPmolYhJclBUpiscgjYnRloVRvmnZqoFwNdyLruOZuKrRwagtnJKNhskKQZmHJudzb
jwncesNIaFRABBHpDhIlhfOnQzpoYDHZwYnTMXrRHroTZYmVIMYwwHrxSwewkoqgmgmOkiSulzQyWfNx
