;hex	;mnemonic
04		LSRD
04		LSRD
04		LSRD

CE0003	LDX 3				;set step
loop0:
04		LSRD
36		PSHA				;template y1
37		PSHB				;ptemplate y2

8401	ANDA 1
C401	ANDB 1
48		ASLA
48		ASLA
48		ASLA
1B		ABA
16		TAB
58		ASLB
1B		ABA

C602	LDAB 2

draw_line:
7D0180	TST $180
2BFB	BMI -5
B70181	STAA 181
5A		DECB
2EF5	BGT draw_line		;B>0
2D04	BLT draw_end		;B<0
4F		CLRA
09		DEX
26EF	BNE draw_line
draw_end:

33		PULB				;y2 to B
32		PULA				;y1 to A
26DB	BNE loop0  
39		RTS  