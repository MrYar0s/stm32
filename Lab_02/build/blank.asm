
build/blank.elf:     file format elf32-littlearm

Sections:
Idx Name              Size      VMA       LMA       File off  Algn  Flags
  0 .isr_vector       000000c0  08000000  08000000  00010000  2**0  CONTENTS, ALLOC, LOAD, READONLY, DATA
  1 .text             0000077c  080000c0  080000c0  000100c0  2**2  CONTENTS, ALLOC, LOAD, READONLY, CODE
  2 .rodata           00000058  0800083c  0800083c  0001083c  2**2  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 .init_array       00000008  08000894  08000894  00010894  2**2  CONTENTS, ALLOC, LOAD, DATA
  4 .fini_array       00000004  0800089c  0800089c  0001089c  2**2  CONTENTS, ALLOC, LOAD, DATA
  5 .data             00000434  20000000  080008a0  00020000  2**3  CONTENTS, ALLOC, LOAD, DATA
  6 .bss              00000024  20000434  08000cd4  00020434  2**2  ALLOC
  7 ._user_heap_stack 00000600  20000458  08000cd4  00020458  2**0  ALLOC
  8 .ARM.attributes   00000028  00000000  00000000  00020434  2**0  CONTENTS, READONLY
  9 .debug_info       00000a47  00000000  00000000  0002045c  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 10 .debug_abbrev     00000366  00000000  00000000  00020ea3  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 11 .debug_loc        000004e8  00000000  00000000  00021209  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 12 .debug_aranges    00000120  00000000  00000000  000216f1  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 13 .debug_ranges     000000f0  00000000  00000000  00021811  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 14 .debug_line       000006aa  00000000  00000000  00021901  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 15 .debug_str        000004ec  00000000  00000000  00021fab  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 16 .comment          0000004d  00000000  00000000  00022497  2**0  CONTENTS, READONLY
 17 .debug_frame      00000500  00000000  00000000  000224e4  2**2  CONTENTS, READONLY, DEBUGGING, OCTETS

Disassembly of section .text:

