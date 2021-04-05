;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (MINGW64)
;--------------------------------------------------------
	.module monkey1
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _UpdateMonkeyFrame
	.globl _ShowMonkey
	.globl _ClearMonkeys
	.globl _InitializeMonkeys
	.globl _posY
	.globl _posX
	.globl _sprcol
	.globl _text02
	.globl _text01
	.globl _INKEY
	.globl _WAIT
	.globl _CLS
	.globl _VPRINT
	.globl _VPOKEARRAY
	.globl _LOCATE
	.globl _PRINT
	.globl _PEEK
	.globl _PEEKW
	.globl _COLOR
	.globl _VPOKE
	.globl _VPEEK
	.globl _FillVRAM
	.globl _CopyToVRAM
	.globl _setFont
	.globl _testSPRITES
	.globl _showSprites
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;src\monkey1.c:121: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src\monkey1.c:125: InitializeMonkeys();
	call	_InitializeMonkeys
;src\monkey1.c:131: __endasm;
	ld	HL,#0xF3B0 ;0xF3B0 system variable
	ld	A,#32
	ld	(HL),A ;WIDTH(32)
;src\monkey1.c:134: testSPRITES();
	call	_testSPRITES
;src\monkey1.c:144: WAIT(30*10);
	ld	hl, #0x012c
	push	hl
	call	_WAIT
	pop	af
;src\monkey1.c:158: }
	ret
_text01:
	.ascii "Monkey Library Test1 ROM"
	.db 0x00
_text02:
	.ascii "    v1.0 (05/April/2021)"
	.db 0x00
