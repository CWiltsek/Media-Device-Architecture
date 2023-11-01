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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer.part.0, %function
drawPlayer.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L3
	ldr	r3, [r0, #4]
	ldr	r1, [r0, #36]
	lsl	r3, r3, #23
	ldr	r2, .L3+4
	ldrb	r0, [r0]	@ zero_extendqisi2
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	lsl	r1, r1, #6
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	player
	.word	shadowOAM
	.size	drawPlayer.part.0, .-drawPlayer.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoss.part.0, %function
drawBoss.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L6
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #48]
	lsl	r3, r3, #23
	ldr	r1, .L6+4
	ldrb	r0, [r0]	@ zero_extendqisi2
	lsr	r3, r3, #23
	lsl	r2, r2, #6
	orr	r3, r3, #16384
	add	r2, r2, #6
	strh	r3, [r1, #10]	@ movhi
	strh	r0, [r1, #8]	@ movhi
	strh	r2, [r1, #12]	@ movhi
	bx	lr
.L7:
	.align	2
.L6:
	.word	boss
	.word	shadowOAM
	.size	drawBoss.part.0, .-drawBoss.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets.part.0, %function
updateBullets.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, [r0, #4]
	ldr	lr, [r0, #20]
	add	r3, r4, lr
	cmp	r3, #0
	ble	.L9
	ldr	r1, .L17
	ldr	r2, .L17+4
	ldr	ip, [r1, #12]
	ldr	r1, [r2]
	add	ip, ip, #239
	add	r1, r3, r1
	cmp	ip, r1
	bge	.L16
.L9:
	mov	r3, #0
	pop	{r4, lr}
	str	r3, [r0, #32]
	bx	lr
.L16:
	ldr	r1, [r0]
	ldr	r2, [r0, #28]
	add	r2, r2, r1, lsl #9
	add	r2, r2, r4
	ldr	r1, .L17+8
	add	r2, r2, lr
	add	r2, r1, r2, lsl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, #0
	strne	r3, [r0, #4]
	beq	.L9
	pop	{r4, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	player
	.word	hOff
	.word	collisionmapBitmap
	.size	updateBullets.part.0, .-updateBullets.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemyBullets.part.0, %function
updateEnemyBullets.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #20]
	sub	r1, r3, r2
	cmp	r1, #0
	ble	.L20
	add	r3, r3, r2
	cmp	r3, #238
	bgt	.L20
	ldr	r3, .L25
	add	r3, r3, r1, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L20
	str	r1, [r0, #4]
	bx	lr
.L20:
	mov	r3, #0
	str	r3, [r0, #32]
	bx	lr
.L26:
	.align	2
.L25:
	.word	collisionmapBitmap
	.size	updateEnemyBullets.part.0, .-updateEnemyBullets.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawObstacles.part.0, %function
drawObstacles.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #8
	ldr	r2, .L28
	ldr	r3, [r2, #4]
	lsl	r3, r3, #23
	ldrb	r0, [r2]	@ zero_extendqisi2
	lsr	r3, r3, #23
	ldr	r2, .L28+4
	orr	r3, r3, #16384
	strh	r3, [r2, #18]	@ movhi
	strh	r0, [r2, #16]	@ movhi
	strh	r1, [r2, #20]	@ movhi
	bx	lr
.L29:
	.align	2
.L28:
	.word	obstacle
	.word	shadowOAM
	.size	drawObstacles.part.0, .-drawObstacles.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoss2.part.0, %function
drawBoss2.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #4
	ldr	r2, .L31
	ldr	r3, [r2, #4]
	lsl	r3, r3, #23
	ldrb	r0, [r2]	@ zero_extendqisi2
	lsr	r3, r3, #23
	ldr	r2, .L31+4
	orr	r3, r3, #16384
	strh	r3, [r2, #26]	@ movhi
	strh	r0, [r2, #24]	@ movhi
	strh	r1, [r2, #28]	@ movhi
	bx	lr
.L32:
	.align	2
.L31:
	.word	boss2
	.word	shadowOAM
	.size	drawBoss2.part.0, .-drawBoss2.part.0
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L62
	ldr	r3, [r4]
	cmp	r3, #256
	ble	.L34
	mov	ip, #67108864
	ldr	r0, .L62+4
	ldr	r1, [r0]
	add	r1, r1, #1
	lsl	r2, r1, #24
	orr	r2, r2, #1073741824
	sub	r3, r3, #256
	lsr	r2, r2, #16
	str	r3, [r4]
	str	r1, [r0]
	strh	r2, [ip, #8]	@ movhi
.L34:
	ldr	r2, .L62+8
	ldr	r3, [r2]
	cmp	r3, #512
	subgt	r3, r3, #512
	strgt	r3, [r2]
	ldr	r3, .L62+12
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L36
	ldr	r5, .L62+16
	ldrh	r3, [r5]
	ldr	r6, .L62+20
	orr	r3, r3, #512
	strh	r3, [r5]	@ movhi
	ldr	r3, [r6, #32]
	cmp	r3, #0
	beq	.L38
.L60:
	ldrh	r3, [r5, #8]
	orr	r3, r3, #512
	strh	r3, [r5, #8]	@ movhi
	ldr	r3, .L62+24
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L40
.L61:
	ldrh	r3, [r5, #24]
	orr	r3, r3, #512
	strh	r3, [r5, #24]	@ movhi
.L41:
	ldr	r3, .L62+28
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L42
	ldrh	r3, [r5, #16]
	orr	r3, r3, #512
	strh	r3, [r5, #16]	@ movhi
.L43:
	ldr	r3, .L62+32
	add	r0, r3, #2192
	mov	lr, #512
	mov	ip, #2
	add	r0, r0, #8
	b	.L46
.L57:
	ldr	r2, [r3, #40]
	ldr	r1, [r3, #4]
	ldr	r8, [r3]
	add	r3, r3, #44
	lsl	r7, r2, #3
	orr	r1, r1, #16384
	add	r2, r5, r2, lsl #3
	cmp	r3, r0
	strh	ip, [r2, #4]	@ movhi
	strh	r8, [r5, r7]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	beq	.L56
.L46:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	bne	.L57
	ldr	r2, [r3, #36]
	cmp	r2, #0
	ldreq	r2, [r3, #40]
	add	r3, r3, #44
	lsleq	r2, r2, #3
	strheq	lr, [r5, r2]	@ movhi
	cmp	r3, r0
	bne	.L46
.L56:
	ldr	r3, .L62+36
	mov	ip, #512
	mov	r7, #2
	ldr	r6, [r6, #32]
	add	r1, r3, #880
	b	.L49
.L59:
	cmp	r6, #0
	add	r0, r5, r2, lsl #3
	lsl	lr, r2, #3
	bne	.L47
	ldr	r2, [r3, #4]
	ldr	r8, [r3]
	add	r3, r3, #44
	orr	r2, r2, #16384
	cmp	r1, r3
	strh	r7, [r0, #4]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r8, [r5, lr]	@ movhi
	beq	.L58
.L49:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	ldr	r2, [r3, #40]
	bne	.L59
.L47:
	add	r3, r3, #44
	lsl	r2, r2, #3
	cmp	r1, r3
	strh	ip, [r5, r2]	@ movhi
	bne	.L49
.L58:
	mov	r2, #117440512
	ldr	r1, .L62+16
	mov	r3, #512
	mov	r0, #3
	ldr	r5, .L62+40
	mov	lr, pc
	bx	r5
	ldr	r3, .L62+44
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L62+48
	ldrh	r1, [r4]
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L42:
	bl	drawObstacles.part.0
	b	.L43
.L36:
	ldr	r6, .L62+20
	bl	drawPlayer.part.0
	ldr	r3, [r6, #32]
	cmp	r3, #0
	ldr	r5, .L62+16
	bne	.L60
.L38:
	bl	drawBoss.part.0
	ldr	r3, .L62+24
	ldr	r3, [r3, #32]
	cmp	r3, #0
	bne	.L61
.L40:
	bl	drawBoss2.part.0
	b	.L41
.L63:
	.align	2
.L62:
	.word	hOff
	.word	screenBlock
	.word	playerHOff
	.word	player
	.word	shadowOAM
	.word	boss
	.word	boss2
	.word	obstacle
	.word	bullets
	.word	enemybullets
	.word	DMANow
	.word	waitForVBlank
	.word	vOff
	.size	drawGame, .-drawGame
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #0
	mov	r6, #5
	mov	r4, #1
	mov	lr, #190
	mov	r1, #16
	mov	ip, #10
	mov	r0, #3
	ldr	r5, .L66
	ldr	r3, .L66+4
	ldr	r5, [r5]
	str	r6, [r3, #16]
	str	r5, [r3, #56]
	str	r4, [r3, #20]
	str	lr, [r3, #8]
	str	ip, [r3, #12]
	str	r0, [r3, #48]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #36]
	pop	{r4, r5, r6, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	playerHealthRemaining
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	isCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	isCollision, %function
isCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L71
	ldr	r3, [r2, #8]
	ldr	r1, [r2, #28]
	add	r0, r0, r3
	ldr	r3, [r2, #24]
	add	r0, r0, r1
	ldr	r1, [r2, #12]
	add	r3, r3, r0, lsl #9
	ldr	r2, .L71+4
	add	r3, r3, r1
	add	r3, r2, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	lsl	r0, r0, #9
	beq	.L70
	add	r0, r0, r1
	lsl	r0, r0, #1
	ldrh	r0, [r2, r0]
	rsbs	r0, r0, #1
	movcc	r0, #0
	bx	lr
.L70:
	mov	r0, #1
	bx	lr
.L72:
	.align	2
.L71:
	.word	player
	.word	collisionmapBitmap
	.size	isCollision, .-isCollision
	.align	2
	.global	willCollide
	.syntax unified
	.arm
	.fpu softvfp
	.type	willCollide, %function
willCollide:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L85
	push	{r4, lr}
	ldr	lr, [r2, #16]
	cmp	lr, #0
	ble	.L83
	mov	r0, #0
	add	r1, r2, #24
	ldr	r4, [r2, #12]
	ldm	r1, {r1, r3}
	ldr	r2, [r2, #8]
	add	r1, r4, r1
	add	r2, r3, r2
	ldr	r3, .L85+4
	add	r2, r1, r2, lsl #9
	rsb	r1, r1, r1, lsl #31
	lsl	r4, r4, #1
	lsl	r1, r1, #1
	add	r3, r3, r2, lsl #1
.L76:
	ldrh	r2, [r3, #-2]
	cmp	r2, #0
	add	ip, r3, r1
	bne	.L84
.L73:
	pop	{r4, lr}
	bx	lr
.L84:
	ldrh	r2, [ip, r4]
	cmp	r2, #0
	beq	.L73
	add	r0, r0, #1
	cmp	r0, lr
	add	r3, r3, #1024
	bne	.L76
.L83:
	mvn	r0, #0
	pop	{r4, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	player
	.word	collisionmapBitmap
	.size	willCollide, .-willCollide
	.global	__aeabi_idivmod
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L98
	ldr	r3, .L98+4
	ldr	r5, [r4, #32]
	smull	r1, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #40]
	bne	.L88
	ldr	r0, [r4, #44]
	ldr	r3, .L98+8
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L88:
	ldr	r1, .L98+12
	ldrh	r3, [r1, #48]
	ldr	r2, .L98+16
	tst	r3, #16
	ldr	r3, [r2]
	beq	.L89
	ldrh	r1, [r1, #48]
	tst	r1, #32
	bne	.L90
.L89:
	ands	r1, r3, #1
	movne	r1, #1
	add	r5, r5, #1
	addeq	r3, r3, #1
	addne	r3, r3, r1
	str	r1, [r4, #36]
	str	r5, [r4, #32]
	str	r3, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L90:
	mov	r1, #0
	add	r3, r3, #1
	str	r6, [r4, #36]
	str	r1, [r4, #44]
	str	r1, [r4, #32]
	str	r3, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L99:
	.align	2
.L98:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.word	.LANCHOR0
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L104
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L101
	ldr	r2, .L104+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L101:
	b	drawPlayer.part.0
.L105:
	.align	2
.L104:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoss, %function
initBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #24
	mov	r4, #0
	mov	r2, #1
	mov	ip, #110
	mov	r0, #200
	ldr	lr, .L108
	ldr	r3, .L108+4
	ldr	lr, [lr]
	str	r4, [r3, #48]
	str	lr, [r3, #36]
	str	ip, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	pop	{r4, lr}
	bx	lr
.L109:
	.align	2
.L108:
	.word	bossHealthRemaining
	.word	boss
	.size	initBoss, .-initBoss
	.align	2
	.global	drawBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoss, %function
drawBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L114
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L111
	ldr	r2, .L114+4
	ldrh	r3, [r2, #8]
	orr	r3, r3, #512
	strh	r3, [r2, #8]	@ movhi
	bx	lr
.L111:
	b	drawBoss.part.0
.L115:
	.align	2
.L114:
	.word	boss
	.word	shadowOAM
	.size	drawBoss, .-drawBoss
	.align	2
	.global	animateBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateBoss, %function
animateBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L128
	ldr	r3, .L128+4
	ldr	r5, [r4, #44]
	smull	r1, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #48]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #52]
	bne	.L117
	ldr	r0, [r4, #56]
	ldr	r3, .L128+8
	ldr	r1, [r4, #60]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #56]
.L117:
	ldr	r2, .L128+12
	ldr	r3, .L128+16
	ldr	r1, [r2]
	smull	r2, r3, r1, r3
	add	r2, r1, r1, lsl #4
	add	r0, r3, r1
	asr	r3, r1, #31
	rsb	r3, r3, r0, asr #2
	add	r2, r2, r2, lsl #8
	ldr	r0, .L128+20
	add	r2, r2, r2, lsl #16
	sub	r0, r0, r2
	ldr	r2, .L128+24
	rsb	r3, r3, r3, lsl #3
	cmp	r0, r2
	sub	r3, r1, r3
	bcs	.L118
	mov	r2, #0
	cmp	r3, r2
	str	r2, [r4, #48]
	bne	.L119
.L121:
	mov	r3, #1
	str	r3, [r4, #48]
.L119:
	add	r5, r5, #1
	str	r5, [r4, #44]
	pop	{r4, r5, r6, lr}
	bx	lr
.L118:
	cmp	r3, #0
	beq	.L121
	mov	r3, #0
	str	r6, [r4, #48]
	str	r3, [r4, #56]
	str	r3, [r4, #44]
	pop	{r4, r5, r6, lr}
	bx	lr
.L129:
	.align	2
.L128:
	.word	boss
	.word	1717986919
	.word	__aeabi_idivmod
	.word	.LANCHOR0
	.word	-1840700269
	.word	143165576
	.word	286331153
	.size	animateBoss, .-animateBoss
	.align	2
	.global	updateBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBoss, %function
updateBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L148
	ldr	r5, .L148+4
	ldr	r1, .L148+8
	ldr	r0, [r3]
	ldr	r2, [r5, #12]
	ldr	r3, [r5, #8]
	ldr	r1, [r1]
	ldr	r4, .L148+12
	sub	r2, r2, r0
	sub	r3, r3, r1
	add	r6, r4, #2192
	mov	r10, #1
	str	r2, [r5, #4]
	str	r3, [r5]
	ldr	r8, .L148+16
	ldr	r7, .L148+20
	ldr	r9, .L148+24
	sub	sp, sp, #16
	add	r6, r6, #8
	b	.L134
.L132:
	add	r4, r4, #44
	cmp	r4, r6
	beq	.L145
.L134:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L132
	add	r0, r4, #24
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L132
	ldr	r3, [r5, #32]
	cmp	r3, #0
	bne	.L132
	mov	r0, #512
	ldr	r2, [r4, #40]
	ldr	r1, [r8]
	str	r3, [r4, #32]
	str	r10, [r4, #36]
	add	r4, r4, #44
	sub	r1, r1, #1
	lsl	r2, r2, #3
	cmp	r4, r6
	str	r1, [r8]
	strh	r0, [r9, r2]	@ movhi
	bne	.L134
.L145:
	ldr	r3, [r8]
	rsbs	r3, r3, #1
	movcc	r3, #0
	ldr	r2, .L148+28
	ldr	r1, [r2, #4]
	cmp	r1, #29
	str	r3, [r5, #32]
	ble	.L146
	mov	r3, #0
	str	r3, [r2, #8]
.L138:
	ldr	r3, [r5, #8]
	sub	r1, r1, #1
	sub	r3, r3, #1
	str	r1, [r2, #4]
	str	r3, [r5, #8]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	animateBoss
.L146:
	ldr	r3, [r2, #8]
	cmp	r3, #0
	bne	.L147
	cmp	r1, #0
	bgt	.L138
.L137:
	mov	r3, #1
	str	r3, [r2, #8]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	animateBoss
.L147:
	ldr	r3, [r5, #8]
	add	r1, r1, #1
	add	r3, r3, #1
	str	r1, [r2, #4]
	str	r3, [r5, #8]
	b	.L137
.L149:
	.align	2
.L148:
	.word	playerHOff
	.word	boss
	.word	vOff
	.word	bullets
	.word	bossHealthRemaining
	.word	collision
	.word	shadowOAM
	.word	.LANCHOR0
	.size	updateBoss, .-updateBoss
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r2, #51
	mov	r0, #6
	mov	r1, #2
	mov	r5, #0
	ldr	ip, .L154
	ldr	r7, .L154+4
	add	r4, ip, #8
	ldr	r6, .L154+8
	ldm	r4, {r4, lr}
	ldr	ip, [r7]
	ldr	r3, .L154+12
	ldr	r6, [r6]
	sub	r4, r4, ip
	add	ip, r3, #2192
	sub	lr, lr, r6
	add	ip, ip, #8
.L151:
	str	r2, [r3, #40]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r5, [r3, #32]
	stm	r3, {r4, lr}
	add	r3, r3, #44
	cmp	r3, ip
	add	r2, r2, #1
	bne	.L151
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L155:
	.align	2
.L154:
	.word	player
	.word	vOff
	.word	playerHOff
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	updateBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets, %function
updateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	updateBullets.part.0
	.size	updateBullets, .-updateBullets
	.align	2
	.global	drawBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullets, %function
drawBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L159
	mov	ip, #2
	ldr	r3, [r0, #40]
	ldr	r2, [r0, #4]
	ldr	r1, .L165
	str	lr, [sp, #-4]!
	ldr	lr, [r0]
	orr	r2, r2, #16384
	lsl	r0, r3, #3
	add	r3, r1, r3, lsl #3
	strh	lr, [r1, r0]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L159:
	ldr	r3, [r0, #36]
	cmp	r3, #0
	moveq	r1, #512
	ldreq	r3, [r0, #40]
	ldreq	r2, .L165
	lsleq	r3, r3, #3
	strheq	r1, [r2, r3]	@ movhi
	bx	lr
.L166:
	.align	2
.L165:
	.word	shadowOAM
	.size	drawBullets, .-drawBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L177
	mov	r3, #0
	mov	r2, r0
	b	.L170
.L168:
	add	r3, r3, #1
	cmp	r3, #50
	add	r2, r2, #44
	bxeq	lr
.L170:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L168
	push	{r4, r5, r6, lr}
	mov	r4, #1
	ldr	r2, .L177+4
	ldr	r5, .L177+8
	ldr	r6, .L177+12
	ldr	lr, [r2, #8]
	ldr	r5, [r5]
	ldr	ip, [r2, #12]
	sub	lr, lr, r5
	ldr	r2, [r6]
	add	r5, r3, r3, lsl #2
	add	r3, r3, r5, lsl r4
	sub	ip, ip, r2
	add	r2, r0, r3, lsl #2
	str	lr, [r0, r3, lsl #2]
	str	r4, [r2, #32]
	str	r1, [r2, #36]
	str	ip, [r2, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L178:
	.align	2
.L177:
	.word	bullets
	.word	player
	.word	vOff
	.word	playerHOff
	.size	fireBullet, .-fireBullet
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	sub	sp, sp, #16
	bl	willCollide
	ldr	r5, .L240
	ldr	r2, .L240+4
	cmn	r0, #1
	ldr	r3, [r5, #8]
	ldrh	r1, [r2]
	beq	.L235
	mov	lr, #5
	mov	r2, #0
	ldr	ip, .L240+8
	add	r0, r0, r3
	str	r0, [r5, #8]
	str	lr, [r5, #16]
	str	r2, [ip]
.L182:
	tst	r1, #64
	bne	.L236
.L183:
	ldr	r3, .L240+12
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L234
	ldr	ip, [r5, #12]
	ldr	r3, [r5, #20]
	ldr	lr, .L240+16
	sub	r3, ip, r3
	rsbs	r0, r3, #0
	ldr	r2, [r5, #8]
	and	r0, r0, lr
	and	r3, r3, lr
	rsbpl	r3, r0, #0
	rsbs	lr, r2, #0
	and	lr, lr, #255
	and	r0, r2, #255
	rsbpl	r0, lr, #0
	add	r0, r3, r0, lsl #9
	ldr	lr, .L240+20
	lsl	r0, r0, #1
	ldrh	r0, [lr, r0]
	cmp	r0, #0
	bne	.L231
.L234:
	ldr	r4, .L240+24
.L185:
	ldr	r3, .L240+12
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L188
	add	r2, r5, #20
	ldm	r2, {r2, r3}
	ldr	ip, [r5, #12]
	add	r3, ip, r3
	add	r3, r3, r2
	ldr	r2, [r5, #8]
	sub	r3, r3, #1
	ldr	lr, .L240+20
	add	r0, r3, r2, lsl #9
	lsl	r0, r0, #1
	ldrh	r0, [lr, r0]
	cmp	r0, #0
	bne	.L237
.L188:
	tst	r1, #1
	beq	.L190
	ldr	r3, .L240+28
	ldrh	r2, [r3]
	ands	r2, r2, #1
	beq	.L238
.L190:
	ldr	r3, .L240+32
	ldr	r2, [r4]
	ldr	r3, [r3]
	ldr	lr, [r5, #12]
	ldr	ip, [r5, #8]
	sub	lr, lr, r2
	sub	ip, ip, r3
	ldr	r4, .L240+36
	str	lr, [sp]
	str	ip, [sp, #4]
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #24]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	ldr	r7, .L240+40
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	str	lr, [r5, #4]
	str	ip, [r5]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L191
	ldr	r3, [r4, #32]
	cmp	r3, #0
	ldreq	r2, .L240+44
	ldreq	r3, [r2]
	subeq	r3, r3, #1
	streq	r3, [r2]
.L191:
	ldr	r4, .L240+48
	ldr	ip, [r5, #24]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r6, [r5, #28]
	ldr	lr, [r5]
	str	ip, [sp, #8]
	ldr	ip, [r5, #4]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L192
	ldr	r3, [r4, #32]
	cmp	r3, #0
	ldreq	r2, .L240+44
	ldreq	r3, [r2]
	subeq	r3, r3, #1
	streq	r3, [r2]
.L192:
	ldr	r0, .L240+52
	ldr	ip, [r5, #24]
	add	r2, r0, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r0]
	ldr	r4, [r5, #28]
	ldr	r0, [r0, #4]
	ldr	lr, [r5]
	str	ip, [sp, #8]
	ldr	ip, [r5, #4]
	str	r4, [sp, #12]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r2, .L240+44
	ldrne	r3, [r2]
	ldr	r4, .L240+56
	subne	r3, r3, #1
	mov	r10, #0
	strne	r3, [r2]
	ldr	r8, .L240+44
	ldr	r9, .L240+60
	add	r6, r4, #880
	b	.L197
.L195:
	add	r4, r4, #44
	cmp	r6, r4
	beq	.L239
.L197:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L195
	add	r0, r4, #24
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L195
	mov	r1, #1
	mov	r0, #512
	ldr	r3, [r4, #40]
	ldr	r2, [r8]
	str	r10, [r4, #32]
	str	r1, [r4, #36]
	add	r4, r4, #44
	sub	r2, r2, #1
	lsl	r3, r3, #3
	cmp	r6, r4
	str	r2, [r8]
	strh	r0, [r9, r3]	@ movhi
	bne	.L197
.L239:
	ldr	r3, .L240+64
	ldr	r3, [r3]
	cmp	r3, #9
	movgt	r2, #20
	ldrgt	r3, .L240+68
	strgt	r2, [r3]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	animatePlayer
.L235:
	ldr	ip, .L240+8
	ldr	r0, [ip]
	ldr	r2, [r5, #16]
	cmp	r0, #0
	add	r0, r2, r3
	addne	r2, r2, #1
	str	r0, [r5, #8]
	strne	r2, [r5, #16]
	bne	.L183
	b	.L182
.L237:
	ldr	r0, [r5, #28]
	add	r2, r2, r0
	sub	r2, r2, #1
	add	r3, r3, r2, lsl #9
	lsl	r3, r3, #1
	ldrh	r3, [lr, r3]
	cmp	r3, #0
	beq	.L188
	ldr	r3, [r5, #4]
	add	ip, ip, #2
	cmp	r3, #80
	str	ip, [r5, #12]
	ble	.L188
	ldr	r3, .L240+72
	ldr	r3, [r3]
	cmp	r3, #30
	cmple	ip, #312
	bge	.L188
	ldr	r0, .L240+76
	ldr	r3, [r4]
	ldr	r2, [r0]
	add	r3, r3, #2
	add	r2, r2, #2
	str	r2, [r0]
	str	r3, [r4]
	b	.L188
.L231:
	ldr	r0, [r5, #28]
	add	r2, r2, r0
	sub	r2, r2, #1
	rsbs	r0, r2, #0
	and	r0, r0, #255
	and	r2, r2, #255
	rsbpl	r2, r0, #0
	add	r3, r3, r2, lsl #9
	lsl	r3, r3, #1
	ldrh	r3, [lr, r3]
	cmp	r3, #0
	ldr	r4, .L240+24
	beq	.L185
	ldr	r3, [r4]
	sub	ip, ip, #2
	cmp	r3, #0
	str	ip, [r5, #12]
	ble	.L185
	ldr	r2, [r5, #4]
	cmp	r2, #79
	bgt	.L185
	ldr	r0, .L240+76
	ldr	r2, [r0]
	sub	r3, r3, #2
	sub	r2, r2, #2
	str	r3, [r4]
	str	r2, [r0]
	b	.L185
.L236:
	ldr	r3, .L240+28
	ldrh	r3, [r3]
	tst	r3, #64
	bne	.L183
	mov	r2, #1
	ldr	r0, .L240+68
	ldr	r3, [r5, #16]
	ldr	r0, [r0]
	sub	r3, r3, r0
	str	r3, [r5, #16]
	str	r2, [ip]
	b	.L183
.L238:
	ldr	r1, .L240+80
	ldr	r0, .L240+84
	ldr	r3, .L240+88
	mov	lr, pc
	bx	r3
	bl	fireBullet
	b	.L190
.L241:
	.align	2
.L240:
	.word	player
	.word	oldButtons
	.word	amJumping
	.word	67109120
	.word	511
	.word	collisionmapBitmap
	.word	playerHOff
	.word	buttons
	.word	vOff
	.word	boss
	.word	collision
	.word	playerHealthRemaining
	.word	boss2
	.word	obstacle
	.word	enemybullets
	.word	shadowOAM
	.word	cheatCounter
	.word	jumpForce
	.word	screenBlock
	.word	hOff
	.word	4605
	.word	laserSound
	.word	playSoundL
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	initEnemyBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemyBullets, %function
initEnemyBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #30
	mov	r0, #6
	mov	r1, #2
	mov	r5, #0
	ldr	r3, .L246
	ldr	r6, .L246+4
	ldr	r4, .L246+8
	ldr	lr, [r3, #8]
	ldr	ip, [r3, #12]
	ldr	r4, [r4]
	ldr	r6, [r6]
	ldr	r3, .L246+12
	sub	ip, ip, r4
	sub	lr, lr, r6
	add	r4, r3, #880
.L243:
	str	r2, [r3, #40]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r5, [r3, #32]
	add	r3, r3, #44
	cmp	r3, r4
	add	r2, r2, #1
	bne	.L243
	pop	{r4, r5, r6, lr}
	bx	lr
.L247:
	.align	2
.L246:
	.word	boss
	.word	vOff
	.word	playerHOff
	.word	enemybullets
	.size	initEnemyBullets, .-initEnemyBullets
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #80
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, #28
	mov	r5, #0
	mov	r6, #10
	mov	r4, #1
	mov	lr, #15
	mov	r0, #3
	mov	r7, #5
	ldr	fp, .L250
	ldr	r9, .L250+4
	str	ip, [fp]
	ldr	r3, .L250+8
	ldr	r2, .L250+12
	ldr	r1, .L250+16
	ldr	fp, .L250+20
	ldr	ip, .L250+24
	str	r10, [r9]
	ldr	r8, .L250+28
	ldr	r10, .L250+32
	ldr	r9, .L250+36
	str	r6, [fp]
	str	r5, [r3]
	str	r5, [r2]
	str	r5, [r1]
	ldr	fp, .L250+40
	mov	r3, #16384
	ldr	r2, .L250+44
	ldr	r1, .L250+48
	str	lr, [ip]
	str	r0, [r8]
	str	r4, [r10]
	str	r7, [r9]
	mov	lr, pc
	bx	fp
	mov	r0, #3
	mov	r3, #256
	ldr	r2, .L250+52
	ldr	r1, .L250+56
	mov	lr, pc
	bx	fp
	mov	ip, #110
	ldr	r3, .L250+60
	mov	r0, #3
	str	r7, [r3, #16]
	ldr	r7, .L250+64
	mov	r2, #24
	mov	r1, #16
	mov	lr, #190
	mov	fp, #200
	str	ip, [r7, #8]
	mov	ip, #100
	ldr	r9, [r9]
	str	r0, [r3, #48]
	ldr	r10, [r10]
	ldr	r0, .L250+68
	ldr	r8, [r8]
	str	r9, [r7, #36]
	ldr	r9, .L250+72
	str	r10, [r3, #56]
	str	r4, [r3, #20]
	str	r6, [r3, #12]
	str	r5, [r3, #32]
	str	r5, [r3, #44]
	str	r5, [r3, #36]
	str	r8, [r0, #36]
	str	r4, [r0, #16]
	str	r4, [r0, #20]
	str	lr, [r3, #8]
	str	r9, [r0, #12]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r2, [r7, #24]
	str	r2, [r7, #28]
	str	r2, [r0, #24]
	str	r2, [r0, #28]
	str	ip, [r0, #8]
	str	r5, [r7, #48]
	str	r4, [r7, #16]
	str	r4, [r7, #20]
	str	fp, [r7, #12]
	bl	initBullets
	bl	initEnemyBullets
	mov	r2, #67108864
	mov	r1, #192
	ldr	r3, .L250+20
	ldr	r0, .L250
	ldrh	r3, [r3]
	ldrh	r0, [r0]
	strh	r3, [r2, #16]	@ movhi
	ldr	r3, .L250+76
	str	fp, [r3, #12]
	strh	r0, [r2, #18]	@ movhi
	str	r6, [r3, #24]
	str	r6, [r3, #28]
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	r1, [r3, #8]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L251:
	.align	2
.L250:
	.word	vOff
	.word	screenBlock
	.word	playerHOff
	.word	cheatCounter
	.word	amJumping
	.word	hOff
	.word	jumpForce
	.word	boss2HealthRemaining
	.word	playerHealthRemaining
	.word	bossHealthRemaining
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	player
	.word	boss
	.word	boss2
	.word	450
	.word	obstacle
	.size	initGame, .-initGame
	.align	2
	.global	updateEnemyBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemyBullets, %function
updateEnemyBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #32]
	cmp	r2, #0
	mov	r3, r0
	beq	.L253
	ldr	r2, .L257
	ldr	r2, [r2, #32]
	cmp	r2, #0
	beq	updateEnemyBullets.part.0
.L253:
	mov	r2, #0
	str	r2, [r3, #32]
	bx	lr
.L258:
	.align	2
.L257:
	.word	boss
	.size	updateEnemyBullets, .-updateEnemyBullets
	.align	2
	.global	drawEnemyBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemyBullets, %function
drawEnemyBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	ldr	r3, [r0, #40]
	beq	.L260
	ldr	r2, .L269
	ldr	r2, [r2, #32]
	cmp	r2, #0
	bne	.L260
	mov	ip, #2
	ldr	r2, [r0, #4]
	ldr	r1, .L269+4
	str	lr, [sp, #-4]!
	ldr	lr, [r0]
	orr	r2, r2, #16384
	lsl	r0, r3, #3
	add	r3, r1, r3, lsl #3
	strh	lr, [r1, r0]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L260:
	mov	r1, #512
	ldr	r2, .L269+4
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L270:
	.align	2
.L269:
	.word	boss
	.word	shadowOAM
	.size	drawEnemyBullets, .-drawEnemyBullets
	.align	2
	.global	fireEnemyBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireEnemyBullets, %function
fireEnemyBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	ip, .L277
	ldr	lr, .L277+4
	mov	r3, #0
	mov	r2, ip
	ldr	r0, [lr, #32]
	b	.L274
.L272:
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #44
	beq	.L271
.L274:
	ldr	r1, [r2, #32]
	orrs	r1, r0, r1
	bne	.L272
	mov	r4, #1
	ldr	r2, .L277+8
	ldr	r0, .L277+12
	add	r1, lr, #8
	ldr	r5, [r2]
	ldr	r0, [r0]
	ldm	r1, {r1, r2}
	add	lr, r3, r3, lsl #2
	add	r3, r3, lr, lsl r4
	sub	r2, r2, r0
	sub	r1, r1, r5
	add	r0, ip, r3, lsl #2
	str	r1, [ip, r3, lsl #2]
	str	r2, [r0, #4]
	str	r4, [r0, #32]
.L271:
	pop	{r4, r5, lr}
	bx	lr
.L278:
	.align	2
.L277:
	.word	enemybullets
	.word	boss
	.word	vOff
	.word	playerHOff
	.size	fireEnemyBullets, .-fireEnemyBullets
	.align	2
	.global	initObstacles
	.syntax unified
	.arm
	.fpu softvfp
	.type	initObstacles, %function
initObstacles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #10
	mov	r2, #1
	mov	ip, #192
	mov	r0, #200
	ldr	r3, .L280
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	ip, [r3, #8]
	str	r0, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	bx	lr
.L281:
	.align	2
.L280:
	.word	obstacle
	.size	initObstacles, .-initObstacles
	.align	2
	.global	drawObstacles
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawObstacles, %function
drawObstacles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L286
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L283
	ldr	r2, .L286+4
	ldrh	r3, [r2, #16]
	orr	r3, r3, #512
	strh	r3, [r2, #16]	@ movhi
	bx	lr
.L283:
	b	drawObstacles.part.0
.L287:
	.align	2
.L286:
	.word	obstacle
	.word	shadowOAM
	.size	drawObstacles, .-drawObstacles
	.align	2
	.global	updateObstacles
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateObstacles, %function
updateObstacles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L299
	ldr	r5, .L299+4
	ldr	r1, .L299+8
	ldr	r0, [r3]
	ldr	r2, [r5, #8]
	ldr	r3, [r5, #12]
	ldr	r1, [r1]
	ldr	r4, .L299+12
	sub	r2, r2, r0
	sub	r3, r3, r1
	add	r6, r4, #2192
	mov	fp, #1
	mov	r10, #512
	stm	r5, {r2, r3}
	ldr	r7, .L299+16
	ldr	r8, .L299+20
	ldr	r9, .L299+24
	sub	sp, sp, #20
	add	r6, r6, #8
	b	.L292
.L290:
	add	r4, r4, #44
	cmp	r4, r6
	beq	.L298
.L292:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L290
	add	r0, r4, #24
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L290
	ldr	r3, [r8, #32]
	cmp	r3, #0
	bne	.L290
	ldr	r2, [r4, #40]
	ldr	r1, [r9]
	str	r3, [r4, #32]
	str	fp, [r4, #36]
	ldr	r3, .L299+28
	add	r4, r4, #44
	add	r1, r1, #1
	lsl	r2, r2, #3
	cmp	r4, r6
	str	r1, [r9]
	strh	r10, [r3, r2]	@ movhi
	bne	.L292
.L298:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L300:
	.align	2
.L299:
	.word	vOff
	.word	obstacle
	.word	playerHOff
	.word	bullets
	.word	collision
	.word	boss
	.word	cheatCounter
	.word	shadowOAM
	.size	updateObstacles, .-updateObstacles
	.align	2
	.global	initBoss2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoss2, %function
initBoss2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #24
	mov	r2, #1
	mov	ip, #100
	ldr	r0, .L303
	str	lr, [sp, #-4]!
	ldr	r3, .L303+4
	ldr	lr, [r0]
	ldr	r0, .L303+8
	str	lr, [r3, #36]
	str	ip, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L304:
	.align	2
.L303:
	.word	boss2HealthRemaining
	.word	boss2
	.word	450
	.size	initBoss2, .-initBoss2
	.align	2
	.global	drawBoss2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoss2, %function
drawBoss2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L309
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L306
	ldr	r2, .L309+4
	ldrh	r3, [r2, #24]
	orr	r3, r3, #512
	strh	r3, [r2, #24]	@ movhi
	bx	lr
.L306:
	b	drawBoss2.part.0
.L310:
	.align	2
.L309:
	.word	boss2
	.word	shadowOAM
	.size	drawBoss2, .-drawBoss2
	.align	2
	.global	updateBoss2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBoss2, %function
updateBoss2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L326
	ldr	r5, .L326+4
	ldr	r1, .L326+8
	ldr	r0, [r3]
	ldr	r2, [r5, #12]
	ldr	r3, [r5, #8]
	ldr	r1, [r1]
	ldr	r4, .L326+12
	sub	r2, r2, r0
	sub	r3, r3, r1
	add	r6, r4, #2192
	mov	r10, #1
	str	r2, [r5, #4]
	str	r3, [r5]
	ldr	r8, .L326+16
	ldr	r7, .L326+20
	ldr	r9, .L326+24
	sub	sp, sp, #16
	add	r6, r6, #8
	b	.L315
.L313:
	add	r4, r4, #44
	cmp	r4, r6
	beq	.L325
.L315:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L313
	add	r0, r4, #24
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L313
	ldr	r3, [r5, #32]
	cmp	r3, #0
	bne	.L313
	mov	r0, #512
	ldr	r2, [r4, #40]
	ldr	r1, [r8]
	str	r3, [r4, #32]
	str	r10, [r4, #36]
	add	r4, r4, #44
	sub	r1, r1, #1
	lsl	r2, r2, #3
	cmp	r4, r6
	str	r1, [r8]
	strh	r0, [r9, r2]	@ movhi
	bne	.L315
.L325:
	ldr	r3, [r8]
	rsbs	r3, r3, #1
	movcc	r3, #0
	ldr	r2, .L326+28
	ldr	r2, [r2]
	cmp	r2, #0
	str	r3, [r5, #32]
	bne	.L311
	ldr	r2, .L326+32
	ldr	r3, [r5, #12]
	ldr	r1, [r2, #12]
	cmp	r3, r1
	ldr	r1, [r2, #8]
	ldr	r2, [r5, #8]
	addlt	r3, r3, #1
	subge	r3, r3, #1
	cmp	r2, r1
	addlt	r2, r2, #1
	subge	r2, r2, #1
	str	r3, [r5, #12]
	str	r2, [r5, #8]
.L311:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L327:
	.align	2
.L326:
	.word	playerHOff
	.word	boss2
	.word	vOff
	.word	bullets
	.word	boss2HealthRemaining
	.word	collision
	.word	shadowOAM
	.word	bossHealthRemaining
	.word	player
	.size	updateBoss2, .-updateBoss2
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	bl	updateBoss
	bl	updateBoss2
	bl	updateObstacles
	ldr	r0, .L348
	add	r4, r0, #2192
	add	r4, r4, #8
.L330:
	ldr	r3, [r0, #32]
	cmp	r3, #0
	blne	updateBullets.part.0
.L329:
	add	r0, r0, #44
	cmp	r4, r0
	bne	.L330
	ldr	r0, .L348+4
	mov	r5, #0
	ldr	r6, .L348+8
	add	r4, r0, #880
	b	.L333
.L346:
	ldr	r3, [r6, #32]
	cmp	r3, #0
	bne	.L331
	bl	updateEnemyBullets.part.0
	add	r0, r0, #44
	cmp	r0, r4
	beq	.L345
.L333:
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bne	.L346
.L331:
	str	r5, [r0, #32]
	add	r0, r0, #44
	cmp	r0, r4
	bne	.L333
.L345:
	ldr	r2, [r6, #40]
	add	r3, r2, r2, lsl #4
	ldr	r1, .L348+12
	add	r3, r3, r3, lsl #8
	ldr	r0, .L348+16
	add	r3, r3, r3, lsl #16
	sub	r1, r1, r3
	cmp	r0, r1, ror #2
	addcc	r2, r2, #1
	bcs	.L347
	str	r2, [r6, #40]
	pop	{r4, r5, r6, lr}
	bx	lr
.L347:
	bl	fireEnemyBullets
	mov	r2, #1
	str	r2, [r6, #40]
	pop	{r4, r5, r6, lr}
	bx	lr
.L349:
	.align	2
.L348:
	.word	bullets
	.word	enemybullets
	.word	boss
	.word	143165576
	.word	71582788
	.size	updateGame, .-updateGame
	.global	up
	.global	i
	.global	j
	.comm	boss2HealthRemaining,4,4
	.comm	bossHealthRemaining,4,4
	.comm	playerHealthRemaining,4,4
	.comm	enemybullets,880,4
	.comm	bullets,2200,4
	.comm	obstacle,64,4
	.comm	boss2,64,4
	.comm	boss,64,4
	.comm	player,60,4
	.comm	shadowOAM,1024,4
	.comm	jumpForce,4,4
	.comm	cheatCounter,4,4
	.comm	amJumping,4,4
	.comm	playerHOff,4,4
	.comm	screenBlock,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	soundG,32,4
	.comm	soundL,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	j, %object
	.size	j, 4
j:
	.space	4
	.type	i, %object
	.size	i, 4
i:
	.space	4
	.type	up, %object
	.size	up, 4
up:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