080000c0 <__do_global_dtors_aux>:
 80000c0:	b510      	push	{r4, lr}
 80000c2:	4c06      	ldr	r4, [pc, #24]	; (80000dc <__do_global_dtors_aux+0x1c>)
 80000c4:	7823      	ldrb	r3, [r4, #0]
 80000c6:	2b00      	cmp	r3, #0
 80000c8:	d107      	bne.n	80000da <__do_global_dtors_aux+0x1a>
 80000ca:	4b05      	ldr	r3, [pc, #20]	; (80000e0 <__do_global_dtors_aux+0x20>)
 80000cc:	2b00      	cmp	r3, #0
 80000ce:	d002      	beq.n	80000d6 <__do_global_dtors_aux+0x16>
 80000d0:	4804      	ldr	r0, [pc, #16]	; (80000e4 <__do_global_dtors_aux+0x24>)
 80000d2:	e000      	b.n	80000d6 <__do_global_dtors_aux+0x16>
 80000d4:	bf00      	nop
 80000d6:	2301      	movs	r3, #1
 80000d8:	7023      	strb	r3, [r4, #0]
 80000da:	bd10      	pop	{r4, pc}
 80000dc:	20000434 	.word	0x20000434
 80000e0:	00000000 	.word	0x00000000
 80000e4:	08000824 	.word	0x08000824

080000e8 <frame_dummy>:
 80000e8:	4b04      	ldr	r3, [pc, #16]	; (80000fc <frame_dummy+0x14>)
 80000ea:	b510      	push	{r4, lr}
 80000ec:	2b00      	cmp	r3, #0
 80000ee:	d003      	beq.n	80000f8 <frame_dummy+0x10>
 80000f0:	4903      	ldr	r1, [pc, #12]	; (8000100 <frame_dummy+0x18>)
 80000f2:	4804      	ldr	r0, [pc, #16]	; (8000104 <frame_dummy+0x1c>)
 80000f4:	e000      	b.n	80000f8 <frame_dummy+0x10>
 80000f6:	bf00      	nop
 80000f8:	bd10      	pop	{r4, pc}
 80000fa:	46c0      	nop			; (mov r8, r8)
 80000fc:	00000000 	.word	0x00000000
 8000100:	20000438 	.word	0x20000438
 8000104:	08000824 	.word	0x08000824

08000108 <Reset_Handler>:
 8000108:	480d      	ldr	r0, [pc, #52]	; (8000140 <LoopForever+0x2>)
 800010a:	4685      	mov	sp, r0
 800010c:	480d      	ldr	r0, [pc, #52]	; (8000144 <LoopForever+0x6>)
 800010e:	490e      	ldr	r1, [pc, #56]	; (8000148 <LoopForever+0xa>)
 8000110:	4a0e      	ldr	r2, [pc, #56]	; (800014c <LoopForever+0xe>)
 8000112:	2300      	movs	r3, #0
 8000114:	e002      	b.n	800011c <LoopCopyDataInit>

08000116 <CopyDataInit>:
 8000116:	58d4      	ldr	r4, [r2, r3]
 8000118:	50c4      	str	r4, [r0, r3]
 800011a:	3304      	adds	r3, #4

0800011c <LoopCopyDataInit>:
 800011c:	18c4      	adds	r4, r0, r3
 800011e:	428c      	cmp	r4, r1
 8000120:	d3f9      	bcc.n	8000116 <CopyDataInit>
 8000122:	4a0b      	ldr	r2, [pc, #44]	; (8000150 <LoopForever+0x12>)
 8000124:	4c0b      	ldr	r4, [pc, #44]	; (8000154 <LoopForever+0x16>)
 8000126:	2300      	movs	r3, #0
 8000128:	e001      	b.n	800012e <LoopFillZerobss>

0800012a <FillZerobss>:
 800012a:	6013      	str	r3, [r2, #0]
 800012c:	3204      	adds	r2, #4

0800012e <LoopFillZerobss>:
 800012e:	42a2      	cmp	r2, r4
 8000130:	d3fb      	bcc.n	800012a <FillZerobss>
 8000132:	f000 fa7d 	bl	8000630 <SystemInit>
 8000136:	f000 fad1 	bl	80006dc <__libc_init_array>
 800013a:	f000 fa2f 	bl	800059c <main>

0800013e <LoopForever>:
 800013e:	e7fe      	b.n	800013e <LoopForever>
 8000140:	20002000 	.word	0x20002000
 8000144:	20000000 	.word	0x20000000
 8000148:	20000434 	.word	0x20000434
 800014c:	080008a0 	.word	0x080008a0
 8000150:	20000434 	.word	0x20000434
 8000154:	20000458 	.word	0x20000458

08000158 <ADC1_COMP_IRQHandler>:
 8000158:	e7fe      	b.n	8000158 <ADC1_COMP_IRQHandler>
	...

0800015c <LL_RCC_HSI_Enable>:
 800015c:	b580      	push	{r7, lr}
 800015e:	af00      	add	r7, sp, #0
 8000160:	4b04      	ldr	r3, [pc, #16]	; (8000174 <LL_RCC_HSI_Enable+0x18>)
 8000162:	681a      	ldr	r2, [r3, #0]
 8000164:	4b03      	ldr	r3, [pc, #12]	; (8000174 <LL_RCC_HSI_Enable+0x18>)
 8000166:	2101      	movs	r1, #1
 8000168:	430a      	orrs	r2, r1
 800016a:	601a      	str	r2, [r3, #0]
 800016c:	46c0      	nop			; (mov r8, r8)
 800016e:	46bd      	mov	sp, r7
 8000170:	bd80      	pop	{r7, pc}
 8000172:	46c0      	nop			; (mov r8, r8)
 8000174:	40021000 	.word	0x40021000

08000178 <LL_RCC_HSI_IsReady>:
 8000178:	b580      	push	{r7, lr}
 800017a:	af00      	add	r7, sp, #0
 800017c:	4b05      	ldr	r3, [pc, #20]	; (8000194 <LL_RCC_HSI_IsReady+0x1c>)
 800017e:	681b      	ldr	r3, [r3, #0]
 8000180:	2202      	movs	r2, #2
 8000182:	4013      	ands	r3, r2
 8000184:	3b02      	subs	r3, #2
 8000186:	425a      	negs	r2, r3
 8000188:	4153      	adcs	r3, r2
 800018a:	b2db      	uxtb	r3, r3
 800018c:	0018      	movs	r0, r3
 800018e:	46bd      	mov	sp, r7
 8000190:	bd80      	pop	{r7, pc}
 8000192:	46c0      	nop			; (mov r8, r8)
 8000194:	40021000 	.word	0x40021000

08000198 <LL_RCC_SetSysClkSource>:
 8000198:	b580      	push	{r7, lr}
 800019a:	b082      	sub	sp, #8
 800019c:	af00      	add	r7, sp, #0
 800019e:	6078      	str	r0, [r7, #4]
 80001a0:	4b06      	ldr	r3, [pc, #24]	; (80001bc <LL_RCC_SetSysClkSource+0x24>)
 80001a2:	685b      	ldr	r3, [r3, #4]
 80001a4:	2203      	movs	r2, #3
 80001a6:	4393      	bics	r3, r2
 80001a8:	0019      	movs	r1, r3
 80001aa:	4b04      	ldr	r3, [pc, #16]	; (80001bc <LL_RCC_SetSysClkSource+0x24>)
 80001ac:	687a      	ldr	r2, [r7, #4]
 80001ae:	430a      	orrs	r2, r1
 80001b0:	605a      	str	r2, [r3, #4]
 80001b2:	46c0      	nop			; (mov r8, r8)
 80001b4:	46bd      	mov	sp, r7
 80001b6:	b002      	add	sp, #8
 80001b8:	bd80      	pop	{r7, pc}
 80001ba:	46c0      	nop			; (mov r8, r8)
 80001bc:	40021000 	.word	0x40021000

080001c0 <LL_RCC_GetSysClkSource>:
 80001c0:	b580      	push	{r7, lr}
 80001c2:	af00      	add	r7, sp, #0
 80001c4:	4b03      	ldr	r3, [pc, #12]	; (80001d4 <LL_RCC_GetSysClkSource+0x14>)
 80001c6:	685b      	ldr	r3, [r3, #4]
 80001c8:	220c      	movs	r2, #12
 80001ca:	4013      	ands	r3, r2
 80001cc:	0018      	movs	r0, r3
 80001ce:	46bd      	mov	sp, r7
 80001d0:	bd80      	pop	{r7, pc}
 80001d2:	46c0      	nop			; (mov r8, r8)
 80001d4:	40021000 	.word	0x40021000

080001d8 <LL_RCC_SetAHBPrescaler>:
 80001d8:	b580      	push	{r7, lr}
 80001da:	b082      	sub	sp, #8
 80001dc:	af00      	add	r7, sp, #0
 80001de:	6078      	str	r0, [r7, #4]
 80001e0:	4b06      	ldr	r3, [pc, #24]	; (80001fc <LL_RCC_SetAHBPrescaler+0x24>)
 80001e2:	685b      	ldr	r3, [r3, #4]
 80001e4:	22f0      	movs	r2, #240	; 0xf0
 80001e6:	4393      	bics	r3, r2
 80001e8:	0019      	movs	r1, r3
 80001ea:	4b04      	ldr	r3, [pc, #16]	; (80001fc <LL_RCC_SetAHBPrescaler+0x24>)
 80001ec:	687a      	ldr	r2, [r7, #4]
 80001ee:	430a      	orrs	r2, r1
 80001f0:	605a      	str	r2, [r3, #4]
 80001f2:	46c0      	nop			; (mov r8, r8)
 80001f4:	46bd      	mov	sp, r7
 80001f6:	b002      	add	sp, #8
 80001f8:	bd80      	pop	{r7, pc}
 80001fa:	46c0      	nop			; (mov r8, r8)
 80001fc:	40021000 	.word	0x40021000

08000200 <LL_RCC_SetAPB1Prescaler>:
 8000200:	b580      	push	{r7, lr}
 8000202:	b082      	sub	sp, #8
 8000204:	af00      	add	r7, sp, #0
 8000206:	6078      	str	r0, [r7, #4]
 8000208:	4b06      	ldr	r3, [pc, #24]	; (8000224 <LL_RCC_SetAPB1Prescaler+0x24>)
 800020a:	685b      	ldr	r3, [r3, #4]
 800020c:	4a06      	ldr	r2, [pc, #24]	; (8000228 <LL_RCC_SetAPB1Prescaler+0x28>)
 800020e:	4013      	ands	r3, r2
 8000210:	0019      	movs	r1, r3
 8000212:	4b04      	ldr	r3, [pc, #16]	; (8000224 <LL_RCC_SetAPB1Prescaler+0x24>)
 8000214:	687a      	ldr	r2, [r7, #4]
 8000216:	430a      	orrs	r2, r1
 8000218:	605a      	str	r2, [r3, #4]
 800021a:	46c0      	nop			; (mov r8, r8)
 800021c:	46bd      	mov	sp, r7
 800021e:	b002      	add	sp, #8
 8000220:	bd80      	pop	{r7, pc}
 8000222:	46c0      	nop			; (mov r8, r8)
 8000224:	40021000 	.word	0x40021000
 8000228:	fffff8ff 	.word	0xfffff8ff

0800022c <LL_RCC_PLL_Enable>:
 800022c:	b580      	push	{r7, lr}
 800022e:	af00      	add	r7, sp, #0
 8000230:	4b04      	ldr	r3, [pc, #16]	; (8000244 <LL_RCC_PLL_Enable+0x18>)
 8000232:	681a      	ldr	r2, [r3, #0]
 8000234:	4b03      	ldr	r3, [pc, #12]	; (8000244 <LL_RCC_PLL_Enable+0x18>)
 8000236:	2180      	movs	r1, #128	; 0x80
 8000238:	0449      	lsls	r1, r1, #17
 800023a:	430a      	orrs	r2, r1
 800023c:	601a      	str	r2, [r3, #0]
 800023e:	46c0      	nop			; (mov r8, r8)
 8000240:	46bd      	mov	sp, r7
 8000242:	bd80      	pop	{r7, pc}
 8000244:	40021000 	.word	0x40021000

08000248 <LL_RCC_PLL_IsReady>:
 8000248:	b580      	push	{r7, lr}
 800024a:	af00      	add	r7, sp, #0
 800024c:	4b07      	ldr	r3, [pc, #28]	; (800026c <LL_RCC_PLL_IsReady+0x24>)
 800024e:	681a      	ldr	r2, [r3, #0]
 8000250:	2380      	movs	r3, #128	; 0x80
 8000252:	049b      	lsls	r3, r3, #18
 8000254:	4013      	ands	r3, r2
 8000256:	22fe      	movs	r2, #254	; 0xfe
 8000258:	0612      	lsls	r2, r2, #24
 800025a:	4694      	mov	ip, r2
 800025c:	4463      	add	r3, ip
 800025e:	425a      	negs	r2, r3
 8000260:	4153      	adcs	r3, r2
 8000262:	b2db      	uxtb	r3, r3
 8000264:	0018      	movs	r0, r3
 8000266:	46bd      	mov	sp, r7
 8000268:	bd80      	pop	{r7, pc}
 800026a:	46c0      	nop			; (mov r8, r8)
 800026c:	40021000 	.word	0x40021000

08000270 <LL_RCC_PLL_ConfigDomain_SYS>:
 8000270:	b580      	push	{r7, lr}
 8000272:	b082      	sub	sp, #8
 8000274:	af00      	add	r7, sp, #0
 8000276:	6078      	str	r0, [r7, #4]
 8000278:	6039      	str	r1, [r7, #0]
 800027a:	4b0e      	ldr	r3, [pc, #56]	; (80002b4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 800027c:	685b      	ldr	r3, [r3, #4]
 800027e:	4a0e      	ldr	r2, [pc, #56]	; (80002b8 <LL_RCC_PLL_ConfigDomain_SYS+0x48>)
 8000280:	4013      	ands	r3, r2
 8000282:	0019      	movs	r1, r3
 8000284:	687a      	ldr	r2, [r7, #4]
 8000286:	2380      	movs	r3, #128	; 0x80
 8000288:	025b      	lsls	r3, r3, #9
 800028a:	401a      	ands	r2, r3
 800028c:	683b      	ldr	r3, [r7, #0]
 800028e:	431a      	orrs	r2, r3
 8000290:	4b08      	ldr	r3, [pc, #32]	; (80002b4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 8000292:	430a      	orrs	r2, r1
 8000294:	605a      	str	r2, [r3, #4]
 8000296:	4b07      	ldr	r3, [pc, #28]	; (80002b4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 8000298:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 800029a:	220f      	movs	r2, #15
 800029c:	4393      	bics	r3, r2
 800029e:	0019      	movs	r1, r3
 80002a0:	687b      	ldr	r3, [r7, #4]
 80002a2:	220f      	movs	r2, #15
 80002a4:	401a      	ands	r2, r3
 80002a6:	4b03      	ldr	r3, [pc, #12]	; (80002b4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 80002a8:	430a      	orrs	r2, r1
 80002aa:	62da      	str	r2, [r3, #44]	; 0x2c
 80002ac:	46c0      	nop			; (mov r8, r8)
 80002ae:	46bd      	mov	sp, r7
 80002b0:	b002      	add	sp, #8
 80002b2:	bd80      	pop	{r7, pc}
 80002b4:	40021000 	.word	0x40021000
 80002b8:	ffc2ffff 	.word	0xffc2ffff

080002bc <LL_FLASH_SetLatency>:
 80002bc:	b580      	push	{r7, lr}
 80002be:	b082      	sub	sp, #8
 80002c0:	af00      	add	r7, sp, #0
 80002c2:	6078      	str	r0, [r7, #4]
 80002c4:	4b06      	ldr	r3, [pc, #24]	; (80002e0 <LL_FLASH_SetLatency+0x24>)
 80002c6:	681b      	ldr	r3, [r3, #0]
 80002c8:	2201      	movs	r2, #1
 80002ca:	4393      	bics	r3, r2
 80002cc:	0019      	movs	r1, r3
 80002ce:	4b04      	ldr	r3, [pc, #16]	; (80002e0 <LL_FLASH_SetLatency+0x24>)
 80002d0:	687a      	ldr	r2, [r7, #4]
 80002d2:	430a      	orrs	r2, r1
 80002d4:	601a      	str	r2, [r3, #0]
 80002d6:	46c0      	nop			; (mov r8, r8)
 80002d8:	46bd      	mov	sp, r7
 80002da:	b002      	add	sp, #8
 80002dc:	bd80      	pop	{r7, pc}
 80002de:	46c0      	nop			; (mov r8, r8)
 80002e0:	40022000 	.word	0x40022000

080002e4 <LL_AHB1_GRP1_EnableClock>:
 80002e4:	b580      	push	{r7, lr}
 80002e6:	b084      	sub	sp, #16
 80002e8:	af00      	add	r7, sp, #0
 80002ea:	6078      	str	r0, [r7, #4]
 80002ec:	4b07      	ldr	r3, [pc, #28]	; (800030c <LL_AHB1_GRP1_EnableClock+0x28>)
 80002ee:	6959      	ldr	r1, [r3, #20]
 80002f0:	4b06      	ldr	r3, [pc, #24]	; (800030c <LL_AHB1_GRP1_EnableClock+0x28>)
 80002f2:	687a      	ldr	r2, [r7, #4]
 80002f4:	430a      	orrs	r2, r1
 80002f6:	615a      	str	r2, [r3, #20]
 80002f8:	4b04      	ldr	r3, [pc, #16]	; (800030c <LL_AHB1_GRP1_EnableClock+0x28>)
 80002fa:	695b      	ldr	r3, [r3, #20]
 80002fc:	687a      	ldr	r2, [r7, #4]
 80002fe:	4013      	ands	r3, r2
 8000300:	60fb      	str	r3, [r7, #12]
 8000302:	68fb      	ldr	r3, [r7, #12]
 8000304:	46c0      	nop			; (mov r8, r8)
 8000306:	46bd      	mov	sp, r7
 8000308:	b004      	add	sp, #16
 800030a:	bd80      	pop	{r7, pc}
 800030c:	40021000 	.word	0x40021000

08000310 <LL_GPIO_SetPinMode>:
 8000310:	b580      	push	{r7, lr}
 8000312:	b084      	sub	sp, #16
 8000314:	af00      	add	r7, sp, #0
 8000316:	60f8      	str	r0, [r7, #12]
 8000318:	60b9      	str	r1, [r7, #8]
 800031a:	607a      	str	r2, [r7, #4]
 800031c:	68fb      	ldr	r3, [r7, #12]
 800031e:	6819      	ldr	r1, [r3, #0]
 8000320:	68bb      	ldr	r3, [r7, #8]
 8000322:	435b      	muls	r3, r3
 8000324:	001a      	movs	r2, r3
 8000326:	0013      	movs	r3, r2
 8000328:	005b      	lsls	r3, r3, #1
 800032a:	189b      	adds	r3, r3, r2
 800032c:	43db      	mvns	r3, r3
 800032e:	400b      	ands	r3, r1
 8000330:	001a      	movs	r2, r3
 8000332:	68bb      	ldr	r3, [r7, #8]
 8000334:	435b      	muls	r3, r3
 8000336:	6879      	ldr	r1, [r7, #4]
 8000338:	434b      	muls	r3, r1
 800033a:	431a      	orrs	r2, r3
 800033c:	68fb      	ldr	r3, [r7, #12]
 800033e:	601a      	str	r2, [r3, #0]
 8000340:	46c0      	nop			; (mov r8, r8)
 8000342:	46bd      	mov	sp, r7
 8000344:	b004      	add	sp, #16
 8000346:	bd80      	pop	{r7, pc}

08000348 <LL_GPIO_IsInputPinSet>:
 8000348:	b580      	push	{r7, lr}
 800034a:	b082      	sub	sp, #8
 800034c:	af00      	add	r7, sp, #0
 800034e:	6078      	str	r0, [r7, #4]
 8000350:	6039      	str	r1, [r7, #0]
 8000352:	687b      	ldr	r3, [r7, #4]
 8000354:	691b      	ldr	r3, [r3, #16]
 8000356:	683a      	ldr	r2, [r7, #0]
 8000358:	4013      	ands	r3, r2
 800035a:	683a      	ldr	r2, [r7, #0]
 800035c:	1ad3      	subs	r3, r2, r3
 800035e:	425a      	negs	r2, r3
 8000360:	4153      	adcs	r3, r2
 8000362:	b2db      	uxtb	r3, r3
 8000364:	0018      	movs	r0, r3
 8000366:	46bd      	mov	sp, r7
 8000368:	b002      	add	sp, #8
 800036a:	bd80      	pop	{r7, pc}

0800036c <LL_GPIO_WriteOutputPort>:
 800036c:	b580      	push	{r7, lr}
 800036e:	b082      	sub	sp, #8
 8000370:	af00      	add	r7, sp, #0
 8000372:	6078      	str	r0, [r7, #4]
 8000374:	6039      	str	r1, [r7, #0]
 8000376:	687b      	ldr	r3, [r7, #4]
 8000378:	683a      	ldr	r2, [r7, #0]
 800037a:	615a      	str	r2, [r3, #20]
 800037c:	46c0      	nop			; (mov r8, r8)
 800037e:	46bd      	mov	sp, r7
 8000380:	b002      	add	sp, #8
 8000382:	bd80      	pop	{r7, pc}

08000384 <LL_GPIO_ResetOutputPin>:
 8000384:	b580      	push	{r7, lr}
 8000386:	b082      	sub	sp, #8
 8000388:	af00      	add	r7, sp, #0
 800038a:	6078      	str	r0, [r7, #4]
 800038c:	6039      	str	r1, [r7, #0]
 800038e:	687b      	ldr	r3, [r7, #4]
 8000390:	683a      	ldr	r2, [r7, #0]
 8000392:	629a      	str	r2, [r3, #40]	; 0x28
 8000394:	46c0      	nop			; (mov r8, r8)
 8000396:	46bd      	mov	sp, r7
 8000398:	b002      	add	sp, #8
 800039a:	bd80      	pop	{r7, pc}

0800039c <rcc_config>:
 800039c:	b580      	push	{r7, lr}
 800039e:	af00      	add	r7, sp, #0
 80003a0:	2001      	movs	r0, #1
 80003a2:	f7ff ff8b 	bl	80002bc <LL_FLASH_SetLatency>
 80003a6:	f7ff fed9 	bl	800015c <LL_RCC_HSI_Enable>
 80003aa:	46c0      	nop			; (mov r8, r8)
 80003ac:	f7ff fee4 	bl	8000178 <LL_RCC_HSI_IsReady>
 80003b0:	0003      	movs	r3, r0
 80003b2:	2b01      	cmp	r3, #1
 80003b4:	d1fa      	bne.n	80003ac <rcc_config+0x10>
 80003b6:	23a0      	movs	r3, #160	; 0xa0
 80003b8:	039b      	lsls	r3, r3, #14
 80003ba:	0019      	movs	r1, r3
 80003bc:	2000      	movs	r0, #0
 80003be:	f7ff ff57 	bl	8000270 <LL_RCC_PLL_ConfigDomain_SYS>
 80003c2:	f7ff ff33 	bl	800022c <LL_RCC_PLL_Enable>
 80003c6:	46c0      	nop			; (mov r8, r8)
 80003c8:	f7ff ff3e 	bl	8000248 <LL_RCC_PLL_IsReady>
 80003cc:	0003      	movs	r3, r0
 80003ce:	2b01      	cmp	r3, #1
 80003d0:	d1fa      	bne.n	80003c8 <rcc_config+0x2c>
 80003d2:	2000      	movs	r0, #0
 80003d4:	f7ff ff00 	bl	80001d8 <LL_RCC_SetAHBPrescaler>
 80003d8:	2002      	movs	r0, #2
 80003da:	f7ff fedd 	bl	8000198 <LL_RCC_SetSysClkSource>
 80003de:	46c0      	nop			; (mov r8, r8)
 80003e0:	f7ff feee 	bl	80001c0 <LL_RCC_GetSysClkSource>
 80003e4:	0003      	movs	r3, r0
 80003e6:	2b08      	cmp	r3, #8
 80003e8:	d1fa      	bne.n	80003e0 <rcc_config+0x44>
 80003ea:	2000      	movs	r0, #0
 80003ec:	f7ff ff08 	bl	8000200 <LL_RCC_SetAPB1Prescaler>
 80003f0:	4b02      	ldr	r3, [pc, #8]	; (80003fc <rcc_config+0x60>)
 80003f2:	4a03      	ldr	r2, [pc, #12]	; (8000400 <rcc_config+0x64>)
 80003f4:	601a      	str	r2, [r3, #0]
 80003f6:	46c0      	nop			; (mov r8, r8)
 80003f8:	46bd      	mov	sp, r7
 80003fa:	bd80      	pop	{r7, pc}
 80003fc:	20000000 	.word	0x20000000
 8000400:	02dc6c00 	.word	0x02dc6c00

08000404 <gpio_config>:
 8000404:	b580      	push	{r7, lr}
 8000406:	af00      	add	r7, sp, #0
 8000408:	2380      	movs	r3, #128	; 0x80
 800040a:	02db      	lsls	r3, r3, #11
 800040c:	0018      	movs	r0, r3
 800040e:	f7ff ff69 	bl	80002e4 <LL_AHB1_GRP1_EnableClock>
 8000412:	4b31      	ldr	r3, [pc, #196]	; (80004d8 <gpio_config+0xd4>)
 8000414:	2201      	movs	r2, #1
 8000416:	2101      	movs	r1, #1
 8000418:	0018      	movs	r0, r3
 800041a:	f7ff ff79 	bl	8000310 <LL_GPIO_SetPinMode>
 800041e:	4b2e      	ldr	r3, [pc, #184]	; (80004d8 <gpio_config+0xd4>)
 8000420:	2201      	movs	r2, #1
 8000422:	2102      	movs	r1, #2
 8000424:	0018      	movs	r0, r3
 8000426:	f7ff ff73 	bl	8000310 <LL_GPIO_SetPinMode>
 800042a:	4b2b      	ldr	r3, [pc, #172]	; (80004d8 <gpio_config+0xd4>)
 800042c:	2201      	movs	r2, #1
 800042e:	2104      	movs	r1, #4
 8000430:	0018      	movs	r0, r3
 8000432:	f7ff ff6d 	bl	8000310 <LL_GPIO_SetPinMode>
 8000436:	4b28      	ldr	r3, [pc, #160]	; (80004d8 <gpio_config+0xd4>)
 8000438:	2201      	movs	r2, #1
 800043a:	2108      	movs	r1, #8
 800043c:	0018      	movs	r0, r3
 800043e:	f7ff ff67 	bl	8000310 <LL_GPIO_SetPinMode>
 8000442:	4b25      	ldr	r3, [pc, #148]	; (80004d8 <gpio_config+0xd4>)
 8000444:	2201      	movs	r2, #1
 8000446:	2110      	movs	r1, #16
 8000448:	0018      	movs	r0, r3
 800044a:	f7ff ff61 	bl	8000310 <LL_GPIO_SetPinMode>
 800044e:	4b22      	ldr	r3, [pc, #136]	; (80004d8 <gpio_config+0xd4>)
 8000450:	2201      	movs	r2, #1
 8000452:	2120      	movs	r1, #32
 8000454:	0018      	movs	r0, r3
 8000456:	f7ff ff5b 	bl	8000310 <LL_GPIO_SetPinMode>
 800045a:	4b1f      	ldr	r3, [pc, #124]	; (80004d8 <gpio_config+0xd4>)
 800045c:	2201      	movs	r2, #1
 800045e:	2140      	movs	r1, #64	; 0x40
 8000460:	0018      	movs	r0, r3
 8000462:	f7ff ff55 	bl	8000310 <LL_GPIO_SetPinMode>
 8000466:	4b1c      	ldr	r3, [pc, #112]	; (80004d8 <gpio_config+0xd4>)
 8000468:	2201      	movs	r2, #1
 800046a:	2180      	movs	r1, #128	; 0x80
 800046c:	0018      	movs	r0, r3
 800046e:	f7ff ff4f 	bl	8000310 <LL_GPIO_SetPinMode>
 8000472:	2380      	movs	r3, #128	; 0x80
 8000474:	029b      	lsls	r3, r3, #10
 8000476:	0018      	movs	r0, r3
 8000478:	f7ff ff34 	bl	80002e4 <LL_AHB1_GRP1_EnableClock>
 800047c:	2390      	movs	r3, #144	; 0x90
 800047e:	05db      	lsls	r3, r3, #23
 8000480:	2200      	movs	r2, #0
 8000482:	2101      	movs	r1, #1
 8000484:	0018      	movs	r0, r3
 8000486:	f7ff ff43 	bl	8000310 <LL_GPIO_SetPinMode>
 800048a:	2380      	movs	r3, #128	; 0x80
 800048c:	031b      	lsls	r3, r3, #12
 800048e:	0018      	movs	r0, r3
 8000490:	f7ff ff28 	bl	80002e4 <LL_AHB1_GRP1_EnableClock>
 8000494:	4b11      	ldr	r3, [pc, #68]	; (80004dc <gpio_config+0xd8>)
 8000496:	2201      	movs	r2, #1
 8000498:	2101      	movs	r1, #1
 800049a:	0018      	movs	r0, r3
 800049c:	f7ff ff38 	bl	8000310 <LL_GPIO_SetPinMode>
 80004a0:	4b0e      	ldr	r3, [pc, #56]	; (80004dc <gpio_config+0xd8>)
 80004a2:	2201      	movs	r2, #1
 80004a4:	2102      	movs	r1, #2
 80004a6:	0018      	movs	r0, r3
 80004a8:	f7ff ff32 	bl	8000310 <LL_GPIO_SetPinMode>
 80004ac:	4b0b      	ldr	r3, [pc, #44]	; (80004dc <gpio_config+0xd8>)
 80004ae:	2201      	movs	r2, #1
 80004b0:	2104      	movs	r1, #4
 80004b2:	0018      	movs	r0, r3
 80004b4:	f7ff ff2c 	bl	8000310 <LL_GPIO_SetPinMode>
 80004b8:	4b08      	ldr	r3, [pc, #32]	; (80004dc <gpio_config+0xd8>)
 80004ba:	2201      	movs	r2, #1
 80004bc:	2108      	movs	r1, #8
 80004be:	0018      	movs	r0, r3
 80004c0:	f7ff ff26 	bl	8000310 <LL_GPIO_SetPinMode>
 80004c4:	2380      	movs	r3, #128	; 0x80
 80004c6:	005b      	lsls	r3, r3, #1
 80004c8:	4804      	ldr	r0, [pc, #16]	; (80004dc <gpio_config+0xd8>)
 80004ca:	2201      	movs	r2, #1
 80004cc:	0019      	movs	r1, r3
 80004ce:	f7ff ff1f 	bl	8000310 <LL_GPIO_SetPinMode>
 80004d2:	46c0      	nop			; (mov r8, r8)
 80004d4:	46bd      	mov	sp, r7
 80004d6:	bd80      	pop	{r7, pc}
 80004d8:	48000400 	.word	0x48000400
 80004dc:	48000800 	.word	0x48000800

080004e0 <delay>:
 80004e0:	b580      	push	{r7, lr}
 80004e2:	4e02      	ldr	r6, [pc, #8]	; (80004ec <delay+0xc>)
 80004e4:	3e01      	subs	r6, #1
 80004e6:	2e00      	cmp	r6, #0
 80004e8:	d1fc      	bne.n	80004e4 <delay+0x4>
 80004ea:	bd80      	pop	{r7, pc}
 80004ec:	00002710 	.word	0x00002710
 80004f0:	46c0      	nop			; (mov r8, r8)
	...

080004f4 <dyn_display>:
 80004f4:	b580      	push	{r7, lr}
 80004f6:	b084      	sub	sp, #16
 80004f8:	af00      	add	r7, sp, #0
 80004fa:	6078      	str	r0, [r7, #4]
 80004fc:	2300      	movs	r3, #0
 80004fe:	60fb      	str	r3, [r7, #12]
 8000500:	4b21      	ldr	r3, [pc, #132]	; (8000588 <dyn_display+0x94>)
 8000502:	210f      	movs	r1, #15
 8000504:	0018      	movs	r0, r3
 8000506:	f7ff ff31 	bl	800036c <LL_GPIO_WriteOutputPort>
 800050a:	237f      	movs	r3, #127	; 0x7f
 800050c:	43db      	mvns	r3, r3
 800050e:	001a      	movs	r2, r3
 8000510:	68fb      	ldr	r3, [r7, #12]
 8000512:	401a      	ands	r2, r3
 8000514:	4b1d      	ldr	r3, [pc, #116]	; (800058c <dyn_display+0x98>)
 8000516:	6819      	ldr	r1, [r3, #0]
 8000518:	4b1d      	ldr	r3, [pc, #116]	; (8000590 <dyn_display+0x9c>)
 800051a:	0089      	lsls	r1, r1, #2
 800051c:	58cb      	ldr	r3, [r1, r3]
 800051e:	43db      	mvns	r3, r3
 8000520:	005b      	lsls	r3, r3, #1
 8000522:	211c      	movs	r1, #28
 8000524:	400b      	ands	r3, r1
 8000526:	210f      	movs	r1, #15
 8000528:	4099      	lsls	r1, r3
 800052a:	000b      	movs	r3, r1
 800052c:	0019      	movs	r1, r3
 800052e:	687b      	ldr	r3, [r7, #4]
 8000530:	4019      	ands	r1, r3
 8000532:	4b16      	ldr	r3, [pc, #88]	; (800058c <dyn_display+0x98>)
 8000534:	6818      	ldr	r0, [r3, #0]
 8000536:	4b16      	ldr	r3, [pc, #88]	; (8000590 <dyn_display+0x9c>)
 8000538:	0080      	lsls	r0, r0, #2
 800053a:	58c3      	ldr	r3, [r0, r3]
 800053c:	43db      	mvns	r3, r3
 800053e:	005b      	lsls	r3, r3, #1
 8000540:	201c      	movs	r0, #28
 8000542:	4003      	ands	r3, r0
 8000544:	40d9      	lsrs	r1, r3
 8000546:	4b13      	ldr	r3, [pc, #76]	; (8000594 <dyn_display+0xa0>)
 8000548:	0089      	lsls	r1, r1, #2
 800054a:	58cb      	ldr	r3, [r1, r3]
 800054c:	4313      	orrs	r3, r2
 800054e:	60fb      	str	r3, [r7, #12]
 8000550:	68fb      	ldr	r3, [r7, #12]
 8000552:	4a11      	ldr	r2, [pc, #68]	; (8000598 <dyn_display+0xa4>)
 8000554:	0019      	movs	r1, r3
 8000556:	0010      	movs	r0, r2
 8000558:	f7ff ff08 	bl	800036c <LL_GPIO_WriteOutputPort>
 800055c:	4b0b      	ldr	r3, [pc, #44]	; (800058c <dyn_display+0x98>)
 800055e:	681a      	ldr	r2, [r3, #0]
 8000560:	4b0b      	ldr	r3, [pc, #44]	; (8000590 <dyn_display+0x9c>)
 8000562:	0092      	lsls	r2, r2, #2
 8000564:	58d3      	ldr	r3, [r2, r3]
 8000566:	4a08      	ldr	r2, [pc, #32]	; (8000588 <dyn_display+0x94>)
 8000568:	0019      	movs	r1, r3
 800056a:	0010      	movs	r0, r2
 800056c:	f7ff fefe 	bl	800036c <LL_GPIO_WriteOutputPort>
 8000570:	4b06      	ldr	r3, [pc, #24]	; (800058c <dyn_display+0x98>)
 8000572:	681b      	ldr	r3, [r3, #0]
 8000574:	3301      	adds	r3, #1
 8000576:	2203      	movs	r2, #3
 8000578:	401a      	ands	r2, r3
 800057a:	4b04      	ldr	r3, [pc, #16]	; (800058c <dyn_display+0x98>)
 800057c:	601a      	str	r2, [r3, #0]
 800057e:	46c0      	nop			; (mov r8, r8)
 8000580:	46bd      	mov	sp, r7
 8000582:	b004      	add	sp, #16
 8000584:	bd80      	pop	{r7, pc}
 8000586:	46c0      	nop			; (mov r8, r8)
 8000588:	48000800 	.word	0x48000800
 800058c:	20000450 	.word	0x20000450
 8000590:	08000880 	.word	0x08000880
 8000594:	0800083c 	.word	0x0800083c
 8000598:	48000400 	.word	0x48000400

0800059c <main>:
 800059c:	b580      	push	{r7, lr}
 800059e:	b084      	sub	sp, #16
 80005a0:	af00      	add	r7, sp, #0
 80005a2:	f7ff fefb 	bl	800039c <rcc_config>
 80005a6:	f7ff ff2d 	bl	8000404 <gpio_config>
 80005aa:	2300      	movs	r3, #0
 80005ac:	60fb      	str	r3, [r7, #12]
 80005ae:	2300      	movs	r3, #0
 80005b0:	603b      	str	r3, [r7, #0]
 80005b2:	2300      	movs	r3, #0
 80005b4:	60bb      	str	r3, [r7, #8]
 80005b6:	2300      	movs	r3, #0
 80005b8:	607b      	str	r3, [r7, #4]
 80005ba:	2380      	movs	r3, #128	; 0x80
 80005bc:	005b      	lsls	r3, r3, #1
 80005be:	4a1b      	ldr	r2, [pc, #108]	; (800062c <main+0x90>)
 80005c0:	0019      	movs	r1, r3
 80005c2:	0010      	movs	r0, r2
 80005c4:	f7ff fede 	bl	8000384 <LL_GPIO_ResetOutputPin>
 80005c8:	68fb      	ldr	r3, [r7, #12]
 80005ca:	0018      	movs	r0, r3
 80005cc:	f7ff ff92 	bl	80004f4 <dyn_display>
 80005d0:	2390      	movs	r3, #144	; 0x90
 80005d2:	05db      	lsls	r3, r3, #23
 80005d4:	2101      	movs	r1, #1
 80005d6:	0018      	movs	r0, r3
 80005d8:	f7ff feb6 	bl	8000348 <LL_GPIO_IsInputPinSet>
 80005dc:	0003      	movs	r3, r0
 80005de:	603b      	str	r3, [r7, #0]
 80005e0:	68bb      	ldr	r3, [r7, #8]
 80005e2:	2b00      	cmp	r3, #0
 80005e4:	d107      	bne.n	80005f6 <main+0x5a>
 80005e6:	683b      	ldr	r3, [r7, #0]
 80005e8:	2b01      	cmp	r3, #1
 80005ea:	d104      	bne.n	80005f6 <main+0x5a>
 80005ec:	687b      	ldr	r3, [r7, #4]
 80005ee:	3301      	adds	r3, #1
 80005f0:	607b      	str	r3, [r7, #4]
 80005f2:	f7ff ff75 	bl	80004e0 <delay>
 80005f6:	687b      	ldr	r3, [r7, #4]
 80005f8:	2b09      	cmp	r3, #9
 80005fa:	d908      	bls.n	800060e <main+0x72>
 80005fc:	68fb      	ldr	r3, [r7, #12]
 80005fe:	3301      	adds	r3, #1
 8000600:	60fb      	str	r3, [r7, #12]
 8000602:	2301      	movs	r3, #1
 8000604:	60bb      	str	r3, [r7, #8]
 8000606:	2300      	movs	r3, #0
 8000608:	603b      	str	r3, [r7, #0]
 800060a:	2300      	movs	r3, #0
 800060c:	607b      	str	r3, [r7, #4]
 800060e:	68bb      	ldr	r3, [r7, #8]
 8000610:	2b00      	cmp	r3, #0
 8000612:	d0d9      	beq.n	80005c8 <main+0x2c>
 8000614:	2390      	movs	r3, #144	; 0x90
 8000616:	05db      	lsls	r3, r3, #23
 8000618:	2101      	movs	r1, #1
 800061a:	0018      	movs	r0, r3
 800061c:	f7ff fe94 	bl	8000348 <LL_GPIO_IsInputPinSet>
 8000620:	1e03      	subs	r3, r0, #0
 8000622:	d1d1      	bne.n	80005c8 <main+0x2c>
 8000624:	2300      	movs	r3, #0
 8000626:	60bb      	str	r3, [r7, #8]
 8000628:	e7ce      	b.n	80005c8 <main+0x2c>
 800062a:	46c0      	nop			; (mov r8, r8)
 800062c:	48000800 	.word	0x48000800

08000630 <SystemInit>:
 8000630:	b580      	push	{r7, lr}
 8000632:	af00      	add	r7, sp, #0
 8000634:	4b1a      	ldr	r3, [pc, #104]	; (80006a0 <SystemInit+0x70>)
 8000636:	681a      	ldr	r2, [r3, #0]
 8000638:	4b19      	ldr	r3, [pc, #100]	; (80006a0 <SystemInit+0x70>)
 800063a:	2101      	movs	r1, #1
 800063c:	430a      	orrs	r2, r1
 800063e:	601a      	str	r2, [r3, #0]
 8000640:	4b17      	ldr	r3, [pc, #92]	; (80006a0 <SystemInit+0x70>)
 8000642:	685a      	ldr	r2, [r3, #4]
 8000644:	4b16      	ldr	r3, [pc, #88]	; (80006a0 <SystemInit+0x70>)
 8000646:	4917      	ldr	r1, [pc, #92]	; (80006a4 <SystemInit+0x74>)
 8000648:	400a      	ands	r2, r1
 800064a:	605a      	str	r2, [r3, #4]
 800064c:	4b14      	ldr	r3, [pc, #80]	; (80006a0 <SystemInit+0x70>)
 800064e:	681a      	ldr	r2, [r3, #0]
 8000650:	4b13      	ldr	r3, [pc, #76]	; (80006a0 <SystemInit+0x70>)
 8000652:	4915      	ldr	r1, [pc, #84]	; (80006a8 <SystemInit+0x78>)
 8000654:	400a      	ands	r2, r1
 8000656:	601a      	str	r2, [r3, #0]
 8000658:	4b11      	ldr	r3, [pc, #68]	; (80006a0 <SystemInit+0x70>)
 800065a:	681a      	ldr	r2, [r3, #0]
 800065c:	4b10      	ldr	r3, [pc, #64]	; (80006a0 <SystemInit+0x70>)
 800065e:	4913      	ldr	r1, [pc, #76]	; (80006ac <SystemInit+0x7c>)
 8000660:	400a      	ands	r2, r1
 8000662:	601a      	str	r2, [r3, #0]
 8000664:	4b0e      	ldr	r3, [pc, #56]	; (80006a0 <SystemInit+0x70>)
 8000666:	685a      	ldr	r2, [r3, #4]
 8000668:	4b0d      	ldr	r3, [pc, #52]	; (80006a0 <SystemInit+0x70>)
 800066a:	4911      	ldr	r1, [pc, #68]	; (80006b0 <SystemInit+0x80>)
 800066c:	400a      	ands	r2, r1
 800066e:	605a      	str	r2, [r3, #4]
 8000670:	4b0b      	ldr	r3, [pc, #44]	; (80006a0 <SystemInit+0x70>)
 8000672:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8000674:	4b0a      	ldr	r3, [pc, #40]	; (80006a0 <SystemInit+0x70>)
 8000676:	210f      	movs	r1, #15
 8000678:	438a      	bics	r2, r1
 800067a:	62da      	str	r2, [r3, #44]	; 0x2c
 800067c:	4b08      	ldr	r3, [pc, #32]	; (80006a0 <SystemInit+0x70>)
 800067e:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8000680:	4b07      	ldr	r3, [pc, #28]	; (80006a0 <SystemInit+0x70>)
 8000682:	490c      	ldr	r1, [pc, #48]	; (80006b4 <SystemInit+0x84>)
 8000684:	400a      	ands	r2, r1
 8000686:	631a      	str	r2, [r3, #48]	; 0x30
 8000688:	4b05      	ldr	r3, [pc, #20]	; (80006a0 <SystemInit+0x70>)
 800068a:	6b5a      	ldr	r2, [r3, #52]	; 0x34
 800068c:	4b04      	ldr	r3, [pc, #16]	; (80006a0 <SystemInit+0x70>)
 800068e:	2101      	movs	r1, #1
 8000690:	438a      	bics	r2, r1
 8000692:	635a      	str	r2, [r3, #52]	; 0x34
 8000694:	4b02      	ldr	r3, [pc, #8]	; (80006a0 <SystemInit+0x70>)
 8000696:	2200      	movs	r2, #0
 8000698:	609a      	str	r2, [r3, #8]
 800069a:	46c0      	nop			; (mov r8, r8)
 800069c:	46bd      	mov	sp, r7
 800069e:	bd80      	pop	{r7, pc}
 80006a0:	40021000 	.word	0x40021000
 80006a4:	f8ffb80c 	.word	0xf8ffb80c
 80006a8:	fef6ffff 	.word	0xfef6ffff
 80006ac:	fffbffff 	.word	0xfffbffff
 80006b0:	ffc0ffff 	.word	0xffc0ffff
 80006b4:	fffffeac 	.word	0xfffffeac

080006b8 <NMI_Handler>:
 80006b8:	b580      	push	{r7, lr}
 80006ba:	af00      	add	r7, sp, #0
 80006bc:	46c0      	nop			; (mov r8, r8)
 80006be:	46bd      	mov	sp, r7
 80006c0:	bd80      	pop	{r7, pc}

080006c2 <HardFault_Handler>:
 80006c2:	b580      	push	{r7, lr}
 80006c4:	af00      	add	r7, sp, #0
 80006c6:	e7fe      	b.n	80006c6 <HardFault_Handler+0x4>

080006c8 <SVC_Handler>:
 80006c8:	b580      	push	{r7, lr}
 80006ca:	af00      	add	r7, sp, #0
 80006cc:	46c0      	nop			; (mov r8, r8)
 80006ce:	46bd      	mov	sp, r7
 80006d0:	bd80      	pop	{r7, pc}

080006d2 <PendSV_Handler>:
 80006d2:	b580      	push	{r7, lr}
 80006d4:	af00      	add	r7, sp, #0
 80006d6:	46c0      	nop			; (mov r8, r8)
 80006d8:	46bd      	mov	sp, r7
 80006da:	bd80      	pop	{r7, pc}

080006dc <__libc_init_array>:
 80006dc:	b570      	push	{r4, r5, r6, lr}
 80006de:	4d0c      	ldr	r5, [pc, #48]	; (8000710 <__libc_init_array+0x34>)
 80006e0:	4e0c      	ldr	r6, [pc, #48]	; (8000714 <__libc_init_array+0x38>)
 80006e2:	1b76      	subs	r6, r6, r5
 80006e4:	10b6      	asrs	r6, r6, #2
 80006e6:	d005      	beq.n	80006f4 <__libc_init_array+0x18>
 80006e8:	2400      	movs	r4, #0
 80006ea:	cd08      	ldmia	r5!, {r3}
 80006ec:	3401      	adds	r4, #1
 80006ee:	4798      	blx	r3
 80006f0:	42a6      	cmp	r6, r4
 80006f2:	d1fa      	bne.n	80006ea <__libc_init_array+0xe>
 80006f4:	f000 f896 	bl	8000824 <_init>
 80006f8:	4d07      	ldr	r5, [pc, #28]	; (8000718 <__libc_init_array+0x3c>)
 80006fa:	4e08      	ldr	r6, [pc, #32]	; (800071c <__libc_init_array+0x40>)
 80006fc:	1b76      	subs	r6, r6, r5
 80006fe:	10b6      	asrs	r6, r6, #2
 8000700:	d005      	beq.n	800070e <__libc_init_array+0x32>
 8000702:	2400      	movs	r4, #0
 8000704:	cd08      	ldmia	r5!, {r3}
 8000706:	3401      	adds	r4, #1
 8000708:	4798      	blx	r3
 800070a:	42a6      	cmp	r6, r4
 800070c:	d1fa      	bne.n	8000704 <__libc_init_array+0x28>
 800070e:	bd70      	pop	{r4, r5, r6, pc}
 8000710:	08000894 	.word	0x08000894
 8000714:	08000894 	.word	0x08000894
 8000718:	08000894 	.word	0x08000894
 800071c:	0800089c 	.word	0x0800089c

08000720 <register_fini>:
 8000720:	4b03      	ldr	r3, [pc, #12]	; (8000730 <register_fini+0x10>)
 8000722:	b510      	push	{r4, lr}
 8000724:	2b00      	cmp	r3, #0
 8000726:	d002      	beq.n	800072e <register_fini+0xe>
 8000728:	4802      	ldr	r0, [pc, #8]	; (8000734 <register_fini+0x14>)
 800072a:	f000 f805 	bl	8000738 <atexit>
 800072e:	bd10      	pop	{r4, pc}
 8000730:	00000000 	.word	0x00000000
 8000734:	08000749 	.word	0x08000749

08000738 <atexit>:
 8000738:	b510      	push	{r4, lr}
 800073a:	0001      	movs	r1, r0
 800073c:	2300      	movs	r3, #0
 800073e:	2200      	movs	r2, #0
 8000740:	2000      	movs	r0, #0
 8000742:	f000 f819 	bl	8000778 <__register_exitproc>
 8000746:	bd10      	pop	{r4, pc}

08000748 <__libc_fini_array>:
 8000748:	b570      	push	{r4, r5, r6, lr}
 800074a:	4d07      	ldr	r5, [pc, #28]	; (8000768 <__libc_fini_array+0x20>)
 800074c:	4c07      	ldr	r4, [pc, #28]	; (800076c <__libc_fini_array+0x24>)
 800074e:	1b64      	subs	r4, r4, r5
 8000750:	10a4      	asrs	r4, r4, #2
 8000752:	d005      	beq.n	8000760 <__libc_fini_array+0x18>
 8000754:	3c01      	subs	r4, #1
 8000756:	00a3      	lsls	r3, r4, #2
 8000758:	58eb      	ldr	r3, [r5, r3]
 800075a:	4798      	blx	r3
 800075c:	2c00      	cmp	r4, #0
 800075e:	d1f9      	bne.n	8000754 <__libc_fini_array+0xc>
 8000760:	f000 f866 	bl	8000830 <_fini>
 8000764:	bd70      	pop	{r4, r5, r6, pc}
 8000766:	46c0      	nop			; (mov r8, r8)
 8000768:	0800089c 	.word	0x0800089c
 800076c:	080008a0 	.word	0x080008a0

08000770 <__retarget_lock_acquire_recursive>:
 8000770:	4770      	bx	lr
 8000772:	46c0      	nop			; (mov r8, r8)

08000774 <__retarget_lock_release_recursive>:
 8000774:	4770      	bx	lr
 8000776:	46c0      	nop			; (mov r8, r8)

08000778 <__register_exitproc>:
 8000778:	b5f0      	push	{r4, r5, r6, r7, lr}
 800077a:	46d6      	mov	lr, sl
 800077c:	464f      	mov	r7, r9
 800077e:	4646      	mov	r6, r8
 8000780:	b5c0      	push	{r6, r7, lr}
 8000782:	4f26      	ldr	r7, [pc, #152]	; (800081c <__register_exitproc+0xa4>)
 8000784:	b082      	sub	sp, #8
 8000786:	0006      	movs	r6, r0
 8000788:	6838      	ldr	r0, [r7, #0]
 800078a:	4692      	mov	sl, r2
 800078c:	4698      	mov	r8, r3
 800078e:	4689      	mov	r9, r1
 8000790:	f7ff ffee 	bl	8000770 <__retarget_lock_acquire_recursive>
 8000794:	4b22      	ldr	r3, [pc, #136]	; (8000820 <__register_exitproc+0xa8>)
 8000796:	681b      	ldr	r3, [r3, #0]
 8000798:	9301      	str	r3, [sp, #4]
 800079a:	23a4      	movs	r3, #164	; 0xa4
 800079c:	9a01      	ldr	r2, [sp, #4]
 800079e:	005b      	lsls	r3, r3, #1
 80007a0:	58d5      	ldr	r5, [r2, r3]
 80007a2:	2d00      	cmp	r5, #0
 80007a4:	d02e      	beq.n	8000804 <__register_exitproc+0x8c>
 80007a6:	686c      	ldr	r4, [r5, #4]
 80007a8:	2c1f      	cmp	r4, #31
 80007aa:	dc30      	bgt.n	800080e <__register_exitproc+0x96>
 80007ac:	2e00      	cmp	r6, #0
 80007ae:	d10f      	bne.n	80007d0 <__register_exitproc+0x58>
 80007b0:	1c63      	adds	r3, r4, #1
 80007b2:	606b      	str	r3, [r5, #4]
 80007b4:	464b      	mov	r3, r9
 80007b6:	3402      	adds	r4, #2
 80007b8:	00a4      	lsls	r4, r4, #2
 80007ba:	6838      	ldr	r0, [r7, #0]
 80007bc:	5163      	str	r3, [r4, r5]
 80007be:	f7ff ffd9 	bl	8000774 <__retarget_lock_release_recursive>
 80007c2:	2000      	movs	r0, #0
 80007c4:	b002      	add	sp, #8
 80007c6:	bce0      	pop	{r5, r6, r7}
 80007c8:	46ba      	mov	sl, r7
 80007ca:	46b1      	mov	r9, r6
 80007cc:	46a8      	mov	r8, r5
 80007ce:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80007d0:	2288      	movs	r2, #136	; 0x88
 80007d2:	4651      	mov	r1, sl
 80007d4:	0028      	movs	r0, r5
 80007d6:	00a3      	lsls	r3, r4, #2
 80007d8:	18eb      	adds	r3, r5, r3
 80007da:	5099      	str	r1, [r3, r2]
 80007dc:	3a87      	subs	r2, #135	; 0x87
 80007de:	40a2      	lsls	r2, r4
 80007e0:	3089      	adds	r0, #137	; 0x89
 80007e2:	30ff      	adds	r0, #255	; 0xff
 80007e4:	6801      	ldr	r1, [r0, #0]
 80007e6:	4311      	orrs	r1, r2
 80007e8:	6001      	str	r1, [r0, #0]
 80007ea:	2184      	movs	r1, #132	; 0x84
 80007ec:	4640      	mov	r0, r8
 80007ee:	0049      	lsls	r1, r1, #1
 80007f0:	5058      	str	r0, [r3, r1]
 80007f2:	2e02      	cmp	r6, #2
 80007f4:	d1dc      	bne.n	80007b0 <__register_exitproc+0x38>
 80007f6:	002b      	movs	r3, r5
 80007f8:	338d      	adds	r3, #141	; 0x8d
 80007fa:	33ff      	adds	r3, #255	; 0xff
 80007fc:	6819      	ldr	r1, [r3, #0]
 80007fe:	430a      	orrs	r2, r1
 8000800:	601a      	str	r2, [r3, #0]
 8000802:	e7d5      	b.n	80007b0 <__register_exitproc+0x38>
 8000804:	0015      	movs	r5, r2
 8000806:	354d      	adds	r5, #77	; 0x4d
 8000808:	35ff      	adds	r5, #255	; 0xff
 800080a:	50d5      	str	r5, [r2, r3]
 800080c:	e7cb      	b.n	80007a6 <__register_exitproc+0x2e>
 800080e:	6838      	ldr	r0, [r7, #0]
 8000810:	f7ff ffb0 	bl	8000774 <__retarget_lock_release_recursive>
 8000814:	2001      	movs	r0, #1
 8000816:	4240      	negs	r0, r0
 8000818:	e7d4      	b.n	80007c4 <__register_exitproc+0x4c>
 800081a:	46c0      	nop			; (mov r8, r8)
 800081c:	20000430 	.word	0x20000430
 8000820:	08000890 	.word	0x08000890

08000824 <_init>:
 8000824:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000826:	46c0      	nop			; (mov r8, r8)
 8000828:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800082a:	bc08      	pop	{r3}
 800082c:	469e      	mov	lr, r3
 800082e:	4770      	bx	lr

08000830 <_fini>:
 8000830:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000832:	46c0      	nop			; (mov r8, r8)
 8000834:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8000836:	bc08      	pop	{r3}
 8000838:	469e      	mov	lr, r3
 800083a:	4770      	bx	lr