_sprcol:
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0e	; 14
_posX:
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xed	; 237
	.db #0xec	; 236
	.db #0xec	; 236
	.db #0xeb	; 235
	.db #0xea	; 234
	.db #0xe9	; 233
	.db #0xe8	; 232
	.db #0xe7	; 231
	.db #0xe6	; 230
	.db #0xe4	; 228
	.db #0xe3	; 227
	.db #0xe2	; 226
	.db #0xe0	; 224
	.db #0xdf	; 223
	.db #0xdd	; 221
	.db #0xdc	; 220
	.db #0xda	; 218
	.db #0xd8	; 216
	.db #0xd6	; 214
	.db #0xd5	; 213
	.db #0xd3	; 211
	.db #0xd1	; 209
	.db #0xcf	; 207
	.db #0xcd	; 205
	.db #0xca	; 202
	.db #0xc8	; 200
	.db #0xc6	; 198
	.db #0xc4	; 196
	.db #0xc1	; 193
	.db #0xbf	; 191
	.db #0xbd	; 189
	.db #0xba	; 186
	.db #0xb8	; 184
	.db #0xb5	; 181
	.db #0xb3	; 179
	.db #0xb0	; 176
	.db #0xad	; 173
	.db #0xab	; 171
	.db #0xa8	; 168
	.db #0xa5	; 165
	.db #0xa3	; 163
	.db #0xa0	; 160
	.db #0x9d	; 157
	.db #0x9a	; 154
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x8f	; 143
	.db #0x8c	; 140
	.db #0x89	; 137
	.db #0x86	; 134
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x7d	; 125
	.db #0x7a	; 122	'z'
	.db #0x77	; 119	'w'
	.db #0x74	; 116	't'
	.db #0x71	; 113	'q'
	.db #0x6e	; 110	'n'
	.db #0x6b	; 107	'k'
	.db #0x69	; 105	'i'
	.db #0x66	; 102	'f'
	.db #0x63	; 99	'c'
	.db #0x60	; 96
	.db #0x5d	; 93
	.db #0x5a	; 90	'Z'
	.db #0x57	; 87	'W'
	.db #0x54	; 84	'T'
	.db #0x52	; 82	'R'
	.db #0x4f	; 79	'O'
	.db #0x4c	; 76	'L'
	.db #0x49	; 73	'I'
	.db #0x47	; 71	'G'
	.db #0x44	; 68	'D'
	.db #0x41	; 65	'A'
	.db #0x3f	; 63
	.db #0x3c	; 60
	.db #0x39	; 57	'9'
	.db #0x37	; 55	'7'
	.db #0x34	; 52	'4'
	.db #0x32	; 50	'2'
	.db #0x30	; 48	'0'
	.db #0x2d	; 45
	.db #0x2b	; 43
	.db #0x29	; 41
	.db #0x27	; 39
	.db #0x24	; 36
	.db #0x22	; 34
	.db #0x20	; 32
	.db #0x1e	; 30
	.db #0x1c	; 28
	.db #0x1b	; 27
	.db #0x19	; 25
	.db #0x17	; 23
	.db #0x15	; 21
	.db #0x14	; 20
	.db #0x12	; 18
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0x0b	; 11
	.db #0x0a	; 10
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x12	; 18
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x17	; 23
	.db #0x19	; 25
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1e	; 30
	.db #0x20	; 32
	.db #0x22	; 34
	.db #0x24	; 36
	.db #0x27	; 39
	.db #0x29	; 41
	.db #0x2b	; 43
	.db #0x2d	; 45
	.db #0x30	; 48	'0'
	.db #0x32	; 50	'2'
	.db #0x34	; 52	'4'
	.db #0x37	; 55	'7'
	.db #0x39	; 57	'9'
	.db #0x3c	; 60
	.db #0x3f	; 63
	.db #0x41	; 65	'A'
	.db #0x44	; 68	'D'
	.db #0x47	; 71	'G'
	.db #0x49	; 73	'I'
	.db #0x4c	; 76	'L'
	.db #0x4f	; 79	'O'
	.db #0x52	; 82	'R'
	.db #0x54	; 84	'T'
	.db #0x57	; 87	'W'
	.db #0x5a	; 90	'Z'
	.db #0x5d	; 93
	.db #0x60	; 96
	.db #0x63	; 99	'c'
	.db #0x66	; 102	'f'
	.db #0x69	; 105	'i'
	.db #0x6b	; 107	'k'
	.db #0x6e	; 110	'n'
	.db #0x71	; 113	'q'
	.db #0x74	; 116	't'
	.db #0x77	; 119	'w'
	.db #0x7a	; 122	'z'
	.db #0x7d	; 125
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x86	; 134
	.db #0x89	; 137
	.db #0x8c	; 140
	.db #0x8f	; 143
	.db #0x92	; 146
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x9a	; 154
	.db #0x9d	; 157
	.db #0xa0	; 160
	.db #0xa3	; 163
	.db #0xa5	; 165
	.db #0xa8	; 168
	.db #0xab	; 171
	.db #0xad	; 173
	.db #0xb0	; 176
	.db #0xb3	; 179
	.db #0xb5	; 181
	.db #0xb8	; 184
	.db #0xba	; 186
	.db #0xbd	; 189
	.db #0xbf	; 191
	.db #0xc1	; 193
	.db #0xc4	; 196
	.db #0xc6	; 198
	.db #0xc8	; 200
	.db #0xca	; 202
	.db #0xcd	; 205
	.db #0xcf	; 207
	.db #0xd1	; 209
	.db #0xd3	; 211
	.db #0xd5	; 213
	.db #0xd6	; 214
	.db #0xd8	; 216
	.db #0xda	; 218
	.db #0xdc	; 220
	.db #0xdd	; 221
	.db #0xdf	; 223
	.db #0xe0	; 224
	.db #0xe2	; 226
	.db #0xe3	; 227
	.db #0xe4	; 228
	.db #0xe6	; 230
	.db #0xe7	; 231
	.db #0xe8	; 232
	.db #0xe9	; 233
	.db #0xea	; 234
	.db #0xeb	; 235
	.db #0xec	; 236
	.db #0xec	; 236
	.db #0xed	; 237
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
_posY:
	.db #0x58	; 88	'X'
	.db #0x5a	; 90	'Z'
	.db #0x5c	; 92
	.db #0x5e	; 94
	.db #0x61	; 97	'a'
	.db #0x63	; 99	'c'
	.db #0x65	; 101	'e'
	.db #0x67	; 103	'g'
	.db #0x69	; 105	'i'
	.db #0x6b	; 107	'k'
	.db #0x6d	; 109	'm'
	.db #0x70	; 112	'p'
	.db #0x72	; 114	'r'
	.db #0x74	; 116	't'
	.db #0x76	; 118	'v'
	.db #0x78	; 120	'x'
	.db #0x7a	; 122	'z'
	.db #0x7c	; 124
	.db #0x7e	; 126
	.db #0x80	; 128
	.db #0x82	; 130
	.db #0x84	; 132
	.db #0x85	; 133
	.db #0x87	; 135
	.db #0x89	; 137
	.db #0x8b	; 139
	.db #0x8d	; 141
	.db #0x8e	; 142
	.db #0x90	; 144
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x96	; 150
	.db #0x98	; 152
	.db #0x99	; 153
	.db #0x9b	; 155
	.db #0x9c	; 156
	.db #0x9e	; 158
	.db #0x9f	; 159
	.db #0xa0	; 160
	.db #0xa1	; 161
	.db #0xa3	; 163
	.db #0xa4	; 164
	.db #0xa5	; 165
	.db #0xa6	; 166
	.db #0xa7	; 167
	.db #0xa8	; 168
	.db #0xa9	; 169
	.db #0xa9	; 169
	.db #0xaa	; 170
	.db #0xab	; 171
	.db #0xac	; 172
	.db #0xac	; 172
	.db #0xad	; 173
	.db #0xad	; 173
	.db #0xae	; 174
	.db #0xae	; 174
	.db #0xaf	; 175
	.db #0xaf	; 175
	.db #0xaf	; 175
	.db #0xb0	; 176
	.db #0xb0	; 176
	.db #0xb0	; 176
	.db #0xb0	; 176
	.db #0xb0	; 176
	.db #0xb0	; 176
	.db #0xb0	; 176
	.db #0xb0	; 176
	.db #0xb0	; 176
	.db #0xaf	; 175
	.db #0xaf	; 175
	.db #0xaf	; 175
	.db #0xae	; 174
	.db #0xae	; 174
	.db #0xad	; 173
	.db #0xad	; 173
	.db #0xac	; 172
	.db #0xab	; 171
	.db #0xab	; 171
	.db #0xaa	; 170
	.db #0xa9	; 169
	.db #0xa8	; 168
	.db #0xa7	; 167
	.db #0xa6	; 166
	.db #0xa5	; 165
	.db #0xa4	; 164
	.db #0xa3	; 163
	.db #0xa2	; 162
	.db #0xa1	; 161
	.db #0xa0	; 160
	.db #0x9e	; 158
	.db #0x9d	; 157
	.db #0x9c	; 156
	.db #0x9a	; 154
	.db #0x99	; 153
	.db #0x97	; 151
	.db #0x96	; 150
	.db #0x94	; 148
	.db #0x92	; 146
	.db #0x91	; 145
	.db #0x8f	; 143
	.db #0x8d	; 141
	.db #0x8c	; 140
	.db #0x8a	; 138
	.db #0x88	; 136
	.db #0x86	; 134
	.db #0x84	; 132
	.db #0x83	; 131
	.db #0x81	; 129
	.db #0x7f	; 127
	.db #0x7d	; 125
	.db #0x7b	; 123
	.db #0x79	; 121	'y'
	.db #0x77	; 119	'w'
	.db #0x75	; 117	'u'
	.db #0x73	; 115	's'
	.db #0x71	; 113	'q'
	.db #0x6f	; 111	'o'
	.db #0x6c	; 108	'l'
	.db #0x6a	; 106	'j'
	.db #0x68	; 104	'h'
	.db #0x66	; 102	'f'
	.db #0x64	; 100	'd'
	.db #0x62	; 98	'b'
	.db #0x60	; 96
	.db #0x5d	; 93
	.db #0x5b	; 91
	.db #0x59	; 89	'Y'
	.db #0x57	; 87	'W'
	.db #0x55	; 85	'U'
	.db #0x53	; 83	'S'
	.db #0x50	; 80	'P'
	.db #0x4e	; 78	'N'
	.db #0x4c	; 76	'L'
	.db #0x4a	; 74	'J'
	.db #0x48	; 72	'H'
	.db #0x46	; 70	'F'
	.db #0x44	; 68	'D'
	.db #0x41	; 65	'A'
	.db #0x3f	; 63
	.db #0x3d	; 61
	.db #0x3b	; 59
	.db #0x39	; 57	'9'
	.db #0x37	; 55	'7'
	.db #0x35	; 53	'5'
	.db #0x33	; 51	'3'
	.db #0x31	; 49	'1'
	.db #0x2f	; 47
	.db #0x2d	; 45
	.db #0x2c	; 44
	.db #0x2a	; 42
	.db #0x28	; 40
	.db #0x26	; 38
	.db #0x24	; 36
	.db #0x23	; 35
	.db #0x21	; 33
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x1c	; 28
	.db #0x1a	; 26
	.db #0x19	; 25
	.db #0x17	; 23
	.db #0x16	; 22
	.db #0x14	; 20
	.db #0x13	; 19
	.db #0x12	; 18
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x0d	; 13
	.db #0x0c	; 12
	.db #0x0b	; 11
	.db #0x0a	; 10
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x20	; 32
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x29	; 41
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2e	; 46
	.db #0x30	; 48	'0'
	.db #0x32	; 50	'2'
	.db #0x34	; 52	'4'
	.db #0x36	; 54	'6'
	.db #0x38	; 56	'8'
	.db #0x3a	; 58
	.db #0x3c	; 60
	.db #0x3e	; 62
	.db #0x40	; 64
	.db #0x43	; 67	'C'
	.db #0x45	; 69	'E'
	.db #0x47	; 71	'G'
	.db #0x49	; 73	'I'
	.db #0x4b	; 75	'K'
	.db #0x4d	; 77	'M'
	.db #0x4f	; 79	'O'
	.db #0x52	; 82	'R'
	.db #0x54	; 84	'T'
	.db #0x56	; 86	'V'
	.db #0x58	; 88	'X'
