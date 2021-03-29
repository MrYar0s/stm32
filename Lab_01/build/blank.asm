
build/blank.elf:     file format elf32-littlearm

Sections:
Idx Name              Size      VMA       LMA       File off  Algn  Flags
  0 .isr_vector       000000c0  08000000  08000000  00010000  2**0  CONTENTS, ALLOC, LOAD, READONLY, DATA
  1 .text             0000059c  080000c0  080000c0  000100c0  2**2  CONTENTS, ALLOC, LOAD, READONLY, CODE
  2 .rodata           00000004  0800065c  0800065c  0001065c  2**2  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 .init_array       00000008  08000660  08000660  00010660  2**2  CONTENTS, ALLOC, LOAD, DATA
  4 .fini_array       00000004  08000668  08000668  00010668  2**2  CONTENTS, ALLOC, LOAD, DATA
  5 .data             00000434  20000000  0800066c  00020000  2**3  CONTENTS, ALLOC, LOAD, DATA
  6 .bss              00000020  20000434  08000aa0  00020434  2**2  ALLOC
  7 ._user_heap_stack 00000604  20000454  08000aa0  00020454  2**0  ALLOC
  8 .ARM.attributes   00000028  00000000  00000000  00020434  2**0  CONTENTS, READONLY
  9 .debug_info       000008e1  00000000  00000000  0002045c  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 10 .debug_abbrev     00000301  00000000  00000000  00020d3d  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 11 .debug_loc        0000046c  00000000  00000000  0002103e  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 12 .debug_aranges    00000108  00000000  00000000  000214aa  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 13 .debug_ranges     000000d8  00000000  00000000  000215b2  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 14 .debug_line       000005dd  00000000  00000000  0002168a  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 15 .debug_str        00000448  00000000  00000000  00021c67  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 16 .comment          0000004d  00000000  00000000  000220af  2**0  CONTENTS, READONLY
 17 .debug_frame      000004ac  00000000  00000000  000220fc  2**2  CONTENTS, READONLY, DEBUGGING, OCTETS

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
 80000e4:	08000644 	.word	0x08000644

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
 8000104:	08000644 	.word	0x08000644

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
 8000132:	f000 f98d 	bl	8000450 <SystemInit>
 8000136:	f000 f9e1 	bl	80004fc <__libc_init_array>
 800013a:	f000 f96f 	bl	800041c <main>

0800013e <LoopForever>:
 800013e:	e7fe      	b.n	800013e <LoopForever>
 8000140:	20002000 	.word	0x20002000
 8000144:	20000000 	.word	0x20000000
 8000148:	20000434 	.word	0x20000434
 800014c:	0800066c 	.word	0x0800066c
 8000150:	20000434 	.word	0x20000434
 8000154:	20000454 	.word	0x20000454

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

