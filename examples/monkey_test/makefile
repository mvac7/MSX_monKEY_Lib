# REM MAKEFILE for 8/16K ROMs using SDCC compiler
# REM CFILENAME = Source name without extension
# REM ROMFILENAME = ROM file name without extension
# REM ROMSIZE = 2000 for 8KBytes ROM or 4000 for 16KBytes ROM
CFILENAME=monkey1
ROMFILENAME=MONKEY1
CODELOC=0x4020
ROMSIZE=2000
CRT=libs/crt_MSX816kROM4000.rel
LIB0=libs/MONKEY_MSX.rel
LIB1=
LIB2=
LIB3=
LIB4=
LIB5=
LIB6=
LIB7=
LIB8=
LIB9=
LIB10=
LIB11=
LIB12=

bin/MONKEY1.ROM:
	mkdir -p build
	mkdir -p bin
	rm -f build/$(CFILENAME).ihx

	sdcc -mz80 -o build/ --code-loc $(CODELOC) --data-loc 0xC000 --use-stdout --no-std-crt0 $(CRT) $(LIB0) $(LIB1) $(LIB2) $(LIB3) $(LIB4) $(LIB5) $(LIB6) $(LIB7) $(LIB8) $(LIB9) $(LIB10) $(LIB11) $(LIB12) src/$(CFILENAME).c

	hex2bin -e bin -l $(ROMSIZE) build/$(CFILENAME).ihx
	cp build/$(CFILENAME).bin bin/$(ROMFILENAME).ROM

clean: bin/MONKEY1.ROM
	rm -f bin/MONKEY1.ROM
	rm -f build/monkey*