;src\monkey1.c:166: char INKEY() __naked
;	---------------------------------
; Function INKEY
; ---------------------------------
_INKEY::
;src\monkey1.c:178: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	call	0x009F
	ld	L,A
	pop	IX
	ret
;src\monkey1.c:179: }
;src\monkey1.c:185: void WAIT(uint cicles)
;	---------------------------------
; Function WAIT
; ---------------------------------
_WAIT::
;src\monkey1.c:188: for(i=0;i<cicles;i++) HALT;
	ld	bc, #0x0000
00103$:
	ld	hl, #2
	add	hl, sp
	ld	a, c
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	ret	NC
	halt	
	inc	bc
;src\monkey1.c:189: }
	jr	00103$
;src\monkey1.c:192: void CLS()
;	---------------------------------
; Function CLS
; ---------------------------------
_CLS::
;src\monkey1.c:194: FillVRAM (BASE5, 0x300, 32);
	ld	a, #0x20
	push	af
	inc	sp
	ld	hl, #0x0300
	push	hl
	ld	h, #0x18
	push	hl
	call	_FillVRAM
	pop	af
	pop	af
	inc	sp
;src\monkey1.c:195: }
	ret
;src\monkey1.c:199: void VPRINT(byte column, byte line, char* text)
;	---------------------------------
; Function VPRINT
; ---------------------------------
_VPRINT::
	push	ix
	ld	ix,#0
	add	ix,sp
