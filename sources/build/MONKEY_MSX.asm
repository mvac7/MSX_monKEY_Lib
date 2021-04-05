;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (MINGW64)
;--------------------------------------------------------
	.module MONKEY_MSX
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SEED
	.globl _InitializeMonkeys
	.globl _ClearMonkeys
	.globl _ShowMonkey
	.globl _UpdateMonkeyFrame
	.globl _GiveMeANumber
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_SEED::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src\MONKEY_MSX.c:44: void InitializeMonkeys() __naked
;	---------------------------------
; Function InitializeMonkeys
; ---------------------------------
_InitializeMonkeys::
;src\MONKEY_MSX.c:77: __endasm;
	push	IX
	ld	A,#1 ;SCREEN 1
	call	0x005F
	ld	HL,#0xF3E0 ; --- read vdp(1) from mem
	ld	B,(HL)
	set	1,B ; 16x16
	ld	C,#0x01
	call	0x0047
	ld	HL,#MONKEY_SPRITES
	ld	DE,#0x3800
	ld	BC,#96
	call	0x005C
	pop	IX
	ret
;	SpriteSet Pattern Data - Size:16x16
;	Sprite range: 0 to 2
;	Size= 96
	MONKEY_SPRITES:
	.db	0x00,0x30,0x70,0x41,0x62,0x63,0x7F,0x3F,0x07,0x07,0x07,0x0F,0x0F,0x0E,0x06,0x1E
	.db	0x00,0x00,0x00,0xC0,0x20,0x7C,0x7E,0xE6,0xE6,0xE2,0xE6,0xF0,0xF8,0x18,0x1E,0x00
	.db	0x30,0x70,0x40,0x61,0x62,0x7F,0x3F,0x07,0x07,0x07,0x07,0x0F,0x1F,0x18,0x38,0x00
	.db	0x00,0x00,0x00,0xC0,0x20,0x60,0x7C,0xFE,0xE6,0xE6,0xE2,0xF6,0xF0,0x70,0x60,0x78
	.db	0x40,0xC0,0xC0,0xE0,0x70,0x30,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.db	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
;src\MONKEY_MSX.c:78: }
;src\MONKEY_MSX.c:93: void ClearMonkeys() __naked
;	---------------------------------
; Function ClearMonkeys
; ---------------------------------
_ClearMonkeys::
;src\MONKEY_MSX.c:118: __endasm;
	push	IX
;call	0x0069
	ld	HL,#0x1B00
	ld	B,#32
	loop_ClearOAM:
	ld	A,#0xD1
	call	0x004D
	inc	HL
	inc	HL
	inc	HL
	inc	HL
	djnz	loop_ClearOAM
	pop	IX
	ret
;src\MONKEY_MSX.c:119: }    
;src\MONKEY_MSX.c:132: void ShowMonkey(char monkey, char x, char y, char color) __naked
;	---------------------------------
; Function ShowMonkey
; ---------------------------------
_ShowMonkey::
;src\MONKEY_MSX.c:179: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	A,4(IX) ;monkey video-plane
	call	0x0087
	ld	A,6(IX) ;y
	call	0x004D
	inc	HL
	ld	A,5(IX) ;x
	call	0x004D
	inc	HL
	ld	A,#0
	call	0x004D ;pattern
	inc	HL
	ld	A,7(IX) ;color
	call	0x004D
	pop	IX
	ret
;	set sprite pattern number
;	Multiply * 4 when its a 16x16 sprite.
;	E - Sprite Number
;SPRPATNOV:	;sprite pattern no calc vram address
;	call 0x008A ;0x008A get sprite size in bytes
;	cp #32 ;16x16
;	jr NZ,WRTPAT
;IF	16x16
;	SLA E
;	SLA E ;multiply x 4
;WRTPAT:
;	LD A,E
;	JP 0x004D
;src\MONKEY_MSX.c:180: }
;src\MONKEY_MSX.c:184: void UpdateMonkeyFrame(char monkey, char frame) __naked
;	---------------------------------
; Function UpdateMonkeyFrame
; ---------------------------------
_UpdateMonkeyFrame::
;src\MONKEY_MSX.c:206: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	A,4(IX) ;monkey video-plane
	call	0x0087
	inc	HL
	inc	HL
	ld	A,5(IX)
	SLA	A
	SLA	A
	call	0x004D ;pattern
	pop	IX
	ret
;src\MONKEY_MSX.c:207: }
;src\MONKEY_MSX.c:212: char GiveMeANumber() __naked
;	---------------------------------
; Function GiveMeANumber
; ---------------------------------
_GiveMeANumber::
;src\MONKEY_MSX.c:245: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	call	RANDOM
	ld	L,A
	pop	IX
	ret
	RANDOM:
	ld	A,(_SEED)
	SRA	A
	add	A,A
	add	A,A
	ld	B,A
	ld	A,R
	add	A,B
	inc	A
	and	C ;aplica la mascara
	ld	(_SEED),A
	ret
;src\MONKEY_MSX.c:246: }
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