08000348 <LL_GPIO_SetOutputPin>:
 8000348:	b580      	push	{r7, lr}
 800034a:	b082      	sub	sp, #8
 800034c:	af00      	add	r7, sp, #0
 800034e:	6078      	str	r0, [r7, #4]
 8000350:	6039      	str	r1, [r7, #0]
 8000352:	687b      	ldr	r3, [r7, #4]
 8000354:	683a      	ldr	r2, [r7, #0]
 8000356:	619a      	str	r2, [r3, #24]
 8000358:	46c0      	nop			; (mov r8, r8)
 800035a:	46bd      	mov	sp, r7
 800035c:	b002      	add	sp, #8
 800035e:	bd80      	pop	{r7, pc}

08000360 <LL_GPIO_ResetOutputPin>:
 8000360:	b580      	push	{r7, lr}
 8000362:	b082      	sub	sp, #8
 8000364:	af00      	add	r7, sp, #0
 8000366:	6078      	str	r0, [r7, #4]
 8000368:	6039      	str	r1, [r7, #0]
 800036a:	687b      	ldr	r3, [r7, #4]
 800036c:	683a      	ldr	r2, [r7, #0]
 800036e:	629a      	str	r2, [r3, #40]	; 0x28
 8000370:	46c0      	nop			; (mov r8, r8)
 8000372:	46bd      	mov	sp, r7
 8000374:	b002      	add	sp, #8
 8000376:	bd80      	pop	{r7, pc}

08000378 <rcc_config>:
 8000378:	b580      	push	{r7, lr}
 800037a:	af00      	add	r7, sp, #0
 800037c:	2001      	movs	r0, #1
 800037e:	f7ff ff9d 	bl	80002bc <LL_FLASH_SetLatency>
 8000382:	f7ff feeb 	bl	800015c <LL_RCC_HSI_Enable>
 8000386:	46c0      	nop			; (mov r8, r8)
 8000388:	f7ff fef6 	bl	8000178 <LL_RCC_HSI_IsReady>
 800038c:	0003      	movs	r3, r0
 800038e:	2b01      	cmp	r3, #1
 8000390:	d1fa      	bne.n	8000388 <rcc_config+0x10>
 8000392:	23a0      	movs	r3, #160	; 0xa0
 8000394:	039b      	lsls	r3, r3, #14
 8000396:	0019      	movs	r1, r3
 8000398:	2000      	movs	r0, #0
 800039a:	f7ff ff69 	bl	8000270 <LL_RCC_PLL_ConfigDomain_SYS>
 800039e:	f7ff ff45 	bl	800022c <LL_RCC_PLL_Enable>
 80003a2:	46c0      	nop			; (mov r8, r8)
 80003a4:	f7ff ff50 	bl	8000248 <LL_RCC_PLL_IsReady>
 80003a8:	0003      	movs	r3, r0
 80003aa:	2b01      	cmp	r3, #1
 80003ac:	d1fa      	bne.n	80003a4 <rcc_config+0x2c>
 80003ae:	2000      	movs	r0, #0
 80003b0:	f7ff ff12 	bl	80001d8 <LL_RCC_SetAHBPrescaler>
 80003b4:	2002      	movs	r0, #2
 80003b6:	f7ff feef 	bl	8000198 <LL_RCC_SetSysClkSource>
 80003ba:	46c0      	nop			; (mov r8, r8)
 80003bc:	f7ff ff00 	bl	80001c0 <LL_RCC_GetSysClkSource>
 80003c0:	0003      	movs	r3, r0
 80003c2:	2b08      	cmp	r3, #8
 80003c4:	d1fa      	bne.n	80003bc <rcc_config+0x44>
 80003c6:	2000      	movs	r0, #0
 80003c8:	f7ff ff1a 	bl	8000200 <LL_RCC_SetAPB1Prescaler>
 80003cc:	4b02      	ldr	r3, [pc, #8]	; (80003d8 <rcc_config+0x60>)
 80003ce:	4a03      	ldr	r2, [pc, #12]	; (80003dc <rcc_config+0x64>)
 80003d0:	601a      	str	r2, [r3, #0]
 80003d2:	46c0      	nop			; (mov r8, r8)
 80003d4:	46bd      	mov	sp, r7
 80003d6:	bd80      	pop	{r7, pc}
 80003d8:	20000000 	.word	0x20000000
 80003dc:	02dc6c00 	.word	0x02dc6c00

080003e0 <gpio_config>:
 80003e0:	b580      	push	{r7, lr}
 80003e2:	af00      	add	r7, sp, #0
 80003e4:	2380      	movs	r3, #128	; 0x80
 80003e6:	031b      	lsls	r3, r3, #12
 80003e8:	0018      	movs	r0, r3
 80003ea:	f7ff ff7b 	bl	80002e4 <LL_AHB1_GRP1_EnableClock>
 80003ee:	2380      	movs	r3, #128	; 0x80
 80003f0:	005b      	lsls	r3, r3, #1
 80003f2:	4804      	ldr	r0, [pc, #16]	; (8000404 <gpio_config+0x24>)
 80003f4:	2201      	movs	r2, #1
 80003f6:	0019      	movs	r1, r3
 80003f8:	f7ff ff8a 	bl	8000310 <LL_GPIO_SetPinMode>
 80003fc:	46c0      	nop			; (mov r8, r8)
 80003fe:	46bd      	mov	sp, r7
 8000400:	bd80      	pop	{r7, pc}
 8000402:	46c0      	nop			; (mov r8, r8)
 8000404:	48000800 	.word	0x48000800

08000408 <delay>:
 8000408:	b580      	push	{r7, lr}
 800040a:	4e02      	ldr	r6, [pc, #8]	; (8000414 <delay+0xc>)
 800040c:	3e01      	subs	r6, #1
 800040e:	2e00      	cmp	r6, #0
 8000410:	d1fc      	bne.n	800040c <delay+0x4>
 8000412:	bd80      	pop	{r7, pc}
 8000414:	005b8d80 	.word	0x005b8d80
 8000418:	46c0      	nop			; (mov r8, r8)
	...

0800041c <main>:
 800041c:	b580      	push	{r7, lr}
 800041e:	af00      	add	r7, sp, #0
 8000420:	f7ff ffaa 	bl	8000378 <rcc_config>
 8000424:	f7ff ffdc 	bl	80003e0 <gpio_config>
 8000428:	2380      	movs	r3, #128	; 0x80
 800042a:	005b      	lsls	r3, r3, #1
 800042c:	4a07      	ldr	r2, [pc, #28]	; (800044c <main+0x30>)
 800042e:	0019      	movs	r1, r3
 8000430:	0010      	movs	r0, r2
 8000432:	f7ff ff89 	bl	8000348 <LL_GPIO_SetOutputPin>
 8000436:	2380      	movs	r3, #128	; 0x80
 8000438:	005b      	lsls	r3, r3, #1
 800043a:	4a04      	ldr	r2, [pc, #16]	; (800044c <main+0x30>)
 800043c:	0019      	movs	r1, r3
 800043e:	0010      	movs	r0, r2
 8000440:	f7ff ff8e 	bl	8000360 <LL_GPIO_ResetOutputPin>
 8000444:	f7ff ffe0 	bl	8000408 <delay>
 8000448:	e7ee      	b.n	8000428 <main+0xc>
 800044a:	46c0      	nop			; (mov r8, r8)
 800044c:	48000800 	.word	0x48000800

08000450 <SystemInit>:
 8000450:	b580      	push	{r7, lr}
 8000452:	af00      	add	r7, sp, #0
 8000454:	4b1a      	ldr	r3, [pc, #104]	; (80004c0 <SystemInit+0x70>)
 8000456:	681a      	ldr	r2, [r3, #0]
 8000458:	4b19      	ldr	r3, [pc, #100]	; (80004c0 <SystemInit+0x70>)
 800045a:	2101      	movs	r1, #1
 800045c:	430a      	orrs	r2, r1
 800045e:	601a      	str	r2, [r3, #0]
 8000460:	4b17      	ldr	r3, [pc, #92]	; (80004c0 <SystemInit+0x70>)
 8000462:	685a      	ldr	r2, [r3, #4]
 8000464:	4b16      	ldr	r3, [pc, #88]	; (80004c0 <SystemInit+0x70>)
 8000466:	4917      	ldr	r1, [pc, #92]	; (80004c4 <SystemInit+0x74>)
 8000468:	400a      	ands	r2, r1
 800046a:	605a      	str	r2, [r3, #4]
 800046c:	4b14      	ldr	r3, [pc, #80]	; (80004c0 <SystemInit+0x70>)
 800046e:	681a      	ldr	r2, [r3, #0]
 8000470:	4b13      	ldr	r3, [pc, #76]	; (80004c0 <SystemInit+0x70>)
 8000472:	4915      	ldr	r1, [pc, #84]	; (80004c8 <SystemInit+0x78>)
 8000474:	400a      	ands	r2, r1
 8000476:	601a      	str	r2, [r3, #0]
 8000478:	4b11      	ldr	r3, [pc, #68]	; (80004c0 <SystemInit+0x70>)
 800047a:	681a      	ldr	r2, [r3, #0]
 800047c:	4b10      	ldr	r3, [pc, #64]	; (80004c0 <SystemInit+0x70>)
 800047e:	4913      	ldr	r1, [pc, #76]	; (80004cc <SystemInit+0x7c>)
 8000480:	400a      	ands	r2, r1
 8000482:	601a      	str	r2, [r3, #0]
 8000484:	4b0e      	ldr	r3, [pc, #56]	; (80004c0 <SystemInit+0x70>)
 8000486:	685a      	ldr	r2, [r3, #4]
 8000488:	4b0d      	ldr	r3, [pc, #52]	; (80004c0 <SystemInit+0x70>)
 800048a:	4911      	ldr	r1, [pc, #68]	; (80004d0 <SystemInit+0x80>)
 800048c:	400a      	ands	r2, r1
 800048e:	605a      	str	r2, [r3, #4]
 8000490:	4b0b      	ldr	r3, [pc, #44]	; (80004c0 <SystemInit+0x70>)
 8000492:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8000494:	4b0a      	ldr	r3, [pc, #40]	; (80004c0 <SystemInit+0x70>)
 8000496:	210f      	movs	r1, #15
 8000498:	438a      	bics	r2, r1
 800049a:	62da      	str	r2, [r3, #44]	; 0x2c
 800049c:	4b08      	ldr	r3, [pc, #32]	; (80004c0 <SystemInit+0x70>)
 800049e:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 80004a0:	4b07      	ldr	r3, [pc, #28]	; (80004c0 <SystemInit+0x70>)
 80004a2:	490c      	ldr	r1, [pc, #48]	; (80004d4 <SystemInit+0x84>)
 80004a4:	400a      	ands	r2, r1
 80004a6:	631a      	str	r2, [r3, #48]	; 0x30
 80004a8:	4b05      	ldr	r3, [pc, #20]	; (80004c0 <SystemInit+0x70>)
 80004aa:	6b5a      	ldr	r2, [r3, #52]	; 0x34
 80004ac:	4b04      	ldr	r3, [pc, #16]	; (80004c0 <SystemInit+0x70>)
 80004ae:	2101      	movs	r1, #1
 80004b0:	438a      	bics	r2, r1
 80004b2:	635a      	str	r2, [r3, #52]	; 0x34
 80004b4:	4b02      	ldr	r3, [pc, #8]	; (80004c0 <SystemInit+0x70>)
 80004b6:	2200      	movs	r2, #0
 80004b8:	609a      	str	r2, [r3, #8]
 80004ba:	46c0      	nop			; (mov r8, r8)
 80004bc:	46bd      	mov	sp, r7
 80004be:	bd80      	pop	{r7, pc}
 80004c0:	40021000 	.word	0x40021000
 80004c4:	f8ffb80c 	.word	0xf8ffb80c
 80004c8:	fef6ffff 	.word	0xfef6ffff
 80004cc:	fffbffff 	.word	0xfffbffff
 80004d0:	ffc0ffff 	.word	0xffc0ffff
 80004d4:	fffffeac 	.word	0xfffffeac

080004d8 <NMI_Handler>:
 80004d8:	b580      	push	{r7, lr}
 80004da:	af00      	add	r7, sp, #0
 80004dc:	46c0      	nop			; (mov r8, r8)
 80004de:	46bd      	mov	sp, r7
 80004e0:	bd80      	pop	{r7, pc}

080004e2 <HardFault_Handler>:
 80004e2:	b580      	push	{r7, lr}
 80004e4:	af00      	add	r7, sp, #0
 80004e6:	e7fe      	b.n	80004e6 <HardFault_Handler+0x4>

080004e8 <SVC_Handler>:
 80004e8:	b580      	push	{r7, lr}
 80004ea:	af00      	add	r7, sp, #0
 80004ec:	46c0      	nop			; (mov r8, r8)
 80004ee:	46bd      	mov	sp, r7
 80004f0:	bd80      	pop	{r7, pc}

080004f2 <PendSV_Handler>:
 80004f2:	b580      	push	{r7, lr}
 80004f4:	af00      	add	r7, sp, #0
 80004f6:	46c0      	nop			; (mov r8, r8)
 80004f8:	46bd      	mov	sp, r7
 80004fa:	bd80      	pop	{r7, pc}

080004fc <__libc_init_array>:
 80004fc:	b570      	push	{r4, r5, r6, lr}
 80004fe:	4d0c      	ldr	r5, [pc, #48]	; (8000530 <__libc_init_array+0x34>)
 8000500:	4e0c      	ldr	r6, [pc, #48]	; (8000534 <__libc_init_array+0x38>)
 8000502:	1b76      	subs	r6, r6, r5
 8000504:	10b6      	asrs	r6, r6, #2
 8000506:	d005      	beq.n	8000514 <__libc_init_array+0x18>
 8000508:	2400      	movs	r4, #0
 800050a:	cd08      	ldmia	r5!, {r3}
 800050c:	3401      	adds	r4, #1
 800050e:	4798      	blx	r3
 8000510:	42a6      	cmp	r6, r4
 8000512:	d1fa      	bne.n	800050a <__libc_init_array+0xe>
 8000514:	f000 f896 	bl	8000644 <_init>
 8000518:	4d07      	ldr	r5, [pc, #28]	; (8000538 <__libc_init_array+0x3c>)
 800051a:	4e08      	ldr	r6, [pc, #32]	; (800053c <__libc_init_array+0x40>)
 800051c:	1b76      	subs	r6, r6, r5
 800051e:	10b6      	asrs	r6, r6, #2
 8000520:	d005      	beq.n	800052e <__libc_init_array+0x32>
 8000522:	2400      	movs	r4, #0
 8000524:	cd08      	ldmia	r5!, {r3}
 8000526:	3401      	adds	r4, #1
 8000528:	4798      	blx	r3
 800052a:	42a6      	cmp	r6, r4
 800052c:	d1fa      	bne.n	8000524 <__libc_init_array+0x28>
 800052e:	bd70      	pop	{r4, r5, r6, pc}
 8000530:	08000660 	.word	0x08000660
 8000534:	08000660 	.word	0x08000660
 8000538:	08000660 	.word	0x08000660
 800053c:	08000668 	.word	0x08000668

08000540 <register_fini>:
 8000540:	4b03      	ldr	r3, [pc, #12]	; (8000550 <register_fini+0x10>)
 8000542:	b510      	push	{r4, lr}
 8000544:	2b00      	cmp	r3, #0
 8000546:	d002      	beq.n	800054e <register_fini+0xe>
 8000548:	4802      	ldr	r0, [pc, #8]	; (8000554 <register_fini+0x14>)
 800054a:	f000 f805 	bl	8000558 <atexit>
 800054e:	bd10      	pop	{r4, pc}
 8000550:	00000000 	.word	0x00000000
 8000554:	08000569 	.word	0x08000569

08000558 <atexit>:
 8000558:	b510      	push	{r4, lr}
 800055a:	0001      	movs	r1, r0
 800055c:	2300      	movs	r3, #0
 800055e:	2200      	movs	r2, #0
 8000560:	2000      	movs	r0, #0
 8000562:	f000 f819 	bl	8000598 <__register_exitproc>
 8000566:	bd10      	pop	{r4, pc}

08000568 <__libc_fini_array>:
 8000568:	b570      	push	{r4, r5, r6, lr}
 800056a:	4d07      	ldr	r5, [pc, #28]	; (8000588 <__libc_fini_array+0x20>)
 800056c:	4c07      	ldr	r4, [pc, #28]	; (800058c <__libc_fini_array+0x24>)
 800056e:	1b64      	subs	r4, r4, r5
 8000570:	10a4      	asrs	r4, r4, #2
 8000572:	d005      	beq.n	8000580 <__libc_fini_array+0x18>
 8000574:	3c01      	subs	r4, #1
 8000576:	00a3      	lsls	r3, r4, #2
 8000578:	58eb      	ldr	r3, [r5, r3]
 800057a:	4798      	blx	r3
 800057c:	2c00      	cmp	r4, #0
 800057e:	d1f9      	bne.n	8000574 <__libc_fini_array+0xc>
 8000580:	f000 f866 	bl	8000650 <_fini>
 8000584:	bd70      	pop	{r4, r5, r6, pc}
 8000586:	46c0      	nop			; (mov r8, r8)
 8000588:	08000668 	.word	0x08000668
 800058c:	0800066c 	.word	0x0800066c

08000590 <__retarget_lock_acquire_recursive>:
 8000590:	4770      	bx	lr
 8000592:	46c0      	nop			; (mov r8, r8)

08000594 <__retarget_lock_release_recursive>:
 8000594:	4770      	bx	lr
 8000596:	46c0      	nop			; (mov r8, r8)

08000598 <__register_exitproc>:
 8000598:	b5f0      	push	{r4, r5, r6, r7, lr}
 800059a:	46d6      	mov	lr, sl
 800059c:	464f      	mov	r7, r9
 800059e:	4646      	mov	r6, r8
 80005a0:	b5c0      	push	{r6, r7, lr}
 80005a2:	4f26      	ldr	r7, [pc, #152]	; (800063c <__register_exitproc+0xa4>)
 80005a4:	b082      	sub	sp, #8
 80005a6:	0006      	movs	r6, r0
 80005a8:	6838      	ldr	r0, [r7, #0]
 80005aa:	4692      	mov	sl, r2
 80005ac:	4698      	mov	r8, r3
 80005ae:	4689      	mov	r9, r1
 80005b0:	f7ff ffee 	bl	8000590 <__retarget_lock_acquire_recursive>
 80005b4:	4b22      	ldr	r3, [pc, #136]	; (8000640 <__register_exitproc+0xa8>)
 80005b6:	681b      	ldr	r3, [r3, #0]
 80005b8:	9301      	str	r3, [sp, #4]
 80005ba:	23a4      	movs	r3, #164	; 0xa4
 80005bc:	9a01      	ldr	r2, [sp, #4]
 80005be:	005b      	lsls	r3, r3, #1
 80005c0:	58d5      	ldr	r5, [r2, r3]
 80005c2:	2d00      	cmp	r5, #0
 80005c4:	d02e      	beq.n	8000624 <__register_exitproc+0x8c>
 80005c6:	686c      	ldr	r4, [r5, #4]
 80005c8:	2c1f      	cmp	r4, #31
 80005ca:	dc30      	bgt.n	800062e <__register_exitproc+0x96>
 80005cc:	2e00      	cmp	r6, #0
 80005ce:	d10f      	bne.n	80005f0 <__register_exitproc+0x58>
 80005d0:	1c63      	adds	r3, r4, #1
 80005d2:	606b      	str	r3, [r5, #4]
 80005d4:	464b      	mov	r3, r9
 80005d6:	3402      	adds	r4, #2
 80005d8:	00a4      	lsls	r4, r4, #2
 80005da:	6838      	ldr	r0, [r7, #0]
 80005dc:	5163      	str	r3, [r4, r5]
 80005de:	f7ff ffd9 	bl	8000594 <__retarget_lock_release_recursive>
 80005e2:	2000      	movs	r0, #0
 80005e4:	b002      	add	sp, #8
 80005e6:	bce0      	pop	{r5, r6, r7}
 80005e8:	46ba      	mov	sl, r7
 80005ea:	46b1      	mov	r9, r6
 80005ec:	46a8      	mov	r8, r5
 80005ee:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80005f0:	2288      	movs	r2, #136	; 0x88
 80005f2:	4651      	mov	r1, sl
 80005f4:	0028      	movs	r0, r5
 80005f6:	00a3      	lsls	r3, r4, #2
 80005f8:	18eb      	adds	r3, r5, r3
 80005fa:	5099      	str	r1, [r3, r2]
 80005fc:	3a87      	subs	r2, #135	; 0x87
 80005fe:	40a2      	lsls	r2, r4
 8000600:	3089      	adds	r0, #137	; 0x89
 8000602:	30ff      	adds	r0, #255	; 0xff
 8000604:	6801      	ldr	r1, [r0, #0]
 8000606:	4311      	orrs	r1, r2
 8000608:	6001      	str	r1, [r0, #0]
 800060a:	2184      	movs	r1, #132	; 0x84
 800060c:	4640      	mov	r0, r8
 800060e:	0049      	lsls	r1, r1, #1
 8000610:	5058      	str	r0, [r3, r1]
 8000612:	2e02      	cmp	r6, #2
 8000614:	d1dc      	bne.n	80005d0 <__register_exitproc+0x38>
 8000616:	002b      	movs	r3, r5
 8000618:	338d      	adds	r3, #141	; 0x8d
 800061a:	33ff      	adds	r3, #255	; 0xff
 800061c:	6819      	ldr	r1, [r3, #0]
 800061e:	430a      	orrs	r2, r1
 8000620:	601a      	str	r2, [r3, #0]
 8000622:	e7d5      	b.n	80005d0 <__register_exitproc+0x38>
 8000624:	0015      	movs	r5, r2
 8000626:	354d      	adds	r5, #77	; 0x4d
 8000628:	35ff      	adds	r5, #255	; 0xff
 800062a:	50d5      	str	r5, [r2, r3]
 800062c:	e7cb      	b.n	80005c6 <__register_exitproc+0x2e>
 800062e:	6838      	ldr	r0, [r7, #0]
 8000630:	f7ff ffb0 	bl	8000594 <__retarget_lock_release_recursive>
 8000634:	2001      	movs	r0, #1
 8000636:	4240      	negs	r0, r0
 8000638:	e7d4      	b.n	80005e4 <__register_exitproc+0x4c>
 800063a:	46c0      	nop			; (mov r8, r8)
 800063c:	20000430 	.word	0x20000430
 8000640:	0800065c 	.word	0x0800065c

08000644 <_init>:
 8000644:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000646:	46c0      	nop			; (mov r8, r8)
 8000648:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800064a:	bc08      	pop	{r3}
 800064c:	469e      	mov	lr, r3
 800064e:	4770      	bx	lr

08000650 <_fini>:
 8000650:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000652:	46c0      	nop			; (mov r8, r8)
 8000654:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8000656:	bc08      	pop	{r3}
 8000658:	469e      	mov	lr, r3
 800065a:	4770      	bx	lr