;src\monkey1.c:201: uint vaddr = BASE5 + (line*32)+column; // calcula la posicion en la VRAM
	ld	l, 5 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, #0x1800
	add	hl, bc
	ld	c, 4 (ix)
	ld	b, #0x00
	add	hl, bc
;src\monkey1.c:202: VPOKEARRAY(vaddr, text);
	ld	c, 6 (ix)
	ld	b, 7 (ix)
	push	bc
	push	hl
	call	_VPOKEARRAY
	pop	af
	pop	af
;src\monkey1.c:203: }
	pop	ix
	ret
;src\monkey1.c:207: void VPOKEARRAY(uint vaddr, char* text)
;	---------------------------------
; Function VPOKEARRAY
; ---------------------------------
_VPOKEARRAY::
	push	ix
	ld	ix,#0
	add	ix,sp
;src\monkey1.c:209: while(*(text)) VPOKE(vaddr++,*(text++));
	ld	c, 6 (ix)
	ld	b, 7 (ix)
	ld	e, 4 (ix)
	ld	d, 5 (ix)
00101$:
	ld	a, (bc)
	or	a, a
	jr	Z,00104$
	ld	h, a
	inc	bc
	push	de
	pop	iy
	inc	de
	ld	4 (ix), e
	ld	5 (ix), d
	push	bc
	push	de
	push	hl
	inc	sp
	push	iy
	call	_VPOKE
	pop	af
	inc	sp
	pop	de
	pop	bc
	jr	00101$
00104$:
;src\monkey1.c:210: }
	pop	ix
	ret
