	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r3, #3072
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r2, #67108864
	ldr	r1, .L4+20
	strh	r3, [r2, #18]	@ movhi
	pop	{r4, lr}
	strh	r3, [r2, #16]	@ movhi
	str	r3, [r1]
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startScreenPal
	.word	startScreenTiles
	.word	100720640
	.word	startScreenMap
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #28
	mov	r3, #67108864
	mov	r1, #4352
	mov	r2, #23552
	push	{r4, lr}
	ldr	r0, .L8
	str	ip, [r0]
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	bl	goToStart
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	screenBlock
	.word	setupSounds
	.word	setupInterrupts
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	ldr	r4, .L12+4
	mov	r3, #32
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L12+8
	mov	lr, pc
	bx	r4
	mov	r3, #2672
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L12+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+16
	ldr	r2, [r3]
	lsl	r2, r2, #11
	mov	r0, #3
	mov	r3, #2048
	ldr	r1, .L12+20
	add	r2, r2, #100663296
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L12+24
	ldrh	r1, [r2]
	ldr	r2, .L12+28
	strh	r1, [r3, #18]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L12+32
	strh	r1, [r3, #16]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L12+36
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L12+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	waitForVBlank
	.word	DMANow
	.word	backgroundPal
	.word	backgroundTiles
	.word	screenBlock
	.word	backgroundMap
	.word	vOff
	.word	hOff
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	instructionState
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructionState, %function
instructionState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L21
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L21+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L20
.L14:
	pop	{r4, lr}
	bx	lr
.L20:
	pop	{r4, lr}
	b	goToStart
.L22:
	.align	2
.L21:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	instructionState, .-instructionState
	.align	2
	.global	goToInstruction
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstruction, %function
goToInstruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L25
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L25+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L25+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L25+16
	mov	lr, pc
	bx	r4
	mov	r3, #1280
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L25+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L25+24
	ldr	r2, [r3]
	lsl	r2, r2, #11
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L25+28
	add	r2, r2, #100663296
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	mov	r0, #2
	ldr	r1, .L25+32
	strh	r2, [r3, #18]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	str	r0, [r1]
	bx	lr
.L26:
	.align	2
.L25:
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	instructionScreenPal
	.word	instructionScreenTiles
	.word	screenBlock
	.word	instructionScreenMap
	.word	state
	.size	goToInstruction, .-goToInstruction
	.align	2
	.global	startState
	.syntax unified
	.arm
	.fpu softvfp
	.type	startState, %function
startState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L40
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L28
	ldr	r2, .L40+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L39
.L28:
	tst	r3, #1
	bxeq	lr
	ldr	r3, .L40+4
	ldrh	r3, [r3]
	tst	r3, #1
	bxne	lr
	b	goToInstruction
.L39:
	push	{r4, lr}
	ldr	r3, .L40+8
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L40+12
	ldr	r0, .L40+16
	ldr	r3, .L40+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L41:
	.align	2
.L40:
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	74156
	.word	gameMusic
	.word	playSoundG
	.word	initGame
	.size	startState, .-startState
	.align	2
	.global	pauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState, %function
pauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L49
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L42
	ldr	r3, .L49+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L48
.L42:
	pop	{r4, lr}
	bx	lr
.L48:
	ldr	r3, .L49+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L50:
	.align	2
.L49:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	unpauseSound
	.size	pauseState, .-pauseState
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L53
	mov	lr, pc
	bx	r3
	ldr	r3, .L53+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L53+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L53+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L53+16
	mov	lr, pc
	bx	r4
	mov	r3, #1856
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L53+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+24
	ldr	r2, [r3]
	lsl	r2, r2, #11
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L53+28
	add	r2, r2, #100663296
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	mov	r0, #3
	ldr	r1, .L53+32
	strh	r2, [r3, #18]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	str	r0, [r1]
	bx	lr
.L54:
	.align	2
.L53:
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	pauseScreenPal
	.word	pauseScreenTiles
	.word	screenBlock
	.word	pauseScreenMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	winState
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState, %function
winState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L62
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L55
	ldr	r3, .L62+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L61
.L55:
	pop	{r4, lr}
	bx	lr
.L61:
	pop	{r4, lr}
	b	initialize
.L63:
	.align	2
.L62:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	winState, .-winState
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L66
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L66+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L66+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L66+16
	mov	lr, pc
	bx	r4
	mov	r3, #800
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L66+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L66+24
	ldr	r2, [r3]
	lsl	r2, r2, #11
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L66+28
	add	r2, r2, #100663296
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	mov	r0, #4
	ldr	r1, .L66+32
	strh	r2, [r3, #18]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	str	r0, [r1]
	bx	lr
.L67:
	.align	2
.L66:
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	winScreenPal
	.word	winScreenTiles
	.word	screenBlock
	.word	winScreenMap
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	loseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseState, %function
loseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	winState
	.size	loseState, .-loseState
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L71
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L71+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L71+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L71+16
	mov	lr, pc
	bx	r4
	mov	r3, #800
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L71+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L71+24
	ldr	r2, [r3]
	lsl	r2, r2, #11
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L71+28
	add	r2, r2, #100663296
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	mov	r0, #5
	ldr	r1, .L71+32
	strh	r2, [r3, #18]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	str	r0, [r1]
	bx	lr
.L72:
	.align	2
.L71:
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	loseScreenPal
	.word	loseScreenTiles
	.word	screenBlock
	.word	loseScreenMap
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	gameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameState, %function
gameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L84
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L74
	ldr	r3, .L84+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L81
.L74:
	ldr	r2, .L84+20
	ldr	r3, .L84+24
	ldr	r2, [r2]
	ldr	r3, [r3]
	orrs	r3, r2, r3
	beq	.L82
	ldr	r3, .L84+28
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L83
	pop	{r4, lr}
	bx	lr
.L83:
	ldr	r3, .L84+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToLose
.L81:
	ldr	r3, .L84+36
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L74
.L82:
	ldr	r3, .L84+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToWin
.L85:
	.align	2
.L84:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	bossHealthRemaining
	.word	boss2HealthRemaining
	.word	playerHealthRemaining
	.word	stopSound
	.word	pauseSound
	.size	gameState, .-gameState
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L98
	mov	lr, pc
	bx	r3
	ldr	r6, .L98+4
	ldr	r8, .L98+8
	ldr	r5, .L98+12
	ldr	fp, .L98+16
	ldr	r10, .L98+20
	ldr	r9, .L98+24
	ldr	r7, .L98+28
	ldr	r4, .L98+32
.L87:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L88:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L88
.L90:
	.word	.L94
	.word	.L93
	.word	.L92
	.word	.L91
	.word	.L89
	.word	.L89
.L89:
	mov	lr, pc
	bx	r7
	b	.L87
.L91:
	ldr	r3, .L98+36
	mov	lr, pc
	bx	r3
	b	.L87
.L92:
	mov	lr, pc
	bx	r9
	b	.L87
.L93:
	mov	lr, pc
	bx	r10
	b	.L87
.L94:
	mov	lr, pc
	bx	fp
	b	.L87
.L99:
	.align	2
.L98:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	startState
	.word	gameState
	.word	instructionState
	.word	winState
	.word	67109120
	.word	pauseState
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundG,32,4
	.comm	soundL,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