;src\monkey1.c:220: void LOCATE(char x, char y) __naked
;	---------------------------------
; Function LOCATE
; ---------------------------------
_LOCATE::
;src\monkey1.c:238: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	A,4(IX) ;x
	inc	A ;incrementa las posiciones para que se situen correctamente en la pantalla
	ld	H,A
	ld	A,5(IX) ;y
	inc	A
	ld	L,A
	call	0x00C6
	pop	IX
	ret
;src\monkey1.c:240: }
;src\monkey1.c:247: void PRINT(char* text) __naked
;	---------------------------------
; Function PRINT
; ---------------------------------
_PRINT::
;src\monkey1.c:269: __endasm; 
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	L,4(ix)
	ld	H,5(ix)
	nextCHAR:
	ld	A,(HL)
	or	A
	jr	Z,ENDnext
	call	0x00A2
	inc	HL
	jr	nextCHAR
	ENDnext:
	pop	IX
	ret
;src\monkey1.c:270: }
;src\monkey1.c:275: char PEEK(uint address) __naked
;	---------------------------------
; Function PEEK
; ---------------------------------
_PEEK::
;src\monkey1.c:290: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	L,4(IX)
	ld	H,5(IX)
	ld	L,(HL)
	pop	IX
	ret
;src\monkey1.c:291: }
;src\monkey1.c:296: uint PEEKW(uint address) __naked
;	---------------------------------
; Function PEEKW
; ---------------------------------
_PEEKW::
;src\monkey1.c:313: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	L,4(ix)
	ld	H,5(ix)
	ld	E,(HL)
	inc	HL
	ld	D,(HL)
	ex	DE,HL
	pop	IX
	ret
;src\monkey1.c:314: }
;src\monkey1.c:326: void COLOR(char ink, char background, char border) __naked
;	---------------------------------
; Function COLOR
; ---------------------------------
_COLOR::
;src\monkey1.c:349: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	A,4(IX)
	ld	(0xF3E9),A
	ld	A,5(IX)
	ld	(0xF3EA),A
	ld	A,6(IX)
	ld	(0xF3EB),A
	call	0x0062
	pop	IX
	ret
;src\monkey1.c:350: }
;src\monkey1.c:361: void VPOKE(unsigned int vaddr, char value) __naked
;	---------------------------------
; Function VPOKE
; ---------------------------------
_VPOKE::
;src\monkey1.c:379: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	L,4(IX)
	ld	H,5(IX)
	ld	A,6(IX)
	call	0x004D
	pop	IX
	ret
;src\monkey1.c:380: }
;src\monkey1.c:390: char VPEEK(unsigned int vaddr) __naked
;	---------------------------------
; Function VPEEK
; ---------------------------------
_VPEEK::
;src\monkey1.c:407: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	L,4(IX)
	ld	H,5(IX)
	call	0x004A
	ld	L,A
	pop	IX
	ret
;src\monkey1.c:408: }
;src\monkey1.c:420: void FillVRAM(unsigned int vaddr, unsigned int length, char value) __naked
;	---------------------------------
; Function FillVRAM
; ---------------------------------
_FillVRAM::
;src\monkey1.c:442: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	L,4(IX) ; vaddress
	ld	H,5(IX)
	ld	C,6(IX) ;length
	ld	B,7(IX)
	ld	A,8(IX) ;value
	call	0x0056
	pop	IX
	ret
;src\monkey1.c:443: }
;src\monkey1.c:455: void CopyToVRAM(unsigned int addr, unsigned int vaddr, unsigned int length) __naked
;	---------------------------------
; Function CopyToVRAM
; ---------------------------------
_CopyToVRAM::
;src\monkey1.c:478: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	L,4(IX) ;ram address
	ld	H,5(IX)
	ld	E,6(IX) ;VRAM address
	ld	D,7(IX)
	ld	C,8(IX) ;length
	ld	B,9(IX)
	call	0x005C
	pop	IX
	ret
;src\monkey1.c:479: }
;src\monkey1.c:484: void setFont()
;	---------------------------------
; Function setFont
; ---------------------------------
_setFont::
;src\monkey1.c:486: uint ROMfont = PEEKW(CGTABL);
	ld	hl, #0x0004
	push	hl
	call	_PEEKW
	pop	af
;src\monkey1.c:488: CopyToVRAM(ROMfont,BASE7,0x800);       //MSX font pattern
	ld	bc, #0x0800
	push	bc
	ld	bc, #0x0000
	push	bc
	push	hl
	call	_CopyToVRAM
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src\monkey1.c:490: FillVRAM(BASE6,32,0xF4);           //colors
	ld	a, #0xf4
	push	af
	inc	sp
	ld	hl, #0x0020
	push	hl
	ld	hl, #0x2000
	push	hl
	call	_FillVRAM
	pop	af
	pop	af
	inc	sp
;src\monkey1.c:492: return;
;src\monkey1.c:493: }
	ret
;src\monkey1.c:499: void testSPRITES()
;	---------------------------------
; Function testSPRITES
; ---------------------------------
_testSPRITES::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src\monkey1.c:504: char frame=0;
	ld	-4 (ix), #0x00
;src\monkey1.c:511: VPRINT(0,cursorLine++, text01);
	ld	hl, #_text01
	push	hl
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_VPRINT
	pop	af
;src\monkey1.c:512: VPRINT(0,cursorLine++, text02);
	ld	hl, #_text02
	ex	(sp),hl
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_VPRINT
	pop	af
;src\monkey1.c:516: VPRINT(0,cursorLine++, "-----------------Test Functions");
	ld	hl, #___str_2
	ex	(sp),hl
	ld	a, #0x02
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_VPRINT
	pop	af
;src\monkey1.c:520: VPRINT(0,cursorLine++, "ShowMonkey(plane,x,y,color)"); 
	ld	hl, #___str_3
	ex	(sp),hl
	ld	a, #0x03
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_VPRINT
	pop	af
	pop	af
;src\monkey1.c:521: showSprites();
	call	_showSprites
;src\monkey1.c:522: WAIT(100);
	ld	hl, #0x0064
	push	hl
	call	_WAIT
;src\monkey1.c:525: VPRINT(0,cursorLine++, "UpdateMonkeyFrame(plane,frame)"); 
	ld	hl, #___str_4
	ex	(sp),hl
	ld	a, #0x04
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_VPRINT
	pop	af
	pop	af
;src\monkey1.c:526: for(i=0;i<20;i++)
	ld	bc, #0x0000
00112$:
;src\monkey1.c:528: WAIT(16);
	push	bc
	ld	hl, #0x0010
	push	hl
	call	_WAIT
	pop	af
	pop	bc
;src\monkey1.c:529: for(plane=0;plane<32;plane++) UpdateMonkeyFrame(plane,1);
	ld	d, #0x00
00108$:
	push	bc
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	push	de
	inc	sp
	call	_UpdateMonkeyFrame
	pop	af
	pop	de
	pop	bc
	inc	d
	ld	a, d
	sub	a, #0x20
	jr	C,00108$
;src\monkey1.c:530: WAIT(16);
	push	bc
	ld	hl, #0x0010
	push	hl
	call	_WAIT
	pop	af
	pop	bc
;src\monkey1.c:531: for(plane=0;plane<32;plane++) UpdateMonkeyFrame(plane,0);
	ld	d, #0x00
00110$:
	push	bc
	push	de
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	call	_UpdateMonkeyFrame
	pop	af
	pop	de
	pop	bc
	inc	d
	ld	a, d
	sub	a, #0x20
	jr	C,00110$
;src\monkey1.c:526: for(i=0;i<20;i++)
	inc	bc
	ld	a, c
	sub	a, #0x14
	ld	a, b
	sbc	a, #0x00
	jr	C,00112$
;src\monkey1.c:535: VPRINT(0,cursorLine++, "ClearMonkeys()");
	ld	hl, #___str_5
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_VPRINT
	pop	af
	pop	af
;src\monkey1.c:536: ClearMonkeys();
	call	_ClearMonkeys
;src\monkey1.c:537: WAIT(100);
	ld	hl, #0x0064
	push	hl
	call	_WAIT
;src\monkey1.c:541: VPRINT(0,cursorLine++, "Monkeys Dancing");
	ld	hl, #___str_6
	ex	(sp),hl
	ld	a, #0x06
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_VPRINT
	pop	af
	pop	af
;src\monkey1.c:542: for(i=0;i<2048;i++)
	ld	-3 (ix), #0x00
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x00
00116$:
;src\monkey1.c:544: HALT;    
	halt	
;src\monkey1.c:546: for(plane=0;plane<32;plane++)
	ld	a, -4 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a, #0x0f
	ld	c, a
	ld	b, #0x00
00114$:
;src\monkey1.c:548: posMonkey = grade + (plane*8);
	ld	a, b
	add	a, a
	add	a, a
	add	a, a
	ld	e, a
	ld	a, -3 (ix)
	add	a, e
	ld	e, a
;src\monkey1.c:549: ShowMonkey(plane, posX[posMonkey], posY[posMonkey], 8);
	ld	hl, #_posY
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
	ld	a, e
	add	a, #<(_posX)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_posX)
	ld	h, a
	ld	e, (hl)
	push	bc
	ld	a, #0x08
	push	af
	inc	sp
	push	de
	push	bc
	inc	sp
	call	_ShowMonkey
	pop	af
	pop	af
	pop	bc
;src\monkey1.c:551: UpdateMonkeyFrame(plane,frame>>4);           
	push	bc
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_UpdateMonkeyFrame
	pop	af
	pop	bc
;src\monkey1.c:546: for(plane=0;plane<32;plane++)
	inc	b
	ld	a, b
	sub	a, #0x20
	jr	C,00114$
;src\monkey1.c:554: frame++;
	inc	-4 (ix)
;src\monkey1.c:555: if (frame>31) frame = 0; 
	ld	a, #0x1f
	sub	a, -4 (ix)
	jr	NC,00106$
	ld	-4 (ix), #0x00
00106$:
;src\monkey1.c:557: grade++;
	inc	-3 (ix)
;src\monkey1.c:542: for(i=0;i<2048;i++)
	inc	-2 (ix)
	jr	NZ,00180$
	inc	-1 (ix)
00180$:
	ld	a, -1 (ix)
	sub	a, #0x08
	jr	C,00116$
;src\monkey1.c:565: VPRINT(0,cursorLine, "Press any key.");
	ld	hl, #___str_7
	push	hl
	ld	a, #0x0a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_VPRINT
	pop	af
	pop	af
;src\monkey1.c:566: LOCATE(14,cursorLine);
	ld	de, #0x0a0e
	push	de
	call	_LOCATE
	pop	af
;src\monkey1.c:567: key = INKEY();
	call	_INKEY
;src\monkey1.c:571: VPRINT(0,cursorLine,"End of the test...");
	ld	hl, #___str_8
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_VPRINT
;src\monkey1.c:573: }
	ld	sp,ix
	pop	ix
	ret
___str_2:
	.ascii "-----------------Test Functions"
	.db 0x00
___str_3:
	.ascii "ShowMonkey(plane,x,y,color)"
	.db 0x00
___str_4:
	.ascii "UpdateMonkeyFrame(plane,frame)"
	.db 0x00
___str_5:
	.ascii "ClearMonkeys()"
	.db 0x00
___str_6:
	.ascii "Monkeys Dancing"
	.db 0x00
___str_7:
	.ascii "Press any key."
	.db 0x00
___str_8:
	.ascii "End of the test..."
	.db 0x00
;src\monkey1.c:582: void showSprites()
;	---------------------------------
; Function showSprites
; ---------------------------------
_showSprites::
;src\monkey1.c:584: char x=0;
;src\monkey1.c:588: for(plane=0;plane<32;plane++)
	ld	bc, #0x0000
00104$:
;src\monkey1.c:590: posY = (plane/4)*16;
	ld	l, b
	ld	h, #0x00
	ld	e, l
	ld	d, h
	bit	7, h
	jr	Z,00108$
	ex	de,hl
	inc	de
	inc	de
	inc	de
00108$:
	sra	d
	rr	e
	sra	d
	rr	e
	ld	a, e
	add	a, a
	add	a, a
	add	a, a
	add	a, a
;src\monkey1.c:591: posY += 48;
	add	a, #0x30
	ld	h, a
;src\monkey1.c:592: ShowMonkey(plane, x*16, posY, 8);
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	ld	d, a
	push	bc
	ld	a, #0x08
	push	af
	inc	sp
	ld	l, d
	push	hl
	push	bc
	inc	sp
	call	_ShowMonkey
	pop	af
	pop	af
	pop	bc
;src\monkey1.c:593: x++;
	inc	c
;src\monkey1.c:594: if (x>3) x=0;
	ld	a, #0x03
	sub	a, c
	jr	NC,00105$
	ld	c, #0x00
00105$:
;src\monkey1.c:588: for(plane=0;plane<32;plane++)
	inc	b
	ld	a, b
	sub	a, #0x20
	jr	C,00104$
;src\monkey1.c:596: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
