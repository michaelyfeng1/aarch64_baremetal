
kernel8.elf:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000080000 <__kernel_start_addr>:
   80000:	d53800a0 	mrs	x0, mpidr_el1
   80004:	92400400 	and	x0, x0, #0x3
   80008:	f100001f 	cmp	x0, #0x0
   8000c:	54000501 	b.ne	800ac <halt_core>  // b.any
   80010:	d5384240 	mrs	x0, currentel
   80014:	927e0400 	and	x0, x0, #0xc
   80018:	f100201f 	cmp	x0, #0x8
   8001c:	540001a0 	b.eq	80050 <trap_to_el1_from_el2>  // b.none
   80020:	aa1f03e0 	mov	x0, xzr
   80024:	d2800180 	mov	x0, #0xc                   	// #12
   80028:	d2807801 	mov	x1, #0x3c0                 	// #960
   8002c:	aa010000 	orr	x0, x0, x1
   80030:	d51e4000 	msr	spsr_el3, x0
   80034:	aa1f03e0 	mov	x0, xzr
   80038:	100000c0 	adr	x0, 80050 <trap_to_el1_from_el2>
   8003c:	d51e4020 	msr	elr_el3, x0
   80040:	aa1f03e0 	mov	x0, xzr
   80044:	580003a0 	ldr	x0, 800b8 <halt_core+0xc>
   80048:	d51e4100 	msr	sp_el2, x0
   8004c:	d69f03e0 	eret

0000000000080050 <trap_to_el1_from_el2>:
   80050:	aa1f03e0 	mov	x0, xzr
   80054:	d5181000 	msr	sctlr_el1, x0
   80058:	aa1f03e0 	mov	x0, xzr
   8005c:	d2b00000 	mov	x0, #0x80000000            	// #2147483648
   80060:	d51c1100 	msr	hcr_el2, x0
   80064:	aa1f03e0 	mov	x0, xzr
   80068:	d28000a0 	mov	x0, #0x5                   	// #5
   8006c:	d2807801 	mov	x1, #0x3c0                 	// #960
   80070:	aa010000 	orr	x0, x0, x1
   80074:	d51c4000 	msr	spsr_el2, x0
   80078:	aa1f03e0 	mov	x0, xzr
   8007c:	100000c0 	adr	x0, 80094 <indirect_start_call>
   80080:	d51c4020 	msr	elr_el2, x0
   80084:	aa1f03e0 	mov	x0, xzr
   80088:	58000180 	ldr	x0, 800b8 <halt_core+0xc>
   8008c:	d51c4100 	msr	sp_el1, x0
   80090:	d69f03e0 	eret

0000000000080094 <indirect_start_call>:
   80094:	94000812 	bl	820dc <set_up_bootstrap_page_table_el0>
   80098:	940007ea 	bl	82040 <set_up_bootstrap_page_table>
   8009c:	940007d9 	bl	82000 <set_up_mmu>
   800a0:	58000100 	ldr	x0, 800c0 <halt_core+0x14>
   800a4:	d61f0000 	br	x0

00000000000800a8 <test_spin>:
   800a8:	14000000 	b	800a8 <test_spin>

00000000000800ac <halt_core>:
   800ac:	d503205f 	wfe
   800b0:	17ffffff 	b	800ac <halt_core>
   800b4:	00000000 	udf	#0
   800b8:	00086000 	.inst	0x00086000 ; undefined
   800bc:	00000000 	udf	#0
   800c0:	00083ae8 	.inst	0x00083ae8 ; undefined
	...

0000000000080100 <jump_to_el1_core_one>:
   80100:	d5384240 	mrs	x0, currentel
   80104:	927e0400 	and	x0, x0, #0xc
   80108:	f100201f 	cmp	x0, #0x8
   8010c:	540001a0 	b.eq	80140 <trap_core_1_to_el1_from_el2>  // b.none
   80110:	aa1f03e0 	mov	x0, xzr
   80114:	d2800180 	mov	x0, #0xc                   	// #12
   80118:	d2807801 	mov	x1, #0x3c0                 	// #960
   8011c:	aa010000 	orr	x0, x0, x1
   80120:	d51e4000 	msr	spsr_el3, x0
   80124:	aa1f03e0 	mov	x0, xzr
   80128:	100000c0 	adr	x0, 80140 <trap_core_1_to_el1_from_el2>
   8012c:	d51e4020 	msr	elr_el3, x0
   80130:	aa1f03e0 	mov	x0, xzr
   80134:	58001660 	ldr	x0, 80400 <enable_core3_timer+0x94>
   80138:	d51e4100 	msr	sp_el2, x0
   8013c:	d69f03e0 	eret

0000000000080140 <trap_core_1_to_el1_from_el2>:
   80140:	aa1f03e0 	mov	x0, xzr
   80144:	d5181000 	msr	sctlr_el1, x0
   80148:	aa1f03e0 	mov	x0, xzr
   8014c:	d2b00000 	mov	x0, #0x80000000            	// #2147483648
   80150:	d51c1100 	msr	hcr_el2, x0
   80154:	aa1f03e0 	mov	x0, xzr
   80158:	d28000a0 	mov	x0, #0x5                   	// #5
   8015c:	d2807801 	mov	x1, #0x3c0                 	// #960
   80160:	aa010000 	orr	x0, x0, x1
   80164:	d51c4000 	msr	spsr_el2, x0
   80168:	aa1f03e0 	mov	x0, xzr
   8016c:	100000c0 	adr	x0, 80184 <core_indirect>
   80170:	d51c4020 	msr	elr_el2, x0
   80174:	aa1f03e0 	mov	x0, xzr
   80178:	58001440 	ldr	x0, 80400 <enable_core3_timer+0x94>
   8017c:	d51c4100 	msr	sp_el1, x0
   80180:	d69f03e0 	eret

0000000000080184 <core_indirect>:
   80184:	9400079f 	bl	82000 <set_up_mmu>
   80188:	58001400 	ldr	x0, 80408 <enable_core3_timer+0x9c>
   8018c:	d61f0000 	br	x0

0000000000080190 <trap_core_1_to_el1>:
   80190:	d5384240 	mrs	x0, currentel
   80194:	927e0400 	and	x0, x0, #0xc
   80198:	f100201f 	cmp	x0, #0x8
   8019c:	540001a0 	b.eq	801d0 <aux_core_1>  // b.none
   801a0:	aa1f03e0 	mov	x0, xzr
   801a4:	d2800180 	mov	x0, #0xc                   	// #12
   801a8:	d2807801 	mov	x1, #0x3c0                 	// #960
   801ac:	aa010000 	orr	x0, x0, x1
   801b0:	d51e4000 	msr	spsr_el3, x0
   801b4:	aa1f03e0 	mov	x0, xzr
   801b8:	100000c0 	adr	x0, 801d0 <aux_core_1>
   801bc:	d51e4020 	msr	elr_el3, x0
   801c0:	aa1f03e0 	mov	x0, xzr
   801c4:	580011e0 	ldr	x0, 80400 <enable_core3_timer+0x94>
   801c8:	d51e4100 	msr	sp_el2, x0
   801cc:	d69f03e0 	eret

00000000000801d0 <aux_core_1>:
   801d0:	aa1f03e0 	mov	x0, xzr
   801d4:	d5181000 	msr	sctlr_el1, x0
   801d8:	aa1f03e0 	mov	x0, xzr
   801dc:	d2b00000 	mov	x0, #0x80000000            	// #2147483648
   801e0:	d51c1100 	msr	hcr_el2, x0
   801e4:	aa1f03e0 	mov	x0, xzr
   801e8:	d28000a0 	mov	x0, #0x5                   	// #5
   801ec:	d2807801 	mov	x1, #0x3c0                 	// #960
   801f0:	aa010000 	orr	x0, x0, x1
   801f4:	d51c4000 	msr	spsr_el2, x0
   801f8:	aa1f03e0 	mov	x0, xzr
   801fc:	100000c0 	adr	x0, 80214 <indirect_core_1>
   80200:	d51c4020 	msr	elr_el2, x0
   80204:	aa1f03e0 	mov	x0, xzr
   80208:	58000fc0 	ldr	x0, 80400 <enable_core3_timer+0x94>
   8020c:	d51c4100 	msr	sp_el1, x0
   80210:	d69f03e0 	eret

0000000000080214 <indirect_core_1>:
   80214:	9400077b 	bl	82000 <set_up_mmu>
   80218:	58000f80 	ldr	x0, 80408 <enable_core3_timer+0x9c>
   8021c:	d61f0000 	br	x0

0000000000080220 <trap_core_2_to_el1>:
   80220:	d5384240 	mrs	x0, currentel
   80224:	927e0400 	and	x0, x0, #0xc
   80228:	f100201f 	cmp	x0, #0x8
   8022c:	540001a0 	b.eq	80260 <aux_core_2>  // b.none
   80230:	aa1f03e0 	mov	x0, xzr
   80234:	d2800180 	mov	x0, #0xc                   	// #12
   80238:	d2807801 	mov	x1, #0x3c0                 	// #960
   8023c:	aa010000 	orr	x0, x0, x1
   80240:	d51e4000 	msr	spsr_el3, x0
   80244:	aa1f03e0 	mov	x0, xzr
   80248:	100000c0 	adr	x0, 80260 <aux_core_2>
   8024c:	d51e4020 	msr	elr_el3, x0
   80250:	aa1f03e0 	mov	x0, xzr
   80254:	58000de0 	ldr	x0, 80410 <enable_core3_timer+0xa4>
   80258:	d51e4100 	msr	sp_el2, x0
   8025c:	d69f03e0 	eret

0000000000080260 <aux_core_2>:
   80260:	aa1f03e0 	mov	x0, xzr
   80264:	d5181000 	msr	sctlr_el1, x0
   80268:	aa1f03e0 	mov	x0, xzr
   8026c:	d2b00000 	mov	x0, #0x80000000            	// #2147483648
   80270:	d51c1100 	msr	hcr_el2, x0
   80274:	aa1f03e0 	mov	x0, xzr
   80278:	d28000a0 	mov	x0, #0x5                   	// #5
   8027c:	d2807801 	mov	x1, #0x3c0                 	// #960
   80280:	aa010000 	orr	x0, x0, x1
   80284:	d51c4000 	msr	spsr_el2, x0
   80288:	aa1f03e0 	mov	x0, xzr
   8028c:	100000c0 	adr	x0, 802a4 <indirect_core_2>
   80290:	d51c4020 	msr	elr_el2, x0
   80294:	aa1f03e0 	mov	x0, xzr
   80298:	58000bc0 	ldr	x0, 80410 <enable_core3_timer+0xa4>
   8029c:	d51c4100 	msr	sp_el1, x0
   802a0:	d69f03e0 	eret

00000000000802a4 <indirect_core_2>:
   802a4:	94000757 	bl	82000 <set_up_mmu>
   802a8:	58000b00 	ldr	x0, 80408 <enable_core3_timer+0x9c>
   802ac:	d61f0000 	br	x0

00000000000802b0 <trap_core_3_to_el1>:
   802b0:	d5384240 	mrs	x0, currentel
   802b4:	927e0400 	and	x0, x0, #0xc
   802b8:	f100201f 	cmp	x0, #0x8
   802bc:	540001a0 	b.eq	802f0 <aux_core_3>  // b.none
   802c0:	aa1f03e0 	mov	x0, xzr
   802c4:	d2800180 	mov	x0, #0xc                   	// #12
   802c8:	d2807801 	mov	x1, #0x3c0                 	// #960
   802cc:	aa010000 	orr	x0, x0, x1
   802d0:	d51e4000 	msr	spsr_el3, x0
   802d4:	aa1f03e0 	mov	x0, xzr
   802d8:	100000c0 	adr	x0, 802f0 <aux_core_3>
   802dc:	d51e4020 	msr	elr_el3, x0
   802e0:	aa1f03e0 	mov	x0, xzr
   802e4:	580009a0 	ldr	x0, 80418 <enable_core3_timer+0xac>
   802e8:	d51e4100 	msr	sp_el2, x0
   802ec:	d69f03e0 	eret

00000000000802f0 <aux_core_3>:
   802f0:	aa1f03e0 	mov	x0, xzr
   802f4:	d5181000 	msr	sctlr_el1, x0
   802f8:	aa1f03e0 	mov	x0, xzr
   802fc:	d2b00000 	mov	x0, #0x80000000            	// #2147483648
   80300:	d51c1100 	msr	hcr_el2, x0
   80304:	aa1f03e0 	mov	x0, xzr
   80308:	d28000a0 	mov	x0, #0x5                   	// #5
   8030c:	d2807801 	mov	x1, #0x3c0                 	// #960
   80310:	aa010000 	orr	x0, x0, x1
   80314:	d51c4000 	msr	spsr_el2, x0
   80318:	aa1f03e0 	mov	x0, xzr
   8031c:	100000c0 	adr	x0, 80334 <indirect_core_3>
   80320:	d51c4020 	msr	elr_el2, x0
   80324:	aa1f03e0 	mov	x0, xzr
   80328:	58000780 	ldr	x0, 80418 <enable_core3_timer+0xac>
   8032c:	d51c4100 	msr	sp_el1, x0
   80330:	d69f03e0 	eret

0000000000080334 <indirect_core_3>:
   80334:	94000733 	bl	82000 <set_up_mmu>
   80338:	58000680 	ldr	x0, 80408 <enable_core3_timer+0x9c>
   8033c:	d61f0000 	br	x0

0000000000080340 <enable_core0_timer>:
   80340:	58000700 	ldr	x0, 80420 <enable_core3_timer+0xb4>
   80344:	d2800041 	mov	x1, #0x2                   	// #2
   80348:	f9000001 	str	x1, [x0]
   8034c:	d65f03c0 	ret

0000000000080350 <read_core0_irq_status>:
   80350:	580006c1 	ldr	x1, 80428 <enable_core3_timer+0xbc>
   80354:	f9400020 	ldr	x0, [x1]
   80358:	d65f03c0 	ret

000000000008035c <read_core0_timer_status>:
   8035c:	d53be220 	mrs	x0, cntp_ctl_el0
   80360:	d65f03c0 	ret

0000000000080364 <enable_core1_irq_status>:
   80364:	d65f03c0 	ret

0000000000080368 <enable_core2_timer>:
   80368:	d65f03c0 	ret

000000000008036c <enable_core3_timer>:
   8036c:	d65f03c0 	ret
   80370:	d503201f 	nop
   80374:	d503201f 	nop
   80378:	d503201f 	nop
   8037c:	d503201f 	nop
   80380:	d503201f 	nop
   80384:	d503201f 	nop
   80388:	d503201f 	nop
   8038c:	d503201f 	nop
   80390:	d503201f 	nop
   80394:	d503201f 	nop
   80398:	d503201f 	nop
   8039c:	d503201f 	nop
   803a0:	d503201f 	nop
   803a4:	d503201f 	nop
   803a8:	d503201f 	nop
   803ac:	d503201f 	nop
   803b0:	d503201f 	nop
   803b4:	d503201f 	nop
   803b8:	d503201f 	nop
   803bc:	d503201f 	nop
   803c0:	d503201f 	nop
   803c4:	d503201f 	nop
   803c8:	d503201f 	nop
   803cc:	d503201f 	nop
   803d0:	d503201f 	nop
   803d4:	d503201f 	nop
   803d8:	d503201f 	nop
   803dc:	d503201f 	nop
   803e0:	d503201f 	nop
   803e4:	d503201f 	nop
   803e8:	d503201f 	nop
   803ec:	d503201f 	nop
   803f0:	d503201f 	nop
   803f4:	d503201f 	nop
   803f8:	d503201f 	nop
   803fc:	d503201f 	nop
   80400:	00088000 	.inst	0x00088000 ; undefined
   80404:	00000000 	udf	#0
   80408:	00083264 	.inst	0x00083264 ; undefined
   8040c:	00000000 	udf	#0
   80410:	0008a000 	.inst	0x0008a000 ; undefined
   80414:	00000000 	udf	#0
   80418:	0008c000 	.inst	0x0008c000 ; undefined
   8041c:	00000000 	udf	#0
   80420:	40000040 	.inst	0x40000040 ; undefined
   80424:	ffff0000 	.inst	0xffff0000 ; undefined
   80428:	40000060 	.inst	0x40000060 ; undefined
   8042c:	ffff0000 	.inst	0xffff0000 ; undefined
	...

0000000000080800 <interrupt_init>:
   80800:	d10023ff 	sub	sp, sp, #0x8
   80804:	f90003fe 	str	x30, [sp]
   80808:	58008a40 	ldr	x0, 81950 <enable_irq+0xc>
   8080c:	d518c000 	msr	vbar_el1, x0
   80810:	f94003fe 	ldr	x30, [sp]
   80814:	910023ff 	add	sp, sp, #0x8
   80818:	d65f03c0 	ret
   8081c:	d503201f 	nop
   80820:	d503201f 	nop
   80824:	d503201f 	nop
   80828:	d503201f 	nop
   8082c:	d503201f 	nop
   80830:	d503201f 	nop
   80834:	d503201f 	nop
   80838:	d503201f 	nop
   8083c:	d503201f 	nop
   80840:	d503201f 	nop
   80844:	d503201f 	nop
   80848:	d503201f 	nop
   8084c:	d503201f 	nop
   80850:	d503201f 	nop
   80854:	d503201f 	nop
   80858:	d503201f 	nop
   8085c:	d503201f 	nop
   80860:	d503201f 	nop
   80864:	d503201f 	nop
   80868:	d503201f 	nop
   8086c:	d503201f 	nop
   80870:	d503201f 	nop
   80874:	d503201f 	nop
   80878:	d503201f 	nop
   8087c:	d503201f 	nop
   80880:	d503201f 	nop
   80884:	d503201f 	nop
   80888:	d503201f 	nop
   8088c:	d503201f 	nop
   80890:	d503201f 	nop
   80894:	d503201f 	nop
   80898:	d503201f 	nop
   8089c:	d503201f 	nop
   808a0:	d503201f 	nop
   808a4:	d503201f 	nop
   808a8:	d503201f 	nop
   808ac:	d503201f 	nop
   808b0:	d503201f 	nop
   808b4:	d503201f 	nop
   808b8:	d503201f 	nop
   808bc:	d503201f 	nop
   808c0:	d503201f 	nop
   808c4:	d503201f 	nop
   808c8:	d503201f 	nop
   808cc:	d503201f 	nop
   808d0:	d503201f 	nop
   808d4:	d503201f 	nop
   808d8:	d503201f 	nop
   808dc:	d503201f 	nop
   808e0:	d503201f 	nop
   808e4:	d503201f 	nop
   808e8:	d503201f 	nop
   808ec:	d503201f 	nop
   808f0:	d503201f 	nop
   808f4:	d503201f 	nop
   808f8:	d503201f 	nop
   808fc:	d503201f 	nop
   80900:	d503201f 	nop
   80904:	d503201f 	nop
   80908:	d503201f 	nop
   8090c:	d503201f 	nop
   80910:	d503201f 	nop
   80914:	d503201f 	nop
   80918:	d503201f 	nop
   8091c:	d503201f 	nop
   80920:	d503201f 	nop
   80924:	d503201f 	nop
   80928:	d503201f 	nop
   8092c:	d503201f 	nop
   80930:	d503201f 	nop
   80934:	d503201f 	nop
   80938:	d503201f 	nop
   8093c:	d503201f 	nop
   80940:	d503201f 	nop
   80944:	d503201f 	nop
   80948:	d503201f 	nop
   8094c:	d503201f 	nop
   80950:	d503201f 	nop
   80954:	d503201f 	nop
   80958:	d503201f 	nop
   8095c:	d503201f 	nop
   80960:	d503201f 	nop
   80964:	d503201f 	nop
   80968:	d503201f 	nop
   8096c:	d503201f 	nop
   80970:	d503201f 	nop
   80974:	d503201f 	nop
   80978:	d503201f 	nop
   8097c:	d503201f 	nop
   80980:	d503201f 	nop
   80984:	d503201f 	nop
   80988:	d503201f 	nop
   8098c:	d503201f 	nop
   80990:	d503201f 	nop
   80994:	d503201f 	nop
   80998:	d503201f 	nop
   8099c:	d503201f 	nop
   809a0:	d503201f 	nop
   809a4:	d503201f 	nop
   809a8:	d503201f 	nop
   809ac:	d503201f 	nop
   809b0:	d503201f 	nop
   809b4:	d503201f 	nop
   809b8:	d503201f 	nop
   809bc:	d503201f 	nop
   809c0:	d503201f 	nop
   809c4:	d503201f 	nop
   809c8:	d503201f 	nop
   809cc:	d503201f 	nop
   809d0:	d503201f 	nop
   809d4:	d503201f 	nop
   809d8:	d503201f 	nop
   809dc:	d503201f 	nop
   809e0:	d503201f 	nop
   809e4:	d503201f 	nop
   809e8:	d503201f 	nop
   809ec:	d503201f 	nop
   809f0:	d503201f 	nop
   809f4:	d503201f 	nop
   809f8:	d503201f 	nop
   809fc:	d503201f 	nop
   80a00:	d503201f 	nop
   80a04:	d503201f 	nop
   80a08:	d503201f 	nop
   80a0c:	d503201f 	nop
   80a10:	d503201f 	nop
   80a14:	d503201f 	nop
   80a18:	d503201f 	nop
   80a1c:	d503201f 	nop
   80a20:	d503201f 	nop
   80a24:	d503201f 	nop
   80a28:	d503201f 	nop
   80a2c:	d503201f 	nop
   80a30:	d503201f 	nop
   80a34:	d503201f 	nop
   80a38:	d503201f 	nop
   80a3c:	d503201f 	nop
   80a40:	d503201f 	nop
   80a44:	d503201f 	nop
   80a48:	d503201f 	nop
   80a4c:	d503201f 	nop
   80a50:	d503201f 	nop
   80a54:	d503201f 	nop
   80a58:	d503201f 	nop
   80a5c:	d503201f 	nop
   80a60:	d503201f 	nop
   80a64:	d503201f 	nop
   80a68:	d503201f 	nop
   80a6c:	d503201f 	nop
   80a70:	d503201f 	nop
   80a74:	d503201f 	nop
   80a78:	d503201f 	nop
   80a7c:	d503201f 	nop
   80a80:	d503201f 	nop
   80a84:	d503201f 	nop
   80a88:	d503201f 	nop
   80a8c:	d503201f 	nop
   80a90:	d503201f 	nop
   80a94:	d503201f 	nop
   80a98:	d503201f 	nop
   80a9c:	d503201f 	nop
   80aa0:	d503201f 	nop
   80aa4:	d503201f 	nop
   80aa8:	d503201f 	nop
   80aac:	d503201f 	nop
   80ab0:	d503201f 	nop
   80ab4:	d503201f 	nop
   80ab8:	d503201f 	nop
   80abc:	d503201f 	nop
   80ac0:	d503201f 	nop
   80ac4:	d503201f 	nop
   80ac8:	d503201f 	nop
   80acc:	d503201f 	nop
   80ad0:	d503201f 	nop
   80ad4:	d503201f 	nop
   80ad8:	d503201f 	nop
   80adc:	d503201f 	nop
   80ae0:	d503201f 	nop
   80ae4:	d503201f 	nop
   80ae8:	d503201f 	nop
   80aec:	d503201f 	nop
   80af0:	d503201f 	nop
   80af4:	d503201f 	nop
   80af8:	d503201f 	nop
   80afc:	d503201f 	nop
   80b00:	d503201f 	nop
   80b04:	d503201f 	nop
   80b08:	d503201f 	nop
   80b0c:	d503201f 	nop
   80b10:	d503201f 	nop
   80b14:	d503201f 	nop
   80b18:	d503201f 	nop
   80b1c:	d503201f 	nop
   80b20:	d503201f 	nop
   80b24:	d503201f 	nop
   80b28:	d503201f 	nop
   80b2c:	d503201f 	nop
   80b30:	d503201f 	nop
   80b34:	d503201f 	nop
   80b38:	d503201f 	nop
   80b3c:	d503201f 	nop
   80b40:	d503201f 	nop
   80b44:	d503201f 	nop
   80b48:	d503201f 	nop
   80b4c:	d503201f 	nop
   80b50:	d503201f 	nop
   80b54:	d503201f 	nop
   80b58:	d503201f 	nop
   80b5c:	d503201f 	nop
   80b60:	d503201f 	nop
   80b64:	d503201f 	nop
   80b68:	d503201f 	nop
   80b6c:	d503201f 	nop
   80b70:	d503201f 	nop
   80b74:	d503201f 	nop
   80b78:	d503201f 	nop
   80b7c:	d503201f 	nop
   80b80:	d503201f 	nop
   80b84:	d503201f 	nop
   80b88:	d503201f 	nop
   80b8c:	d503201f 	nop
   80b90:	d503201f 	nop
   80b94:	d503201f 	nop
   80b98:	d503201f 	nop
   80b9c:	d503201f 	nop
   80ba0:	d503201f 	nop
   80ba4:	d503201f 	nop
   80ba8:	d503201f 	nop
   80bac:	d503201f 	nop
   80bb0:	d503201f 	nop
   80bb4:	d503201f 	nop
   80bb8:	d503201f 	nop
   80bbc:	d503201f 	nop
   80bc0:	d503201f 	nop
   80bc4:	d503201f 	nop
   80bc8:	d503201f 	nop
   80bcc:	d503201f 	nop
   80bd0:	d503201f 	nop
   80bd4:	d503201f 	nop
   80bd8:	d503201f 	nop
   80bdc:	d503201f 	nop
   80be0:	d503201f 	nop
   80be4:	d503201f 	nop
   80be8:	d503201f 	nop
   80bec:	d503201f 	nop
   80bf0:	d503201f 	nop
   80bf4:	d503201f 	nop
   80bf8:	d503201f 	nop
   80bfc:	d503201f 	nop
   80c00:	d503201f 	nop
   80c04:	d503201f 	nop
   80c08:	d503201f 	nop
   80c0c:	d503201f 	nop
   80c10:	d503201f 	nop
   80c14:	d503201f 	nop
   80c18:	d503201f 	nop
   80c1c:	d503201f 	nop
   80c20:	d503201f 	nop
   80c24:	d503201f 	nop
   80c28:	d503201f 	nop
   80c2c:	d503201f 	nop
   80c30:	d503201f 	nop
   80c34:	d503201f 	nop
   80c38:	d503201f 	nop
   80c3c:	d503201f 	nop
   80c40:	d503201f 	nop
   80c44:	d503201f 	nop
   80c48:	d503201f 	nop
   80c4c:	d503201f 	nop
   80c50:	d503201f 	nop
   80c54:	d503201f 	nop
   80c58:	d503201f 	nop
   80c5c:	d503201f 	nop
   80c60:	d503201f 	nop
   80c64:	d503201f 	nop
   80c68:	d503201f 	nop
   80c6c:	d503201f 	nop
   80c70:	d503201f 	nop
   80c74:	d503201f 	nop
   80c78:	d503201f 	nop
   80c7c:	d503201f 	nop
   80c80:	d503201f 	nop
   80c84:	d503201f 	nop
   80c88:	d503201f 	nop
   80c8c:	d503201f 	nop
   80c90:	d503201f 	nop
   80c94:	d503201f 	nop
   80c98:	d503201f 	nop
   80c9c:	d503201f 	nop
   80ca0:	d503201f 	nop
   80ca4:	d503201f 	nop
   80ca8:	d503201f 	nop
   80cac:	d503201f 	nop
   80cb0:	d503201f 	nop
   80cb4:	d503201f 	nop
   80cb8:	d503201f 	nop
   80cbc:	d503201f 	nop
   80cc0:	d503201f 	nop
   80cc4:	d503201f 	nop
   80cc8:	d503201f 	nop
   80ccc:	d503201f 	nop
   80cd0:	d503201f 	nop
   80cd4:	d503201f 	nop
   80cd8:	d503201f 	nop
   80cdc:	d503201f 	nop
   80ce0:	d503201f 	nop
   80ce4:	d503201f 	nop
   80ce8:	d503201f 	nop
   80cec:	d503201f 	nop
   80cf0:	d503201f 	nop
   80cf4:	d503201f 	nop
   80cf8:	d503201f 	nop
   80cfc:	d503201f 	nop
   80d00:	d503201f 	nop
   80d04:	d503201f 	nop
   80d08:	d503201f 	nop
   80d0c:	d503201f 	nop
   80d10:	d503201f 	nop
   80d14:	d503201f 	nop
   80d18:	d503201f 	nop
   80d1c:	d503201f 	nop
   80d20:	d503201f 	nop
   80d24:	d503201f 	nop
   80d28:	d503201f 	nop
   80d2c:	d503201f 	nop
   80d30:	d503201f 	nop
   80d34:	d503201f 	nop
   80d38:	d503201f 	nop
   80d3c:	d503201f 	nop
   80d40:	d503201f 	nop
   80d44:	d503201f 	nop
   80d48:	d503201f 	nop
   80d4c:	d503201f 	nop
   80d50:	d503201f 	nop
   80d54:	d503201f 	nop
   80d58:	d503201f 	nop
   80d5c:	d503201f 	nop
   80d60:	d503201f 	nop
   80d64:	d503201f 	nop
   80d68:	d503201f 	nop
   80d6c:	d503201f 	nop
   80d70:	d503201f 	nop
   80d74:	d503201f 	nop
   80d78:	d503201f 	nop
   80d7c:	d503201f 	nop
   80d80:	d503201f 	nop
   80d84:	d503201f 	nop
   80d88:	d503201f 	nop
   80d8c:	d503201f 	nop
   80d90:	d503201f 	nop
   80d94:	d503201f 	nop
   80d98:	d503201f 	nop
   80d9c:	d503201f 	nop
   80da0:	d503201f 	nop
   80da4:	d503201f 	nop
   80da8:	d503201f 	nop
   80dac:	d503201f 	nop
   80db0:	d503201f 	nop
   80db4:	d503201f 	nop
   80db8:	d503201f 	nop
   80dbc:	d503201f 	nop
   80dc0:	d503201f 	nop
   80dc4:	d503201f 	nop
   80dc8:	d503201f 	nop
   80dcc:	d503201f 	nop
   80dd0:	d503201f 	nop
   80dd4:	d503201f 	nop
   80dd8:	d503201f 	nop
   80ddc:	d503201f 	nop
   80de0:	d503201f 	nop
   80de4:	d503201f 	nop
   80de8:	d503201f 	nop
   80dec:	d503201f 	nop
   80df0:	d503201f 	nop
   80df4:	d503201f 	nop
   80df8:	d503201f 	nop
   80dfc:	d503201f 	nop
   80e00:	d503201f 	nop
   80e04:	d503201f 	nop
   80e08:	d503201f 	nop
   80e0c:	d503201f 	nop
   80e10:	d503201f 	nop
   80e14:	d503201f 	nop
   80e18:	d503201f 	nop
   80e1c:	d503201f 	nop
   80e20:	d503201f 	nop
   80e24:	d503201f 	nop
   80e28:	d503201f 	nop
   80e2c:	d503201f 	nop
   80e30:	d503201f 	nop
   80e34:	d503201f 	nop
   80e38:	d503201f 	nop
   80e3c:	d503201f 	nop
   80e40:	d503201f 	nop
   80e44:	d503201f 	nop
   80e48:	d503201f 	nop
   80e4c:	d503201f 	nop
   80e50:	d503201f 	nop
   80e54:	d503201f 	nop
   80e58:	d503201f 	nop
   80e5c:	d503201f 	nop
   80e60:	d503201f 	nop
   80e64:	d503201f 	nop
   80e68:	d503201f 	nop
   80e6c:	d503201f 	nop
   80e70:	d503201f 	nop
   80e74:	d503201f 	nop
   80e78:	d503201f 	nop
   80e7c:	d503201f 	nop
   80e80:	d503201f 	nop
   80e84:	d503201f 	nop
   80e88:	d503201f 	nop
   80e8c:	d503201f 	nop
   80e90:	d503201f 	nop
   80e94:	d503201f 	nop
   80e98:	d503201f 	nop
   80e9c:	d503201f 	nop
   80ea0:	d503201f 	nop
   80ea4:	d503201f 	nop
   80ea8:	d503201f 	nop
   80eac:	d503201f 	nop
   80eb0:	d503201f 	nop
   80eb4:	d503201f 	nop
   80eb8:	d503201f 	nop
   80ebc:	d503201f 	nop
   80ec0:	d503201f 	nop
   80ec4:	d503201f 	nop
   80ec8:	d503201f 	nop
   80ecc:	d503201f 	nop
   80ed0:	d503201f 	nop
   80ed4:	d503201f 	nop
   80ed8:	d503201f 	nop
   80edc:	d503201f 	nop
   80ee0:	d503201f 	nop
   80ee4:	d503201f 	nop
   80ee8:	d503201f 	nop
   80eec:	d503201f 	nop
   80ef0:	d503201f 	nop
   80ef4:	d503201f 	nop
   80ef8:	d503201f 	nop
   80efc:	d503201f 	nop
   80f00:	d503201f 	nop
   80f04:	d503201f 	nop
   80f08:	d503201f 	nop
   80f0c:	d503201f 	nop
   80f10:	d503201f 	nop
   80f14:	d503201f 	nop
   80f18:	d503201f 	nop
   80f1c:	d503201f 	nop
   80f20:	d503201f 	nop
   80f24:	d503201f 	nop
   80f28:	d503201f 	nop
   80f2c:	d503201f 	nop
   80f30:	d503201f 	nop
   80f34:	d503201f 	nop
   80f38:	d503201f 	nop
   80f3c:	d503201f 	nop
   80f40:	d503201f 	nop
   80f44:	d503201f 	nop
   80f48:	d503201f 	nop
   80f4c:	d503201f 	nop
   80f50:	d503201f 	nop
   80f54:	d503201f 	nop
   80f58:	d503201f 	nop
   80f5c:	d503201f 	nop
   80f60:	d503201f 	nop
   80f64:	d503201f 	nop
   80f68:	d503201f 	nop
   80f6c:	d503201f 	nop
   80f70:	d503201f 	nop
   80f74:	d503201f 	nop
   80f78:	d503201f 	nop
   80f7c:	d503201f 	nop
   80f80:	d503201f 	nop
   80f84:	d503201f 	nop
   80f88:	d503201f 	nop
   80f8c:	d503201f 	nop
   80f90:	d503201f 	nop
   80f94:	d503201f 	nop
   80f98:	d503201f 	nop
   80f9c:	d503201f 	nop
   80fa0:	d503201f 	nop
   80fa4:	d503201f 	nop
   80fa8:	d503201f 	nop
   80fac:	d503201f 	nop
   80fb0:	d503201f 	nop
   80fb4:	d503201f 	nop
   80fb8:	d503201f 	nop
   80fbc:	d503201f 	nop
   80fc0:	d503201f 	nop
   80fc4:	d503201f 	nop
   80fc8:	d503201f 	nop
   80fcc:	d503201f 	nop
   80fd0:	d503201f 	nop
   80fd4:	d503201f 	nop
   80fd8:	d503201f 	nop
   80fdc:	d503201f 	nop
   80fe0:	d503201f 	nop
   80fe4:	d503201f 	nop
   80fe8:	d503201f 	nop
   80fec:	d503201f 	nop
   80ff0:	d503201f 	nop
   80ff4:	d503201f 	nop
   80ff8:	d503201f 	nop
   80ffc:	d503201f 	nop

0000000000081000 <ivt_table_start_addr>:
   81000:	1400024f 	b	8193c <generic_handler>
   81004:	d503201f 	nop
   81008:	d503201f 	nop
   8100c:	d503201f 	nop
   81010:	d503201f 	nop
   81014:	d503201f 	nop
   81018:	d503201f 	nop
   8101c:	d503201f 	nop
   81020:	d503201f 	nop
   81024:	d503201f 	nop
   81028:	d503201f 	nop
   8102c:	d503201f 	nop
   81030:	d503201f 	nop
   81034:	d503201f 	nop
   81038:	d503201f 	nop
   8103c:	d503201f 	nop
   81040:	d503201f 	nop
   81044:	d503201f 	nop
   81048:	d503201f 	nop
   8104c:	d503201f 	nop
   81050:	d503201f 	nop
   81054:	d503201f 	nop
   81058:	d503201f 	nop
   8105c:	d503201f 	nop
   81060:	d503201f 	nop
   81064:	d503201f 	nop
   81068:	d503201f 	nop
   8106c:	d503201f 	nop
   81070:	d503201f 	nop
   81074:	d503201f 	nop
   81078:	d503201f 	nop
   8107c:	d503201f 	nop

0000000000081080 <curret_el_sp0_irq>:
   81080:	1400022f 	b	8193c <generic_handler>
   81084:	d503201f 	nop
   81088:	d503201f 	nop
   8108c:	d503201f 	nop
   81090:	d503201f 	nop
   81094:	d503201f 	nop
   81098:	d503201f 	nop
   8109c:	d503201f 	nop
   810a0:	d503201f 	nop
   810a4:	d503201f 	nop
   810a8:	d503201f 	nop
   810ac:	d503201f 	nop
   810b0:	d503201f 	nop
   810b4:	d503201f 	nop
   810b8:	d503201f 	nop
   810bc:	d503201f 	nop
   810c0:	d503201f 	nop
   810c4:	d503201f 	nop
   810c8:	d503201f 	nop
   810cc:	d503201f 	nop
   810d0:	d503201f 	nop
   810d4:	d503201f 	nop
   810d8:	d503201f 	nop
   810dc:	d503201f 	nop
   810e0:	d503201f 	nop
   810e4:	d503201f 	nop
   810e8:	d503201f 	nop
   810ec:	d503201f 	nop
   810f0:	d503201f 	nop
   810f4:	d503201f 	nop
   810f8:	d503201f 	nop
   810fc:	d503201f 	nop

0000000000081100 <current_el_sp0_fiq>:
   81100:	1400020f 	b	8193c <generic_handler>
   81104:	d503201f 	nop
   81108:	d503201f 	nop
   8110c:	d503201f 	nop
   81110:	d503201f 	nop
   81114:	d503201f 	nop
   81118:	d503201f 	nop
   8111c:	d503201f 	nop
   81120:	d503201f 	nop
   81124:	d503201f 	nop
   81128:	d503201f 	nop
   8112c:	d503201f 	nop
   81130:	d503201f 	nop
   81134:	d503201f 	nop
   81138:	d503201f 	nop
   8113c:	d503201f 	nop
   81140:	d503201f 	nop
   81144:	d503201f 	nop
   81148:	d503201f 	nop
   8114c:	d503201f 	nop
   81150:	d503201f 	nop
   81154:	d503201f 	nop
   81158:	d503201f 	nop
   8115c:	d503201f 	nop
   81160:	d503201f 	nop
   81164:	d503201f 	nop
   81168:	d503201f 	nop
   8116c:	d503201f 	nop
   81170:	d503201f 	nop
   81174:	d503201f 	nop
   81178:	d503201f 	nop
   8117c:	d503201f 	nop

0000000000081180 <current_el_sp0_serror>:
   81180:	140001ef 	b	8193c <generic_handler>
   81184:	d503201f 	nop
   81188:	d503201f 	nop
   8118c:	d503201f 	nop
   81190:	d503201f 	nop
   81194:	d503201f 	nop
   81198:	d503201f 	nop
   8119c:	d503201f 	nop
   811a0:	d503201f 	nop
   811a4:	d503201f 	nop
   811a8:	d503201f 	nop
   811ac:	d503201f 	nop
   811b0:	d503201f 	nop
   811b4:	d503201f 	nop
   811b8:	d503201f 	nop
   811bc:	d503201f 	nop
   811c0:	d503201f 	nop
   811c4:	d503201f 	nop
   811c8:	d503201f 	nop
   811cc:	d503201f 	nop
   811d0:	d503201f 	nop
   811d4:	d503201f 	nop
   811d8:	d503201f 	nop
   811dc:	d503201f 	nop
   811e0:	d503201f 	nop
   811e4:	d503201f 	nop
   811e8:	d503201f 	nop
   811ec:	d503201f 	nop
   811f0:	d503201f 	nop
   811f4:	d503201f 	nop
   811f8:	d503201f 	nop
   811fc:	d503201f 	nop

0000000000081200 <curret_el_sp1_sync>:
   81200:	14000198 	b	81860 <sync_handler>
   81204:	d503201f 	nop
   81208:	d503201f 	nop
   8120c:	d503201f 	nop
   81210:	d503201f 	nop
   81214:	d503201f 	nop
   81218:	d503201f 	nop
   8121c:	d503201f 	nop
   81220:	d503201f 	nop
   81224:	d503201f 	nop
   81228:	d503201f 	nop
   8122c:	d503201f 	nop
   81230:	d503201f 	nop
   81234:	d503201f 	nop
   81238:	d503201f 	nop
   8123c:	d503201f 	nop
   81240:	d503201f 	nop
   81244:	d503201f 	nop
   81248:	d503201f 	nop
   8124c:	d503201f 	nop
   81250:	d503201f 	nop
   81254:	d503201f 	nop
   81258:	d503201f 	nop
   8125c:	d503201f 	nop
   81260:	d503201f 	nop
   81264:	d503201f 	nop
   81268:	d503201f 	nop
   8126c:	d503201f 	nop
   81270:	d503201f 	nop
   81274:	d503201f 	nop
   81278:	d503201f 	nop
   8127c:	d503201f 	nop

0000000000081280 <current_el_sp1_irq>:
   81280:	14000141 	b	81784 <irq_handler>
   81284:	d503201f 	nop
   81288:	d503201f 	nop
   8128c:	d503201f 	nop
   81290:	d503201f 	nop
   81294:	d503201f 	nop
   81298:	d503201f 	nop
   8129c:	d503201f 	nop
   812a0:	d503201f 	nop
   812a4:	d503201f 	nop
   812a8:	d503201f 	nop
   812ac:	d503201f 	nop
   812b0:	d503201f 	nop
   812b4:	d503201f 	nop
   812b8:	d503201f 	nop
   812bc:	d503201f 	nop
   812c0:	d503201f 	nop
   812c4:	d503201f 	nop
   812c8:	d503201f 	nop
   812cc:	d503201f 	nop
   812d0:	d503201f 	nop
   812d4:	d503201f 	nop
   812d8:	d503201f 	nop
   812dc:	d503201f 	nop
   812e0:	d503201f 	nop
   812e4:	d503201f 	nop
   812e8:	d503201f 	nop
   812ec:	d503201f 	nop
   812f0:	d503201f 	nop
   812f4:	d503201f 	nop
   812f8:	d503201f 	nop
   812fc:	d503201f 	nop

0000000000081300 <current_el_sp1_fiq>:
   81300:	1400018f 	b	8193c <generic_handler>
   81304:	d503201f 	nop
   81308:	d503201f 	nop
   8130c:	d503201f 	nop
   81310:	d503201f 	nop
   81314:	d503201f 	nop
   81318:	d503201f 	nop
   8131c:	d503201f 	nop
   81320:	d503201f 	nop
   81324:	d503201f 	nop
   81328:	d503201f 	nop
   8132c:	d503201f 	nop
   81330:	d503201f 	nop
   81334:	d503201f 	nop
   81338:	d503201f 	nop
   8133c:	d503201f 	nop
   81340:	d503201f 	nop
   81344:	d503201f 	nop
   81348:	d503201f 	nop
   8134c:	d503201f 	nop
   81350:	d503201f 	nop
   81354:	d503201f 	nop
   81358:	d503201f 	nop
   8135c:	d503201f 	nop
   81360:	d503201f 	nop
   81364:	d503201f 	nop
   81368:	d503201f 	nop
   8136c:	d503201f 	nop
   81370:	d503201f 	nop
   81374:	d503201f 	nop
   81378:	d503201f 	nop
   8137c:	d503201f 	nop

0000000000081380 <curret_el_sp1_serror>:
   81380:	1400016f 	b	8193c <generic_handler>
   81384:	d503201f 	nop
   81388:	d503201f 	nop
   8138c:	d503201f 	nop
   81390:	d503201f 	nop
   81394:	d503201f 	nop
   81398:	d503201f 	nop
   8139c:	d503201f 	nop
   813a0:	d503201f 	nop
   813a4:	d503201f 	nop
   813a8:	d503201f 	nop
   813ac:	d503201f 	nop
   813b0:	d503201f 	nop
   813b4:	d503201f 	nop
   813b8:	d503201f 	nop
   813bc:	d503201f 	nop
   813c0:	d503201f 	nop
   813c4:	d503201f 	nop
   813c8:	d503201f 	nop
   813cc:	d503201f 	nop
   813d0:	d503201f 	nop
   813d4:	d503201f 	nop
   813d8:	d503201f 	nop
   813dc:	d503201f 	nop
   813e0:	d503201f 	nop
   813e4:	d503201f 	nop
   813e8:	d503201f 	nop
   813ec:	d503201f 	nop
   813f0:	d503201f 	nop
   813f4:	d503201f 	nop
   813f8:	d503201f 	nop
   813fc:	d503201f 	nop

0000000000081400 <lower_el_aarch64_sync>:
   81400:	1400014f 	b	8193c <generic_handler>
   81404:	d503201f 	nop
   81408:	d503201f 	nop
   8140c:	d503201f 	nop
   81410:	d503201f 	nop
   81414:	d503201f 	nop
   81418:	d503201f 	nop
   8141c:	d503201f 	nop
   81420:	d503201f 	nop
   81424:	d503201f 	nop
   81428:	d503201f 	nop
   8142c:	d503201f 	nop
   81430:	d503201f 	nop
   81434:	d503201f 	nop
   81438:	d503201f 	nop
   8143c:	d503201f 	nop
   81440:	d503201f 	nop
   81444:	d503201f 	nop
   81448:	d503201f 	nop
   8144c:	d503201f 	nop
   81450:	d503201f 	nop
   81454:	d503201f 	nop
   81458:	d503201f 	nop
   8145c:	d503201f 	nop
   81460:	d503201f 	nop
   81464:	d503201f 	nop
   81468:	d503201f 	nop
   8146c:	d503201f 	nop
   81470:	d503201f 	nop
   81474:	d503201f 	nop
   81478:	d503201f 	nop
   8147c:	d503201f 	nop

0000000000081480 <lower_el_aarch64_irq>:
   81480:	1400012f 	b	8193c <generic_handler>
   81484:	d503201f 	nop
   81488:	d503201f 	nop
   8148c:	d503201f 	nop
   81490:	d503201f 	nop
   81494:	d503201f 	nop
   81498:	d503201f 	nop
   8149c:	d503201f 	nop
   814a0:	d503201f 	nop
   814a4:	d503201f 	nop
   814a8:	d503201f 	nop
   814ac:	d503201f 	nop
   814b0:	d503201f 	nop
   814b4:	d503201f 	nop
   814b8:	d503201f 	nop
   814bc:	d503201f 	nop
   814c0:	d503201f 	nop
   814c4:	d503201f 	nop
   814c8:	d503201f 	nop
   814cc:	d503201f 	nop
   814d0:	d503201f 	nop
   814d4:	d503201f 	nop
   814d8:	d503201f 	nop
   814dc:	d503201f 	nop
   814e0:	d503201f 	nop
   814e4:	d503201f 	nop
   814e8:	d503201f 	nop
   814ec:	d503201f 	nop
   814f0:	d503201f 	nop
   814f4:	d503201f 	nop
   814f8:	d503201f 	nop
   814fc:	d503201f 	nop

0000000000081500 <lower_el_aarch64_fiq>:
   81500:	1400010f 	b	8193c <generic_handler>
   81504:	d503201f 	nop
   81508:	d503201f 	nop
   8150c:	d503201f 	nop
   81510:	d503201f 	nop
   81514:	d503201f 	nop
   81518:	d503201f 	nop
   8151c:	d503201f 	nop
   81520:	d503201f 	nop
   81524:	d503201f 	nop
   81528:	d503201f 	nop
   8152c:	d503201f 	nop
   81530:	d503201f 	nop
   81534:	d503201f 	nop
   81538:	d503201f 	nop
   8153c:	d503201f 	nop
   81540:	d503201f 	nop
   81544:	d503201f 	nop
   81548:	d503201f 	nop
   8154c:	d503201f 	nop
   81550:	d503201f 	nop
   81554:	d503201f 	nop
   81558:	d503201f 	nop
   8155c:	d503201f 	nop
   81560:	d503201f 	nop
   81564:	d503201f 	nop
   81568:	d503201f 	nop
   8156c:	d503201f 	nop
   81570:	d503201f 	nop
   81574:	d503201f 	nop
   81578:	d503201f 	nop
   8157c:	d503201f 	nop

0000000000081580 <lower_el_aarch64_serror>:
   81580:	140000ef 	b	8193c <generic_handler>
   81584:	d503201f 	nop
   81588:	d503201f 	nop
   8158c:	d503201f 	nop
   81590:	d503201f 	nop
   81594:	d503201f 	nop
   81598:	d503201f 	nop
   8159c:	d503201f 	nop
   815a0:	d503201f 	nop
   815a4:	d503201f 	nop
   815a8:	d503201f 	nop
   815ac:	d503201f 	nop
   815b0:	d503201f 	nop
   815b4:	d503201f 	nop
   815b8:	d503201f 	nop
   815bc:	d503201f 	nop
   815c0:	d503201f 	nop
   815c4:	d503201f 	nop
   815c8:	d503201f 	nop
   815cc:	d503201f 	nop
   815d0:	d503201f 	nop
   815d4:	d503201f 	nop
   815d8:	d503201f 	nop
   815dc:	d503201f 	nop
   815e0:	d503201f 	nop
   815e4:	d503201f 	nop
   815e8:	d503201f 	nop
   815ec:	d503201f 	nop
   815f0:	d503201f 	nop
   815f4:	d503201f 	nop
   815f8:	d503201f 	nop
   815fc:	d503201f 	nop

0000000000081600 <lower_el_aarch32_sync>:
   81600:	140000cf 	b	8193c <generic_handler>
   81604:	d503201f 	nop
   81608:	d503201f 	nop
   8160c:	d503201f 	nop
   81610:	d503201f 	nop
   81614:	d503201f 	nop
   81618:	d503201f 	nop
   8161c:	d503201f 	nop
   81620:	d503201f 	nop
   81624:	d503201f 	nop
   81628:	d503201f 	nop
   8162c:	d503201f 	nop
   81630:	d503201f 	nop
   81634:	d503201f 	nop
   81638:	d503201f 	nop
   8163c:	d503201f 	nop
   81640:	d503201f 	nop
   81644:	d503201f 	nop
   81648:	d503201f 	nop
   8164c:	d503201f 	nop
   81650:	d503201f 	nop
   81654:	d503201f 	nop
   81658:	d503201f 	nop
   8165c:	d503201f 	nop
   81660:	d503201f 	nop
   81664:	d503201f 	nop
   81668:	d503201f 	nop
   8166c:	d503201f 	nop
   81670:	d503201f 	nop
   81674:	d503201f 	nop
   81678:	d503201f 	nop
   8167c:	d503201f 	nop

0000000000081680 <lower_el_aarch32_irq>:
   81680:	140000af 	b	8193c <generic_handler>
   81684:	d503201f 	nop
   81688:	d503201f 	nop
   8168c:	d503201f 	nop
   81690:	d503201f 	nop
   81694:	d503201f 	nop
   81698:	d503201f 	nop
   8169c:	d503201f 	nop
   816a0:	d503201f 	nop
   816a4:	d503201f 	nop
   816a8:	d503201f 	nop
   816ac:	d503201f 	nop
   816b0:	d503201f 	nop
   816b4:	d503201f 	nop
   816b8:	d503201f 	nop
   816bc:	d503201f 	nop
   816c0:	d503201f 	nop
   816c4:	d503201f 	nop
   816c8:	d503201f 	nop
   816cc:	d503201f 	nop
   816d0:	d503201f 	nop
   816d4:	d503201f 	nop
   816d8:	d503201f 	nop
   816dc:	d503201f 	nop
   816e0:	d503201f 	nop
   816e4:	d503201f 	nop
   816e8:	d503201f 	nop
   816ec:	d503201f 	nop
   816f0:	d503201f 	nop
   816f4:	d503201f 	nop
   816f8:	d503201f 	nop
   816fc:	d503201f 	nop

0000000000081700 <lower_el_aarch32_fiq>:
   81700:	1400008f 	b	8193c <generic_handler>
   81704:	d503201f 	nop
   81708:	d503201f 	nop
   8170c:	d503201f 	nop
   81710:	d503201f 	nop
   81714:	d503201f 	nop
   81718:	d503201f 	nop
   8171c:	d503201f 	nop
   81720:	d503201f 	nop
   81724:	d503201f 	nop
   81728:	d503201f 	nop
   8172c:	d503201f 	nop
   81730:	d503201f 	nop
   81734:	d503201f 	nop
   81738:	d503201f 	nop
   8173c:	d503201f 	nop
   81740:	d503201f 	nop
   81744:	d503201f 	nop
   81748:	d503201f 	nop
   8174c:	d503201f 	nop
   81750:	d503201f 	nop
   81754:	d503201f 	nop
   81758:	d503201f 	nop
   8175c:	d503201f 	nop
   81760:	d503201f 	nop
   81764:	d503201f 	nop
   81768:	d503201f 	nop
   8176c:	d503201f 	nop
   81770:	d503201f 	nop
   81774:	d503201f 	nop
   81778:	d503201f 	nop
   8177c:	d503201f 	nop

0000000000081780 <lower_el_aarch32_serror>:
   81780:	1400006f 	b	8193c <generic_handler>

0000000000081784 <irq_handler>:
   81784:	d10483ff 	sub	sp, sp, #0x120
   81788:	a90007e0 	stp	x0, x1, [sp]
   8178c:	a9010fe2 	stp	x2, x3, [sp, #16]
   81790:	a90217e4 	stp	x4, x5, [sp, #32]
   81794:	a9031fe6 	stp	x6, x7, [sp, #48]
   81798:	a90407e8 	stp	x8, x1, [sp, #64]
   8179c:	a9052fea 	stp	x10, x11, [sp, #80]
   817a0:	a90637ec 	stp	x12, x13, [sp, #96]
   817a4:	a9073fee 	stp	x14, x15, [sp, #112]
   817a8:	a90847f0 	stp	x16, x17, [sp, #128]
   817ac:	a9094ff2 	stp	x18, x19, [sp, #144]
   817b0:	a90a57f4 	stp	x20, x21, [sp, #160]
   817b4:	a90b5ff6 	stp	x22, x23, [sp, #176]
   817b8:	a90c67f8 	stp	x24, x25, [sp, #192]
   817bc:	a90d6ffa 	stp	x26, x27, [sp, #208]
   817c0:	a90e77fc 	stp	x28, x29, [sp, #224]
   817c4:	d5384000 	mrs	x0, spsr_el1
   817c8:	92400c00 	and	x0, x0, #0xf
   817cc:	f100001f 	cmp	x0, #0x0
   817d0:	54000040 	b.eq	817d8 <irq_enter_stack_pointer_swap_skip>  // b.none
   817d4:	d5384100 	mrs	x0, sp_el0

00000000000817d8 <irq_enter_stack_pointer_swap_skip>:
   817d8:	a90f03fe 	stp	x30, x0, [sp, #240]
   817dc:	d2800020 	mov	x0, #0x1                   	// #1
   817e0:	d5385201 	mrs	x1, esr_el1
   817e4:	a91007e0 	stp	x0, x1, [sp, #256]
   817e8:	d5384020 	mrs	x0, elr_el1
   817ec:	d5384001 	mrs	x1, spsr_el1
   817f0:	a91107e0 	stp	x0, x1, [sp, #272]
   817f4:	910003e0 	mov	x0, sp
   817f8:	940006da 	bl	83360 <isr_dispatcher>
   817fc:	a95107e0 	ldp	x0, x1, [sp, #272]
   81800:	d5184020 	msr	elr_el1, x0
   81804:	d5184001 	msr	spsr_el1, x1
   81808:	a94f03fe 	ldp	x30, x0, [sp, #240]
   8180c:	92400c21 	and	x1, x1, #0xf
   81810:	f100003f 	cmp	x1, #0x0
   81814:	54000041 	b.ne	8181c <irq_exist_stack_pointer_swap_skip>  // b.any
   81818:	d5184100 	msr	sp_el0, x0

000000000008181c <irq_exist_stack_pointer_swap_skip>:
   8181c:	a94e03fe 	ldp	x30, x0, [sp, #224]
   81820:	a94d03fe 	ldp	x30, x0, [sp, #208]
   81824:	a94c03fe 	ldp	x30, x0, [sp, #192]
   81828:	a94b03fe 	ldp	x30, x0, [sp, #176]
   8182c:	a94a03fe 	ldp	x30, x0, [sp, #160]
   81830:	a94903fe 	ldp	x30, x0, [sp, #144]
   81834:	a94803fe 	ldp	x30, x0, [sp, #128]
   81838:	a94703fe 	ldp	x30, x0, [sp, #112]
   8183c:	a94603fe 	ldp	x30, x0, [sp, #96]
   81840:	a94503fe 	ldp	x30, x0, [sp, #80]
   81844:	a94403fe 	ldp	x30, x0, [sp, #64]
   81848:	a94303fe 	ldp	x30, x0, [sp, #48]
   8184c:	a94203fe 	ldp	x30, x0, [sp, #32]
   81850:	a94103fe 	ldp	x30, x0, [sp, #16]
   81854:	a94003fe 	ldp	x30, x0, [sp]
   81858:	910483ff 	add	sp, sp, #0x120
   8185c:	d69f03e0 	eret

0000000000081860 <sync_handler>:
   81860:	d10483ff 	sub	sp, sp, #0x120
   81864:	a90007e0 	stp	x0, x1, [sp]
   81868:	a9010fe2 	stp	x2, x3, [sp, #16]
   8186c:	a90217e4 	stp	x4, x5, [sp, #32]
   81870:	a9031fe6 	stp	x6, x7, [sp, #48]
   81874:	a90407e8 	stp	x8, x1, [sp, #64]
   81878:	a9052fea 	stp	x10, x11, [sp, #80]
   8187c:	a90637ec 	stp	x12, x13, [sp, #96]
   81880:	a9073fee 	stp	x14, x15, [sp, #112]
   81884:	a90847f0 	stp	x16, x17, [sp, #128]
   81888:	a9094ff2 	stp	x18, x19, [sp, #144]
   8188c:	a90a57f4 	stp	x20, x21, [sp, #160]
   81890:	a90b5ff6 	stp	x22, x23, [sp, #176]
   81894:	a90c67f8 	stp	x24, x25, [sp, #192]
   81898:	a90d6ffa 	stp	x26, x27, [sp, #208]
   8189c:	a90e77fc 	stp	x28, x29, [sp, #224]
   818a0:	d5384000 	mrs	x0, spsr_el1
   818a4:	92400c00 	and	x0, x0, #0xf
   818a8:	f100001f 	cmp	x0, #0x0
   818ac:	54000040 	b.eq	818b4 <sync_enter_stack_pointer_swap_skip>  // b.none
   818b0:	d5384100 	mrs	x0, sp_el0

00000000000818b4 <sync_enter_stack_pointer_swap_skip>:
   818b4:	a90f03fe 	stp	x30, x0, [sp, #240]
   818b8:	d2800200 	mov	x0, #0x10                  	// #16
   818bc:	d5385201 	mrs	x1, esr_el1
   818c0:	a91007e0 	stp	x0, x1, [sp, #256]
   818c4:	d5384020 	mrs	x0, elr_el1
   818c8:	d5384001 	mrs	x1, spsr_el1
   818cc:	a91107e0 	stp	x0, x1, [sp, #272]
   818d0:	910003e0 	mov	x0, sp
   818d4:	940006a3 	bl	83360 <isr_dispatcher>
   818d8:	a95107e0 	ldp	x0, x1, [sp, #272]
   818dc:	d5184020 	msr	elr_el1, x0
   818e0:	d5184001 	msr	spsr_el1, x1
   818e4:	a94f03fe 	ldp	x30, x0, [sp, #240]
   818e8:	92400c21 	and	x1, x1, #0xf
   818ec:	f100003f 	cmp	x1, #0x0
   818f0:	54000041 	b.ne	818f8 <sync_exit_stack_pointer_swap_skip>  // b.any
   818f4:	d5184100 	msr	sp_el0, x0

00000000000818f8 <sync_exit_stack_pointer_swap_skip>:
   818f8:	a94e03fe 	ldp	x30, x0, [sp, #224]
   818fc:	a94d03fe 	ldp	x30, x0, [sp, #208]
   81900:	a94c03fe 	ldp	x30, x0, [sp, #192]
   81904:	a94b03fe 	ldp	x30, x0, [sp, #176]
   81908:	a94a03fe 	ldp	x30, x0, [sp, #160]
   8190c:	a94903fe 	ldp	x30, x0, [sp, #144]
   81910:	a94803fe 	ldp	x30, x0, [sp, #128]
   81914:	a94703fe 	ldp	x30, x0, [sp, #112]
   81918:	a94603fe 	ldp	x30, x0, [sp, #96]
   8191c:	a94503fe 	ldp	x30, x0, [sp, #80]
   81920:	a94403fe 	ldp	x30, x0, [sp, #64]
   81924:	a94303fe 	ldp	x30, x0, [sp, #48]
   81928:	a94203fe 	ldp	x30, x0, [sp, #32]
   8192c:	a94103fe 	ldp	x30, x0, [sp, #16]
   81930:	a94003fe 	ldp	x30, x0, [sp]
   81934:	910483ff 	add	sp, sp, #0x120
   81938:	d69f03e0 	eret

000000000008193c <generic_handler>:
   8193c:	d2800000 	mov	x0, #0x0                   	// #0
   81940:	17ffffff 	b	8193c <generic_handler>

0000000000081944 <enable_irq>:
   81944:	d50342ff 	msr	daifclr, #0x2
   81948:	d65f03c0 	ret
   8194c:	00000000 	udf	#0
   81950:	00081000 	.inst	0x00081000 ; undefined
   81954:	00000000 	udf	#0

0000000000081958 <memcpy>:
   81958:	a9bf13e3 	stp	x3, x4, [sp, #-16]!
   8195c:	a9bf1be5 	stp	x5, x6, [sp, #-16]!
   81960:	aa0003e3 	mov	x3, x0
   81964:	aa0103e4 	mov	x4, x1
   81968:	aa0203e5 	mov	x5, x2
   8196c:	eb1f00bf 	cmp	x5, xzr
   81970:	540000c0 	b.eq	81988 <memcpy+0x30>  // b.none
   81974:	39400086 	ldrb	w6, [x4]
   81978:	39000066 	strb	w6, [x3]
   8197c:	d10004a5 	sub	x5, x5, #0x1
   81980:	eb1f00bf 	cmp	x5, xzr
   81984:	54ffff8c 	b.gt	81974 <memcpy+0x1c>
   81988:	a8c11be5 	ldp	x5, x6, [sp], #16
   8198c:	a8c113e3 	ldp	x3, x4, [sp], #16
   81990:	d65f03c0 	ret

0000000000081994 <memclr>:
   81994:	a9bf13e3 	stp	x3, x4, [sp, #-16]!
   81998:	aa0003e3 	mov	x3, x0
   8199c:	aa0103e4 	mov	x4, x1
   819a0:	3900007f 	strb	wzr, [x3]
   819a4:	d1000484 	sub	x4, x4, #0x1
   819a8:	eb1f009f 	cmp	x4, xzr
   819ac:	54ffffac 	b.gt	819a0 <memclr+0xc>
   819b0:	a8c113e3 	ldp	x3, x4, [sp], #16
   819b4:	d65f03c0 	ret

00000000000819b8 <memset>:
   819b8:	a9bf13e3 	stp	x3, x4, [sp, #-16]!
   819bc:	a9bf1be5 	stp	x5, x6, [sp, #-16]!
   819c0:	aa0003e3 	mov	x3, x0
   819c4:	aa0203e4 	mov	x4, x2
   819c8:	aa0103e5 	mov	x5, x1
   819cc:	b8004465 	str	w5, [x3], #4
   819d0:	d1001084 	sub	x4, x4, #0x4
   819d4:	eb1f009f 	cmp	x4, xzr
   819d8:	54ffffac 	b.gt	819cc <memset+0x14>
   819dc:	a8c11be5 	ldp	x5, x6, [sp], #16
   819e0:	a8c113e3 	ldp	x3, x4, [sp], #16
   819e4:	d65f03c0 	ret

00000000000819e8 <delay>:
   819e8:	f1000400 	subs	x0, x0, #0x1
   819ec:	54ffffe1 	b.ne	819e8 <delay>  // b.any
   819f0:	d65f03c0 	ret

00000000000819f4 <out_word>:
   819f4:	b9000001 	str	w1, [x0]
   819f8:	d65f03c0 	ret

00000000000819fc <in_word>:
   819fc:	b9400000 	ldr	w0, [x0]
   81a00:	d65f03c0 	ret

0000000000081a04 <__lock_acq_mem>:
   81a04:	52800022 	mov	w2, #0x1                   	// #1
   81a08:	d50320bf 	sevl

0000000000081a0c <l1>:
   81a0c:	d503205f 	wfe

0000000000081a10 <l2>:
   81a10:	885ffc01 	ldaxr	w1, [x0]
   81a14:	35ffffc1 	cbnz	w1, 81a0c <l1>
   81a18:	88017c02 	stxr	w1, w2, [x0]
   81a1c:	52800023 	mov	w3, #0x1                   	// #1
   81a20:	889ffc03 	stlr	w3, [x0]
   81a24:	35ffff61 	cbnz	w1, 81a10 <l2>
   81a28:	d65f03c0 	ret

0000000000081a2c <__lock_rel_mem>:
   81a2c:	889ffc1f 	stlr	wzr, [x0]
   81a30:	d65f03c0 	ret
   81a34:	00000000 	udf	#0

0000000000081a38 <core_one_start>:
   81a38:	d503205f 	wfe

0000000000081a3c <core_two_start>:
   81a3c:	d503205f 	wfe
   81a40:	58000380 	ldr	x0, 81ab0 <fetch_stack_3+0xc>
   81a44:	91400800 	add	x0, x0, #0x2, lsl #12
   81a48:	9100001f 	mov	sp, x0
   81a4c:	aa1f03e0 	mov	x0, xzr
   81a50:	d5181000 	msr	sctlr_el1, x0
   81a54:	140005f2 	b	8321c <func_core_entry>

0000000000081a58 <core_three_start>:
   81a58:	d503205f 	wfe
   81a5c:	580002e0 	ldr	x0, 81ab8 <fetch_stack_3+0x14>
   81a60:	91400800 	add	x0, x0, #0x2, lsl #12
   81a64:	9100001f 	mov	sp, x0
   81a68:	aa1f03e0 	mov	x0, xzr
   81a6c:	d5181000 	msr	sctlr_el1, x0
   81a70:	140005f1 	b	83234 <func_core_aux_entry>

0000000000081a74 <get_core_stack>:
   81a74:	f100041f 	cmp	x0, #0x1
   81a78:	540000e0 	b.eq	81a94 <fetch_stack_1>  // b.none
   81a7c:	f100081f 	cmp	x0, #0x2
   81a80:	540000e0 	b.eq	81a9c <fetch_stack_2>  // b.none
   81a84:	f1000c1f 	cmp	x0, #0x3
   81a88:	540000e0 	b.eq	81aa4 <fetch_stack_3>  // b.none
   81a8c:	580001a0 	ldr	x0, 81ac0 <fetch_stack_3+0x1c>
   81a90:	d65f03c0 	ret

0000000000081a94 <fetch_stack_1>:
   81a94:	580001a0 	ldr	x0, 81ac8 <fetch_stack_3+0x24>
   81a98:	d65f03c0 	ret

0000000000081a9c <fetch_stack_2>:
   81a9c:	580000a0 	ldr	x0, 81ab0 <fetch_stack_3+0xc>
   81aa0:	d65f03c0 	ret

0000000000081aa4 <fetch_stack_3>:
   81aa4:	580000a0 	ldr	x0, 81ab8 <fetch_stack_3+0x14>
   81aa8:	d65f03c0 	ret
   81aac:	00000000 	udf	#0
   81ab0:	0008a000 	.inst	0x0008a000 ; undefined
   81ab4:	00000000 	udf	#0
   81ab8:	0008c000 	.inst	0x0008c000 ; undefined
   81abc:	00000000 	udf	#0
   81ac0:	00086000 	.inst	0x00086000 ; undefined
   81ac4:	00000000 	udf	#0
   81ac8:	00088000 	.inst	0x00088000 ; undefined
	...

0000000000082000 <set_up_mmu>:
   82000:	10088000 	adr	x0, 93000 <boot_strap_table_addr_el0>
   82004:	d5182000 	msr	ttbr0_el1, x0
   82008:	1005ffc0 	adr	x0, 8e000 <boot_strap_table_addr>
   8200c:	d5182020 	msr	ttbr1_el1, x0
   82010:	58007f80 	ldr	x0, 83000 <set_up_bootstrap_page_table_el0+0xf24>
   82014:	d518a200 	msr	mair_el1, x0
   82018:	58007f80 	ldr	x0, 83008 <set_up_bootstrap_page_table_el0+0xf2c>
   8201c:	d5182040 	msr	tcr_el1, x0
   82020:	d5381000 	mrs	x0, sctlr_el1
   82024:	b2400000 	orr	x0, x0, #0x1
   82028:	d5181000 	msr	sctlr_el1, x0
   8202c:	d65f03c0 	ret

0000000000082030 <flush_tlb_el1>:
   82030:	d508831f 	tlbi	vmalle1is
   82034:	d5033b9f 	dsb	ish
   82038:	d5033fdf 	isb
   8203c:	d65f03c0 	ret

0000000000082040 <set_up_bootstrap_page_table>:
   82040:	1005fe00 	adr	x0, 8e000 <boot_strap_table_addr>
   82044:	10067de1 	adr	x1, 8f000 <boot_strap_pud>
   82048:	b2400421 	orr	x1, x1, #0x3
   8204c:	f9000001 	str	x1, [x0]
   82050:	10067d80 	adr	x0, 8f000 <boot_strap_pud>
   82054:	1006fd61 	adr	x1, 90000 <boot_strap_pmd>
   82058:	b2400421 	orr	x1, x1, #0x3
   8205c:	f9000001 	str	x1, [x0]

0000000000082060 <build_pmd>:
   82060:	d2a60002 	mov	x2, #0x30000000            	// #805306368
   82064:	aa1f03e0 	mov	x0, xzr
   82068:	1006fcc1 	adr	x1, 90000 <boot_strap_pmd>
   8206c:	d28080a0 	mov	x0, #0x405                 	// #1029

0000000000082070 <map_kernel>:
   82070:	f8008420 	str	x0, [x1], #8
   82074:	91480000 	add	x0, x0, #0x200, lsl #12
   82078:	eb02001f 	cmp	x0, x2
   8207c:	54ffffa3 	b.cc	82070 <map_kernel>  // b.lo, b.ul, b.last
   82080:	d2a80001 	mov	x1, #0x40000000            	// #1073741824
   82084:	d2a7e000 	mov	x0, #0x3f000000            	// #1056964608
   82088:	1006fbc2 	adr	x2, 90000 <boot_strap_pmd>
   8208c:	d355fc03 	lsr	x3, x0, #21
   82090:	d37df063 	lsl	x3, x3, #3
   82094:	8b030042 	add	x2, x2, x3
   82098:	b2400000 	orr	x0, x0, #0x1
   8209c:	b2760000 	orr	x0, x0, #0x400

00000000000820a0 <map_periphral>:
   820a0:	f8008440 	str	x0, [x2], #8
   820a4:	91480000 	add	x0, x0, #0x200, lsl #12
   820a8:	eb01001f 	cmp	x0, x1
   820ac:	54ffffa3 	b.cc	820a0 <map_periphral>  // b.lo, b.ul, b.last
   820b0:	10067a80 	adr	x0, 8f000 <boot_strap_pud>
   820b4:	91002000 	add	x0, x0, #0x8
   820b8:	10077a41 	adr	x1, 91000 <boot_strap_pmd_above_1G>
   820bc:	b2400421 	orr	x1, x1, #0x3
   820c0:	f9000001 	str	x1, [x0]
   820c4:	d2a80000 	mov	x0, #0x40000000            	// #1073741824
   820c8:	100779c2 	adr	x2, 91000 <boot_strap_pmd_above_1G>
   820cc:	b2400000 	orr	x0, x0, #0x1
   820d0:	b2760000 	orr	x0, x0, #0x400
   820d4:	f9000040 	str	x0, [x2]
   820d8:	d65f03c0 	ret

00000000000820dc <set_up_bootstrap_page_table_el0>:
   820dc:	10087920 	adr	x0, 93000 <boot_strap_table_addr_el0>
   820e0:	1008f901 	adr	x1, 94000 <boot_strap_pud_el0>
   820e4:	b2400421 	orr	x1, x1, #0x3
   820e8:	f9000001 	str	x1, [x0]
   820ec:	1008f8a0 	adr	x0, 94000 <boot_strap_pud_el0>
   820f0:	10097881 	adr	x1, 95000 <boot_strap_pmd_el0>
   820f4:	b2400421 	orr	x1, x1, #0x3
   820f8:	f9000001 	str	x1, [x0]
   820fc:	10097821 	adr	x1, 95000 <boot_strap_pmd_el0>
   82100:	d28080a0 	mov	x0, #0x405                 	// #1029
   82104:	f9000020 	str	x0, [x1]
   82108:	1008f7c0 	adr	x0, 94000 <boot_strap_pud_el0>
   8210c:	91002000 	add	x0, x0, #0x8
   82110:	1009f781 	adr	x1, 96000 <boot_strap_pmd_el0_above_1G>
   82114:	b2400421 	orr	x1, x1, #0x3
   82118:	f9000001 	str	x1, [x0]
   8211c:	d2a80000 	mov	x0, #0x40000000            	// #1073741824
   82120:	1009f702 	adr	x2, 96000 <boot_strap_pmd_el0_above_1G>
   82124:	b2400000 	orr	x0, x0, #0x1
   82128:	b2760000 	orr	x0, x0, #0x400
   8212c:	f9000040 	str	x0, [x2]
   82130:	d65f03c0 	ret
   82134:	d503201f 	nop
   82138:	d503201f 	nop
   8213c:	d503201f 	nop
   82140:	d503201f 	nop
   82144:	d503201f 	nop
   82148:	d503201f 	nop
   8214c:	d503201f 	nop
   82150:	d503201f 	nop
   82154:	d503201f 	nop
   82158:	d503201f 	nop
   8215c:	d503201f 	nop
   82160:	d503201f 	nop
   82164:	d503201f 	nop
   82168:	d503201f 	nop
   8216c:	d503201f 	nop
   82170:	d503201f 	nop
   82174:	d503201f 	nop
   82178:	d503201f 	nop
   8217c:	d503201f 	nop
   82180:	d503201f 	nop
   82184:	d503201f 	nop
   82188:	d503201f 	nop
   8218c:	d503201f 	nop
   82190:	d503201f 	nop
   82194:	d503201f 	nop
   82198:	d503201f 	nop
   8219c:	d503201f 	nop
   821a0:	d503201f 	nop
   821a4:	d503201f 	nop
   821a8:	d503201f 	nop
   821ac:	d503201f 	nop
   821b0:	d503201f 	nop
   821b4:	d503201f 	nop
   821b8:	d503201f 	nop
   821bc:	d503201f 	nop
   821c0:	d503201f 	nop
   821c4:	d503201f 	nop
   821c8:	d503201f 	nop
   821cc:	d503201f 	nop
   821d0:	d503201f 	nop
   821d4:	d503201f 	nop
   821d8:	d503201f 	nop
   821dc:	d503201f 	nop
   821e0:	d503201f 	nop
   821e4:	d503201f 	nop
   821e8:	d503201f 	nop
   821ec:	d503201f 	nop
   821f0:	d503201f 	nop
   821f4:	d503201f 	nop
   821f8:	d503201f 	nop
   821fc:	d503201f 	nop
   82200:	d503201f 	nop
   82204:	d503201f 	nop
   82208:	d503201f 	nop
   8220c:	d503201f 	nop
   82210:	d503201f 	nop
   82214:	d503201f 	nop
   82218:	d503201f 	nop
   8221c:	d503201f 	nop
   82220:	d503201f 	nop
   82224:	d503201f 	nop
   82228:	d503201f 	nop
   8222c:	d503201f 	nop
   82230:	d503201f 	nop
   82234:	d503201f 	nop
   82238:	d503201f 	nop
   8223c:	d503201f 	nop
   82240:	d503201f 	nop
   82244:	d503201f 	nop
   82248:	d503201f 	nop
   8224c:	d503201f 	nop
   82250:	d503201f 	nop
   82254:	d503201f 	nop
   82258:	d503201f 	nop
   8225c:	d503201f 	nop
   82260:	d503201f 	nop
   82264:	d503201f 	nop
   82268:	d503201f 	nop
   8226c:	d503201f 	nop
   82270:	d503201f 	nop
   82274:	d503201f 	nop
   82278:	d503201f 	nop
   8227c:	d503201f 	nop
   82280:	d503201f 	nop
   82284:	d503201f 	nop
   82288:	d503201f 	nop
   8228c:	d503201f 	nop
   82290:	d503201f 	nop
   82294:	d503201f 	nop
   82298:	d503201f 	nop
   8229c:	d503201f 	nop
   822a0:	d503201f 	nop
   822a4:	d503201f 	nop
   822a8:	d503201f 	nop
   822ac:	d503201f 	nop
   822b0:	d503201f 	nop
   822b4:	d503201f 	nop
   822b8:	d503201f 	nop
   822bc:	d503201f 	nop
   822c0:	d503201f 	nop
   822c4:	d503201f 	nop
   822c8:	d503201f 	nop
   822cc:	d503201f 	nop
   822d0:	d503201f 	nop
   822d4:	d503201f 	nop
   822d8:	d503201f 	nop
   822dc:	d503201f 	nop
   822e0:	d503201f 	nop
   822e4:	d503201f 	nop
   822e8:	d503201f 	nop
   822ec:	d503201f 	nop
   822f0:	d503201f 	nop
   822f4:	d503201f 	nop
   822f8:	d503201f 	nop
   822fc:	d503201f 	nop
   82300:	d503201f 	nop
   82304:	d503201f 	nop
   82308:	d503201f 	nop
   8230c:	d503201f 	nop
   82310:	d503201f 	nop
   82314:	d503201f 	nop
   82318:	d503201f 	nop
   8231c:	d503201f 	nop
   82320:	d503201f 	nop
   82324:	d503201f 	nop
   82328:	d503201f 	nop
   8232c:	d503201f 	nop
   82330:	d503201f 	nop
   82334:	d503201f 	nop
   82338:	d503201f 	nop
   8233c:	d503201f 	nop
   82340:	d503201f 	nop
   82344:	d503201f 	nop
   82348:	d503201f 	nop
   8234c:	d503201f 	nop
   82350:	d503201f 	nop
   82354:	d503201f 	nop
   82358:	d503201f 	nop
   8235c:	d503201f 	nop
   82360:	d503201f 	nop
   82364:	d503201f 	nop
   82368:	d503201f 	nop
   8236c:	d503201f 	nop
   82370:	d503201f 	nop
   82374:	d503201f 	nop
   82378:	d503201f 	nop
   8237c:	d503201f 	nop
   82380:	d503201f 	nop
   82384:	d503201f 	nop
   82388:	d503201f 	nop
   8238c:	d503201f 	nop
   82390:	d503201f 	nop
   82394:	d503201f 	nop
   82398:	d503201f 	nop
   8239c:	d503201f 	nop
   823a0:	d503201f 	nop
   823a4:	d503201f 	nop
   823a8:	d503201f 	nop
   823ac:	d503201f 	nop
   823b0:	d503201f 	nop
   823b4:	d503201f 	nop
   823b8:	d503201f 	nop
   823bc:	d503201f 	nop
   823c0:	d503201f 	nop
   823c4:	d503201f 	nop
   823c8:	d503201f 	nop
   823cc:	d503201f 	nop
   823d0:	d503201f 	nop
   823d4:	d503201f 	nop
   823d8:	d503201f 	nop
   823dc:	d503201f 	nop
   823e0:	d503201f 	nop
   823e4:	d503201f 	nop
   823e8:	d503201f 	nop
   823ec:	d503201f 	nop
   823f0:	d503201f 	nop
   823f4:	d503201f 	nop
   823f8:	d503201f 	nop
   823fc:	d503201f 	nop
   82400:	d503201f 	nop
   82404:	d503201f 	nop
   82408:	d503201f 	nop
   8240c:	d503201f 	nop
   82410:	d503201f 	nop
   82414:	d503201f 	nop
   82418:	d503201f 	nop
   8241c:	d503201f 	nop
   82420:	d503201f 	nop
   82424:	d503201f 	nop
   82428:	d503201f 	nop
   8242c:	d503201f 	nop
   82430:	d503201f 	nop
   82434:	d503201f 	nop
   82438:	d503201f 	nop
   8243c:	d503201f 	nop
   82440:	d503201f 	nop
   82444:	d503201f 	nop
   82448:	d503201f 	nop
   8244c:	d503201f 	nop
   82450:	d503201f 	nop
   82454:	d503201f 	nop
   82458:	d503201f 	nop
   8245c:	d503201f 	nop
   82460:	d503201f 	nop
   82464:	d503201f 	nop
   82468:	d503201f 	nop
   8246c:	d503201f 	nop
   82470:	d503201f 	nop
   82474:	d503201f 	nop
   82478:	d503201f 	nop
   8247c:	d503201f 	nop
   82480:	d503201f 	nop
   82484:	d503201f 	nop
   82488:	d503201f 	nop
   8248c:	d503201f 	nop
   82490:	d503201f 	nop
   82494:	d503201f 	nop
   82498:	d503201f 	nop
   8249c:	d503201f 	nop
   824a0:	d503201f 	nop
   824a4:	d503201f 	nop
   824a8:	d503201f 	nop
   824ac:	d503201f 	nop
   824b0:	d503201f 	nop
   824b4:	d503201f 	nop
   824b8:	d503201f 	nop
   824bc:	d503201f 	nop
   824c0:	d503201f 	nop
   824c4:	d503201f 	nop
   824c8:	d503201f 	nop
   824cc:	d503201f 	nop
   824d0:	d503201f 	nop
   824d4:	d503201f 	nop
   824d8:	d503201f 	nop
   824dc:	d503201f 	nop
   824e0:	d503201f 	nop
   824e4:	d503201f 	nop
   824e8:	d503201f 	nop
   824ec:	d503201f 	nop
   824f0:	d503201f 	nop
   824f4:	d503201f 	nop
   824f8:	d503201f 	nop
   824fc:	d503201f 	nop
   82500:	d503201f 	nop
   82504:	d503201f 	nop
   82508:	d503201f 	nop
   8250c:	d503201f 	nop
   82510:	d503201f 	nop
   82514:	d503201f 	nop
   82518:	d503201f 	nop
   8251c:	d503201f 	nop
   82520:	d503201f 	nop
   82524:	d503201f 	nop
   82528:	d503201f 	nop
   8252c:	d503201f 	nop
   82530:	d503201f 	nop
   82534:	d503201f 	nop
   82538:	d503201f 	nop
   8253c:	d503201f 	nop
   82540:	d503201f 	nop
   82544:	d503201f 	nop
   82548:	d503201f 	nop
   8254c:	d503201f 	nop
   82550:	d503201f 	nop
   82554:	d503201f 	nop
   82558:	d503201f 	nop
   8255c:	d503201f 	nop
   82560:	d503201f 	nop
   82564:	d503201f 	nop
   82568:	d503201f 	nop
   8256c:	d503201f 	nop
   82570:	d503201f 	nop
   82574:	d503201f 	nop
   82578:	d503201f 	nop
   8257c:	d503201f 	nop
   82580:	d503201f 	nop
   82584:	d503201f 	nop
   82588:	d503201f 	nop
   8258c:	d503201f 	nop
   82590:	d503201f 	nop
   82594:	d503201f 	nop
   82598:	d503201f 	nop
   8259c:	d503201f 	nop
   825a0:	d503201f 	nop
   825a4:	d503201f 	nop
   825a8:	d503201f 	nop
   825ac:	d503201f 	nop
   825b0:	d503201f 	nop
   825b4:	d503201f 	nop
   825b8:	d503201f 	nop
   825bc:	d503201f 	nop
   825c0:	d503201f 	nop
   825c4:	d503201f 	nop
   825c8:	d503201f 	nop
   825cc:	d503201f 	nop
   825d0:	d503201f 	nop
   825d4:	d503201f 	nop
   825d8:	d503201f 	nop
   825dc:	d503201f 	nop
   825e0:	d503201f 	nop
   825e4:	d503201f 	nop
   825e8:	d503201f 	nop
   825ec:	d503201f 	nop
   825f0:	d503201f 	nop
   825f4:	d503201f 	nop
   825f8:	d503201f 	nop
   825fc:	d503201f 	nop
   82600:	d503201f 	nop
   82604:	d503201f 	nop
   82608:	d503201f 	nop
   8260c:	d503201f 	nop
   82610:	d503201f 	nop
   82614:	d503201f 	nop
   82618:	d503201f 	nop
   8261c:	d503201f 	nop
   82620:	d503201f 	nop
   82624:	d503201f 	nop
   82628:	d503201f 	nop
   8262c:	d503201f 	nop
   82630:	d503201f 	nop
   82634:	d503201f 	nop
   82638:	d503201f 	nop
   8263c:	d503201f 	nop
   82640:	d503201f 	nop
   82644:	d503201f 	nop
   82648:	d503201f 	nop
   8264c:	d503201f 	nop
   82650:	d503201f 	nop
   82654:	d503201f 	nop
   82658:	d503201f 	nop
   8265c:	d503201f 	nop
   82660:	d503201f 	nop
   82664:	d503201f 	nop
   82668:	d503201f 	nop
   8266c:	d503201f 	nop
   82670:	d503201f 	nop
   82674:	d503201f 	nop
   82678:	d503201f 	nop
   8267c:	d503201f 	nop
   82680:	d503201f 	nop
   82684:	d503201f 	nop
   82688:	d503201f 	nop
   8268c:	d503201f 	nop
   82690:	d503201f 	nop
   82694:	d503201f 	nop
   82698:	d503201f 	nop
   8269c:	d503201f 	nop
   826a0:	d503201f 	nop
   826a4:	d503201f 	nop
   826a8:	d503201f 	nop
   826ac:	d503201f 	nop
   826b0:	d503201f 	nop
   826b4:	d503201f 	nop
   826b8:	d503201f 	nop
   826bc:	d503201f 	nop
   826c0:	d503201f 	nop
   826c4:	d503201f 	nop
   826c8:	d503201f 	nop
   826cc:	d503201f 	nop
   826d0:	d503201f 	nop
   826d4:	d503201f 	nop
   826d8:	d503201f 	nop
   826dc:	d503201f 	nop
   826e0:	d503201f 	nop
   826e4:	d503201f 	nop
   826e8:	d503201f 	nop
   826ec:	d503201f 	nop
   826f0:	d503201f 	nop
   826f4:	d503201f 	nop
   826f8:	d503201f 	nop
   826fc:	d503201f 	nop
   82700:	d503201f 	nop
   82704:	d503201f 	nop
   82708:	d503201f 	nop
   8270c:	d503201f 	nop
   82710:	d503201f 	nop
   82714:	d503201f 	nop
   82718:	d503201f 	nop
   8271c:	d503201f 	nop
   82720:	d503201f 	nop
   82724:	d503201f 	nop
   82728:	d503201f 	nop
   8272c:	d503201f 	nop
   82730:	d503201f 	nop
   82734:	d503201f 	nop
   82738:	d503201f 	nop
   8273c:	d503201f 	nop
   82740:	d503201f 	nop
   82744:	d503201f 	nop
   82748:	d503201f 	nop
   8274c:	d503201f 	nop
   82750:	d503201f 	nop
   82754:	d503201f 	nop
   82758:	d503201f 	nop
   8275c:	d503201f 	nop
   82760:	d503201f 	nop
   82764:	d503201f 	nop
   82768:	d503201f 	nop
   8276c:	d503201f 	nop
   82770:	d503201f 	nop
   82774:	d503201f 	nop
   82778:	d503201f 	nop
   8277c:	d503201f 	nop
   82780:	d503201f 	nop
   82784:	d503201f 	nop
   82788:	d503201f 	nop
   8278c:	d503201f 	nop
   82790:	d503201f 	nop
   82794:	d503201f 	nop
   82798:	d503201f 	nop
   8279c:	d503201f 	nop
   827a0:	d503201f 	nop
   827a4:	d503201f 	nop
   827a8:	d503201f 	nop
   827ac:	d503201f 	nop
   827b0:	d503201f 	nop
   827b4:	d503201f 	nop
   827b8:	d503201f 	nop
   827bc:	d503201f 	nop
   827c0:	d503201f 	nop
   827c4:	d503201f 	nop
   827c8:	d503201f 	nop
   827cc:	d503201f 	nop
   827d0:	d503201f 	nop
   827d4:	d503201f 	nop
   827d8:	d503201f 	nop
   827dc:	d503201f 	nop
   827e0:	d503201f 	nop
   827e4:	d503201f 	nop
   827e8:	d503201f 	nop
   827ec:	d503201f 	nop
   827f0:	d503201f 	nop
   827f4:	d503201f 	nop
   827f8:	d503201f 	nop
   827fc:	d503201f 	nop
   82800:	d503201f 	nop
   82804:	d503201f 	nop
   82808:	d503201f 	nop
   8280c:	d503201f 	nop
   82810:	d503201f 	nop
   82814:	d503201f 	nop
   82818:	d503201f 	nop
   8281c:	d503201f 	nop
   82820:	d503201f 	nop
   82824:	d503201f 	nop
   82828:	d503201f 	nop
   8282c:	d503201f 	nop
   82830:	d503201f 	nop
   82834:	d503201f 	nop
   82838:	d503201f 	nop
   8283c:	d503201f 	nop
   82840:	d503201f 	nop
   82844:	d503201f 	nop
   82848:	d503201f 	nop
   8284c:	d503201f 	nop
   82850:	d503201f 	nop
   82854:	d503201f 	nop
   82858:	d503201f 	nop
   8285c:	d503201f 	nop
   82860:	d503201f 	nop
   82864:	d503201f 	nop
   82868:	d503201f 	nop
   8286c:	d503201f 	nop
   82870:	d503201f 	nop
   82874:	d503201f 	nop
   82878:	d503201f 	nop
   8287c:	d503201f 	nop
   82880:	d503201f 	nop
   82884:	d503201f 	nop
   82888:	d503201f 	nop
   8288c:	d503201f 	nop
   82890:	d503201f 	nop
   82894:	d503201f 	nop
   82898:	d503201f 	nop
   8289c:	d503201f 	nop
   828a0:	d503201f 	nop
   828a4:	d503201f 	nop
   828a8:	d503201f 	nop
   828ac:	d503201f 	nop
   828b0:	d503201f 	nop
   828b4:	d503201f 	nop
   828b8:	d503201f 	nop
   828bc:	d503201f 	nop
   828c0:	d503201f 	nop
   828c4:	d503201f 	nop
   828c8:	d503201f 	nop
   828cc:	d503201f 	nop
   828d0:	d503201f 	nop
   828d4:	d503201f 	nop
   828d8:	d503201f 	nop
   828dc:	d503201f 	nop
   828e0:	d503201f 	nop
   828e4:	d503201f 	nop
   828e8:	d503201f 	nop
   828ec:	d503201f 	nop
   828f0:	d503201f 	nop
   828f4:	d503201f 	nop
   828f8:	d503201f 	nop
   828fc:	d503201f 	nop
   82900:	d503201f 	nop
   82904:	d503201f 	nop
   82908:	d503201f 	nop
   8290c:	d503201f 	nop
   82910:	d503201f 	nop
   82914:	d503201f 	nop
   82918:	d503201f 	nop
   8291c:	d503201f 	nop
   82920:	d503201f 	nop
   82924:	d503201f 	nop
   82928:	d503201f 	nop
   8292c:	d503201f 	nop
   82930:	d503201f 	nop
   82934:	d503201f 	nop
   82938:	d503201f 	nop
   8293c:	d503201f 	nop
   82940:	d503201f 	nop
   82944:	d503201f 	nop
   82948:	d503201f 	nop
   8294c:	d503201f 	nop
   82950:	d503201f 	nop
   82954:	d503201f 	nop
   82958:	d503201f 	nop
   8295c:	d503201f 	nop
   82960:	d503201f 	nop
   82964:	d503201f 	nop
   82968:	d503201f 	nop
   8296c:	d503201f 	nop
   82970:	d503201f 	nop
   82974:	d503201f 	nop
   82978:	d503201f 	nop
   8297c:	d503201f 	nop
   82980:	d503201f 	nop
   82984:	d503201f 	nop
   82988:	d503201f 	nop
   8298c:	d503201f 	nop
   82990:	d503201f 	nop
   82994:	d503201f 	nop
   82998:	d503201f 	nop
   8299c:	d503201f 	nop
   829a0:	d503201f 	nop
   829a4:	d503201f 	nop
   829a8:	d503201f 	nop
   829ac:	d503201f 	nop
   829b0:	d503201f 	nop
   829b4:	d503201f 	nop
   829b8:	d503201f 	nop
   829bc:	d503201f 	nop
   829c0:	d503201f 	nop
   829c4:	d503201f 	nop
   829c8:	d503201f 	nop
   829cc:	d503201f 	nop
   829d0:	d503201f 	nop
   829d4:	d503201f 	nop
   829d8:	d503201f 	nop
   829dc:	d503201f 	nop
   829e0:	d503201f 	nop
   829e4:	d503201f 	nop
   829e8:	d503201f 	nop
   829ec:	d503201f 	nop
   829f0:	d503201f 	nop
   829f4:	d503201f 	nop
   829f8:	d503201f 	nop
   829fc:	d503201f 	nop
   82a00:	d503201f 	nop
   82a04:	d503201f 	nop
   82a08:	d503201f 	nop
   82a0c:	d503201f 	nop
   82a10:	d503201f 	nop
   82a14:	d503201f 	nop
   82a18:	d503201f 	nop
   82a1c:	d503201f 	nop
   82a20:	d503201f 	nop
   82a24:	d503201f 	nop
   82a28:	d503201f 	nop
   82a2c:	d503201f 	nop
   82a30:	d503201f 	nop
   82a34:	d503201f 	nop
   82a38:	d503201f 	nop
   82a3c:	d503201f 	nop
   82a40:	d503201f 	nop
   82a44:	d503201f 	nop
   82a48:	d503201f 	nop
   82a4c:	d503201f 	nop
   82a50:	d503201f 	nop
   82a54:	d503201f 	nop
   82a58:	d503201f 	nop
   82a5c:	d503201f 	nop
   82a60:	d503201f 	nop
   82a64:	d503201f 	nop
   82a68:	d503201f 	nop
   82a6c:	d503201f 	nop
   82a70:	d503201f 	nop
   82a74:	d503201f 	nop
   82a78:	d503201f 	nop
   82a7c:	d503201f 	nop
   82a80:	d503201f 	nop
   82a84:	d503201f 	nop
   82a88:	d503201f 	nop
   82a8c:	d503201f 	nop
   82a90:	d503201f 	nop
   82a94:	d503201f 	nop
   82a98:	d503201f 	nop
   82a9c:	d503201f 	nop
   82aa0:	d503201f 	nop
   82aa4:	d503201f 	nop
   82aa8:	d503201f 	nop
   82aac:	d503201f 	nop
   82ab0:	d503201f 	nop
   82ab4:	d503201f 	nop
   82ab8:	d503201f 	nop
   82abc:	d503201f 	nop
   82ac0:	d503201f 	nop
   82ac4:	d503201f 	nop
   82ac8:	d503201f 	nop
   82acc:	d503201f 	nop
   82ad0:	d503201f 	nop
   82ad4:	d503201f 	nop
   82ad8:	d503201f 	nop
   82adc:	d503201f 	nop
   82ae0:	d503201f 	nop
   82ae4:	d503201f 	nop
   82ae8:	d503201f 	nop
   82aec:	d503201f 	nop
   82af0:	d503201f 	nop
   82af4:	d503201f 	nop
   82af8:	d503201f 	nop
   82afc:	d503201f 	nop
   82b00:	d503201f 	nop
   82b04:	d503201f 	nop
   82b08:	d503201f 	nop
   82b0c:	d503201f 	nop
   82b10:	d503201f 	nop
   82b14:	d503201f 	nop
   82b18:	d503201f 	nop
   82b1c:	d503201f 	nop
   82b20:	d503201f 	nop
   82b24:	d503201f 	nop
   82b28:	d503201f 	nop
   82b2c:	d503201f 	nop
   82b30:	d503201f 	nop
   82b34:	d503201f 	nop
   82b38:	d503201f 	nop
   82b3c:	d503201f 	nop
   82b40:	d503201f 	nop
   82b44:	d503201f 	nop
   82b48:	d503201f 	nop
   82b4c:	d503201f 	nop
   82b50:	d503201f 	nop
   82b54:	d503201f 	nop
   82b58:	d503201f 	nop
   82b5c:	d503201f 	nop
   82b60:	d503201f 	nop
   82b64:	d503201f 	nop
   82b68:	d503201f 	nop
   82b6c:	d503201f 	nop
   82b70:	d503201f 	nop
   82b74:	d503201f 	nop
   82b78:	d503201f 	nop
   82b7c:	d503201f 	nop
   82b80:	d503201f 	nop
   82b84:	d503201f 	nop
   82b88:	d503201f 	nop
   82b8c:	d503201f 	nop
   82b90:	d503201f 	nop
   82b94:	d503201f 	nop
   82b98:	d503201f 	nop
   82b9c:	d503201f 	nop
   82ba0:	d503201f 	nop
   82ba4:	d503201f 	nop
   82ba8:	d503201f 	nop
   82bac:	d503201f 	nop
   82bb0:	d503201f 	nop
   82bb4:	d503201f 	nop
   82bb8:	d503201f 	nop
   82bbc:	d503201f 	nop
   82bc0:	d503201f 	nop
   82bc4:	d503201f 	nop
   82bc8:	d503201f 	nop
   82bcc:	d503201f 	nop
   82bd0:	d503201f 	nop
   82bd4:	d503201f 	nop
   82bd8:	d503201f 	nop
   82bdc:	d503201f 	nop
   82be0:	d503201f 	nop
   82be4:	d503201f 	nop
   82be8:	d503201f 	nop
   82bec:	d503201f 	nop
   82bf0:	d503201f 	nop
   82bf4:	d503201f 	nop
   82bf8:	d503201f 	nop
   82bfc:	d503201f 	nop
   82c00:	d503201f 	nop
   82c04:	d503201f 	nop
   82c08:	d503201f 	nop
   82c0c:	d503201f 	nop
   82c10:	d503201f 	nop
   82c14:	d503201f 	nop
   82c18:	d503201f 	nop
   82c1c:	d503201f 	nop
   82c20:	d503201f 	nop
   82c24:	d503201f 	nop
   82c28:	d503201f 	nop
   82c2c:	d503201f 	nop
   82c30:	d503201f 	nop
   82c34:	d503201f 	nop
   82c38:	d503201f 	nop
   82c3c:	d503201f 	nop
   82c40:	d503201f 	nop
   82c44:	d503201f 	nop
   82c48:	d503201f 	nop
   82c4c:	d503201f 	nop
   82c50:	d503201f 	nop
   82c54:	d503201f 	nop
   82c58:	d503201f 	nop
   82c5c:	d503201f 	nop
   82c60:	d503201f 	nop
   82c64:	d503201f 	nop
   82c68:	d503201f 	nop
   82c6c:	d503201f 	nop
   82c70:	d503201f 	nop
   82c74:	d503201f 	nop
   82c78:	d503201f 	nop
   82c7c:	d503201f 	nop
   82c80:	d503201f 	nop
   82c84:	d503201f 	nop
   82c88:	d503201f 	nop
   82c8c:	d503201f 	nop
   82c90:	d503201f 	nop
   82c94:	d503201f 	nop
   82c98:	d503201f 	nop
   82c9c:	d503201f 	nop
   82ca0:	d503201f 	nop
   82ca4:	d503201f 	nop
   82ca8:	d503201f 	nop
   82cac:	d503201f 	nop
   82cb0:	d503201f 	nop
   82cb4:	d503201f 	nop
   82cb8:	d503201f 	nop
   82cbc:	d503201f 	nop
   82cc0:	d503201f 	nop
   82cc4:	d503201f 	nop
   82cc8:	d503201f 	nop
   82ccc:	d503201f 	nop
   82cd0:	d503201f 	nop
   82cd4:	d503201f 	nop
   82cd8:	d503201f 	nop
   82cdc:	d503201f 	nop
   82ce0:	d503201f 	nop
   82ce4:	d503201f 	nop
   82ce8:	d503201f 	nop
   82cec:	d503201f 	nop
   82cf0:	d503201f 	nop
   82cf4:	d503201f 	nop
   82cf8:	d503201f 	nop
   82cfc:	d503201f 	nop
   82d00:	d503201f 	nop
   82d04:	d503201f 	nop
   82d08:	d503201f 	nop
   82d0c:	d503201f 	nop
   82d10:	d503201f 	nop
   82d14:	d503201f 	nop
   82d18:	d503201f 	nop
   82d1c:	d503201f 	nop
   82d20:	d503201f 	nop
   82d24:	d503201f 	nop
   82d28:	d503201f 	nop
   82d2c:	d503201f 	nop
   82d30:	d503201f 	nop
   82d34:	d503201f 	nop
   82d38:	d503201f 	nop
   82d3c:	d503201f 	nop
   82d40:	d503201f 	nop
   82d44:	d503201f 	nop
   82d48:	d503201f 	nop
   82d4c:	d503201f 	nop
   82d50:	d503201f 	nop
   82d54:	d503201f 	nop
   82d58:	d503201f 	nop
   82d5c:	d503201f 	nop
   82d60:	d503201f 	nop
   82d64:	d503201f 	nop
   82d68:	d503201f 	nop
   82d6c:	d503201f 	nop
   82d70:	d503201f 	nop
   82d74:	d503201f 	nop
   82d78:	d503201f 	nop
   82d7c:	d503201f 	nop
   82d80:	d503201f 	nop
   82d84:	d503201f 	nop
   82d88:	d503201f 	nop
   82d8c:	d503201f 	nop
   82d90:	d503201f 	nop
   82d94:	d503201f 	nop
   82d98:	d503201f 	nop
   82d9c:	d503201f 	nop
   82da0:	d503201f 	nop
   82da4:	d503201f 	nop
   82da8:	d503201f 	nop
   82dac:	d503201f 	nop
   82db0:	d503201f 	nop
   82db4:	d503201f 	nop
   82db8:	d503201f 	nop
   82dbc:	d503201f 	nop
   82dc0:	d503201f 	nop
   82dc4:	d503201f 	nop
   82dc8:	d503201f 	nop
   82dcc:	d503201f 	nop
   82dd0:	d503201f 	nop
   82dd4:	d503201f 	nop
   82dd8:	d503201f 	nop
   82ddc:	d503201f 	nop
   82de0:	d503201f 	nop
   82de4:	d503201f 	nop
   82de8:	d503201f 	nop
   82dec:	d503201f 	nop
   82df0:	d503201f 	nop
   82df4:	d503201f 	nop
   82df8:	d503201f 	nop
   82dfc:	d503201f 	nop
   82e00:	d503201f 	nop
   82e04:	d503201f 	nop
   82e08:	d503201f 	nop
   82e0c:	d503201f 	nop
   82e10:	d503201f 	nop
   82e14:	d503201f 	nop
   82e18:	d503201f 	nop
   82e1c:	d503201f 	nop
   82e20:	d503201f 	nop
   82e24:	d503201f 	nop
   82e28:	d503201f 	nop
   82e2c:	d503201f 	nop
   82e30:	d503201f 	nop
   82e34:	d503201f 	nop
   82e38:	d503201f 	nop
   82e3c:	d503201f 	nop
   82e40:	d503201f 	nop
   82e44:	d503201f 	nop
   82e48:	d503201f 	nop
   82e4c:	d503201f 	nop
   82e50:	d503201f 	nop
   82e54:	d503201f 	nop
   82e58:	d503201f 	nop
   82e5c:	d503201f 	nop
   82e60:	d503201f 	nop
   82e64:	d503201f 	nop
   82e68:	d503201f 	nop
   82e6c:	d503201f 	nop
   82e70:	d503201f 	nop
   82e74:	d503201f 	nop
   82e78:	d503201f 	nop
   82e7c:	d503201f 	nop
   82e80:	d503201f 	nop
   82e84:	d503201f 	nop
   82e88:	d503201f 	nop
   82e8c:	d503201f 	nop
   82e90:	d503201f 	nop
   82e94:	d503201f 	nop
   82e98:	d503201f 	nop
   82e9c:	d503201f 	nop
   82ea0:	d503201f 	nop
   82ea4:	d503201f 	nop
   82ea8:	d503201f 	nop
   82eac:	d503201f 	nop
   82eb0:	d503201f 	nop
   82eb4:	d503201f 	nop
   82eb8:	d503201f 	nop
   82ebc:	d503201f 	nop
   82ec0:	d503201f 	nop
   82ec4:	d503201f 	nop
   82ec8:	d503201f 	nop
   82ecc:	d503201f 	nop
   82ed0:	d503201f 	nop
   82ed4:	d503201f 	nop
   82ed8:	d503201f 	nop
   82edc:	d503201f 	nop
   82ee0:	d503201f 	nop
   82ee4:	d503201f 	nop
   82ee8:	d503201f 	nop
   82eec:	d503201f 	nop
   82ef0:	d503201f 	nop
   82ef4:	d503201f 	nop
   82ef8:	d503201f 	nop
   82efc:	d503201f 	nop
   82f00:	d503201f 	nop
   82f04:	d503201f 	nop
   82f08:	d503201f 	nop
   82f0c:	d503201f 	nop
   82f10:	d503201f 	nop
   82f14:	d503201f 	nop
   82f18:	d503201f 	nop
   82f1c:	d503201f 	nop
   82f20:	d503201f 	nop
   82f24:	d503201f 	nop
   82f28:	d503201f 	nop
   82f2c:	d503201f 	nop
   82f30:	d503201f 	nop
   82f34:	d503201f 	nop
   82f38:	d503201f 	nop
   82f3c:	d503201f 	nop
   82f40:	d503201f 	nop
   82f44:	d503201f 	nop
   82f48:	d503201f 	nop
   82f4c:	d503201f 	nop
   82f50:	d503201f 	nop
   82f54:	d503201f 	nop
   82f58:	d503201f 	nop
   82f5c:	d503201f 	nop
   82f60:	d503201f 	nop
   82f64:	d503201f 	nop
   82f68:	d503201f 	nop
   82f6c:	d503201f 	nop
   82f70:	d503201f 	nop
   82f74:	d503201f 	nop
   82f78:	d503201f 	nop
   82f7c:	d503201f 	nop
   82f80:	d503201f 	nop
   82f84:	d503201f 	nop
   82f88:	d503201f 	nop
   82f8c:	d503201f 	nop
   82f90:	d503201f 	nop
   82f94:	d503201f 	nop
   82f98:	d503201f 	nop
   82f9c:	d503201f 	nop
   82fa0:	d503201f 	nop
   82fa4:	d503201f 	nop
   82fa8:	d503201f 	nop
   82fac:	d503201f 	nop
   82fb0:	d503201f 	nop
   82fb4:	d503201f 	nop
   82fb8:	d503201f 	nop
   82fbc:	d503201f 	nop
   82fc0:	d503201f 	nop
   82fc4:	d503201f 	nop
   82fc8:	d503201f 	nop
   82fcc:	d503201f 	nop
   82fd0:	d503201f 	nop
   82fd4:	d503201f 	nop
   82fd8:	d503201f 	nop
   82fdc:	d503201f 	nop
   82fe0:	d503201f 	nop
   82fe4:	d503201f 	nop
   82fe8:	d503201f 	nop
   82fec:	d503201f 	nop
   82ff0:	d503201f 	nop
   82ff4:	d503201f 	nop
   82ff8:	d503201f 	nop
   82ffc:	d503201f 	nop
   83000:	00004400 	udf	#17408
   83004:	00000000 	udf	#0
   83008:	00100010 	.inst	0x00100010 ; undefined
   8300c:	00000000 	udf	#0

0000000000083010 <enable_irq_timer>:
   83010:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   83014:	94000008 	bl	83034 <get_system_clk>
   83018:	d2800c81 	mov	x1, #0x64                  	// #100
   8301c:	9ac10800 	udiv	x0, x0, x1
   83020:	94000007 	bl	8303c <set_timer_interval>
   83024:	d2800020 	mov	x0, #0x1                   	// #1
   83028:	d51be220 	msr	cntp_ctl_el0, x0
   8302c:	a8c17bfd 	ldp	x29, x30, [sp], #16
   83030:	d65f03c0 	ret

0000000000083034 <get_system_clk>:
   83034:	d53be000 	mrs	x0, cntfrq_el0
   83038:	d65f03c0 	ret

000000000008303c <set_timer_interval>:
   8303c:	d51be200 	msr	cntp_tval_el0, x0
   83040:	d65f03c0 	ret

0000000000083044 <__assert>:
   83044:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
   83048:	910003fd 	mov	x29, sp
   8304c:	f90017e0 	str	x0, [sp, #40]
   83050:	f90013e1 	str	x1, [sp, #32]
   83054:	f9000fe2 	str	x2, [sp, #24]
   83058:	b90017e3 	str	w3, [sp, #20]
   8305c:	b94017e4 	ldr	w4, [sp, #20]
   83060:	f9400fe3 	ldr	x3, [sp, #24]
   83064:	f94013e2 	ldr	x2, [sp, #32]
   83068:	f94017e1 	ldr	x1, [sp, #40]
   8306c:	b0000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   83070:	911b0000 	add	x0, x0, #0x6c0
   83074:	940001c7 	bl	83790 <printk>
   83078:	d503201f 	nop
   8307c:	a8c37bfd 	ldp	x29, x30, [sp], #48
   83080:	d65f03c0 	ret

0000000000083084 <display_page_table>:
   83084:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
   83088:	910003fd 	mov	x29, sp
   8308c:	900000a0 	adrp	x0, 97000 <core_count>
   83090:	f9400c00 	ldr	x0, [x0, #24]
   83094:	f9002fe0 	str	x0, [sp, #88]
   83098:	14000028 	b	83138 <display_page_table+0xb4>
   8309c:	f9402fe1 	ldr	x1, [sp, #88]
   830a0:	b0000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   830a4:	911c4000 	add	x0, x0, #0x710
   830a8:	940001ba 	bl	83790 <printk>
   830ac:	f9402fe0 	ldr	x0, [sp, #88]
   830b0:	f9400000 	ldr	x0, [x0]
   830b4:	f90017e0 	str	x0, [sp, #40]
   830b8:	f94017e0 	ldr	x0, [sp, #40]
   830bc:	927df000 	and	x0, x0, #0xfffffffffffffff8
   830c0:	f90017e0 	str	x0, [sp, #40]
   830c4:	f94017e0 	ldr	x0, [sp, #40]
   830c8:	f9002be0 	str	x0, [sp, #80]
   830cc:	14000013 	b	83118 <display_page_table+0x94>
   830d0:	f9402be0 	ldr	x0, [sp, #80]
   830d4:	f9400000 	ldr	x0, [x0]
   830d8:	aa0003e2 	mov	x2, x0
   830dc:	f9402be1 	ldr	x1, [sp, #80]
   830e0:	b0000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   830e4:	911c6000 	add	x0, x0, #0x718
   830e8:	940001aa 	bl	83790 <printk>
   830ec:	f9402be0 	ldr	x0, [sp, #80]
   830f0:	f9400000 	ldr	x0, [x0]
   830f4:	f90013e0 	str	x0, [sp, #32]
   830f8:	f94013e0 	ldr	x0, [sp, #32]
   830fc:	927df000 	and	x0, x0, #0xfffffffffffffff8
   83100:	f90013e0 	str	x0, [sp, #32]
   83104:	f94013e0 	ldr	x0, [sp, #32]
   83108:	f9000fe0 	str	x0, [sp, #24]
   8310c:	f9402be0 	ldr	x0, [sp, #80]
   83110:	91002000 	add	x0, x0, #0x8
   83114:	f9002be0 	str	x0, [sp, #80]
   83118:	f9402be0 	ldr	x0, [sp, #80]
   8311c:	f9400000 	ldr	x0, [x0]
   83120:	92400000 	and	x0, x0, #0x1
   83124:	f100001f 	cmp	x0, #0x0
   83128:	54fffd41 	b.ne	830d0 <display_page_table+0x4c>  // b.any
   8312c:	f9402fe0 	ldr	x0, [sp, #88]
   83130:	91002000 	add	x0, x0, #0x8
   83134:	f9002fe0 	str	x0, [sp, #88]
   83138:	f9402fe0 	ldr	x0, [sp, #88]
   8313c:	f9400000 	ldr	x0, [x0]
   83140:	92400000 	and	x0, x0, #0x1
   83144:	f100001f 	cmp	x0, #0x0
   83148:	54fffaa1 	b.ne	8309c <display_page_table+0x18>  // b.any
   8314c:	900000a0 	adrp	x0, 97000 <core_count>
   83150:	f9402400 	ldr	x0, [x0, #72]
   83154:	f9002fe0 	str	x0, [sp, #88]
   83158:	14000028 	b	831f8 <display_page_table+0x174>
   8315c:	f9402fe1 	ldr	x1, [sp, #88]
   83160:	b0000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   83164:	911c4000 	add	x0, x0, #0x710
   83168:	9400018a 	bl	83790 <printk>
   8316c:	f9402fe0 	ldr	x0, [sp, #88]
   83170:	f9400000 	ldr	x0, [x0]
   83174:	f90023e0 	str	x0, [sp, #64]
   83178:	f94023e0 	ldr	x0, [sp, #64]
   8317c:	927df000 	and	x0, x0, #0xfffffffffffffff8
   83180:	f90023e0 	str	x0, [sp, #64]
   83184:	f94023e0 	ldr	x0, [sp, #64]
   83188:	f90027e0 	str	x0, [sp, #72]
   8318c:	14000013 	b	831d8 <display_page_table+0x154>
   83190:	f94027e0 	ldr	x0, [sp, #72]
   83194:	f9400000 	ldr	x0, [x0]
   83198:	aa0003e2 	mov	x2, x0
   8319c:	f94027e1 	ldr	x1, [sp, #72]
   831a0:	b0000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   831a4:	911c6000 	add	x0, x0, #0x718
   831a8:	9400017a 	bl	83790 <printk>
   831ac:	f94027e0 	ldr	x0, [sp, #72]
   831b0:	f9400000 	ldr	x0, [x0]
   831b4:	f9001fe0 	str	x0, [sp, #56]
   831b8:	f9401fe0 	ldr	x0, [sp, #56]
   831bc:	927df000 	and	x0, x0, #0xfffffffffffffff8
   831c0:	f9001fe0 	str	x0, [sp, #56]
   831c4:	f9401fe0 	ldr	x0, [sp, #56]
   831c8:	f9001be0 	str	x0, [sp, #48]
   831cc:	f94027e0 	ldr	x0, [sp, #72]
   831d0:	91002000 	add	x0, x0, #0x8
   831d4:	f90027e0 	str	x0, [sp, #72]
   831d8:	f94027e0 	ldr	x0, [sp, #72]
   831dc:	f9400000 	ldr	x0, [x0]
   831e0:	92400000 	and	x0, x0, #0x1
   831e4:	f100001f 	cmp	x0, #0x0
   831e8:	54fffd41 	b.ne	83190 <display_page_table+0x10c>  // b.any
   831ec:	f9402fe0 	ldr	x0, [sp, #88]
   831f0:	91002000 	add	x0, x0, #0x8
   831f4:	f9002fe0 	str	x0, [sp, #88]
   831f8:	f9402fe0 	ldr	x0, [sp, #88]
   831fc:	f9400000 	ldr	x0, [x0]
   83200:	92400000 	and	x0, x0, #0x1
   83204:	f100001f 	cmp	x0, #0x0
   83208:	54fffaa1 	b.ne	8315c <display_page_table+0xd8>  // b.any
   8320c:	d503201f 	nop
   83210:	d503201f 	nop
   83214:	a8c67bfd 	ldp	x29, x30, [sp], #96
   83218:	d65f03c0 	ret

000000000008321c <func_core_entry>:
   8321c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   83220:	910003fd 	mov	x29, sp
   83224:	b0000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   83228:	911ca000 	add	x0, x0, #0x728
   8322c:	9400040a 	bl	84254 <uart_write_string>
   83230:	14000000 	b	83230 <func_core_entry+0x14>

0000000000083234 <func_core_aux_entry>:
   83234:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   83238:	910003fd 	mov	x29, sp
   8323c:	b0000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   83240:	911d0000 	add	x0, x0, #0x740
   83244:	94000404 	bl	84254 <uart_write_string>
   83248:	14000000 	b	83248 <func_core_aux_entry+0x14>

000000000008324c <user_core_entry>:
   8324c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   83250:	910003fd 	mov	x29, sp
   83254:	b0000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   83258:	911d6000 	add	x0, x0, #0x758
   8325c:	9400014d 	bl	83790 <printk>
   83260:	14000000 	b	83260 <user_core_entry+0x14>

0000000000083264 <comm_core_entry>:
   83264:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   83268:	910003fd 	mov	x29, sp
   8326c:	b0000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   83270:	911dc000 	add	x0, x0, #0x770
   83274:	940003f8 	bl	84254 <uart_write_string>
   83278:	52800021 	mov	w1, #0x1                   	// #1
   8327c:	528000e0 	mov	w0, #0x7                   	// #7
   83280:	94000487 	bl	8449c <gpio_pin_func_select>
   83284:	528000e0 	mov	w0, #0x7                   	// #7
   83288:	940004bd 	bl	8457c <gpio_pin_enable>
   8328c:	528000e0 	mov	w0, #0x7                   	// #7
   83290:	940004df 	bl	8460c <gpio_set>
   83294:	d284e200 	mov	x0, #0x2710                	// #10000
   83298:	97fff9d4 	bl	819e8 <delay>
   8329c:	528000e0 	mov	w0, #0x7                   	// #7
   832a0:	940004e7 	bl	8463c <gpio_clear>
   832a4:	d284e200 	mov	x0, #0x2710                	// #10000
   832a8:	97fff9d0 	bl	819e8 <delay>
   832ac:	17fffff8 	b	8328c <comm_core_entry+0x28>

00000000000832b0 <program_gic>:
   832b0:	d2964000 	mov	x0, #0xb200                	// #45568
   832b4:	f2a7e000 	movk	x0, #0x3f00, lsl #16
   832b8:	12800001 	mov	w1, #0xffffffff            	// #-1
   832bc:	b9002401 	str	w1, [x0, #36]
   832c0:	d2964000 	mov	x0, #0xb200                	// #45568
   832c4:	f2a7e000 	movk	x0, #0x3f00, lsl #16
   832c8:	12800001 	mov	w1, #0xffffffff            	// #-1
   832cc:	b9001c01 	str	w1, [x0, #28]
   832d0:	d2964000 	mov	x0, #0xb200                	// #45568
   832d4:	f2a7e000 	movk	x0, #0x3f00, lsl #16
   832d8:	12800001 	mov	w1, #0xffffffff            	// #-1
   832dc:	b9002001 	str	w1, [x0, #32]
   832e0:	d2964000 	mov	x0, #0xb200                	// #45568
   832e4:	f2a7e000 	movk	x0, #0x3f00, lsl #16
   832e8:	52800021 	mov	w1, #0x1                   	// #1
   832ec:	b9001801 	str	w1, [x0, #24]
   832f0:	d503201f 	nop
   832f4:	d65f03c0 	ret

00000000000832f8 <external_async_irq_handler>:
   832f8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   832fc:	910003fd 	mov	x29, sp
   83300:	39007fff 	strb	wzr, [sp, #31]
   83304:	39007bff 	strb	wzr, [sp, #30]
   83308:	97fff412 	bl	80350 <read_core0_irq_status>
   8330c:	d341fc00 	lsr	x0, x0, #1
   83310:	f100001f 	cmp	x0, #0x0
   83314:	1a9f07e0 	cset	w0, ne  // ne = any
   83318:	12001c00 	and	w0, w0, #0xff
   8331c:	39007fe0 	strb	w0, [sp, #31]
   83320:	97fff40f 	bl	8035c <read_core0_timer_status>
   83324:	927e0000 	and	x0, x0, #0x4
   83328:	f100001f 	cmp	x0, #0x0
   8332c:	1a9f07e0 	cset	w0, ne  // ne = any
   83330:	12001c00 	and	w0, w0, #0xff
   83334:	39007be0 	strb	w0, [sp, #30]
   83338:	39407fe0 	ldrb	w0, [sp, #31]
   8333c:	7100001f 	cmp	w0, #0x0
   83340:	540000a0 	b.eq	83354 <external_async_irq_handler+0x5c>  // b.none
   83344:	39407be0 	ldrb	w0, [sp, #30]
   83348:	7100001f 	cmp	w0, #0x0
   8334c:	54000040 	b.eq	83354 <external_async_irq_handler+0x5c>  // b.none
   83350:	94000280 	bl	83d50 <timer_irq_handler>
   83354:	d503201f 	nop
   83358:	a8c27bfd 	ldp	x29, x30, [sp], #32
   8335c:	d65f03c0 	ret

0000000000083360 <isr_dispatcher>:
   83360:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   83364:	910003fd 	mov	x29, sp
   83368:	f9000fe0 	str	x0, [sp, #24]
   8336c:	f9400fe0 	ldr	x0, [sp, #24]
   83370:	f9408000 	ldr	x0, [x0, #256]
   83374:	f100041f 	cmp	x0, #0x1
   83378:	54000080 	b.eq	83388 <isr_dispatcher+0x28>  // b.none
   8337c:	f100081f 	cmp	x0, #0x2
   83380:	54000080 	b.eq	83390 <isr_dispatcher+0x30>  // b.none
   83384:	14000004 	b	83394 <isr_dispatcher+0x34>
   83388:	97ffffdc 	bl	832f8 <external_async_irq_handler>
   8338c:	14000002 	b	83394 <isr_dispatcher+0x34>
   83390:	d503201f 	nop
   83394:	d503201f 	nop
   83398:	a8c27bfd 	ldp	x29, x30, [sp], #32
   8339c:	d65f03c0 	ret

00000000000833a0 <stack_access_self_test>:
   833a0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   833a4:	910003fd 	mov	x29, sp
   833a8:	39007fe0 	strb	w0, [sp, #31]
   833ac:	39407fe0 	ldrb	w0, [sp, #31]
   833b0:	71000c1f 	cmp	w0, #0x3
   833b4:	54000420 	b.eq	83438 <stack_access_self_test+0x98>  // b.none
   833b8:	71000c1f 	cmp	w0, #0x3
   833bc:	5400048c 	b.gt	8344c <stack_access_self_test+0xac>
   833c0:	7100081f 	cmp	w0, #0x2
   833c4:	54000300 	b.eq	83424 <stack_access_self_test+0x84>  // b.none
   833c8:	7100081f 	cmp	w0, #0x2
   833cc:	5400040c 	b.gt	8344c <stack_access_self_test+0xac>
   833d0:	7100001f 	cmp	w0, #0x0
   833d4:	54000080 	b.eq	833e4 <stack_access_self_test+0x44>  // b.none
   833d8:	7100041f 	cmp	w0, #0x1
   833dc:	540001a0 	b.eq	83410 <stack_access_self_test+0x70>  // b.none
   833e0:	1400001b 	b	8344c <stack_access_self_test+0xac>
   833e4:	d2800000 	mov	x0, #0x0                   	// #0
   833e8:	97fff9a3 	bl	81a74 <get_core_stack>
   833ec:	d2820001 	mov	x1, #0x1000                	// #4096
   833f0:	97fff969 	bl	81994 <memclr>
   833f4:	d2800000 	mov	x0, #0x0                   	// #0
   833f8:	97fff99f 	bl	81a74 <get_core_stack>
   833fc:	d2820002 	mov	x2, #0x1000                	// #4096
   83400:	d297dde1 	mov	x1, #0xbeef                	// #48879
   83404:	f2bbd5a1 	movk	x1, #0xdead, lsl #16
   83408:	97fff96c 	bl	819b8 <memset>
   8340c:	14000011 	b	83450 <stack_access_self_test+0xb0>
   83410:	d2800020 	mov	x0, #0x1                   	// #1
   83414:	97fff998 	bl	81a74 <get_core_stack>
   83418:	d2820001 	mov	x1, #0x1000                	// #4096
   8341c:	97fff95e 	bl	81994 <memclr>
   83420:	1400000c 	b	83450 <stack_access_self_test+0xb0>
   83424:	d2800040 	mov	x0, #0x2                   	// #2
   83428:	97fff993 	bl	81a74 <get_core_stack>
   8342c:	d2820001 	mov	x1, #0x1000                	// #4096
   83430:	97fff959 	bl	81994 <memclr>
   83434:	14000007 	b	83450 <stack_access_self_test+0xb0>
   83438:	d2800060 	mov	x0, #0x3                   	// #3
   8343c:	97fff98e 	bl	81a74 <get_core_stack>
   83440:	d2820001 	mov	x1, #0x1000                	// #4096
   83444:	97fff954 	bl	81994 <memclr>
   83448:	14000002 	b	83450 <stack_access_self_test+0xb0>
   8344c:	d503201f 	nop
   83450:	d503201f 	nop
   83454:	a8c27bfd 	ldp	x29, x30, [sp], #32
   83458:	d65f03c0 	ret

000000000008345c <read_string>:
   8345c:	d100c3ff 	sub	sp, sp, #0x30
   83460:	f9000fe0 	str	x0, [sp, #24]
   83464:	b90017e1 	str	w1, [sp, #20]
   83468:	f90007e2 	str	x2, [sp, #8]
   8346c:	b9002fff 	str	wzr, [sp, #44]
   83470:	b9002fff 	str	wzr, [sp, #44]
   83474:	1400000f 	b	834b0 <read_string+0x54>
   83478:	b9802fe0 	ldrsw	x0, [sp, #44]
   8347c:	f94007e1 	ldr	x1, [sp, #8]
   83480:	8b000021 	add	x1, x1, x0
   83484:	b94017e0 	ldr	w0, [sp, #20]
   83488:	11000402 	add	w2, w0, #0x1
   8348c:	b90017e2 	str	w2, [sp, #20]
   83490:	93407c00 	sxtw	x0, w0
   83494:	f9400fe2 	ldr	x2, [sp, #24]
   83498:	8b000040 	add	x0, x2, x0
   8349c:	39400021 	ldrb	w1, [x1]
   834a0:	39000001 	strb	w1, [x0]
   834a4:	b9402fe0 	ldr	w0, [sp, #44]
   834a8:	11000400 	add	w0, w0, #0x1
   834ac:	b9002fe0 	str	w0, [sp, #44]
   834b0:	b9802fe0 	ldrsw	x0, [sp, #44]
   834b4:	f94007e1 	ldr	x1, [sp, #8]
   834b8:	8b000020 	add	x0, x1, x0
   834bc:	39400000 	ldrb	w0, [x0]
   834c0:	7100001f 	cmp	w0, #0x0
   834c4:	54fffda1 	b.ne	83478 <read_string+0x1c>  // b.any
   834c8:	b9402fe0 	ldr	w0, [sp, #44]
   834cc:	9100c3ff 	add	sp, sp, #0x30
   834d0:	d65f03c0 	ret

00000000000834d4 <hex_to_string>:
   834d4:	d10183ff 	sub	sp, sp, #0x60
   834d8:	f9000fe0 	str	x0, [sp, #24]
   834dc:	b90017e1 	str	w1, [sp, #20]
   834e0:	f90007e2 	str	x2, [sp, #8]
   834e4:	b0000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   834e8:	911e6000 	add	x0, x0, #0x798
   834ec:	a9400400 	ldp	x0, x1, [x0]
   834f0:	a90287e0 	stp	x0, x1, [sp, #40]
   834f4:	b9005fff 	str	wzr, [sp, #92]
   834f8:	f94007e0 	ldr	x0, [sp, #8]
   834fc:	92400c01 	and	x1, x0, #0xf
   83500:	b9405fe0 	ldr	w0, [sp, #92]
   83504:	11000402 	add	w2, w0, #0x1
   83508:	b9005fe2 	str	w2, [sp, #92]
   8350c:	9100a3e2 	add	x2, sp, #0x28
   83510:	38616842 	ldrb	w2, [x2, x1]
   83514:	93407c00 	sxtw	x0, w0
   83518:	9100e3e1 	add	x1, sp, #0x38
   8351c:	38206822 	strb	w2, [x1, x0]
   83520:	f94007e0 	ldr	x0, [sp, #8]
   83524:	d344fc00 	lsr	x0, x0, #4
   83528:	f90007e0 	str	x0, [sp, #8]
   8352c:	f94007e0 	ldr	x0, [sp, #8]
   83530:	f100001f 	cmp	x0, #0x0
   83534:	54fffe21 	b.ne	834f8 <hex_to_string+0x24>  // b.any
   83538:	b9405fe0 	ldr	w0, [sp, #92]
   8353c:	51000400 	sub	w0, w0, #0x1
   83540:	b9005be0 	str	w0, [sp, #88]
   83544:	1400000e 	b	8357c <hex_to_string+0xa8>
   83548:	b94017e0 	ldr	w0, [sp, #20]
   8354c:	11000401 	add	w1, w0, #0x1
   83550:	b90017e1 	str	w1, [sp, #20]
   83554:	93407c00 	sxtw	x0, w0
   83558:	f9400fe1 	ldr	x1, [sp, #24]
   8355c:	8b000020 	add	x0, x1, x0
   83560:	b9805be1 	ldrsw	x1, [sp, #88]
   83564:	9100e3e2 	add	x2, sp, #0x38
   83568:	38616841 	ldrb	w1, [x2, x1]
   8356c:	39000001 	strb	w1, [x0]
   83570:	b9405be0 	ldr	w0, [sp, #88]
   83574:	51000400 	sub	w0, w0, #0x1
   83578:	b9005be0 	str	w0, [sp, #88]
   8357c:	b9405be0 	ldr	w0, [sp, #88]
   83580:	7100001f 	cmp	w0, #0x0
   83584:	54fffe2a 	b.ge	83548 <hex_to_string+0x74>  // b.tcont
   83588:	b94017e0 	ldr	w0, [sp, #20]
   8358c:	11000401 	add	w1, w0, #0x1
   83590:	b90017e1 	str	w1, [sp, #20]
   83594:	93407c00 	sxtw	x0, w0
   83598:	f9400fe1 	ldr	x1, [sp, #24]
   8359c:	8b000020 	add	x0, x1, x0
   835a0:	52800901 	mov	w1, #0x48                  	// #72
   835a4:	39000001 	strb	w1, [x0]
   835a8:	b9405fe0 	ldr	w0, [sp, #92]
   835ac:	11000400 	add	w0, w0, #0x1
   835b0:	910183ff 	add	sp, sp, #0x60
   835b4:	d65f03c0 	ret

00000000000835b8 <udecimal_to_string>:
   835b8:	d10183ff 	sub	sp, sp, #0x60
   835bc:	f9000fe0 	str	x0, [sp, #24]
   835c0:	b90017e1 	str	w1, [sp, #20]
   835c4:	f90007e2 	str	x2, [sp, #8]
   835c8:	b0000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   835cc:	911ea001 	add	x1, x0, #0x7a8
   835d0:	910123e0 	add	x0, sp, #0x48
   835d4:	f9400022 	ldr	x2, [x1]
   835d8:	f9000002 	str	x2, [x0]
   835dc:	79401021 	ldrh	w1, [x1, #8]
   835e0:	79001001 	strh	w1, [x0, #8]
   835e4:	b9005fff 	str	wzr, [sp, #92]
   835e8:	f94007e2 	ldr	x2, [sp, #8]
   835ec:	b202e7e0 	mov	x0, #0xcccccccccccccccc    	// #-3689348814741910324
   835f0:	f29999a0 	movk	x0, #0xcccd
   835f4:	9bc07c40 	umulh	x0, x2, x0
   835f8:	d343fc01 	lsr	x1, x0, #3
   835fc:	aa0103e0 	mov	x0, x1
   83600:	d37ef400 	lsl	x0, x0, #2
   83604:	8b010000 	add	x0, x0, x1
   83608:	d37ff800 	lsl	x0, x0, #1
   8360c:	cb000041 	sub	x1, x2, x0
   83610:	b9405fe0 	ldr	w0, [sp, #92]
   83614:	11000402 	add	w2, w0, #0x1
   83618:	b9005fe2 	str	w2, [sp, #92]
   8361c:	910123e2 	add	x2, sp, #0x48
   83620:	38616842 	ldrb	w2, [x2, x1]
   83624:	93407c00 	sxtw	x0, w0
   83628:	9100a3e1 	add	x1, sp, #0x28
   8362c:	38206822 	strb	w2, [x1, x0]
   83630:	f94007e1 	ldr	x1, [sp, #8]
   83634:	b202e7e0 	mov	x0, #0xcccccccccccccccc    	// #-3689348814741910324
   83638:	f29999a0 	movk	x0, #0xcccd
   8363c:	9bc07c20 	umulh	x0, x1, x0
   83640:	d343fc00 	lsr	x0, x0, #3
   83644:	f90007e0 	str	x0, [sp, #8]
   83648:	f94007e0 	ldr	x0, [sp, #8]
   8364c:	f100001f 	cmp	x0, #0x0
   83650:	54fffcc1 	b.ne	835e8 <udecimal_to_string+0x30>  // b.any
   83654:	b9405fe0 	ldr	w0, [sp, #92]
   83658:	51000400 	sub	w0, w0, #0x1
   8365c:	b9005be0 	str	w0, [sp, #88]
   83660:	1400000e 	b	83698 <udecimal_to_string+0xe0>
   83664:	b94017e0 	ldr	w0, [sp, #20]
   83668:	11000401 	add	w1, w0, #0x1
   8366c:	b90017e1 	str	w1, [sp, #20]
   83670:	93407c00 	sxtw	x0, w0
   83674:	f9400fe1 	ldr	x1, [sp, #24]
   83678:	8b000020 	add	x0, x1, x0
   8367c:	b9805be1 	ldrsw	x1, [sp, #88]
   83680:	9100a3e2 	add	x2, sp, #0x28
   83684:	38616841 	ldrb	w1, [x2, x1]
   83688:	39000001 	strb	w1, [x0]
   8368c:	b9405be0 	ldr	w0, [sp, #88]
   83690:	51000400 	sub	w0, w0, #0x1
   83694:	b9005be0 	str	w0, [sp, #88]
   83698:	b9405be0 	ldr	w0, [sp, #88]
   8369c:	7100001f 	cmp	w0, #0x0
   836a0:	54fffe2a 	b.ge	83664 <udecimal_to_string+0xac>  // b.tcont
   836a4:	b9405fe0 	ldr	w0, [sp, #92]
   836a8:	910183ff 	add	sp, sp, #0x60
   836ac:	d65f03c0 	ret

00000000000836b0 <decimal_to_string>:
   836b0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
   836b4:	910003fd 	mov	x29, sp
   836b8:	f90017e0 	str	x0, [sp, #40]
   836bc:	b90027e1 	str	w1, [sp, #36]
   836c0:	f9000fe2 	str	x2, [sp, #24]
   836c4:	b9003fff 	str	wzr, [sp, #60]
   836c8:	f9400fe0 	ldr	x0, [sp, #24]
   836cc:	f100001f 	cmp	x0, #0x0
   836d0:	540001ca 	b.ge	83708 <decimal_to_string+0x58>  // b.tcont
   836d4:	f9400fe0 	ldr	x0, [sp, #24]
   836d8:	cb0003e0 	neg	x0, x0
   836dc:	f9000fe0 	str	x0, [sp, #24]
   836e0:	b94027e0 	ldr	w0, [sp, #36]
   836e4:	11000401 	add	w1, w0, #0x1
   836e8:	b90027e1 	str	w1, [sp, #36]
   836ec:	93407c00 	sxtw	x0, w0
   836f0:	f94017e1 	ldr	x1, [sp, #40]
   836f4:	8b000020 	add	x0, x1, x0
   836f8:	528005a1 	mov	w1, #0x2d                  	// #45
   836fc:	39000001 	strb	w1, [x0]
   83700:	52800020 	mov	w0, #0x1                   	// #1
   83704:	b9003fe0 	str	w0, [sp, #60]
   83708:	f9400fe0 	ldr	x0, [sp, #24]
   8370c:	aa0003e2 	mov	x2, x0
   83710:	b94027e1 	ldr	w1, [sp, #36]
   83714:	f94017e0 	ldr	x0, [sp, #40]
   83718:	97ffffa8 	bl	835b8 <udecimal_to_string>
   8371c:	2a0003e1 	mov	w1, w0
   83720:	b9403fe0 	ldr	w0, [sp, #60]
   83724:	0b010000 	add	w0, w0, w1
   83728:	b9003fe0 	str	w0, [sp, #60]
   8372c:	b9403fe0 	ldr	w0, [sp, #60]
   83730:	a8c47bfd 	ldp	x29, x30, [sp], #64
   83734:	d65f03c0 	ret

0000000000083738 <write_console>:
   83738:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
   8373c:	910003fd 	mov	x29, sp
   83740:	f9000fe0 	str	x0, [sp, #24]
   83744:	b90017e1 	str	w1, [sp, #20]
   83748:	b9002fff 	str	wzr, [sp, #44]
   8374c:	14000009 	b	83770 <write_console+0x38>
   83750:	b9802fe0 	ldrsw	x0, [sp, #44]
   83754:	f9400fe1 	ldr	x1, [sp, #24]
   83758:	8b000020 	add	x0, x1, x0
   8375c:	39400000 	ldrb	w0, [x0]
   83760:	9400028f 	bl	8419c <uart_send_c>
   83764:	b9402fe0 	ldr	w0, [sp, #44]
   83768:	11000400 	add	w0, w0, #0x1
   8376c:	b9002fe0 	str	w0, [sp, #44]
   83770:	b9402fe1 	ldr	w1, [sp, #44]
   83774:	b94017e0 	ldr	w0, [sp, #20]
   83778:	6b00003f 	cmp	w1, w0
   8377c:	54fffeab 	b.lt	83750 <write_console+0x18>  // b.tstop
   83780:	d503201f 	nop
   83784:	d503201f 	nop
   83788:	a8c37bfd 	ldp	x29, x30, [sp], #48
   8378c:	d65f03c0 	ret

0000000000083790 <printk>:
   83790:	d11283ff 	sub	sp, sp, #0x4a0
   83794:	a9007bfd 	stp	x29, x30, [sp]
   83798:	910003fd 	mov	x29, sp
   8379c:	f9000fe0 	str	x0, [sp, #24]
   837a0:	f90237e1 	str	x1, [sp, #1128]
   837a4:	f9023be2 	str	x2, [sp, #1136]
   837a8:	f9023fe3 	str	x3, [sp, #1144]
   837ac:	f90243e4 	str	x4, [sp, #1152]
   837b0:	f90247e5 	str	x5, [sp, #1160]
   837b4:	f9024be6 	str	x6, [sp, #1168]
   837b8:	f9024fe7 	str	x7, [sp, #1176]
   837bc:	b9045fff 	str	wzr, [sp, #1116]
   837c0:	f9022bff 	str	xzr, [sp, #1104]
   837c4:	f90227ff 	str	xzr, [sp, #1096]
   837c8:	911283e0 	add	x0, sp, #0x4a0
   837cc:	f90017e0 	str	x0, [sp, #40]
   837d0:	911283e0 	add	x0, sp, #0x4a0
   837d4:	f9001be0 	str	x0, [sp, #48]
   837d8:	911183e0 	add	x0, sp, #0x460
   837dc:	f9001fe0 	str	x0, [sp, #56]
   837e0:	128006e0 	mov	w0, #0xffffffc8            	// #-56
   837e4:	b90043e0 	str	w0, [sp, #64]
   837e8:	b90047ff 	str	wzr, [sp, #68]
   837ec:	b9045bff 	str	wzr, [sp, #1112]
   837f0:	140000b1 	b	83ab4 <printk+0x324>
   837f4:	b9845be0 	ldrsw	x0, [sp, #1112]
   837f8:	f9400fe1 	ldr	x1, [sp, #24]
   837fc:	8b000020 	add	x0, x1, x0
   83800:	39400000 	ldrb	w0, [x0]
   83804:	7100941f 	cmp	w0, #0x25
   83808:	54000180 	b.eq	83838 <printk+0xa8>  // b.none
   8380c:	b9845be0 	ldrsw	x0, [sp, #1112]
   83810:	f9400fe1 	ldr	x1, [sp, #24]
   83814:	8b000021 	add	x1, x1, x0
   83818:	b9445fe0 	ldr	w0, [sp, #1116]
   8381c:	11000402 	add	w2, w0, #0x1
   83820:	b9045fe2 	str	w2, [sp, #1116]
   83824:	39400022 	ldrb	w2, [x1]
   83828:	93407c00 	sxtw	x0, w0
   8382c:	910123e1 	add	x1, sp, #0x48
   83830:	38206822 	strb	w2, [x1, x0]
   83834:	1400009d 	b	83aa8 <printk+0x318>
   83838:	b9445be0 	ldr	w0, [sp, #1112]
   8383c:	11000400 	add	w0, w0, #0x1
   83840:	b9045be0 	str	w0, [sp, #1112]
   83844:	b9845be0 	ldrsw	x0, [sp, #1112]
   83848:	f9400fe1 	ldr	x1, [sp, #24]
   8384c:	8b000020 	add	x0, x1, x0
   83850:	39400000 	ldrb	w0, [x0]
   83854:	7101e01f 	cmp	w0, #0x78
   83858:	54000180 	b.eq	83888 <printk+0xf8>  // b.none
   8385c:	7101e01f 	cmp	w0, #0x78
   83860:	5400110c 	b.gt	83a80 <printk+0x2f0>
   83864:	7101d41f 	cmp	w0, #0x75
   83868:	54000500 	b.eq	83908 <printk+0x178>  // b.none
   8386c:	7101d41f 	cmp	w0, #0x75
   83870:	5400108c 	b.gt	83a80 <printk+0x2f0>
   83874:	7101901f 	cmp	w0, #0x64
   83878:	54000880 	b.eq	83988 <printk+0x1f8>  // b.none
   8387c:	7101cc1f 	cmp	w0, #0x73
   83880:	54000c20 	b.eq	83a04 <printk+0x274>  // b.none
   83884:	1400007f 	b	83a80 <printk+0x2f0>
   83888:	b94043e1 	ldr	w1, [sp, #64]
   8388c:	f94017e0 	ldr	x0, [sp, #40]
   83890:	7100003f 	cmp	w1, #0x0
   83894:	540000ab 	b.lt	838a8 <printk+0x118>  // b.tstop
   83898:	91003c01 	add	x1, x0, #0xf
   8389c:	927df021 	and	x1, x1, #0xfffffffffffffff8
   838a0:	f90017e1 	str	x1, [sp, #40]
   838a4:	1400000d 	b	838d8 <printk+0x148>
   838a8:	11002022 	add	w2, w1, #0x8
   838ac:	b90043e2 	str	w2, [sp, #64]
   838b0:	b94043e2 	ldr	w2, [sp, #64]
   838b4:	7100005f 	cmp	w2, #0x0
   838b8:	540000ad 	b.le	838cc <printk+0x13c>
   838bc:	91003c01 	add	x1, x0, #0xf
   838c0:	927df021 	and	x1, x1, #0xfffffffffffffff8
   838c4:	f90017e1 	str	x1, [sp, #40]
   838c8:	14000004 	b	838d8 <printk+0x148>
   838cc:	f9401be2 	ldr	x2, [sp, #48]
   838d0:	93407c20 	sxtw	x0, w1
   838d4:	8b000040 	add	x0, x2, x0
   838d8:	f9400000 	ldr	x0, [x0]
   838dc:	f9022be0 	str	x0, [sp, #1104]
   838e0:	f9422be1 	ldr	x1, [sp, #1104]
   838e4:	910123e0 	add	x0, sp, #0x48
   838e8:	aa0103e2 	mov	x2, x1
   838ec:	b9445fe1 	ldr	w1, [sp, #1116]
   838f0:	97fffef9 	bl	834d4 <hex_to_string>
   838f4:	2a0003e1 	mov	w1, w0
   838f8:	b9445fe0 	ldr	w0, [sp, #1116]
   838fc:	0b010000 	add	w0, w0, w1
   83900:	b9045fe0 	str	w0, [sp, #1116]
   83904:	14000069 	b	83aa8 <printk+0x318>
   83908:	b94043e1 	ldr	w1, [sp, #64]
   8390c:	f94017e0 	ldr	x0, [sp, #40]
   83910:	7100003f 	cmp	w1, #0x0
   83914:	540000ab 	b.lt	83928 <printk+0x198>  // b.tstop
   83918:	91003c01 	add	x1, x0, #0xf
   8391c:	927df021 	and	x1, x1, #0xfffffffffffffff8
   83920:	f90017e1 	str	x1, [sp, #40]
   83924:	1400000d 	b	83958 <printk+0x1c8>
   83928:	11002022 	add	w2, w1, #0x8
   8392c:	b90043e2 	str	w2, [sp, #64]
   83930:	b94043e2 	ldr	w2, [sp, #64]
   83934:	7100005f 	cmp	w2, #0x0
   83938:	540000ad 	b.le	8394c <printk+0x1bc>
   8393c:	91003c01 	add	x1, x0, #0xf
   83940:	927df021 	and	x1, x1, #0xfffffffffffffff8
   83944:	f90017e1 	str	x1, [sp, #40]
   83948:	14000004 	b	83958 <printk+0x1c8>
   8394c:	f9401be2 	ldr	x2, [sp, #48]
   83950:	93407c20 	sxtw	x0, w1
   83954:	8b000040 	add	x0, x2, x0
   83958:	f9400000 	ldr	x0, [x0]
   8395c:	f9022be0 	str	x0, [sp, #1104]
   83960:	f9422be1 	ldr	x1, [sp, #1104]
   83964:	910123e0 	add	x0, sp, #0x48
   83968:	aa0103e2 	mov	x2, x1
   8396c:	b9445fe1 	ldr	w1, [sp, #1116]
   83970:	97ffff12 	bl	835b8 <udecimal_to_string>
   83974:	2a0003e1 	mov	w1, w0
   83978:	b9445fe0 	ldr	w0, [sp, #1116]
   8397c:	0b010000 	add	w0, w0, w1
   83980:	b9045fe0 	str	w0, [sp, #1116]
   83984:	14000049 	b	83aa8 <printk+0x318>
   83988:	b94043e1 	ldr	w1, [sp, #64]
   8398c:	f94017e0 	ldr	x0, [sp, #40]
   83990:	7100003f 	cmp	w1, #0x0
   83994:	540000ab 	b.lt	839a8 <printk+0x218>  // b.tstop
   83998:	91003c01 	add	x1, x0, #0xf
   8399c:	927df021 	and	x1, x1, #0xfffffffffffffff8
   839a0:	f90017e1 	str	x1, [sp, #40]
   839a4:	1400000d 	b	839d8 <printk+0x248>
   839a8:	11002022 	add	w2, w1, #0x8
   839ac:	b90043e2 	str	w2, [sp, #64]
   839b0:	b94043e2 	ldr	w2, [sp, #64]
   839b4:	7100005f 	cmp	w2, #0x0
   839b8:	540000ad 	b.le	839cc <printk+0x23c>
   839bc:	91003c01 	add	x1, x0, #0xf
   839c0:	927df021 	and	x1, x1, #0xfffffffffffffff8
   839c4:	f90017e1 	str	x1, [sp, #40]
   839c8:	14000004 	b	839d8 <printk+0x248>
   839cc:	f9401be2 	ldr	x2, [sp, #48]
   839d0:	93407c20 	sxtw	x0, w1
   839d4:	8b000040 	add	x0, x2, x0
   839d8:	f9400000 	ldr	x0, [x0]
   839dc:	f9022be0 	str	x0, [sp, #1104]
   839e0:	910123e0 	add	x0, sp, #0x48
   839e4:	f9422be2 	ldr	x2, [sp, #1104]
   839e8:	b9445fe1 	ldr	w1, [sp, #1116]
   839ec:	97ffff31 	bl	836b0 <decimal_to_string>
   839f0:	2a0003e1 	mov	w1, w0
   839f4:	b9445fe0 	ldr	w0, [sp, #1116]
   839f8:	0b010000 	add	w0, w0, w1
   839fc:	b9045fe0 	str	w0, [sp, #1116]
   83a00:	1400002a 	b	83aa8 <printk+0x318>
   83a04:	b94043e1 	ldr	w1, [sp, #64]
   83a08:	f94017e0 	ldr	x0, [sp, #40]
   83a0c:	7100003f 	cmp	w1, #0x0
   83a10:	540000ab 	b.lt	83a24 <printk+0x294>  // b.tstop
   83a14:	91003c01 	add	x1, x0, #0xf
   83a18:	927df021 	and	x1, x1, #0xfffffffffffffff8
   83a1c:	f90017e1 	str	x1, [sp, #40]
   83a20:	1400000d 	b	83a54 <printk+0x2c4>
   83a24:	11002022 	add	w2, w1, #0x8
   83a28:	b90043e2 	str	w2, [sp, #64]
   83a2c:	b94043e2 	ldr	w2, [sp, #64]
   83a30:	7100005f 	cmp	w2, #0x0
   83a34:	540000ad 	b.le	83a48 <printk+0x2b8>
   83a38:	91003c01 	add	x1, x0, #0xf
   83a3c:	927df021 	and	x1, x1, #0xfffffffffffffff8
   83a40:	f90017e1 	str	x1, [sp, #40]
   83a44:	14000004 	b	83a54 <printk+0x2c4>
   83a48:	f9401be2 	ldr	x2, [sp, #48]
   83a4c:	93407c20 	sxtw	x0, w1
   83a50:	8b000040 	add	x0, x2, x0
   83a54:	f9400000 	ldr	x0, [x0]
   83a58:	f90227e0 	str	x0, [sp, #1096]
   83a5c:	910123e0 	add	x0, sp, #0x48
   83a60:	f94227e2 	ldr	x2, [sp, #1096]
   83a64:	b9445fe1 	ldr	w1, [sp, #1116]
   83a68:	97fffe7d 	bl	8345c <read_string>
   83a6c:	2a0003e1 	mov	w1, w0
   83a70:	b9445fe0 	ldr	w0, [sp, #1116]
   83a74:	0b010000 	add	w0, w0, w1
   83a78:	b9045fe0 	str	w0, [sp, #1116]
   83a7c:	1400000b 	b	83aa8 <printk+0x318>
   83a80:	b9445fe0 	ldr	w0, [sp, #1116]
   83a84:	11000401 	add	w1, w0, #0x1
   83a88:	b9045fe1 	str	w1, [sp, #1116]
   83a8c:	93407c00 	sxtw	x0, w0
   83a90:	910123e1 	add	x1, sp, #0x48
   83a94:	528004a2 	mov	w2, #0x25                  	// #37
   83a98:	38206822 	strb	w2, [x1, x0]
   83a9c:	b9445be0 	ldr	w0, [sp, #1112]
   83aa0:	51000400 	sub	w0, w0, #0x1
   83aa4:	b9045be0 	str	w0, [sp, #1112]
   83aa8:	b9445be0 	ldr	w0, [sp, #1112]
   83aac:	11000400 	add	w0, w0, #0x1
   83ab0:	b9045be0 	str	w0, [sp, #1112]
   83ab4:	b9845be0 	ldrsw	x0, [sp, #1112]
   83ab8:	f9400fe1 	ldr	x1, [sp, #24]
   83abc:	8b000020 	add	x0, x1, x0
   83ac0:	39400000 	ldrb	w0, [x0]
   83ac4:	7100001f 	cmp	w0, #0x0
   83ac8:	54ffe961 	b.ne	837f4 <printk+0x64>  // b.any
   83acc:	910123e0 	add	x0, sp, #0x48
   83ad0:	b9445fe1 	ldr	w1, [sp, #1116]
   83ad4:	97ffff19 	bl	83738 <write_console>
   83ad8:	b9445fe0 	ldr	w0, [sp, #1116]
   83adc:	a9407bfd 	ldp	x29, x30, [sp]
   83ae0:	911283ff 	add	sp, sp, #0x4a0
   83ae4:	d65f03c0 	ret

0000000000083ae8 <main>:
   83ae8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   83aec:	910003fd 	mov	x29, sp
   83af0:	97fff344 	bl	80800 <interrupt_init>
   83af4:	94000263 	bl	84480 <devices_init>
   83af8:	97fff793 	bl	81944 <enable_irq>
   83afc:	52800020 	mov	w0, #0x1                   	// #1
   83b00:	39007fe0 	strb	w0, [sp, #31]
   83b04:	14000027 	b	83ba0 <main+0xb8>
   83b08:	39407fe0 	ldrb	w0, [sp, #31]
   83b0c:	71000c1f 	cmp	w0, #0x3
   83b10:	54000300 	b.eq	83b70 <main+0x88>  // b.none
   83b14:	71000c1f 	cmp	w0, #0x3
   83b18:	540003ec 	b.gt	83b94 <main+0xac>
   83b1c:	7100041f 	cmp	w0, #0x1
   83b20:	54000080 	b.eq	83b30 <main+0x48>  // b.none
   83b24:	7100081f 	cmp	w0, #0x2
   83b28:	54000120 	b.eq	83b4c <main+0x64>  // b.none
   83b2c:	1400001a 	b	83b94 <main+0xac>
   83b30:	900000a0 	adrp	x0, 97000 <core_count>
   83b34:	f9401c01 	ldr	x1, [x0, #56]
   83b38:	900000a0 	adrp	x0, 97000 <core_count>
   83b3c:	f9400800 	ldr	x0, [x0, #16]
   83b40:	f9000001 	str	x1, [x0]
   83b44:	d503209f 	sev
   83b48:	14000013 	b	83b94 <main+0xac>
   83b4c:	900000a0 	adrp	x0, 97000 <core_count>
   83b50:	f9402c01 	ldr	x1, [x0, #88]
   83b54:	d2e00020 	mov	x0, #0x1000000000000       	// #281474976710656
   83b58:	8b000021 	add	x1, x1, x0
   83b5c:	900000a0 	adrp	x0, 97000 <core_count>
   83b60:	f9401000 	ldr	x0, [x0, #32]
   83b64:	f9000001 	str	x1, [x0]
   83b68:	d503209f 	sev
   83b6c:	1400000a 	b	83b94 <main+0xac>
   83b70:	900000a0 	adrp	x0, 97000 <core_count>
   83b74:	f9402801 	ldr	x1, [x0, #80]
   83b78:	d2e00020 	mov	x0, #0x1000000000000       	// #281474976710656
   83b7c:	8b000021 	add	x1, x1, x0
   83b80:	900000a0 	adrp	x0, 97000 <core_count>
   83b84:	f9403000 	ldr	x0, [x0, #96]
   83b88:	f9000001 	str	x1, [x0]
   83b8c:	d503209f 	sev
   83b90:	d503201f 	nop
   83b94:	39407fe0 	ldrb	w0, [sp, #31]
   83b98:	11000400 	add	w0, w0, #0x1
   83b9c:	39007fe0 	strb	w0, [sp, #31]
   83ba0:	900000a0 	adrp	x0, 97000 <core_count>
   83ba4:	91000000 	add	x0, x0, #0x0
   83ba8:	39400000 	ldrb	w0, [x0]
   83bac:	39407fe1 	ldrb	w1, [sp, #31]
   83bb0:	6b00003f 	cmp	w1, w0
   83bb4:	54fffaa3 	b.cc	83b08 <main+0x20>  // b.lo, b.ul, b.last
   83bb8:	97fffda5 	bl	8324c <user_core_entry>
   83bbc:	52800000 	mov	w0, #0x0                   	// #0
   83bc0:	a8c27bfd 	ldp	x29, x30, [sp], #32
   83bc4:	d65f03c0 	ret

0000000000083bc8 <set_up_boot_strap_page_table>:
   83bc8:	d503201f 	nop
   83bcc:	d65f03c0 	ret

0000000000083bd0 <kmalloc>:
   83bd0:	d503201f 	nop
   83bd4:	d65f03c0 	ret

0000000000083bd8 <kfree>:
   83bd8:	d503201f 	nop
   83bdc:	d65f03c0 	ret

0000000000083be0 <mm_init>:
   83be0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   83be4:	910003fd 	mov	x29, sp
   83be8:	b00000a0 	adrp	x0, 98000 <spiRecvBuf>
   83bec:	91102000 	add	x0, x0, #0x408
   83bf0:	94000004 	bl	83c00 <physical_segment_init>
   83bf4:	d503201f 	nop
   83bf8:	a8c17bfd 	ldp	x29, x30, [sp], #16
   83bfc:	d65f03c0 	ret

0000000000083c00 <physical_segment_init>:
   83c00:	d10083ff 	sub	sp, sp, #0x20
   83c04:	f90007e0 	str	x0, [sp, #8]
   83c08:	900000a0 	adrp	x0, 97000 <core_count>
   83c0c:	f9401400 	ldr	x0, [x0, #40]
   83c10:	f9400001 	ldr	x1, [x0]
   83c14:	f94007e0 	ldr	x0, [sp, #8]
   83c18:	f9000001 	str	x1, [x0]
   83c1c:	900000a0 	adrp	x0, 97000 <core_count>
   83c20:	f9402000 	ldr	x0, [x0, #64]
   83c24:	f9400001 	ldr	x1, [x0]
   83c28:	f94007e0 	ldr	x0, [sp, #8]
   83c2c:	f9000401 	str	x1, [x0, #8]
   83c30:	f94007e0 	ldr	x0, [sp, #8]
   83c34:	f9400401 	ldr	x1, [x0, #8]
   83c38:	f94007e0 	ldr	x0, [sp, #8]
   83c3c:	f9400000 	ldr	x0, [x0]
   83c40:	cb000020 	sub	x0, x1, x0
   83c44:	f9000fe0 	str	x0, [sp, #24]
   83c48:	f9400fe0 	ldr	x0, [sp, #24]
   83c4c:	913ffc00 	add	x0, x0, #0xfff
   83c50:	926ba800 	and	x0, x0, #0xffffffffffe00000
   83c54:	f9000fe0 	str	x0, [sp, #24]
   83c58:	f94007e0 	ldr	x0, [sp, #8]
   83c5c:	f9400fe1 	ldr	x1, [sp, #24]
   83c60:	f9000801 	str	x1, [x0, #16]
   83c64:	900000a0 	adrp	x0, 97000 <core_count>
   83c68:	f9401800 	ldr	x0, [x0, #48]
   83c6c:	39400000 	ldrb	w0, [x0]
   83c70:	92401c01 	and	x1, x0, #0xff
   83c74:	f94007e0 	ldr	x0, [sp, #8]
   83c78:	f9001401 	str	x1, [x0, #40]
   83c7c:	f94007e0 	ldr	x0, [sp, #8]
   83c80:	f9000c1f 	str	xzr, [x0, #24]
   83c84:	f94007e0 	ldr	x0, [sp, #8]
   83c88:	f900101f 	str	xzr, [x0, #32]
   83c8c:	d503201f 	nop
   83c90:	910083ff 	add	sp, sp, #0x20
   83c94:	d65f03c0 	ret

0000000000083c98 <virtual_segment_init>:
   83c98:	d503201f 	nop
   83c9c:	d65f03c0 	ret

0000000000083ca0 <mem_malloc_test>:
   83ca0:	d503201f 	nop
   83ca4:	d65f03c0 	ret

0000000000083ca8 <mem_priority_queue>:
   83ca8:	d503201f 	nop
   83cac:	d65f03c0 	ret

0000000000083cb0 <find_next_free_page>:
   83cb0:	d10043ff 	sub	sp, sp, #0x10
   83cb4:	f90007e0 	str	x0, [sp, #8]
   83cb8:	d503201f 	nop
   83cbc:	910043ff 	add	sp, sp, #0x10
   83cc0:	d65f03c0 	ret

0000000000083cc4 <find_next_free_page_bfs>:
   83cc4:	d10043ff 	sub	sp, sp, #0x10
   83cc8:	f90007e0 	str	x0, [sp, #8]
   83ccc:	d503201f 	nop
   83cd0:	910043ff 	add	sp, sp, #0x10
   83cd4:	d65f03c0 	ret

0000000000083cd8 <allocator_init>:
   83cd8:	d503201f 	nop
   83cdc:	d65f03c0 	ret

0000000000083ce0 <timer_init>:
   83ce0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   83ce4:	910003fd 	mov	x29, sp
   83ce8:	97fffcd3 	bl	83034 <get_system_clk>
   83cec:	d342fc01 	lsr	x1, x0, #2
   83cf0:	d29eb860 	mov	x0, #0xf5c3                	// #62915
   83cf4:	f2ab8500 	movk	x0, #0x5c28, lsl #16
   83cf8:	f2d851e0 	movk	x0, #0xc28f, lsl #32
   83cfc:	f2e51ea0 	movk	x0, #0x28f5, lsl #48
   83d00:	9bc07c20 	umulh	x0, x1, x0
   83d04:	d342fc01 	lsr	x1, x0, #2
   83d08:	b00000a0 	adrp	x0, 98000 <spiRecvBuf>
   83d0c:	9118e000 	add	x0, x0, #0x638
   83d10:	f9000001 	str	x1, [x0]
   83d14:	d2968000 	mov	x0, #0xb400                	// #46080
   83d18:	f2a7e000 	movk	x0, #0x3f00, lsl #16
   83d1c:	52800fa1 	mov	w1, #0x7d                  	// #125
   83d20:	b9001c01 	str	w1, [x0, #28]
   83d24:	d2968000 	mov	x0, #0xb400                	// #46080
   83d28:	f2a7e000 	movk	x0, #0x3f00, lsl #16
   83d2c:	5289b021 	mov	w1, #0x4d81                	// #19841
   83d30:	b9000001 	str	w1, [x0]
   83d34:	d2968000 	mov	x0, #0xb400                	// #46080
   83d38:	f2a7e000 	movk	x0, #0x3f00, lsl #16
   83d3c:	52801441 	mov	w1, #0xa2                  	// #162
   83d40:	b9000801 	str	w1, [x0, #8]
   83d44:	d503201f 	nop
   83d48:	a8c17bfd 	ldp	x29, x30, [sp], #16
   83d4c:	d65f03c0 	ret

0000000000083d50 <timer_irq_handler>:
   83d50:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   83d54:	910003fd 	mov	x29, sp
   83d58:	b00000a0 	adrp	x0, 98000 <spiRecvBuf>
   83d5c:	91190000 	add	x0, x0, #0x640
   83d60:	f9400000 	ldr	x0, [x0]
   83d64:	91000401 	add	x1, x0, #0x1
   83d68:	b00000a0 	adrp	x0, 98000 <spiRecvBuf>
   83d6c:	91190000 	add	x0, x0, #0x640
   83d70:	f9000001 	str	x1, [x0]
   83d74:	b00000a0 	adrp	x0, 98000 <spiRecvBuf>
   83d78:	91190000 	add	x0, x0, #0x640
   83d7c:	f9400002 	ldr	x2, [x0]
   83d80:	d342fc41 	lsr	x1, x2, #2
   83d84:	d29eb860 	mov	x0, #0xf5c3                	// #62915
   83d88:	f2ab8500 	movk	x0, #0x5c28, lsl #16
   83d8c:	f2d851e0 	movk	x0, #0xc28f, lsl #32
   83d90:	f2e51ea0 	movk	x0, #0x28f5, lsl #48
   83d94:	9bc07c20 	umulh	x0, x1, x0
   83d98:	d342fc01 	lsr	x1, x0, #2
   83d9c:	aa0103e0 	mov	x0, x1
   83da0:	d37ff800 	lsl	x0, x0, #1
   83da4:	8b010000 	add	x0, x0, x1
   83da8:	d37df000 	lsl	x0, x0, #3
   83dac:	8b010000 	add	x0, x0, x1
   83db0:	d37ef400 	lsl	x0, x0, #2
   83db4:	cb000041 	sub	x1, x2, x0
   83db8:	f100003f 	cmp	x1, #0x0
   83dbc:	54000081 	b.ne	83dcc <timer_irq_handler+0x7c>  // b.any
   83dc0:	b0000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   83dc4:	911ee000 	add	x0, x0, #0x7b8
   83dc8:	97fffe72 	bl	83790 <printk>
   83dcc:	b00000a0 	adrp	x0, 98000 <spiRecvBuf>
   83dd0:	9118e000 	add	x0, x0, #0x638
   83dd4:	f9400000 	ldr	x0, [x0]
   83dd8:	97fffc99 	bl	8303c <set_timer_interval>
   83ddc:	d503201f 	nop
   83de0:	a8c17bfd 	ldp	x29, x30, [sp], #16
   83de4:	d65f03c0 	ret

0000000000083de8 <spi_init>:
   83de8:	d503201f 	nop
   83dec:	d65f03c0 	ret

0000000000083df0 <i2c_init>:
   83df0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   83df4:	910003fd 	mov	x29, sp
   83df8:	52800081 	mov	w1, #0x4                   	// #4
   83dfc:	52800040 	mov	w0, #0x2                   	// #2
   83e00:	940001a7 	bl	8449c <gpio_pin_func_select>
   83e04:	52800081 	mov	w1, #0x4                   	// #4
   83e08:	52800060 	mov	w0, #0x3                   	// #3
   83e0c:	940001a4 	bl	8449c <gpio_pin_func_select>
   83e10:	52800040 	mov	w0, #0x2                   	// #2
   83e14:	940001da 	bl	8457c <gpio_pin_enable>
   83e18:	52800060 	mov	w0, #0x3                   	// #3
   83e1c:	940001d8 	bl	8457c <gpio_pin_enable>
   83e20:	d2880000 	mov	x0, #0x4000                	// #16384
   83e24:	f2a7f000 	movk	x0, #0x3f80, lsl #16
   83e28:	52875301 	mov	w1, #0x3a98                	// #15000
   83e2c:	b9001401 	str	w1, [x0, #20]
   83e30:	d503201f 	nop
   83e34:	a8c17bfd 	ldp	x29, x30, [sp], #16
   83e38:	d65f03c0 	ret

0000000000083e3c <i2c_send>:
   83e3c:	d10103ff 	sub	sp, sp, #0x40
   83e40:	f9000fe0 	str	x0, [sp, #24]
   83e44:	f9000be1 	str	x1, [sp, #16]
   83e48:	f90007e2 	str	x2, [sp, #8]
   83e4c:	b9003fff 	str	wzr, [sp, #60]
   83e50:	d2880000 	mov	x0, #0x4000                	// #16384
   83e54:	f2a7f000 	movk	x0, #0x3f80, lsl #16
   83e58:	f9400fe1 	ldr	x1, [sp, #24]
   83e5c:	b9000c01 	str	w1, [x0, #12]
   83e60:	d2880000 	mov	x0, #0x4000                	// #16384
   83e64:	f2a7f000 	movk	x0, #0x3f80, lsl #16
   83e68:	52806041 	mov	w1, #0x302                 	// #770
   83e6c:	b9000401 	str	w1, [x0, #4]
   83e70:	d2880000 	mov	x0, #0x4000                	// #16384
   83e74:	f2a7f000 	movk	x0, #0x3f80, lsl #16
   83e78:	f94007e1 	ldr	x1, [sp, #8]
   83e7c:	b9000801 	str	w1, [x0, #8]
   83e80:	d2880000 	mov	x0, #0x4000                	// #16384
   83e84:	f2a7f000 	movk	x0, #0x3f80, lsl #16
   83e88:	52901001 	mov	w1, #0x8080                	// #32896
   83e8c:	b9000001 	str	w1, [x0]
   83e90:	f9001bff 	str	xzr, [sp, #48]
   83e94:	14000012 	b	83edc <i2c_send+0xa0>
   83e98:	d2880000 	mov	x0, #0x4000                	// #16384
   83e9c:	f2a7f000 	movk	x0, #0x3f80, lsl #16
   83ea0:	b9401002 	ldr	w2, [x0, #16]
   83ea4:	f9400be0 	ldr	x0, [sp, #16]
   83ea8:	91000401 	add	x1, x0, #0x1
   83eac:	f9000be1 	str	x1, [sp, #16]
   83eb0:	12001c41 	and	w1, w2, #0xff
   83eb4:	39000001 	strb	w1, [x0]
   83eb8:	f9401be0 	ldr	x0, [sp, #48]
   83ebc:	91000400 	add	x0, x0, #0x1
   83ec0:	f9001be0 	str	x0, [sp, #48]
   83ec4:	d2880000 	mov	x0, #0x4000                	// #16384
   83ec8:	f2a7f000 	movk	x0, #0x3f80, lsl #16
   83ecc:	b9400400 	ldr	w0, [x0, #4]
   83ed0:	121b0000 	and	w0, w0, #0x20
   83ed4:	7100001f 	cmp	w0, #0x0
   83ed8:	54fffe01 	b.ne	83e98 <i2c_send+0x5c>  // b.any
   83edc:	d2880000 	mov	x0, #0x4000                	// #16384
   83ee0:	f2a7f000 	movk	x0, #0x3f80, lsl #16
   83ee4:	b9400400 	ldr	w0, [x0, #4]
   83ee8:	121f0000 	and	w0, w0, #0x2
   83eec:	7100001f 	cmp	w0, #0x0
   83ef0:	54fffea0 	b.eq	83ec4 <i2c_send+0x88>  // b.none
   83ef4:	d2880000 	mov	x0, #0x4000                	// #16384
   83ef8:	f2a7f000 	movk	x0, #0x3f80, lsl #16
   83efc:	b9400400 	ldr	w0, [x0, #4]
   83f00:	b9002fe0 	str	w0, [sp, #44]
   83f04:	b9402fe0 	ldr	w0, [sp, #44]
   83f08:	12180000 	and	w0, w0, #0x100
   83f0c:	7100001f 	cmp	w0, #0x0
   83f10:	54000080 	b.eq	83f20 <i2c_send+0xe4>  // b.none
   83f14:	52800020 	mov	w0, #0x1                   	// #1
   83f18:	b9003fe0 	str	w0, [sp, #60]
   83f1c:	1400000e 	b	83f54 <i2c_send+0x118>
   83f20:	b9402fe0 	ldr	w0, [sp, #44]
   83f24:	12170000 	and	w0, w0, #0x200
   83f28:	7100001f 	cmp	w0, #0x0
   83f2c:	54000080 	b.eq	83f3c <i2c_send+0x100>  // b.none
   83f30:	52800060 	mov	w0, #0x3                   	// #3
   83f34:	b9003fe0 	str	w0, [sp, #60]
   83f38:	14000007 	b	83f54 <i2c_send+0x118>
   83f3c:	f9401be1 	ldr	x1, [sp, #48]
   83f40:	f94007e0 	ldr	x0, [sp, #8]
   83f44:	eb00003f 	cmp	x1, x0
   83f48:	54000062 	b.cs	83f54 <i2c_send+0x118>  // b.hs, b.nlast
   83f4c:	52800040 	mov	w0, #0x2                   	// #2
   83f50:	b9003fe0 	str	w0, [sp, #60]
   83f54:	b9403fe0 	ldr	w0, [sp, #60]
   83f58:	910103ff 	add	sp, sp, #0x40
   83f5c:	d65f03c0 	ret

0000000000083f60 <i2c_recv>:
   83f60:	d10103ff 	sub	sp, sp, #0x40
   83f64:	f9000fe0 	str	x0, [sp, #24]
   83f68:	f9000be1 	str	x1, [sp, #16]
   83f6c:	f90007e2 	str	x2, [sp, #8]
   83f70:	b9003fff 	str	wzr, [sp, #60]
   83f74:	d2880000 	mov	x0, #0x4000                	// #16384
   83f78:	f2a7f000 	movk	x0, #0x3f80, lsl #16
   83f7c:	f9400fe1 	ldr	x1, [sp, #24]
   83f80:	b9000c01 	str	w1, [x0, #12]
   83f84:	d2880000 	mov	x0, #0x4000                	// #16384
   83f88:	f2a7f000 	movk	x0, #0x3f80, lsl #16
   83f8c:	52806041 	mov	w1, #0x302                 	// #770
   83f90:	b9000401 	str	w1, [x0, #4]
   83f94:	d2880000 	mov	x0, #0x4000                	// #16384
   83f98:	f2a7f000 	movk	x0, #0x3f80, lsl #16
   83f9c:	f94007e1 	ldr	x1, [sp, #8]
   83fa0:	b9000801 	str	w1, [x0, #8]
   83fa4:	d2880000 	mov	x0, #0x4000                	// #16384
   83fa8:	f2a7f000 	movk	x0, #0x3f80, lsl #16
   83fac:	52901021 	mov	w1, #0x8081                	// #32897
   83fb0:	b9000001 	str	w1, [x0]
   83fb4:	f9001bff 	str	xzr, [sp, #48]
   83fb8:	14000012 	b	84000 <i2c_recv+0xa0>
   83fbc:	d2880000 	mov	x0, #0x4000                	// #16384
   83fc0:	f2a7f000 	movk	x0, #0x3f80, lsl #16
   83fc4:	b9401002 	ldr	w2, [x0, #16]
   83fc8:	f9400be0 	ldr	x0, [sp, #16]
   83fcc:	91000401 	add	x1, x0, #0x1
   83fd0:	f9000be1 	str	x1, [sp, #16]
   83fd4:	12001c41 	and	w1, w2, #0xff
   83fd8:	39000001 	strb	w1, [x0]
   83fdc:	f9401be0 	ldr	x0, [sp, #48]
   83fe0:	91000400 	add	x0, x0, #0x1
   83fe4:	f9001be0 	str	x0, [sp, #48]
   83fe8:	d2880000 	mov	x0, #0x4000                	// #16384
   83fec:	f2a7f000 	movk	x0, #0x3f80, lsl #16
   83ff0:	b9400400 	ldr	w0, [x0, #4]
   83ff4:	121b0000 	and	w0, w0, #0x20
   83ff8:	7100001f 	cmp	w0, #0x0
   83ffc:	54fffe01 	b.ne	83fbc <i2c_recv+0x5c>  // b.any
   84000:	d2880000 	mov	x0, #0x4000                	// #16384
   84004:	f2a7f000 	movk	x0, #0x3f80, lsl #16
   84008:	b9400400 	ldr	w0, [x0, #4]
   8400c:	121f0000 	and	w0, w0, #0x2
   84010:	7100001f 	cmp	w0, #0x0
   84014:	54fffea0 	b.eq	83fe8 <i2c_recv+0x88>  // b.none
   84018:	1400000c 	b	84048 <i2c_recv+0xe8>
   8401c:	d2880000 	mov	x0, #0x4000                	// #16384
   84020:	f2a7f000 	movk	x0, #0x3f80, lsl #16
   84024:	b9401002 	ldr	w2, [x0, #16]
   84028:	f9400be0 	ldr	x0, [sp, #16]
   8402c:	91000401 	add	x1, x0, #0x1
   84030:	f9000be1 	str	x1, [sp, #16]
   84034:	12001c41 	and	w1, w2, #0xff
   84038:	39000001 	strb	w1, [x0]
   8403c:	f9401be0 	ldr	x0, [sp, #48]
   84040:	91000400 	add	x0, x0, #0x1
   84044:	f9001be0 	str	x0, [sp, #48]
   84048:	f9401be1 	ldr	x1, [sp, #48]
   8404c:	f94007e0 	ldr	x0, [sp, #8]
   84050:	eb00003f 	cmp	x1, x0
   84054:	540000e2 	b.cs	84070 <i2c_recv+0x110>  // b.hs, b.nlast
   84058:	d2880000 	mov	x0, #0x4000                	// #16384
   8405c:	f2a7f000 	movk	x0, #0x3f80, lsl #16
   84060:	b9400400 	ldr	w0, [x0, #4]
   84064:	121b0000 	and	w0, w0, #0x20
   84068:	7100001f 	cmp	w0, #0x0
   8406c:	54fffd81 	b.ne	8401c <i2c_recv+0xbc>  // b.any
   84070:	d2880000 	mov	x0, #0x4000                	// #16384
   84074:	f2a7f000 	movk	x0, #0x3f80, lsl #16
   84078:	b9400400 	ldr	w0, [x0, #4]
   8407c:	b9002fe0 	str	w0, [sp, #44]
   84080:	b9402fe0 	ldr	w0, [sp, #44]
   84084:	12180000 	and	w0, w0, #0x100
   84088:	7100001f 	cmp	w0, #0x0
   8408c:	54000080 	b.eq	8409c <i2c_recv+0x13c>  // b.none
   84090:	52800020 	mov	w0, #0x1                   	// #1
   84094:	b9003fe0 	str	w0, [sp, #60]
   84098:	1400000e 	b	840d0 <i2c_recv+0x170>
   8409c:	b9402fe0 	ldr	w0, [sp, #44]
   840a0:	12170000 	and	w0, w0, #0x200
   840a4:	7100001f 	cmp	w0, #0x0
   840a8:	54000080 	b.eq	840b8 <i2c_recv+0x158>  // b.none
   840ac:	52800060 	mov	w0, #0x3                   	// #3
   840b0:	b9003fe0 	str	w0, [sp, #60]
   840b4:	14000007 	b	840d0 <i2c_recv+0x170>
   840b8:	f9401be1 	ldr	x1, [sp, #48]
   840bc:	f94007e0 	ldr	x0, [sp, #8]
   840c0:	eb00003f 	cmp	x1, x0
   840c4:	54000062 	b.cs	840d0 <i2c_recv+0x170>  // b.hs, b.nlast
   840c8:	52800040 	mov	w0, #0x2                   	// #2
   840cc:	b9003fe0 	str	w0, [sp, #60]
   840d0:	b9403fe0 	ldr	w0, [sp, #60]
   840d4:	910103ff 	add	sp, sp, #0x40
   840d8:	d65f03c0 	ret

00000000000840dc <uart_register_map_dump>:
   840dc:	d503201f 	nop
   840e0:	d65f03c0 	ret

00000000000840e4 <uart_init>:
   840e4:	d10083ff 	sub	sp, sp, #0x20
   840e8:	b9000fe0 	str	w0, [sp, #12]
   840ec:	b9001fff 	str	wzr, [sp, #28]
   840f0:	b9001bff 	str	wzr, [sp, #24]
   840f4:	b90017ff 	str	wzr, [sp, #20]
   840f8:	b9400fe0 	ldr	w0, [sp, #12]
   840fc:	7100001f 	cmp	w0, #0x0
   84100:	540000a0 	b.eq	84114 <uart_init+0x30>  // b.none
   84104:	b9400fe0 	ldr	w0, [sp, #12]
   84108:	7100041f 	cmp	w0, #0x1
   8410c:	540000e0 	b.eq	84128 <uart_init+0x44>  // b.none
   84110:	1400000b 	b	8413c <uart_init+0x58>
   84114:	52800e00 	mov	w0, #0x70                  	// #112
   84118:	b9001fe0 	str	w0, [sp, #28]
   8411c:	52806020 	mov	w0, #0x301                 	// #769
   84120:	b90017e0 	str	w0, [sp, #20]
   84124:	14000006 	b	8413c <uart_init+0x58>
   84128:	52800e00 	mov	w0, #0x70                  	// #112
   8412c:	b9001fe0 	str	w0, [sp, #28]
   84130:	52806020 	mov	w0, #0x301                 	// #769
   84134:	b90017e0 	str	w0, [sp, #20]
   84138:	d503201f 	nop
   8413c:	d2820000 	mov	x0, #0x1000                	// #4096
   84140:	f2a7e400 	movk	x0, #0x3f20, lsl #16
   84144:	b900301f 	str	wzr, [x0, #48]
   84148:	d2820000 	mov	x0, #0x1000                	// #4096
   8414c:	f2a7e400 	movk	x0, #0x3f20, lsl #16
   84150:	52800341 	mov	w1, #0x1a                  	// #26
   84154:	b9002401 	str	w1, [x0, #36]
   84158:	d2820000 	mov	x0, #0x1000                	// #4096
   8415c:	f2a7e400 	movk	x0, #0x3f20, lsl #16
   84160:	b900281f 	str	wzr, [x0, #40]
   84164:	d2820000 	mov	x0, #0x1000                	// #4096
   84168:	f2a7e400 	movk	x0, #0x3f20, lsl #16
   8416c:	b9401fe1 	ldr	w1, [sp, #28]
   84170:	b9002c01 	str	w1, [x0, #44]
   84174:	d2820000 	mov	x0, #0x1000                	// #4096
   84178:	f2a7e400 	movk	x0, #0x3f20, lsl #16
   8417c:	b900381f 	str	wzr, [x0, #56]
   84180:	d2820000 	mov	x0, #0x1000                	// #4096
   84184:	f2a7e400 	movk	x0, #0x3f20, lsl #16
   84188:	b94017e1 	ldr	w1, [sp, #20]
   8418c:	b9003001 	str	w1, [x0, #48]
   84190:	d503201f 	nop
   84194:	910083ff 	add	sp, sp, #0x20
   84198:	d65f03c0 	ret

000000000008419c <uart_send_c>:
   8419c:	d10043ff 	sub	sp, sp, #0x10
   841a0:	39003fe0 	strb	w0, [sp, #15]
   841a4:	d503201f 	nop
   841a8:	d2820000 	mov	x0, #0x1000                	// #4096
   841ac:	f2a7e400 	movk	x0, #0x3f20, lsl #16
   841b0:	b9401800 	ldr	w0, [x0, #24]
   841b4:	121b0000 	and	w0, w0, #0x20
   841b8:	7100001f 	cmp	w0, #0x0
   841bc:	54ffff61 	b.ne	841a8 <uart_send_c+0xc>  // b.any
   841c0:	d2820000 	mov	x0, #0x1000                	// #4096
   841c4:	f2a7e400 	movk	x0, #0x3f20, lsl #16
   841c8:	39403fe1 	ldrb	w1, [sp, #15]
   841cc:	b9000001 	str	w1, [x0]
   841d0:	d503201f 	nop
   841d4:	910043ff 	add	sp, sp, #0x10
   841d8:	d65f03c0 	ret

00000000000841dc <uart_irq_handler>:
   841dc:	d503201f 	nop
   841e0:	d65f03c0 	ret

00000000000841e4 <uart_send_data>:
   841e4:	d10043ff 	sub	sp, sp, #0x10
   841e8:	39003fe0 	strb	w0, [sp, #15]
   841ec:	d503201f 	nop
   841f0:	d2820000 	mov	x0, #0x1000                	// #4096
   841f4:	f2a7e400 	movk	x0, #0x3f20, lsl #16
   841f8:	b9401800 	ldr	w0, [x0, #24]
   841fc:	121b0000 	and	w0, w0, #0x20
   84200:	7100001f 	cmp	w0, #0x0
   84204:	54ffff61 	b.ne	841f0 <uart_send_data+0xc>  // b.any
   84208:	d2820000 	mov	x0, #0x1000                	// #4096
   8420c:	f2a7e400 	movk	x0, #0x3f20, lsl #16
   84210:	39403fe1 	ldrb	w1, [sp, #15]
   84214:	b9000001 	str	w1, [x0]
   84218:	d503201f 	nop
   8421c:	910043ff 	add	sp, sp, #0x10
   84220:	d65f03c0 	ret

0000000000084224 <uart_read_data>:
   84224:	d503201f 	nop
   84228:	d2820000 	mov	x0, #0x1000                	// #4096
   8422c:	f2a7e400 	movk	x0, #0x3f20, lsl #16
   84230:	b9401800 	ldr	w0, [x0, #24]
   84234:	121c0000 	and	w0, w0, #0x10
   84238:	7100001f 	cmp	w0, #0x0
   8423c:	54ffff61 	b.ne	84228 <uart_read_data+0x4>  // b.any
   84240:	d2820000 	mov	x0, #0x1000                	// #4096
   84244:	f2a7e400 	movk	x0, #0x3f20, lsl #16
   84248:	b9400000 	ldr	w0, [x0]
   8424c:	12001c00 	and	w0, w0, #0xff
   84250:	d65f03c0 	ret

0000000000084254 <uart_write_string>:
   84254:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
   84258:	910003fd 	mov	x29, sp
   8425c:	f9000fe0 	str	x0, [sp, #24]
   84260:	b9002fff 	str	wzr, [sp, #44]
   84264:	14000009 	b	84288 <uart_write_string+0x34>
   84268:	b9802fe0 	ldrsw	x0, [sp, #44]
   8426c:	f9400fe1 	ldr	x1, [sp, #24]
   84270:	8b000020 	add	x0, x1, x0
   84274:	39400000 	ldrb	w0, [x0]
   84278:	97ffffdb 	bl	841e4 <uart_send_data>
   8427c:	b9402fe0 	ldr	w0, [sp, #44]
   84280:	11000400 	add	w0, w0, #0x1
   84284:	b9002fe0 	str	w0, [sp, #44]
   84288:	b9802fe0 	ldrsw	x0, [sp, #44]
   8428c:	f9400fe1 	ldr	x1, [sp, #24]
   84290:	8b000020 	add	x0, x1, x0
   84294:	39400000 	ldrb	w0, [x0]
   84298:	7100001f 	cmp	w0, #0x0
   8429c:	54fffe61 	b.ne	84268 <uart_write_string+0x14>  // b.any
   842a0:	d503201f 	nop
   842a4:	d503201f 	nop
   842a8:	a8c37bfd 	ldp	x29, x30, [sp], #48
   842ac:	d65f03c0 	ret

00000000000842b0 <dump_uart>:
   842b0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   842b4:	910003fd 	mov	x29, sp
   842b8:	90000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   842bc:	911f0000 	add	x0, x0, #0x7c0
   842c0:	97fffd34 	bl	83790 <printk>
   842c4:	d2820301 	mov	x1, #0x1018                	// #4120
   842c8:	f2a7e401 	movk	x1, #0x3f20, lsl #16
   842cc:	90000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   842d0:	911f8000 	add	x0, x0, #0x7e0
   842d4:	97fffd2f 	bl	83790 <printk>
   842d8:	d2820481 	mov	x1, #0x1024                	// #4132
   842dc:	f2a7e401 	movk	x1, #0x3f20, lsl #16
   842e0:	90000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   842e4:	911fc000 	add	x0, x0, #0x7f0
   842e8:	97fffd2a 	bl	83790 <printk>
   842ec:	d2820501 	mov	x1, #0x1028                	// #4136
   842f0:	f2a7e401 	movk	x1, #0x3f20, lsl #16
   842f4:	90000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   842f8:	91200000 	add	x0, x0, #0x800
   842fc:	97fffd25 	bl	83790 <printk>
   84300:	d2820501 	mov	x1, #0x1028                	// #4136
   84304:	f2a7e401 	movk	x1, #0x3f20, lsl #16
   84308:	90000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   8430c:	91204000 	add	x0, x0, #0x810
   84310:	97fffd20 	bl	83790 <printk>
   84314:	d28207c1 	mov	x1, #0x103e                	// #4158
   84318:	f2a7e401 	movk	x1, #0x3f20, lsl #16
   8431c:	90000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   84320:	91208000 	add	x0, x0, #0x820
   84324:	97fffd1b 	bl	83790 <printk>
   84328:	d2820701 	mov	x1, #0x1038                	// #4152
   8432c:	f2a7e401 	movk	x1, #0x3f20, lsl #16
   84330:	90000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   84334:	9120c000 	add	x0, x0, #0x830
   84338:	97fffd16 	bl	83790 <printk>
   8433c:	d2820601 	mov	x1, #0x1030                	// #4144
   84340:	f2a7e401 	movk	x1, #0x3f20, lsl #16
   84344:	90000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   84348:	91210000 	add	x0, x0, #0x840
   8434c:	97fffd11 	bl	83790 <printk>
   84350:	90000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   84354:	91214000 	add	x0, x0, #0x850
   84358:	97fffd0e 	bl	83790 <printk>
   8435c:	d503201f 	nop
   84360:	a8c17bfd 	ldp	x29, x30, [sp], #16
   84364:	d65f03c0 	ret

0000000000084368 <dump_timer>:
   84368:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   8436c:	910003fd 	mov	x29, sp
   84370:	90000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   84374:	9121c000 	add	x0, x0, #0x870
   84378:	97fffd06 	bl	83790 <printk>
   8437c:	d2968001 	mov	x1, #0xb400                	// #46080
   84380:	f2a7e001 	movk	x1, #0x3f00, lsl #16
   84384:	90000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   84388:	91224000 	add	x0, x0, #0x890
   8438c:	97fffd01 	bl	83790 <printk>
   84390:	d2968101 	mov	x1, #0xb408                	// #46088
   84394:	f2a7e001 	movk	x1, #0x3f00, lsl #16
   84398:	90000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   8439c:	9122a000 	add	x0, x0, #0x8a8
   843a0:	97fffcfc 	bl	83790 <printk>
   843a4:	d2968181 	mov	x1, #0xb40c                	// #46092
   843a8:	f2a7e001 	movk	x1, #0x3f00, lsl #16
   843ac:	90000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   843b0:	91230000 	add	x0, x0, #0x8c0
   843b4:	97fffcf7 	bl	83790 <printk>
   843b8:	d2968281 	mov	x1, #0xb414                	// #46100
   843bc:	f2a7e001 	movk	x1, #0x3f00, lsl #16
   843c0:	90000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   843c4:	91236000 	add	x0, x0, #0x8d8
   843c8:	97fffcf2 	bl	83790 <printk>
   843cc:	d2968381 	mov	x1, #0xb41c                	// #46108
   843d0:	f2a7e001 	movk	x1, #0x3f00, lsl #16
   843d4:	90000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   843d8:	9123c000 	add	x0, x0, #0x8f0
   843dc:	97fffced 	bl	83790 <printk>
   843e0:	90000000 	adrp	x0, 84000 <i2c_recv+0xa0>
   843e4:	91214000 	add	x0, x0, #0x850
   843e8:	97fffcea 	bl	83790 <printk>
   843ec:	d503201f 	nop
   843f0:	a8c17bfd 	ldp	x29, x30, [sp], #16
   843f4:	d65f03c0 	ret

00000000000843f8 <register_dump>:
   843f8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   843fc:	910003fd 	mov	x29, sp
   84400:	b9001fe0 	str	w0, [sp, #28]
   84404:	b9401fe0 	ldr	w0, [sp, #28]
   84408:	7100101f 	cmp	w0, #0x4
   8440c:	54000260 	b.eq	84458 <register_dump+0x60>  // b.none
   84410:	b9401fe0 	ldr	w0, [sp, #28]
   84414:	7100101f 	cmp	w0, #0x4
   84418:	54000248 	b.hi	84460 <register_dump+0x68>  // b.pmore
   8441c:	b9401fe0 	ldr	w0, [sp, #28]
   84420:	7100081f 	cmp	w0, #0x2
   84424:	54000220 	b.eq	84468 <register_dump+0x70>  // b.none
   84428:	b9401fe0 	ldr	w0, [sp, #28]
   8442c:	7100081f 	cmp	w0, #0x2
   84430:	54000188 	b.hi	84460 <register_dump+0x68>  // b.pmore
   84434:	b9401fe0 	ldr	w0, [sp, #28]
   84438:	7100001f 	cmp	w0, #0x0
   8443c:	540000a0 	b.eq	84450 <register_dump+0x58>  // b.none
   84440:	b9401fe0 	ldr	w0, [sp, #28]
   84444:	7100041f 	cmp	w0, #0x1
   84448:	54000140 	b.eq	84470 <register_dump+0x78>  // b.none
   8444c:	14000005 	b	84460 <register_dump+0x68>
   84450:	97ffff98 	bl	842b0 <dump_uart>
   84454:	14000008 	b	84474 <register_dump+0x7c>
   84458:	97ffffc4 	bl	84368 <dump_timer>
   8445c:	14000006 	b	84474 <register_dump+0x7c>
   84460:	d503201f 	nop
   84464:	14000004 	b	84474 <register_dump+0x7c>
   84468:	d503201f 	nop
   8446c:	14000002 	b	84474 <register_dump+0x7c>
   84470:	d503201f 	nop
   84474:	d503201f 	nop
   84478:	a8c27bfd 	ldp	x29, x30, [sp], #32
   8447c:	d65f03c0 	ret

0000000000084480 <devices_init>:
   84480:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   84484:	910003fd 	mov	x29, sp
   84488:	52800000 	mov	w0, #0x0                   	// #0
   8448c:	97ffff16 	bl	840e4 <uart_init>
   84490:	d503201f 	nop
   84494:	a8c17bfd 	ldp	x29, x30, [sp], #16
   84498:	d65f03c0 	ret

000000000008449c <gpio_pin_func_select>:
   8449c:	d10083ff 	sub	sp, sp, #0x20
   844a0:	39003fe0 	strb	w0, [sp, #15]
   844a4:	b9000be1 	str	w1, [sp, #8]
   844a8:	39403fe1 	ldrb	w1, [sp, #15]
   844ac:	2a0103e0 	mov	w0, w1
   844b0:	531f7800 	lsl	w0, w0, #1
   844b4:	0b010001 	add	w1, w0, w1
   844b8:	52911120 	mov	w0, #0x8889                	// #34953
   844bc:	72b11100 	movk	w0, #0x8888, lsl #16
   844c0:	9b207c20 	smull	x0, w1, w0
   844c4:	d360fc00 	lsr	x0, x0, #32
   844c8:	0b000020 	add	w0, w1, w0
   844cc:	13047c02 	asr	w2, w0, #4
   844d0:	131f7c20 	asr	w0, w1, #31
   844d4:	4b000042 	sub	w2, w2, w0
   844d8:	2a0203e0 	mov	w0, w2
   844dc:	531c6c00 	lsl	w0, w0, #4
   844e0:	4b020000 	sub	w0, w0, w2
   844e4:	531f7800 	lsl	w0, w0, #1
   844e8:	4b000022 	sub	w2, w1, w0
   844ec:	2a0203e0 	mov	w0, w2
   844f0:	39007fe0 	strb	w0, [sp, #31]
   844f4:	39403fe1 	ldrb	w1, [sp, #15]
   844f8:	529999a0 	mov	w0, #0xcccd                	// #52429
   844fc:	72b99980 	movk	w0, #0xcccc, lsl #16
   84500:	9ba07c20 	umull	x0, w1, w0
   84504:	d360fc00 	lsr	x0, x0, #32
   84508:	53037c00 	lsr	w0, w0, #3
   8450c:	39007be0 	strb	w0, [sp, #30]
   84510:	d2a7e400 	mov	x0, #0x3f200000            	// #1059061760
   84514:	39407be1 	ldrb	w1, [sp, #30]
   84518:	93407c21 	sxtw	x1, w1
   8451c:	b8617800 	ldr	w0, [x0, x1, lsl #2]
   84520:	b9001be0 	str	w0, [sp, #24]
   84524:	39407fe0 	ldrb	w0, [sp, #31]
   84528:	528000e1 	mov	w1, #0x7                   	// #7
   8452c:	1ac02020 	lsl	w0, w1, w0
   84530:	2a2003e0 	mvn	w0, w0
   84534:	2a0003e1 	mov	w1, w0
   84538:	b9401be0 	ldr	w0, [sp, #24]
   8453c:	0a010000 	and	w0, w0, w1
   84540:	b9001be0 	str	w0, [sp, #24]
   84544:	39407fe0 	ldrb	w0, [sp, #31]
   84548:	b9400be1 	ldr	w1, [sp, #8]
   8454c:	1ac02020 	lsl	w0, w1, w0
   84550:	b9401be1 	ldr	w1, [sp, #24]
   84554:	2a000020 	orr	w0, w1, w0
   84558:	b9001be0 	str	w0, [sp, #24]
   8455c:	d2a7e400 	mov	x0, #0x3f200000            	// #1059061760
   84560:	39407be1 	ldrb	w1, [sp, #30]
   84564:	93407c21 	sxtw	x1, w1
   84568:	b9401be2 	ldr	w2, [sp, #24]
   8456c:	b8217802 	str	w2, [x0, x1, lsl #2]
   84570:	d503201f 	nop
   84574:	910083ff 	add	sp, sp, #0x20
   84578:	d65f03c0 	ret

000000000008457c <gpio_pin_enable>:
   8457c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   84580:	910003fd 	mov	x29, sp
   84584:	39007fe0 	strb	w0, [sp, #31]
   84588:	d2a7e400 	mov	x0, #0x3f200000            	// #1059061760
   8458c:	b900941f 	str	wzr, [x0, #148]
   84590:	d28012c0 	mov	x0, #0x96                  	// #150
   84594:	97fff515 	bl	819e8 <delay>
   84598:	39407fe0 	ldrb	w0, [sp, #31]
   8459c:	12001000 	and	w0, w0, #0x1f
   845a0:	52800021 	mov	w1, #0x1                   	// #1
   845a4:	1ac02022 	lsl	w2, w1, w0
   845a8:	d2a7e401 	mov	x1, #0x3f200000            	// #1059061760
   845ac:	39407fe0 	ldrb	w0, [sp, #31]
   845b0:	53057c00 	lsr	w0, w0, #5
   845b4:	12001c00 	and	w0, w0, #0xff
   845b8:	93407c00 	sxtw	x0, w0
   845bc:	91009000 	add	x0, x0, #0x24
   845c0:	d37ef400 	lsl	x0, x0, #2
   845c4:	8b000020 	add	x0, x1, x0
   845c8:	b9000802 	str	w2, [x0, #8]
   845cc:	d28012c0 	mov	x0, #0x96                  	// #150
   845d0:	97fff506 	bl	819e8 <delay>
   845d4:	d2a7e400 	mov	x0, #0x3f200000            	// #1059061760
   845d8:	b900941f 	str	wzr, [x0, #148]
   845dc:	d2a7e401 	mov	x1, #0x3f200000            	// #1059061760
   845e0:	39407fe0 	ldrb	w0, [sp, #31]
   845e4:	53057c00 	lsr	w0, w0, #5
   845e8:	12001c00 	and	w0, w0, #0xff
   845ec:	93407c00 	sxtw	x0, w0
   845f0:	91009000 	add	x0, x0, #0x24
   845f4:	d37ef400 	lsl	x0, x0, #2
   845f8:	8b000020 	add	x0, x1, x0
   845fc:	b900081f 	str	wzr, [x0, #8]
   84600:	d503201f 	nop
   84604:	a8c27bfd 	ldp	x29, x30, [sp], #32
   84608:	d65f03c0 	ret

000000000008460c <gpio_set>:
   8460c:	d10083ff 	sub	sp, sp, #0x20
   84610:	39003fe0 	strb	w0, [sp, #15]
   84614:	39403fe0 	ldrb	w0, [sp, #15]
   84618:	52800021 	mov	w1, #0x1                   	// #1
   8461c:	1ac02020 	lsl	w0, w1, w0
   84620:	b9001fe0 	str	w0, [sp, #28]
   84624:	d2a7e400 	mov	x0, #0x3f200000            	// #1059061760
   84628:	b9401fe1 	ldr	w1, [sp, #28]
   8462c:	b9001c01 	str	w1, [x0, #28]
   84630:	d503201f 	nop
   84634:	910083ff 	add	sp, sp, #0x20
   84638:	d65f03c0 	ret

000000000008463c <gpio_clear>:
   8463c:	d10083ff 	sub	sp, sp, #0x20
   84640:	39003fe0 	strb	w0, [sp, #15]
   84644:	39403fe0 	ldrb	w0, [sp, #15]
   84648:	52800021 	mov	w1, #0x1                   	// #1
   8464c:	1ac02020 	lsl	w0, w1, w0
   84650:	b9001fe0 	str	w0, [sp, #28]
   84654:	d2a7e400 	mov	x0, #0x3f200000            	// #1059061760
   84658:	b9401fe1 	ldr	w1, [sp, #28]
   8465c:	b9002801 	str	w1, [x0, #40]
   84660:	d503201f 	nop
   84664:	910083ff 	add	sp, sp, #0x20
   84668:	d65f03c0 	ret

000000000008466c <entry>:
   8466c:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
   84670:	910003fd 	mov	x29, sp
   84674:	52800020 	mov	w0, #0x1                   	// #1
   84678:	b9003fe0 	str	w0, [sp, #60]
   8467c:	aa0003e0 	mov	x0, x0
   84680:	f9001be0 	str	x0, [sp, #48]
   84684:	aa0103e0 	mov	x0, x1
   84688:	f90017e0 	str	x0, [sp, #40]
   8468c:	a901ffff 	stp	xzr, xzr, [sp, #24]
   84690:	f9401be0 	ldr	x0, [sp, #48]
   84694:	12001c00 	and	w0, w0, #0xff
   84698:	390063e0 	strb	w0, [sp, #24]
   8469c:	f94017e0 	ldr	x0, [sp, #40]
   846a0:	12001c00 	and	w0, w0, #0xff
   846a4:	390067e0 	strb	w0, [sp, #25]
   846a8:	910063e0 	add	x0, sp, #0x18
   846ac:	aa0003e1 	mov	x1, x0
   846b0:	b9403fe0 	ldr	w0, [sp, #60]
   846b4:	97fffd0d 	bl	83ae8 <main>
   846b8:	a8c47bfd 	ldp	x29, x30, [sp], #64
   846bc:	d65f03c0 	ret

Disassembly of section .rodata:

00000000000846c0 <.rodata>:
   846c0:	20202020 	.inst	0x20202020 ; undefined
   846c4:	6e6f6320 	rsubhn2	v0.8h, v25.4s, v15.4s
   846c8:	69746964 	ldpsw	x4, x26, [x11, #-96]
   846cc:	66206e6f 	.inst	0x66206e6f ; undefined
   846d0:	736c6961 	.inst	0x736c6961 ; undefined
   846d4:	25203a20 	.inst	0x25203a20 ; undefined
   846d8:	200a2073 	.inst	0x200a2073 ; undefined
   846dc:	20202020 	.inst	0x20202020 ; undefined
   846e0:	5f676264 	.inst	0x5f676264 ; undefined
   846e4:	2067736d 	.inst	0x2067736d ; undefined
   846e8:	7325203a 	.inst	0x7325203a ; undefined
   846ec:	20200a20 	.inst	0x20200a20 ; undefined
   846f0:	66202020 	.inst	0x66202020 ; undefined
   846f4:	20656c69 	.inst	0x20656c69 ; undefined
   846f8:	7325203a 	.inst	0x7325203a ; undefined
   846fc:	20200a20 	.inst	0x20200a20 ; undefined
   84700:	6c202020 	stnp	d0, d8, [x1, #-512]
   84704:	20656e69 	.inst	0x20656e69 ; undefined
   84708:	6425203a 	fmul	z26.h, z1.h, z5.h[0]
   8470c:	00000a20 	udf	#2592
   84710:	78257830 	strh	w16, [x1, x5, lsl #1]
   84714:	00000a20 	udf	#2592
   84718:	20202020 	.inst	0x20202020 ; undefined
   8471c:	78257830 	strh	w16, [x1, x5, lsl #1]
   84720:	78302020 	ldeorh	w16, w0, [x1]
   84724:	000a7825 	.inst	0x000a7825 ; undefined
   84728:	6c6c6548 	ldnp	d8, d25, [x10, #-320]
   8472c:	6f57206f 	umlal2	v15.4s, v3.8h, v7.h[1]
   84730:	20646c72 	.inst	0x20646c72 ; undefined
   84734:	65726f63 	fnmls	z3.h, p3/m, z27.h, z18.h
   84738:	000a3220 	.inst	0x000a3220 ; undefined
   8473c:	00000000 	udf	#0
   84740:	6c6c6548 	ldnp	d8, d25, [x10, #-320]
   84744:	6f57206f 	umlal2	v15.4s, v3.8h, v7.h[1]
   84748:	20646c72 	.inst	0x20646c72 ; undefined
   8474c:	65726f63 	fnmls	z3.h, p3/m, z27.h, z18.h
   84750:	000a3320 	.inst	0x000a3320 ; undefined
   84754:	00000000 	udf	#0
   84758:	6c6c6548 	ldnp	d8, d25, [x10, #-320]
   8475c:	7266206f 	.inst	0x7266206f ; undefined
   84760:	75206d6f 	.inst	0x75206d6f ; undefined
   84764:	20726573 	.inst	0x20726573 ; undefined
   84768:	65726f63 	fnmls	z3.h, p3/m, z27.h, z18.h
   8476c:	0000000a 	udf	#10
   84770:	6c6c6548 	ldnp	d8, d25, [x10, #-320]
   84774:	6f57206f 	umlal2	v15.4s, v3.8h, v7.h[1]
   84778:	20646c72 	.inst	0x20646c72 ; undefined
   8477c:	6d6d6f63 	ldp	d3, d27, [x27, #-304]
   84780:	63696e75 	.inst	0x63696e75 ; undefined
   84784:	6f697461 	uqshl	v1.2d, v3.2d, #41
   84788:	6f63206e 	umlal2	v14.4s, v3.8h, v3.h[2]
   8478c:	31206572 	adds	w18, w11, #0x819
   84790:	0000000a 	udf	#10
   84794:	00000000 	udf	#0
   84798:	33323130 	.inst	0x33323130 ; undefined
   8479c:	37363534 	tbnz	w20, #6, 80e40 <interrupt_init+0x640>
   847a0:	42413938 	.inst	0x42413938 ; undefined
   847a4:	46454443 	.inst	0x46454443 ; undefined
   847a8:	33323130 	.inst	0x33323130 ; undefined
   847ac:	37363534 	tbnz	w20, #6, 80e50 <interrupt_init+0x650>
   847b0:	00003938 	udf	#14648
   847b4:	00000000 	udf	#0
   847b8:	656d6954 	fnmls	z20.h, p2/m, z10.h, z13.h
   847bc:	00000a72 	udf	#2674
   847c0:	2d2d2d0a 	stp	s10, s11, [x8, #-152]
   847c4:	2d2d2d2d 	stp	s13, s11, [x9, #-152]
   847c8:	52415520 	.inst	0x52415520 ; undefined
   847cc:	45522054 	.inst	0x45522054 ; undefined
   847d0:	2d205347 	stp	s7, s20, [x26, #-256]
   847d4:	2d2d2d2d 	stp	s13, s11, [x9, #-152]
   847d8:	000a2d2d 	.inst	0x000a2d2d ; undefined
   847dc:	00000000 	udf	#0
   847e0:	46202d2d 	.inst	0x46202d2d ; undefined
   847e4:	20202052 	.inst	0x20202052 ; undefined
   847e8:	7830203a 	ldeorh	w16, w26, [x1]
   847ec:	000a7825 	.inst	0x000a7825 ; undefined
   847f0:	4c202d2d 	.inst	0x4c202d2d ; undefined
   847f4:	20445242 	.inst	0x20445242 ; undefined
   847f8:	7830203a 	ldeorh	w16, w26, [x1]
   847fc:	000a7825 	.inst	0x000a7825 ; undefined
   84800:	46202d2d 	.inst	0x46202d2d ; undefined
   84804:	20445242 	.inst	0x20445242 ; undefined
   84808:	7830203a 	ldeorh	w16, w26, [x1]
   8480c:	000a7825 	.inst	0x000a7825 ; undefined
   84810:	4c202d2d 	.inst	0x4c202d2d ; undefined
   84814:	20445243 	.inst	0x20445243 ; undefined
   84818:	7830203a 	ldeorh	w16, w26, [x1]
   8481c:	000a7825 	.inst	0x000a7825 ; undefined
   84820:	49202d2d 	.inst	0x49202d2d ; undefined
   84824:	20205243 	.inst	0x20205243 ; undefined
   84828:	7830203a 	ldeorh	w16, w26, [x1]
   8482c:	000a7825 	.inst	0x000a7825 ; undefined
   84830:	49202d2d 	.inst	0x49202d2d ; undefined
   84834:	2043534d 	.inst	0x2043534d ; undefined
   84838:	7830203a 	ldeorh	w16, w26, [x1]
   8483c:	000a7825 	.inst	0x000a7825 ; undefined
   84840:	43202d2d 	.inst	0x43202d2d ; undefined
   84844:	20202052 	.inst	0x20202052 ; undefined
   84848:	7830203a 	ldeorh	w16, w26, [x1]
   8484c:	000a7825 	.inst	0x000a7825 ; undefined
   84850:	2d2d2d2d 	stp	s13, s11, [x9, #-152]
   84854:	2d2d2d2d 	stp	s13, s11, [x9, #-152]
   84858:	2d2d2d2d 	stp	s13, s11, [x9, #-152]
   8485c:	2d2d2d2d 	stp	s13, s11, [x9, #-152]
   84860:	2d2d2d2d 	stp	s13, s11, [x9, #-152]
   84864:	2d2d2d2d 	stp	s13, s11, [x9, #-152]
   84868:	00000a2d 	udf	#2605
   8486c:	00000000 	udf	#0
   84870:	2d2d2d0a 	stp	s10, s11, [x8, #-152]
   84874:	2d2d2d2d 	stp	s13, s11, [x9, #-152]
   84878:	6d695420 	ldp	d0, d21, [x1, #-368]
   8487c:	52207265 	eor	w5, w19, #0x1fffffff
   84880:	20534745 	.inst	0x20534745 ; undefined
   84884:	2d2d2d2d 	stp	s13, s11, [x9, #-152]
   84888:	0a2d2d2d 	bic	w13, w9, w13, lsl #11
   8488c:	00000000 	udf	#0
   84890:	4c202d2d 	.inst	0x4c202d2d ; undefined
   84894:	2044414f 	.inst	0x2044414f ; undefined
   84898:	203a2020 	.inst	0x203a2020 ; undefined
   8489c:	78257830 	strh	w16, [x1, x5, lsl #1]
   848a0:	0000000a 	udf	#10
   848a4:	00000000 	udf	#0
   848a8:	43202d2d 	.inst	0x43202d2d ; undefined
   848ac:	20204c54 	.inst	0x20204c54 ; undefined
   848b0:	203a2020 	.inst	0x203a2020 ; undefined
   848b4:	78257830 	strh	w16, [x1, x5, lsl #1]
   848b8:	0000000a 	udf	#10
   848bc:	00000000 	udf	#0
   848c0:	41202d2d 	.inst	0x41202d2d ; undefined
   848c4:	20204b43 	.inst	0x20204b43 ; undefined
   848c8:	203a2020 	.inst	0x203a2020 ; undefined
   848cc:	78257830 	strh	w16, [x1, x5, lsl #1]
   848d0:	0000000a 	udf	#10
   848d4:	00000000 	udf	#0
   848d8:	4d202d2d 	st4	{v13.b-v16.b}[11], [x9]
   848dc:	52494b53 	.inst	0x52494b53 ; undefined
   848e0:	203a2051 	.inst	0x203a2051 ; undefined
   848e4:	78257830 	strh	w16, [x1, x5, lsl #1]
   848e8:	0000000a 	udf	#10
   848ec:	00000000 	udf	#0
   848f0:	50202d2d 	adr	x13, c4e96 <__kernel_end_addr+0x2c84e>
   848f4:	49444552 	.inst	0x49444552 ; undefined
   848f8:	203a2056 	.inst	0x203a2056 ; undefined
   848fc:	78257830 	strh	w16, [x1, x5, lsl #1]
   84900:	Address 0x0000000000084900 is out of bounds.


Disassembly of section .eh_frame:

0000000000084908 <.eh_frame>:
   84908:	00000010 	udf	#16
   8490c:	00000000 	udf	#0
   84910:	00527a01 	.inst	0x00527a01 ; undefined
   84914:	011e7804 	.inst	0x011e7804 ; undefined
   84918:	001f0c1b 	.inst	0x001f0c1b ; undefined
   8491c:	0000001c 	udf	#28
   84920:	00000018 	udf	#24
   84924:	ffffe720 	.inst	0xffffe720 ; undefined
   84928:	00000040 	udf	#64
   8492c:	300e4100 	adr	x0, a114d <__kernel_end_addr+0x8b05>
   84930:	059e069d 	mov	z29.s, p14/z, #52
   84934:	0eddde4e 	.inst	0x0eddde4e ; undefined
   84938:	00000000 	udf	#0
   8493c:	00000020 	udf	#32
   84940:	00000038 	udf	#56
   84944:	ffffe740 	.inst	0xffffe740 ; undefined
   84948:	00000198 	udf	#408
   8494c:	600e4100 	.inst	0x600e4100 ; undefined
   84950:	0b9e0c9d 	add	w29, w4, w30, asr #3
   84954:	ddde6402 	.inst	0xddde6402 ; undefined
   84958:	0000000e 	udf	#14
   8495c:	00000000 	udf	#0
   84960:	00000014 	udf	#20
   84964:	0000005c 	udf	#92
   84968:	ffffe8b4 	.inst	0xffffe8b4 ; undefined
   8496c:	00000018 	udf	#24
   84970:	100e4100 	adr	x0, a1190 <__kernel_end_addr+0x8b48>
   84974:	019e029d 	.inst	0x019e029d ; undefined
   84978:	00000014 	udf	#20
   8497c:	00000074 	udf	#116
   84980:	ffffe8b4 	.inst	0xffffe8b4 ; undefined
   84984:	00000018 	udf	#24
   84988:	100e4100 	adr	x0, a11a8 <__kernel_end_addr+0x8b60>
   8498c:	019e029d 	.inst	0x019e029d ; undefined
   84990:	00000014 	udf	#20
   84994:	0000008c 	udf	#140
   84998:	ffffe8b4 	.inst	0xffffe8b4 ; undefined
   8499c:	00000018 	udf	#24
   849a0:	100e4100 	adr	x0, a11c0 <__kernel_end_addr+0x8b78>
   849a4:	019e029d 	.inst	0x019e029d ; undefined
   849a8:	00000014 	udf	#20
   849ac:	000000a4 	udf	#164
   849b0:	ffffe8b4 	.inst	0xffffe8b4 ; undefined
   849b4:	0000004c 	udf	#76
   849b8:	100e4100 	adr	x0, a11d8 <__kernel_end_addr+0x8b90>
   849bc:	019e029d 	.inst	0x019e029d ; undefined
   849c0:	00000010 	udf	#16
   849c4:	000000bc 	udf	#188
   849c8:	ffffe8e8 	.inst	0xffffe8e8 ; undefined
   849cc:	00000048 	udf	#72
   849d0:	00000000 	udf	#0
   849d4:	0000001c 	udf	#28
   849d8:	000000d0 	udf	#208
   849dc:	ffffe91c 	.inst	0xffffe91c ; undefined
   849e0:	00000068 	udf	#104
   849e4:	200e4100 	.inst	0x200e4100 ; undefined
   849e8:	039e049d 	.inst	0x039e049d ; undefined
   849ec:	0eddde58 	.inst	0x0eddde58 ; undefined
   849f0:	00000000 	udf	#0
   849f4:	00000020 	udf	#32
   849f8:	000000f0 	udf	#240
   849fc:	ffffe964 	.inst	0xffffe964 ; undefined
   84a00:	00000040 	udf	#64
   84a04:	200e4100 	.inst	0x200e4100 ; undefined
   84a08:	039e049d 	.inst	0x039e049d ; undefined
   84a0c:	0eddde4e 	.inst	0x0eddde4e ; undefined
	...
   84a18:	0000001c 	udf	#28
   84a1c:	00000114 	udf	#276
   84a20:	ffffe980 	.inst	0xffffe980 ; undefined
   84a24:	000000bc 	udf	#188
   84a28:	200e4100 	.inst	0x200e4100 ; undefined
   84a2c:	039e049d 	.inst	0x039e049d ; undefined
   84a30:	0eddde6d 	.inst	0x0eddde6d ; undefined
   84a34:	00000000 	udf	#0
   84a38:	00000014 	udf	#20
   84a3c:	00000134 	udf	#308
   84a40:	ffffea1c 	.inst	0xffffea1c ; undefined
   84a44:	00000078 	udf	#120
   84a48:	300e4100 	adr	x0, a1269 <__kernel_end_addr+0x8c21>
   84a4c:	00000e5c 	udf	#3676
   84a50:	00000014 	udf	#20
   84a54:	0000014c 	udf	#332
   84a58:	ffffea7c 	.inst	0xffffea7c ; undefined
   84a5c:	000000e4 	udf	#228
   84a60:	600e4100 	.inst	0x600e4100 ; undefined
   84a64:	00000e77 	udf	#3703
   84a68:	00000014 	udf	#20
   84a6c:	00000164 	udf	#356
   84a70:	ffffeb48 	.inst	0xffffeb48 ; undefined
   84a74:	000000f8 	udf	#248
   84a78:	600e4100 	.inst	0x600e4100 ; undefined
   84a7c:	00000e7c 	udf	#3708
   84a80:	0000001c 	udf	#28
   84a84:	0000017c 	udf	#380
   84a88:	ffffec28 	.inst	0xffffec28 ; undefined
   84a8c:	00000088 	udf	#136
   84a90:	400e4100 	.inst	0x400e4100 ; undefined
   84a94:	079e089d 	.inst	0x079e089d ; undefined
   84a98:	0eddde60 	.inst	0x0eddde60 ; undefined
   84a9c:	00000000 	udf	#0
   84aa0:	0000001c 	udf	#28
   84aa4:	0000019c 	udf	#412
   84aa8:	ffffec90 	.inst	0xffffec90 ; undefined
   84aac:	00000058 	udf	#88
   84ab0:	300e4100 	adr	x0, a12d1 <__kernel_end_addr+0x8c89>
   84ab4:	059e069d 	mov	z29.s, p14/z, #52
   84ab8:	0eddde54 	.inst	0x0eddde54 ; undefined
   84abc:	00000000 	udf	#0
   84ac0:	00000024 	udf	#36
   84ac4:	000001bc 	udf	#444
   84ac8:	ffffecc8 	.inst	0xffffecc8 ; undefined
   84acc:	00000358 	udf	#856
   84ad0:	a00e4100 	.inst	0xa00e4100 ; undefined
   84ad4:	949d4109 	bl	27d4ef8 <TCR_VALUE+0x26d4ee8>
   84ad8:	01939e01 	.inst	0x01939e01 ; undefined
   84adc:	deddd302 	.inst	0xdeddd302 ; undefined
   84ae0:	0000000e 	udf	#14
   84ae4:	00000000 	udf	#0
   84ae8:	0000001c 	udf	#28
   84aec:	000001e4 	udf	#484
   84af0:	ffffeff8 	.inst	0xffffeff8 ; undefined
   84af4:	000000e0 	udf	#224
   84af8:	200e4100 	.inst	0x200e4100 ; undefined
   84afc:	039e049d 	.inst	0x039e049d ; undefined
   84b00:	0eddde76 	.inst	0x0eddde76 ; undefined
   84b04:	00000000 	udf	#0
   84b08:	00000010 	udf	#16
   84b0c:	00000204 	udf	#516
   84b10:	fffff0b8 	.inst	0xfffff0b8 ; undefined
   84b14:	00000008 	udf	#8
   84b18:	00000000 	udf	#0
   84b1c:	00000010 	udf	#16
   84b20:	00000218 	udf	#536
   84b24:	fffff0ac 	.inst	0xfffff0ac ; undefined
   84b28:	00000008 	udf	#8
   84b2c:	00000000 	udf	#0
   84b30:	00000010 	udf	#16
   84b34:	0000022c 	udf	#556
   84b38:	fffff0a0 	.inst	0xfffff0a0 ; undefined
   84b3c:	00000008 	udf	#8
   84b40:	00000000 	udf	#0
   84b44:	0000001c 	udf	#28
   84b48:	00000240 	udf	#576
   84b4c:	fffff094 	.inst	0xfffff094 ; undefined
   84b50:	00000020 	udf	#32
   84b54:	100e4100 	adr	x0, a1374 <__kernel_end_addr+0x8d2c>
   84b58:	019e029d 	.inst	0x019e029d ; undefined
   84b5c:	0eddde46 	.inst	0x0eddde46 ; undefined
   84b60:	00000000 	udf	#0
   84b64:	00000014 	udf	#20
   84b68:	00000260 	udf	#608
   84b6c:	fffff094 	.inst	0xfffff094 ; undefined
   84b70:	00000098 	udf	#152
   84b74:	200e4100 	.inst	0x200e4100 ; undefined
   84b78:	00000e64 	udf	#3684
   84b7c:	00000010 	udf	#16
   84b80:	00000278 	udf	#632
   84b84:	fffff114 	.inst	0xfffff114 ; undefined
   84b88:	00000008 	udf	#8
   84b8c:	00000000 	udf	#0
   84b90:	00000014 	udf	#20
   84b94:	0000028c 	udf	#652
   84b98:	fffff108 	.inst	0xfffff108 ; undefined
   84b9c:	00000008 	udf	#8
	...
   84ba8:	00000010 	udf	#16
   84bac:	000002a4 	udf	#676
   84bb0:	fffff0f8 	.inst	0xfffff0f8 ; undefined
   84bb4:	00000008 	udf	#8
   84bb8:	00000000 	udf	#0
   84bbc:	00000014 	udf	#20
   84bc0:	000002b8 	udf	#696
   84bc4:	fffff0ec 	.inst	0xfffff0ec ; undefined
   84bc8:	00000014 	udf	#20
   84bcc:	100e4100 	adr	x0, a13ec <__kernel_end_addr+0x8da4>
   84bd0:	00000e43 	udf	#3651
   84bd4:	00000014 	udf	#20
   84bd8:	000002d0 	udf	#720
   84bdc:	fffff0e8 	.inst	0xfffff0e8 ; undefined
   84be0:	00000014 	udf	#20
   84be4:	100e4100 	adr	x0, a1404 <__kernel_end_addr+0x8dbc>
   84be8:	00000e43 	udf	#3651
   84bec:	00000010 	udf	#16
   84bf0:	000002e8 	udf	#744
   84bf4:	fffff0e4 	.inst	0xfffff0e4 ; undefined
   84bf8:	00000008 	udf	#8
   84bfc:	00000000 	udf	#0
   84c00:	0000001c 	udf	#28
   84c04:	000002fc 	udf	#764
   84c08:	fffff0d8 	.inst	0xfffff0d8 ; undefined
   84c0c:	00000070 	udf	#112
   84c10:	100e4100 	adr	x0, a1430 <__kernel_end_addr+0x8de8>
   84c14:	019e029d 	.inst	0x019e029d ; undefined
   84c18:	0eddde5a 	.inst	0x0eddde5a ; undefined
   84c1c:	00000000 	udf	#0
   84c20:	0000001c 	udf	#28
   84c24:	0000031c 	udf	#796
   84c28:	fffff128 	.inst	0xfffff128 ; undefined
   84c2c:	00000098 	udf	#152
   84c30:	100e4100 	adr	x0, a1450 <__kernel_end_addr+0x8e08>
   84c34:	019e029d 	.inst	0x019e029d ; undefined
   84c38:	0eddde64 	.inst	0x0eddde64 ; undefined
   84c3c:	00000000 	udf	#0
   84c40:	00000014 	udf	#20
   84c44:	0000033c 	udf	#828
   84c48:	fffff1a0 	.inst	0xfffff1a0 ; undefined
   84c4c:	00000008 	udf	#8
	...
   84c58:	0000001c 	udf	#28
   84c5c:	00000354 	udf	#852
   84c60:	fffff190 	.inst	0xfffff190 ; undefined
   84c64:	0000004c 	udf	#76
   84c68:	100e4100 	adr	x0, a1488 <__kernel_end_addr+0x8e40>
   84c6c:	019e029d 	.inst	0x019e029d ; undefined
   84c70:	0eddde51 	.inst	0x0eddde51 ; undefined
   84c74:	00000000 	udf	#0
   84c78:	00000014 	udf	#20
   84c7c:	00000374 	udf	#884
   84c80:	fffff1bc 	.inst	0xfffff1bc ; undefined
   84c84:	00000124 	udf	#292
   84c88:	400e4100 	.inst	0x400e4100 ; undefined
   84c8c:	000e4702 	.inst	0x000e4702 ; undefined
   84c90:	00000014 	udf	#20
   84c94:	0000038c 	udf	#908
   84c98:	fffff2c8 	.inst	0xfffff2c8 ; undefined
   84c9c:	0000017c 	udf	#380
   84ca0:	400e4100 	.inst	0x400e4100 ; undefined
   84ca4:	000e5d02 	.inst	0x000e5d02 ; undefined
   84ca8:	00000010 	udf	#16
   84cac:	000003a4 	udf	#932
   84cb0:	fffff42c 	.inst	0xfffff42c ; undefined
   84cb4:	00000008 	udf	#8
   84cb8:	00000000 	udf	#0
   84cbc:	00000014 	udf	#20
   84cc0:	000003b8 	udf	#952
   84cc4:	fffff420 	.inst	0xfffff420 ; undefined
   84cc8:	000000b8 	udf	#184
   84ccc:	200e4100 	.inst	0x200e4100 ; undefined
   84cd0:	00000e6c 	udf	#3692
   84cd4:	00000014 	udf	#20
   84cd8:	000003d0 	udf	#976
   84cdc:	fffff4c0 	.inst	0xfffff4c0 ; undefined
   84ce0:	00000040 	udf	#64
   84ce4:	100e4100 	adr	x0, a1504 <__kernel_end_addr+0x8ebc>
   84ce8:	00000e4e 	udf	#3662
   84cec:	00000010 	udf	#16
   84cf0:	000003e8 	udf	#1000
   84cf4:	fffff4e8 	.inst	0xfffff4e8 ; undefined
   84cf8:	00000008 	udf	#8
   84cfc:	00000000 	udf	#0
   84d00:	00000014 	udf	#20
   84d04:	000003fc 	udf	#1020
   84d08:	fffff4dc 	.inst	0xfffff4dc ; undefined
   84d0c:	00000040 	udf	#64
   84d10:	100e4100 	adr	x0, a1530 <__kernel_end_addr+0x8ee8>
   84d14:	00000e4e 	udf	#3662
   84d18:	00000010 	udf	#16
   84d1c:	00000414 	udf	#1044
   84d20:	fffff504 	.inst	0xfffff504 ; undefined
   84d24:	00000030 	udf	#48
   84d28:	00000000 	udf	#0
   84d2c:	00000020 	udf	#32
   84d30:	00000428 	udf	#1064
   84d34:	fffff520 	.inst	0xfffff520 ; undefined
   84d38:	0000005c 	udf	#92
   84d3c:	300e4100 	adr	x0, a155d <__kernel_end_addr+0x8f15>
   84d40:	059e069d 	mov	z29.s, p14/z, #52
   84d44:	0eddde55 	.inst	0x0eddde55 ; undefined
	...
   84d50:	0000001c 	udf	#28
   84d54:	0000044c 	udf	#1100
   84d58:	fffff558 	.inst	0xfffff558 ; undefined
   84d5c:	000000b8 	udf	#184
   84d60:	100e4100 	adr	x0, a1580 <__kernel_end_addr+0x8f38>
   84d64:	019e029d 	.inst	0x019e029d ; undefined
   84d68:	0eddde6c 	.inst	0x0eddde6c ; undefined
   84d6c:	00000000 	udf	#0
   84d70:	0000001c 	udf	#28
   84d74:	0000046c 	udf	#1132
   84d78:	fffff5f0 	.inst	0xfffff5f0 ; undefined
   84d7c:	00000090 	udf	#144
   84d80:	100e4100 	adr	x0, a15a0 <__kernel_end_addr+0x8f58>
   84d84:	019e029d 	.inst	0x019e029d ; undefined
   84d88:	0eddde62 	.inst	0x0eddde62 ; undefined
   84d8c:	00000000 	udf	#0
   84d90:	0000001c 	udf	#28
   84d94:	0000048c 	udf	#1164
   84d98:	fffff660 	.inst	0xfffff660 ; undefined
   84d9c:	00000088 	udf	#136
   84da0:	200e4100 	.inst	0x200e4100 ; undefined
   84da4:	039e049d 	.inst	0x039e049d ; undefined
   84da8:	0eddde60 	.inst	0x0eddde60 ; undefined
   84dac:	00000000 	udf	#0
   84db0:	0000001c 	udf	#28
   84db4:	000004ac 	udf	#1196
   84db8:	fffff6c8 	.inst	0xfffff6c8 ; undefined
   84dbc:	0000001c 	udf	#28
   84dc0:	100e4100 	adr	x0, a15e0 <__kernel_end_addr+0x8f98>
   84dc4:	019e029d 	.inst	0x019e029d ; undefined
   84dc8:	0eddde45 	.inst	0x0eddde45 ; undefined
   84dcc:	00000000 	udf	#0
   84dd0:	00000014 	udf	#20
   84dd4:	000004cc 	udf	#1228
   84dd8:	fffff6c4 	.inst	0xfffff6c4 ; undefined
   84ddc:	000000e0 	udf	#224
   84de0:	200e4100 	.inst	0x200e4100 ; undefined
   84de4:	00000e76 	udf	#3702
   84de8:	0000001c 	udf	#28
   84dec:	000004e4 	udf	#1252
   84df0:	fffff78c 	.inst	0xfffff78c ; undefined
   84df4:	00000090 	udf	#144
   84df8:	200e4100 	.inst	0x200e4100 ; undefined
   84dfc:	039e049d 	.inst	0x039e049d ; undefined
   84e00:	0eddde62 	.inst	0x0eddde62 ; undefined
   84e04:	00000000 	udf	#0
   84e08:	00000014 	udf	#20
   84e0c:	00000504 	udf	#1284
   84e10:	fffff7fc 	.inst	0xfffff7fc ; undefined
   84e14:	00000030 	udf	#48
   84e18:	200e4100 	.inst	0x200e4100 ; undefined
   84e1c:	00000e4a 	udf	#3658
   84e20:	00000014 	udf	#20
   84e24:	0000051c 	udf	#1308
   84e28:	fffff814 	.inst	0xfffff814 ; undefined
   84e2c:	00000030 	udf	#48
   84e30:	200e4100 	.inst	0x200e4100 ; undefined
   84e34:	00000e4a 	udf	#3658
   84e38:	0000001c 	udf	#28
   84e3c:	00000534 	udf	#1332
   84e40:	fffff82c 	.inst	0xfffff82c ; undefined
   84e44:	00000054 	udf	#84
   84e48:	400e4100 	.inst	0x400e4100 ; undefined
   84e4c:	079e089d 	.inst	0x079e089d ; undefined
   84e50:	0eddde53 	.inst	0x0eddde53 ; undefined
   84e54:	00000000 	udf	#0

Disassembly of section .data:

0000000000085000 <core_info>:
	...

0000000000086000 <core_0_kernel_stack>:
	...

0000000000088000 <core_1_kernel_stack>:
	...

000000000008a000 <core_2_kernel_stack>:
	...

000000000008c000 <core_3_kernel_stack>:
	...

000000000008e000 <boot_strap_table_addr>:
	...

000000000008f000 <boot_strap_pud>:
	...

0000000000090000 <boot_strap_pmd>:
	...

0000000000091000 <boot_strap_pmd_above_1G>:
	...

0000000000092000 <boot_strap_pmd_usr>:
	...

0000000000093000 <boot_strap_table_addr_el0>:
	...

0000000000094000 <boot_strap_pud_el0>:
	...

0000000000095000 <boot_strap_pmd_el0>:
	...

0000000000096000 <boot_strap_pmd_el0_above_1G>:
	...

0000000000097000 <core_count>:
   97000:	Address 0x0000000000097000 is out of bounds.


Disassembly of section .got:

0000000000097008 <_GLOBAL_OFFSET_TABLE_>:
	...
   97010:	000000e0 	udf	#224
   97014:	00000000 	udf	#0
   97018:	0008e000 	.inst	0x0008e000 ; undefined
   9701c:	00000000 	udf	#0
   97020:	000000e8 	udf	#232
   97024:	00000000 	udf	#0
   97028:	00080000 	.inst	0x00080000 ; undefined
   9702c:	00000000 	udf	#0
   97030:	00097000 	.inst	0x00097000 ; undefined
   97034:	00000000 	udf	#0
   97038:	00080100 	.inst	0x00080100 ; undefined
   9703c:	00000000 	udf	#0
   97040:	00098648 	.inst	0x00098648 ; undefined
   97044:	00000000 	udf	#0
   97048:	00093000 	.inst	0x00093000 ; undefined
   9704c:	00000000 	udf	#0
   97050:	000802b0 	.inst	0x000802b0 ; undefined
   97054:	00000000 	udf	#0
   97058:	00080220 	.inst	0x00080220 ; undefined
   9705c:	00000000 	udf	#0
   97060:	000000f0 	udf	#240
   97064:	00000000 	udf	#0

Disassembly of section .got.plt:

0000000000097068 <.got.plt>:
	...

Disassembly of section .bss:

0000000000098000 <spiRecvBuf>:
	...

0000000000098100 <spiSendBuf>:
	...

0000000000098200 <i2cRecvBuf>:
	...

0000000000098300 <i2cSendBuf>:
	...

0000000000098400 <core_console_lock>:
	...

0000000000098408 <SysMemoryInfo>:
	...

0000000000098638 <timer_interval>:
	...

0000000000098640 <ticks>:
	...

Disassembly of section .debug_line:

0000000000000000 <.debug_line>:
       0:	00000084 	udf	#132
       4:	00080005 	.inst	0x00080005 ; undefined
       8:	0000002e 	udf	#46
       c:	fb010104 	.inst	0xfb010104 ; undefined
      10:	01000d0e 	.inst	0x01000d0e ; undefined
      14:	00010101 	.inst	0x00010101 ; undefined
      18:	00010000 	.inst	0x00010000 ; undefined
      1c:	01010100 	.inst	0x01010100 ; undefined
      20:	0000021f 	udf	#543
      24:	002d0000 	.inst	0x002d0000 ; NYI
      28:	01020000 	.inst	0x01020000 ; undefined
      2c:	020f021f 	.inst	0x020f021f ; undefined
      30:	00000032 	udf	#50
      34:	00003201 	udf	#12801
      38:	09000100 	.inst	0x09000100 ; undefined
      3c:	08010002 	stxrb	w1, w2, [x0]
      40:	00000000 	udf	#0
      44:	21211500 	.inst	0x21211500 ; undefined
      48:	21212322 	.inst	0x21212322 ; undefined
      4c:	21222221 	.inst	0x21222221 ; undefined
      50:	21212221 	.inst	0x21212221 ; undefined
      54:	22222322 	.inst	0x22222322 ; undefined
      58:	21222121 	.inst	0x21222121 ; undefined
      5c:	22212122 	.inst	0x22212122 ; undefined
      60:	21222121 	.inst	0x21222121 ; undefined
      64:	22242221 	.inst	0x22242221 ; undefined
      68:	00c10321 	.inst	0x00c10321 ; undefined
      6c:	17240220 	b	fffffffffc9008ec <IRQ_SOURCE_EL0_CORE_0+0xffffbc90088c>
      70:	03172402 	.inst	0x03172402 ; undefined
      74:	0124020d 	.inst	0x0124020d ; undefined
      78:	24212121 	cmplo	p1.b, p0/z, z9.b, #4
      7c:	21242221 	.inst	0x21242221 ; undefined
      80:	02252526 	.inst	0x02252526 ; undefined
      84:	01010031 	.inst	0x01010031 ; undefined
      88:	00000088 	udf	#136
      8c:	00080005 	.inst	0x00080005 ; undefined
      90:	0000002e 	udf	#46
      94:	fb010104 	.inst	0xfb010104 ; undefined
      98:	01000d0e 	.inst	0x01000d0e ; undefined
      9c:	00010101 	.inst	0x00010101 ; undefined
      a0:	00010000 	.inst	0x00010000 ; undefined
      a4:	01010100 	.inst	0x01010100 ; undefined
      a8:	0000021f 	udf	#543
      ac:	00380000 	.inst	0x00380000 ; NYI
      b0:	01020000 	.inst	0x01020000 ; undefined
      b4:	020f021f 	.inst	0x020f021f ; undefined
      b8:	00000042 	udf	#66
      bc:	00004201 	udf	#16897
      c0:	09000100 	.inst	0x09000100 ; undefined
      c4:	08080002 	stxrb	w8, w2, [x0]
      c8:	00000000 	udf	#0
      cc:	010a0300 	.inst	0x010a0300 ; undefined
      d0:	24212221 	cmplo	p1.b, p0/z, z17.b, #4
      d4:	d7032221 	.inst	0xd7032221 ; undefined
      d8:	03fa0200 	.inst	0x03fa0200 ; undefined
      dc:	08e80801 	.inst	0x08e80801 ; undefined
      e0:	08e808e8 	.inst	0x08e808e8 ; undefined
      e4:	08e808e8 	.inst	0x08e808e8 ; undefined
      e8:	08e808e8 	.inst	0x08e808e8 ; undefined
      ec:	08e808e8 	.inst	0x08e808e8 ; undefined
      f0:	08e808e8 	.inst	0x08e808e8 ; undefined
      f4:	08e808e8 	.inst	0x08e808e8 ; undefined
      f8:	23e808e8 	.inst	0x23e808e8 ; undefined
      fc:	67215908 	.inst	0x67215908 ; undefined
     100:	5b083d21 	.inst	0x5b083d21 ; undefined
     104:	67215908 	.inst	0x67215908 ; undefined
     108:	5b083d21 	.inst	0x5b083d21 ; undefined
     10c:	02212422 	.inst	0x02212422 ; undefined
     110:	01010004 	.inst	0x01010004 ; undefined
     114:	0000007d 	udf	#125
     118:	00080005 	.inst	0x00080005 ; undefined
     11c:	0000002e 	udf	#46
     120:	fb010104 	.inst	0xfb010104 ; undefined
     124:	01000d0e 	.inst	0x01000d0e ; undefined
     128:	00010101 	.inst	0x00010101 ; undefined
     12c:	00010000 	.inst	0x00010000 ; undefined
     130:	01010100 	.inst	0x01010100 ; undefined
     134:	0000021f 	udf	#543
     138:	00480000 	.inst	0x00480000 ; undefined
     13c:	01020000 	.inst	0x01020000 ; undefined
     140:	020f021f 	.inst	0x020f021f ; undefined
     144:	00000050 	udf	#80
     148:	00005001 	udf	#20481
     14c:	09000100 	.inst	0x09000100 ; undefined
     150:	08195802 	stxrb	w25, w2, [x0]
     154:	00000000 	udf	#0
     158:	22211500 	.inst	0x22211500 ; undefined
     15c:	21222121 	.inst	0x21222121 ; undefined
     160:	21212123 	.inst	0x21212123 ; undefined
     164:	21212421 	.inst	0x21212421 ; undefined
     168:	23212225 	.inst	0x23212225 ; undefined
     16c:	24212121 	cmplo	p1.b, p0/z, z9.b, #4
     170:	22212522 	.inst	0x22212522 ; undefined
     174:	21232121 	.inst	0x21232121 ; undefined
     178:	21242121 	.inst	0x21242121 ; undefined
     17c:	21212822 	.inst	0x21212822 ; undefined
     180:	21232123 	.inst	0x21232123 ; undefined
     184:	21212125 	.inst	0x21212125 ; undefined
     188:	21212121 	.inst	0x21212121 ; undefined
     18c:	21252121 	.inst	0x21252121 ; undefined
     190:	01000102 	.inst	0x01000102 ; undefined
     194:	0000a501 	udf	#42241
     198:	08000500 	stxrb	w0, w0, [x8]
     19c:	00002e00 	udf	#11776
     1a0:	01010400 	.inst	0x01010400 ; undefined
     1a4:	000d0efb 	.inst	0x000d0efb ; undefined
     1a8:	01010101 	.inst	0x01010101 ; undefined
     1ac:	01000000 	.inst	0x01000000 ; undefined
     1b0:	01010000 	.inst	0x01010000 ; undefined
     1b4:	00021f01 	.inst	0x00021f01 ; undefined
     1b8:	5a000000 	sbc	w0, w0, w0
     1bc:	02000000 	.inst	0x02000000 ; undefined
     1c0:	0f021f01 	.inst	0x0f021f01 ; undefined
     1c4:	00005f02 	udf	#24322
     1c8:	005f0100 	.inst	0x005f0100 ; undefined
     1cc:	00010000 	.inst	0x00010000 ; undefined
     1d0:	00000209 	udf	#521
     1d4:	00000008 	udf	#8
     1d8:	21170000 	.inst	0x21170000 ; undefined
     1dc:	21222122 	.inst	0x21222122 ; undefined
     1e0:	21232221 	.inst	0x21232221 ; undefined
     1e4:	22222121 	.inst	0x22222121 ; undefined
     1e8:	21222121 	.inst	0x21222121 ; undefined
     1ec:	21232221 	.inst	0x21232221 ; undefined
     1f0:	22212122 	.inst	0x22212122 ; undefined
     1f4:	21212221 	.inst	0x21212221 ; undefined
     1f8:	22212122 	.inst	0x22212122 ; undefined
     1fc:	25222121 	.inst	0x25222121 ; undefined
     200:	21232121 	.inst	0x21232121 ; undefined
     204:	02212324 	.inst	0x02212324 ; undefined
     208:	01010006 	.inst	0x01010006 ; undefined
     20c:	38020900 	sttrb	w0, [x8, #32]
     210:	0000081a 	udf	#2074
     214:	03000000 	.inst	0x03000000 ; undefined
     218:	030100d2 	.inst	0x030100d2 ; undefined
     21c:	2122200b 	.inst	0x2122200b ; undefined
     220:	22212221 	.inst	0x22212221 ; undefined
     224:	21212225 	.inst	0x21212225 ; undefined
     228:	24222122 	cmplo	p2.b, p0/z, z9.b, #8
     22c:	21212121 	.inst	0x21212121 ; undefined
     230:	23212221 	.inst	0x23212221 ; undefined
     234:	22212221 	.inst	0x22212221 ; undefined
     238:	000a0221 	.inst	0x000a0221 ; undefined
     23c:	00980101 	.inst	0x00980101 ; undefined
     240:	00050000 	.inst	0x00050000 ; undefined
     244:	002e0008 	.inst	0x002e0008 ; NYI
     248:	01040000 	.inst	0x01040000 ; undefined
     24c:	0d0efb01 	.inst	0x0d0efb01 ; undefined
     250:	01010100 	.inst	0x01010100 ; undefined
     254:	00000001 	udf	#1
     258:	01000001 	.inst	0x01000001 ; undefined
     25c:	021f0101 	.inst	0x021f0101 ; undefined
     260:	00000000 	udf	#0
     264:	00000066 	udf	#102
     268:	021f0102 	.inst	0x021f0102 ; undefined
     26c:	0069020f 	.inst	0x0069020f ; undefined
     270:	69010000 	stgp	x0, x0, [x0, #32]
     274:	01000000 	.inst	0x01000000 ; undefined
     278:	00020900 	.inst	0x00020900 ; undefined
     27c:	00000820 	udf	#2080
     280:	03000000 	.inst	0x03000000 ; undefined
     284:	2221010f 	.inst	0x2221010f ; undefined
     288:	22212221 	.inst	0x22212221 ; undefined
     28c:	21212321 	.inst	0x21212321 ; undefined
     290:	21212525 	.inst	0x21212525 ; undefined
     294:	200a0322 	.inst	0x200a0322 ; undefined
     298:	23212221 	.inst	0x23212221 ; undefined
     29c:	25212221 	.inst	0x25212221 ; undefined
     2a0:	23212121 	.inst	0x23212121 ; undefined
     2a4:	23212121 	.inst	0x23212121 ; undefined
     2a8:	21222221 	.inst	0x21222221 ; undefined
     2ac:	23212221 	.inst	0x23212221 ; undefined
     2b0:	24212221 	cmplo	p1.b, p0/z, z17.b, #4
     2b4:	21212121 	.inst	0x21212121 ; undefined
     2b8:	21212223 	.inst	0x21212223 ; undefined
     2bc:	21242522 	.inst	0x21242522 ; undefined
     2c0:	21222122 	.inst	0x21222122 ; undefined
     2c4:	21222122 	.inst	0x21222122 ; undefined
     2c8:	21212321 	.inst	0x21212321 ; undefined
     2cc:	22222121 	.inst	0x22222121 ; undefined
     2d0:	23222121 	.inst	0x23222121 ; undefined
     2d4:	0007b802 	.inst	0x0007b802 ; undefined
     2d8:	00530101 	.inst	0x00530101 ; undefined
     2dc:	00050000 	.inst	0x00050000 ; undefined
     2e0:	002e0008 	.inst	0x002e0008 ; NYI
     2e4:	01040000 	.inst	0x01040000 ; undefined
     2e8:	0d0efb01 	.inst	0x0d0efb01 ; undefined
     2ec:	01010100 	.inst	0x01010100 ; undefined
     2f0:	00000001 	udf	#1
     2f4:	01000001 	.inst	0x01000001 ; undefined
     2f8:	021f0101 	.inst	0x021f0101 ; undefined
     2fc:	00000000 	udf	#0
     300:	00000073 	udf	#115
     304:	021f0102 	.inst	0x021f0102 ; undefined
     308:	007a020f 	.inst	0x007a020f ; undefined
     30c:	7a010000 	sbcs	w0, w0, w1
     310:	01000000 	.inst	0x01000000 ; undefined
     314:	10020900 	adr	x0, 4434 <MAIR_ATTR+0x34>
     318:	00000830 	udf	#2096
     31c:	15000000 	b	400031c <TCR_VALUE+0x3f0030c>
     320:	22212122 	.inst	0x22212122 ; undefined
     324:	21222122 	.inst	0x21222122 ; undefined
     328:	21242124 	.inst	0x21242124 ; undefined
     32c:	01000102 	.inst	0x01000102 ; undefined
     330:	0000d901 	udf	#55553
     334:	08000500 	stxrb	w0, w0, [x8]
     338:	00003c00 	udf	#15360
     33c:	01010400 	.inst	0x01010400 ; undefined
     340:	000d0efb 	.inst	0x000d0efb ; undefined
     344:	01010101 	.inst	0x01010101 ; undefined
     348:	01000000 	.inst	0x01000000 ; undefined
     34c:	01010000 	.inst	0x01010000 ; undefined
     350:	00031f01 	.inst	0x00031f01 ; undefined
     354:	9a000000 	adc	x0, x0, x0
     358:	a0000000 	.inst	0xa0000000 ; undefined
     35c:	02000000 	.inst	0x02000000 ; undefined
     360:	0f021f01 	.inst	0x0f021f01 ; undefined
     364:	00009204 	udf	#37380
     368:	00920100 	.inst	0x00920100 ; undefined
     36c:	a6010000 	.inst	0xa6010000 ; undefined
     370:	02000000 	.inst	0x02000000 ; undefined
     374:	000000ae 	udf	#174
     378:	005d0502 	.inst	0x005d0502 ; undefined
     37c:	30440209 	adr	x9, 883bd <core_1_kernel_stack+0x3bd>
     380:	00000008 	udf	#8
     384:	05190000 	mov	z0.b, p9/z, #0
     388:	01056705 	.inst	0x01056705 ; undefined
     38c:	411c0579 	.inst	0x411c0579 ; undefined
     390:	05310a05 	ext	z5.b, z5.b, z16.b, #138
     394:	09053e0b 	.inst	0x09053e0b ; undefined
     398:	4b0d0521 	sub	w1, w9, w13, lsl #1
     39c:	3d3d0e05 	str	b5, [x16, #3907]
     3a0:	052f0f05 	ext	z5.b, z5.b, z24.b, #123
     3a4:	1105210d 	add	w13, w8, #0x148
     3a8:	3d120575 	str	b21, [x11, #1153]
     3ac:	1005333d 	adr	x29, aa10 <MAIR_ATTR+0x6610>
     3b0:	053c7703 	trn2	z3.b, z24.b, z28.b
     3b4:	10052e16 	adr	x22, a974 <MAIR_ATTR+0x6574>
     3b8:	030d0520 	.inst	0x030d0520 ; undefined
     3bc:	0c052e0c 	.inst	0x0c052e0c ; undefined
     3c0:	053c6f03 	uzp2	z3.b, z24.b, z28.b
     3c4:	0c052e11 	.inst	0x0c052e11 ; undefined
     3c8:	03090520 	.inst	0x03090520 ; undefined
     3cc:	0b052e16 	add	w22, w16, w5, lsl #11
     3d0:	2109053e 	.inst	0x2109053e ; undefined
     3d4:	054b0d05 	.inst	0x054b0d05 ; undefined
     3d8:	053d3d0e 	.inst	0x053d3d0e ; undefined
     3dc:	0d052f0f 	.inst	0x0d052f0f ; undefined
     3e0:	75110521 	.inst	0x75110521 ; undefined
     3e4:	3d3d1205 	str	b5, [x16, #3908]
     3e8:	03100533 	.inst	0x03100533 ; undefined
     3ec:	16053c77 	b	fffffffff814f5c8 <IRQ_SOURCE_EL0_CORE_0+0xffffb814f568>
     3f0:	2010052e 	.inst	0x2010052e ; undefined
     3f4:	0c030d05 	.inst	0x0c030d05 ; undefined
     3f8:	030c052e 	.inst	0x030c052e ; undefined
     3fc:	11053c6f 	add	w15, w3, #0x14f
     400:	200c052e 	.inst	0x200c052e ; undefined
     404:	15030105 	b	40c0818 <TCR_VALUE+0x3fc0808>
     408:	0004022e 	.inst	0x0004022e ; undefined
     40c:	005c0101 	.inst	0x005c0101 ; undefined
     410:	00050000 	.inst	0x00050000 ; undefined
     414:	00370008 	.inst	0x00370008 ; NYI
     418:	01040000 	.inst	0x01040000 ; undefined
     41c:	0d0efb01 	.inst	0x0d0efb01 ; undefined
     420:	01010100 	.inst	0x01010100 ; undefined
     424:	00000001 	udf	#1
     428:	01000001 	.inst	0x01000001 ; undefined
     42c:	031f0101 	.inst	0x031f0101 ; undefined
     430:	00000000 	udf	#0
     434:	0000002d 	udf	#45
     438:	000000a0 	udf	#160
     43c:	021f0102 	.inst	0x021f0102 ; undefined
     440:	00bb030f 	.inst	0x00bb030f ; undefined
     444:	bb010000 	.inst	0xbb010000 ; undefined
     448:	01000000 	.inst	0x01000000 ; undefined
     44c:	000000c3 	udf	#195
     450:	001d0502 	.inst	0x001d0502 ; undefined
     454:	321c0209 	orr	w9, w16, #0x10
     458:	00000008 	udf	#8
     45c:	05160000 	mov	z0.b, p6/z, #0
     460:	0b053105 	add	w5, w8, w5, lsl #12
     464:	01040200 	.inst	0x01040200 ; undefined
     468:	0001023e 	.inst	0x0001023e ; undefined
     46c:	005c0101 	.inst	0x005c0101 ; undefined
     470:	00050000 	.inst	0x00050000 ; undefined
     474:	00370008 	.inst	0x00370008 ; NYI
     478:	01040000 	.inst	0x01040000 ; undefined
     47c:	0d0efb01 	.inst	0x0d0efb01 ; undefined
     480:	01010100 	.inst	0x01010100 ; undefined
     484:	00000001 	udf	#1
     488:	01000001 	.inst	0x01000001 ; undefined
     48c:	031f0101 	.inst	0x031f0101 ; undefined
     490:	00000000 	udf	#0
     494:	0000002d 	udf	#45
     498:	000000a0 	udf	#160
     49c:	021f0102 	.inst	0x021f0102 ; undefined
     4a0:	00d1030f 	.inst	0x00d1030f ; undefined
     4a4:	d1010000 	sub	x0, x0, #0x40
     4a8:	01000000 	.inst	0x01000000 ; undefined
     4ac:	000000c3 	udf	#195
     4b0:	00210502 	.inst	0x00210502 ; NYI
     4b4:	32340209 	orr	w9, w16, #0x1000
     4b8:	00000008 	udf	#8
     4bc:	05160000 	mov	z0.b, p6/z, #0
     4c0:	0b053005 	add	w5, w0, w5, lsl #12
     4c4:	01040200 	.inst	0x01040200 ; undefined
     4c8:	0001023f 	.inst	0x0001023f ; undefined
     4cc:	00630101 	.inst	0x00630101 ; undefined
     4d0:	00050000 	.inst	0x00050000 ; undefined
     4d4:	003c0008 	.inst	0x003c0008 ; NYI
     4d8:	01040000 	.inst	0x01040000 ; undefined
     4dc:	0d0efb01 	.inst	0x0d0efb01 ; undefined
     4e0:	01010100 	.inst	0x01010100 ; undefined
     4e4:	00000001 	udf	#1
     4e8:	01000001 	.inst	0x01000001 ; undefined
     4ec:	031f0101 	.inst	0x031f0101 ; undefined
     4f0:	00000000 	udf	#0
     4f4:	0000002d 	udf	#45
     4f8:	000000a0 	udf	#160
     4fc:	021f0102 	.inst	0x021f0102 ; undefined
     500:	00de040f 	.inst	0x00de040f ; undefined
     504:	de010000 	.inst	0xde010000 ; undefined
     508:	01000000 	.inst	0x01000000 ; undefined
     50c:	000000a6 	udf	#166
     510:	0000ae02 	udf	#44546
     514:	18050200 	ldr	w0, a554 <MAIR_ATTR+0x6154>
     518:	4c020900 	.inst	0x4c020900 ; undefined
     51c:	00000832 	udf	#2098
     520:	03000000 	.inst	0x03000000 ; undefined
     524:	0505010c 	.inst	0x0505010c ; undefined
     528:	000b0532 	.inst	0x000b0532 ; undefined
     52c:	40010402 	.inst	0x40010402 ; undefined
     530:	01000102 	.inst	0x01000102 ; undefined
     534:	00007c01 	udf	#31745
     538:	08000500 	stxrb	w0, w0, [x8]
     53c:	00004100 	udf	#16640
     540:	01010400 	.inst	0x01010400 ; undefined
     544:	000d0efb 	.inst	0x000d0efb ; undefined
     548:	01010101 	.inst	0x01010101 ; undefined
     54c:	01000000 	.inst	0x01000000 ; undefined
     550:	01010000 	.inst	0x01010000 ; undefined
     554:	00031f01 	.inst	0x00031f01 ; undefined
     558:	2d000000 	stp	s0, s0, [x0]
     55c:	a0000000 	.inst	0xa0000000 ; undefined
     560:	02000000 	.inst	0x02000000 ; undefined
     564:	0f021f01 	.inst	0x0f021f01 ; undefined
     568:	0000eb05 	udf	#60165
     56c:	00eb0100 	.inst	0x00eb0100 ; undefined
     570:	a6010000 	.inst	0xa6010000 ; undefined
     574:	02000000 	.inst	0x02000000 ; undefined
     578:	000000c3 	udf	#195
     57c:	0000f302 	udf	#62210
     580:	1d050200 	.inst	0x1d050200 ; undefined
     584:	64020900 	.inst	0x64020900 ; undefined
     588:	00000832 	udf	#2098
     58c:	19000000 	stlurb	w0, [x0]
     590:	3f340605 	.inst	0x3f340605 ; undefined
     594:	000b053d 	.inst	0x000b053d ; undefined
     598:	31010402 	adds	w2, w0, #0x41
     59c:	01040200 	.inst	0x01040200 ; undefined
     5a0:	0402002f 	.inst	0x0402002f ; undefined
     5a4:	02002f01 	.inst	0x02002f01 ; undefined
     5a8:	002f0104 	.inst	0x002f0104 ; NYI
     5ac:	2b010402 	adds	w2, w0, w1, lsl #1
     5b0:	01000102 	.inst	0x01000102 ; undefined
     5b4:	0000b801 	udf	#47105
     5b8:	08000500 	stxrb	w0, w0, [x8]
     5bc:	00004100 	udf	#16640
     5c0:	01010400 	.inst	0x01010400 ; undefined
     5c4:	000d0efb 	.inst	0x000d0efb ; undefined
     5c8:	01010101 	.inst	0x01010101 ; undefined
     5cc:	01000000 	.inst	0x01000000 ; undefined
     5d0:	01010000 	.inst	0x01010000 ; undefined
     5d4:	00031f01 	.inst	0x00031f01 ; undefined
     5d8:	38000000 	sturb	w0, [x0]
     5dc:	a0000000 	.inst	0xa0000000 ; undefined
     5e0:	02000000 	.inst	0x02000000 ; undefined
     5e4:	0f021f01 	.inst	0x0f021f01 ; undefined
     5e8:	00010705 	.inst	0x00010705 ; undefined
     5ec:	01070100 	.inst	0x01070100 ; undefined
     5f0:	a6010000 	.inst	0xa6010000 ; undefined
     5f4:	02000000 	.inst	0x02000000 ; undefined
     5f8:	000000c3 	udf	#195
     5fc:	00011302 	.inst	0x00011302 ; undefined
     600:	19050200 	stlurb	w0, [x16, #80]
     604:	b0020900 	adrp	x0, 4121000 <TCR_VALUE+0x4020ff0>
     608:	00000832 	udf	#2098
     60c:	16000000 	b	fffffffff800060c <IRQ_SOURCE_EL0_CORE_0+0xffffb80005ac>
     610:	05140d05 	mov	z5.b, p4/z, #104
     614:	0d052e21 	.inst	0x0d052e21 ; undefined
     618:	2e20052f 	uhadd	v15.8b, v9.8b, v0.8b
     61c:	052f0d05 	ext	z5.b, z5.b, z8.b, #123
     620:	0d052e20 	.inst	0x0d052e20 ; undefined
     624:	2e200534 	uhadd	v20.8b, v9.8b, v0.8b
     628:	052f0105 	ext	z5.b, z5.b, z8.b, #120
     62c:	0705312b 	.inst	0x0705312b ; undefined
     630:	18052130 	ldr	w16, aa54 <MAIR_ATTR+0x6654>
     634:	20310523 	.inst	0x20310523 ; undefined
     638:	05203c05 	.inst	0x05203c05 ; undefined
     63c:	1a053c15 	.inst	0x1a053c15 ; undefined
     640:	20350521 	.inst	0x20350521 ; undefined
     644:	05204505 	zip2	p5.b, p8.b, p0.b
     648:	07053c17 	.inst	0x07053c17 ; undefined
     64c:	001a0523 	.inst	0x001a0523 ; undefined
     650:	3c010402 	str	b2, [x0], #16
     654:	053e0905 	ext	z5.b, z5.b, z8.b, #242
     658:	2c052301 	stnp	s1, s8, [x24, #40]
     65c:	3d10053e 	str	b30, [x9, #1025]
     660:	052e0505 	ext	z5.b, z5.b, z8.b, #113
     664:	211b510d 	.inst	0x211b510d ; undefined
     668:	24010522 	cmphs	p2.b, p1/z, z9.b, z1.b
     66c:	01000302 	.inst	0x01000302 ; undefined
     670:	00008701 	udf	#34561
     674:	08000500 	stxrb	w0, w0, [x8]
     678:	00003c00 	udf	#15360
     67c:	01010400 	.inst	0x01010400 ; undefined
     680:	000d0efb 	.inst	0x000d0efb ; undefined
     684:	01010101 	.inst	0x01010101 ; undefined
     688:	01000000 	.inst	0x01000000 ; undefined
     68c:	01010000 	.inst	0x01010000 ; undefined
     690:	00031f01 	.inst	0x00031f01 ; undefined
     694:	34000000 	cbz	w0, 694 <THREAD_HW_CONTEXT_SIZE+0x574>
     698:	a0000001 	.inst	0xa0000001 ; undefined
     69c:	02000000 	.inst	0x02000000 ; undefined
     6a0:	0f021f01 	.inst	0x0f021f01 ; undefined
     6a4:	00012804 	.inst	0x00012804 ; undefined
     6a8:	01280100 	.inst	0x01280100 ; undefined
     6ac:	a6010000 	.inst	0xa6010000 ; undefined
     6b0:	02000000 	.inst	0x02000000 ; undefined
     6b4:	000000f3 	udf	#243
     6b8:	002a0502 	.inst	0x002a0502 ; NYI
     6bc:	33a00209 	.inst	0x33a00209 ; undefined
     6c0:	00000008 	udf	#8
     6c4:	05150000 	mov	z0.b, p5/z, #0
     6c8:	0d054405 	.inst	0x0d054405 ; undefined
     6cc:	05c80f03 	.inst	0x05c80f03 ; undefined
     6d0:	2073031b 	.inst	0x2073031b ; undefined
     6d4:	052e0d05 	ext	z5.b, z5.b, z8.b, #115
     6d8:	0d052f1b 	.inst	0x0d052f1b ; undefined
     6dc:	1b054b2e 	madd	w14, w25, w5, w18
     6e0:	2e0d0522 	.inst	0x2e0d0522 ; undefined
     6e4:	221b052f 	.inst	0x221b052f ; undefined
     6e8:	2f2e0d05 	.inst	0x2f2e0d05 ; undefined
     6ec:	05221b05 	ext	z5.b, z5.b, z24.b, #22
     6f0:	222f2e0d 	.inst	0x222f2e0d ; undefined
     6f4:	02230105 	.inst	0x02230105 ; undefined
     6f8:	01010003 	.inst	0x01010003 ; undefined
     6fc:	00000260 	udf	#608
     700:	00080005 	.inst	0x00080005 ; undefined
     704:	0000004f 	udf	#79
     708:	fb010104 	.inst	0xfb010104 ; undefined
     70c:	01000d0e 	.inst	0x01000d0e ; undefined
     710:	00010101 	.inst	0x00010101 ; undefined
     714:	00010000 	.inst	0x00010000 ; undefined
     718:	01010100 	.inst	0x01010100 ; undefined
     71c:	0000041f 	udf	#1055
     720:	00480000 	.inst	0x00480000 ; undefined
     724:	014d0000 	.inst	0x014d0000 ; undefined
     728:	00a00000 	.inst	0x00a00000 ; undefined
     72c:	01020000 	.inst	0x01020000 ; undefined
     730:	070f021f 	.inst	0x070f021f ; undefined
     734:	00000145 	udf	#325
     738:	00014501 	.inst	0x00014501 ; undefined
     73c:	017d0100 	.inst	0x017d0100 ; undefined
     740:	8a020000 	and	x0, x0, x2
     744:	02000001 	.inst	0x02000001 ; undefined
     748:	00000193 	udf	#403
     74c:	0000a600 	udf	#42496
     750:	00c30300 	.inst	0x00c30300 ; undefined
     754:	05030000 	orr	z0.d, z0.d, #0x100000000
     758:	02090001 	.inst	0x02090001 ; undefined
     75c:	0008345c 	.inst	0x0008345c ; undefined
     760:	00000000 	udf	#0
     764:	4b090518 	sub	w24, w8, w9, lsl #1
     768:	05221005 	ext	z5.b, z5.b, z0.b, #20
     76c:	24052005 	cmpeq	p5.b, p0/z, z0.b, z5.d
     770:	03040200 	.inst	0x03040200 ; undefined
     774:	00180521 	.inst	0x00180521 ; undefined
     778:	3c030402 	str	b2, [x0], #48
     77c:	02000f05 	.inst	0x02000f05 ; undefined
     780:	054a0304 	.inst	0x054a0304 ; undefined
     784:	04020024 	.inst	0x04020024 ; undefined
     788:	1c052e03 	ldr	s3, ad48 <MAIR_ATTR+0x6948>
     78c:	03040200 	.inst	0x03040200 ; undefined
     790:	00310520 	.inst	0x00310520 ; NYI
     794:	1f030402 	fmadd	s2, s0, s3, s1
     798:	02001b05 	.inst	0x02001b05 ; undefined
     79c:	053c0104 	ext	z4.b, z4.b, z8.b, #224
     7a0:	04020023 	.inst	0x04020023 ; undefined
     7a4:	0c054a01 	.inst	0x0c054a01 ; undefined
     7a8:	21010532 	.inst	0x21010532 ; undefined
     7ac:	4c0a0531 	.inst	0x4c0a0531 ; undefined
     7b0:	054b0905 	.inst	0x054b0905 ; undefined
     7b4:	04020033 	.inst	0x04020033 ; undefined
     7b8:	1b052301 	madd	w1, w24, w5, w8
     7bc:	01040200 	.inst	0x01040200 ; undefined
     7c0:	002b052e 	.inst	0x002b052e ; NYI
     7c4:	3c010402 	str	b2, [x0], #16
     7c8:	02001f05 	.inst	0x02001f05 ; undefined
     7cc:	052e0104 	ext	z4.b, z4.b, z8.b, #112
     7d0:	04020010 	.inst	0x04020010 ; undefined
     7d4:	15053d01 	b	414fbd8 <TCR_VALUE+0x404fbc8>
     7d8:	01040200 	.inst	0x01040200 ; undefined
     7dc:	3e0e053d 	.inst	0x3e0e053d ; undefined
     7e0:	053c0505 	ext	z5.b, z5.b, z8.b, #225
     7e4:	04020018 	.inst	0x04020018 ; undefined
     7e8:	0f052103 	.inst	0x0f052103 ; undefined
     7ec:	03040200 	.inst	0x03040200 ; undefined
     7f0:	002b054a 	.inst	0x002b054a ; NYI
     7f4:	2e030402 	.inst	0x2e030402 ; undefined
     7f8:	02001c05 	.inst	0x02001c05 ; undefined
     7fc:	053c0304 	ext	z4.b, z4.b, z24.b, #224
     800:	04020023 	.inst	0x04020023 ; undefined
     804:	1c051f03 	ldr	s3, abe4 <MAIR_ATTR+0x67e4>
     808:	01040200 	.inst	0x01040200 ; undefined
     80c:	4014053c 	.inst	0x4014053c ; undefined
     810:	054a0b05 	.inst	0x054a0b05 ; undefined
     814:	11052e18 	add	w24, w16, #0x14b
     818:	2f010530 	mvni	v16.2s, #0x29
     81c:	4b0a0531 	sub	w17, w9, w10, lsl #1
     820:	05760905 	ext	z5.b, {z8.b, z9.b}, #178
     824:	04020033 	.inst	0x04020033 ; undefined
     828:	1b052301 	madd	w1, w24, w5, w8
     82c:	01040200 	.inst	0x01040200 ; undefined
     830:	002b059e 	.inst	0x002b059e ; NYI
     834:	3c010402 	str	b2, [x0], #16
     838:	02001f05 	.inst	0x02001f05 ; undefined
     83c:	052e0104 	ext	z4.b, z4.b, z8.b, #112
     840:	04020010 	.inst	0x04020010 ; undefined
     844:	15053d01 	b	414fc48 <TCR_VALUE+0x404fc38>
     848:	01040200 	.inst	0x01040200 ; undefined
     84c:	3e0e0567 	.inst	0x3e0e0567 ; undefined
     850:	053c0505 	ext	z5.b, z5.b, z8.b, #225
     854:	04020018 	.inst	0x04020018 ; undefined
     858:	0f052103 	.inst	0x0f052103 ; undefined
     85c:	03040200 	.inst	0x03040200 ; undefined
     860:	002b054a 	.inst	0x002b054a ; NYI
     864:	2e030402 	.inst	0x2e030402 ; undefined
     868:	02001c05 	.inst	0x02001c05 ; undefined
     86c:	053c0304 	ext	z4.b, z4.b, z24.b, #224
     870:	04020023 	.inst	0x04020023 ; undefined
     874:	1c051f03 	ldr	s3, ac54 <MAIR_ATTR+0x6854>
     878:	01040200 	.inst	0x01040200 ; undefined
     87c:	400c053c 	.inst	0x400c053c ; undefined
     880:	31210105 	adds	w5, w8, #0x840
     884:	05590905 	mov	z5.h, p9/z, #72
     888:	10052208 	adr	x8, acc8 <MAIR_ATTR+0x68c8>
     88c:	3d18053d 	str	b29, [x9, #1537]
     890:	054a0f05 	.inst	0x054a0f05 ; undefined
     894:	0e052e1c 	smov	w28, v16.b[2]
     898:	310d052f 	adds	w15, w9, #0x341
     89c:	05660a05 	ext	z5.b, {z16.b, z17.b}, #50
     8a0:	01053d0c 	.inst	0x01053d0c ; undefined
     8a4:	0e053121 	tbx	v1.8b, {v9.16b, v10.16b}, v5.8b
     8a8:	2005054b 	.inst	0x2005054b ; undefined
     8ac:	02001b05 	.inst	0x02001b05 ; undefined
     8b0:	05220304 	ext	z4.b, z4.b, z24.b, #16
     8b4:	04020009 	.inst	0x04020009 ; undefined
     8b8:	20053c03 	.inst	0x20053c03 ; undefined
     8bc:	03040200 	.inst	0x03040200 ; undefined
     8c0:	0017052c 	.inst	0x0017052c ; undefined
     8c4:	3c010402 	str	b2, [x0], #16
     8c8:	4d4e0105 	.inst	0x4d4e0105 ; undefined
     8cc:	05ae0905 	uzp1	z5.q, z8.q, z14.q
     8d0:	0b05210d 	add	w13, w8, w5, lsl #8
     8d4:	23050521 	.inst	0x23050521 ; undefined
     8d8:	05920e05 	mov	z5.s, p2/z, #112
     8dc:	13052005 	sbfx	w5, w0, #5, #4
     8e0:	4a0c0521 	eor	w1, w9, w12, lsl #1
     8e4:	052f2b05 	tbl	z5.b, {z24.b, z25.b}, z15.b
     8e8:	2b053c1f 	cmn	w0, w5, lsl #15
     8ec:	2023053c 	.inst	0x2023053c ; undefined
     8f0:	054d0d05 	.inst	0x054d0d05 ; undefined
     8f4:	1b053c1c 	madd	w28, w0, w5, w15
     8f8:	3c0d0520 	str	b0, [x9], #208
     8fc:	05ca1d05 	.inst	0x05ca1d05 ; undefined
     900:	05590824 	mov	z4.h, p9/z, #65
     904:	15056621 	b	415a188 <TCR_VALUE+0x405a178>
     908:	231d053d 	.inst	0x231d053d ; undefined
     90c:	59082405 	.inst	0x59082405 ; undefined
     910:	05662105 	mov	z5.h, z8.h[9]
     914:	1d053d15 	.inst	0x1d053d15 ; undefined
     918:	08240523 	.inst	0x08240523 ; undefined
     91c:	58210559 	ldr	x25, 429c4 <MAIR_ATTR+0x3e5c4>
     920:	053d1505 	ext	z5.b, z5.b, z8.b, #237
     924:	2405231c 	cmpne	p12.b, p0/z, z24.b, z5.d
     928:	21055908 	.inst	0x21055908 ; undefined
     92c:	3d150558 	str	b24, [x10, #1345]
     930:	05232705 	.inst	0x05232705 ; undefined
     934:	16053c2b 	b	fffffffff814f9e0 <IRQ_SOURCE_EL0_CORE_0+0xffffb814f980>
     938:	0029054b 	.inst	0x0029054b ; NYI
     93c:	03020402 	.inst	0x03020402 ; undefined
     940:	1b053c64 	madd	w4, w3, w5, w15
     944:	01040200 	.inst	0x01040200 ; undefined
     948:	001f053c 	.inst	0x001f053c ; undefined
     94c:	4a010402 	eor	w2, w0, w1, lsl #1
     950:	21030505 	.inst	0x21030505 ; undefined
     954:	3f0c052e 	.inst	0x3f0c052e ; undefined
     958:	02210105 	.inst	0x02210105 ; undefined
     95c:	01010003 	.inst	0x01010003 ; undefined
     960:	000000a9 	udf	#169
     964:	00080005 	.inst	0x00080005 ; undefined
     968:	0000003d 	udf	#61
     96c:	fb010104 	.inst	0xfb010104 ; undefined
     970:	01000d0e 	.inst	0x01000d0e ; undefined
     974:	00010101 	.inst	0x00010101 ; undefined
     978:	00010000 	.inst	0x00010000 ; undefined
     97c:	01010100 	.inst	0x01010100 ; undefined
     980:	0000021f 	udf	#543
     984:	00a00000 	.inst	0x00a00000 ; undefined
     988:	01020000 	.inst	0x01020000 ; undefined
     98c:	050f021f 	.inst	0x050f021f ; undefined
     990:	0000019e 	udf	#414
     994:	00019e00 	.inst	0x00019e00 ; undefined
     998:	00a60000 	.inst	0x00a60000 ; undefined
     99c:	c3010000 	.inst	0xc3010000 ; undefined
     9a0:	01000000 	.inst	0x01000000 ; undefined
     9a4:	00000113 	udf	#275
     9a8:	00110501 	.inst	0x00110501 ; undefined
     9ac:	3ae80209 	.inst	0x3ae80209 ; undefined
     9b0:	00000008 	udf	#8
     9b4:	0c030000 	.inst	0x0c030000 ; undefined
     9b8:	2f050501 	mvni	v1.2s, #0xa8
     9bc:	0d052721 	.inst	0x0d052721 ; undefined
     9c0:	05200b03 	ext	z3.b, z3.b, z24.b, #2
     9c4:	09052e05 	.inst	0x09052e05 ; undefined
     9c8:	a63b0521 	.inst	0xa63b0521 ; undefined
     9cc:	052e3905 	.inst	0x052e3905 ; undefined
     9d0:	05213e11 	.inst	0x05213e11 ; undefined
     9d4:	5405223c 	bc.gt	ae18 <MAIR_ATTR+0x6a18>
     9d8:	2e3a052e 	uhadd	v14.8b, v9.8b, v26.8b
     9dc:	213d1105 	.inst	0x213d1105 ; undefined
     9e0:	05223c05 	.inst	0x05223c05 ; undefined
     9e4:	3a052e54 	.inst	0x3a052e54 ; undefined
     9e8:	3d12052e 	str	b14, [x9, #1153]
     9ec:	00250521 	.inst	0x00250521 ; NYI
     9f0:	03020402 	.inst	0x03020402 ; undefined
     9f4:	1605206c 	b	fffffffff8148ba4 <IRQ_SOURCE_EL0_CORE_0+0xffffb8148b44>
     9f8:	01040200 	.inst	0x01040200 ; undefined
     9fc:	0305053c 	.inst	0x0305053c ; undefined
     a00:	0c056618 	.inst	0x0c056618 ; undefined
     a04:	21010522 	.inst	0x21010522 ; undefined
     a08:	01000202 	.inst	0x01000202 ; undefined
     a0c:	0000a201 	udf	#41473
     a10:	08000500 	stxrb	w0, w0, [x8]
     a14:	00003c00 	udf	#15360
     a18:	01010400 	.inst	0x01010400 ; undefined
     a1c:	000d0efb 	.inst	0x000d0efb ; undefined
     a20:	01010101 	.inst	0x01010101 ; undefined
     a24:	01000000 	.inst	0x01000000 ; undefined
     a28:	01010000 	.inst	0x01010000 ; undefined
     a2c:	00031f01 	.inst	0x00031f01 ; undefined
     a30:	66000000 	.inst	0x66000000 ; undefined
     a34:	a0000000 	.inst	0xa0000000 ; undefined
     a38:	02000000 	.inst	0x02000000 ; undefined
     a3c:	0f021f01 	.inst	0x0f021f01 ; undefined
     a40:	0001a804 	.inst	0x0001a804 ; undefined
     a44:	01a80100 	.inst	0x01a80100 ; undefined
     a48:	a6010000 	.inst	0xa6010000 ; undefined
     a4c:	02000000 	.inst	0x02000000 ; undefined
     a50:	000001ad 	udf	#429
     a54:	00250502 	.inst	0x00250502 ; NYI
     a58:	3bc80209 	.inst	0x3bc80209 ; undefined
     a5c:	00000008 	udf	#8
     a60:	0a030000 	and	w0, w0, w3
     a64:	14010501 	b	41e68 <MAIR_ATTR+0x3da68>
     a68:	05301005 	ext	z5.b, z5.b, z0.b, #132
     a6c:	0e051401 	.inst	0x0e051401 ; undefined
     a70:	14010530 	b	41f30 <MAIR_ATTR+0x3db30>
     a74:	05311505 	ext	z5.b, z5.b, z8.b, #141
     a78:	01053005 	.inst	0x01053005 ; undefined
     a7c:	3e35053d 	.inst	0x3e35053d ; undefined
     a80:	09031905 	.inst	0x09031905 ; undefined
     a84:	5917052e 	.inst	0x5917052e ; undefined
     a88:	055a1d05 	mov	z5.h, p10/z, #-24
     a8c:	09052e31 	.inst	0x09052e31 ; undefined
     a90:	2f30052e 	ushr	v14.2s, v9.2s, #16
     a94:	052e1105 	ext	z5.b, z5.b, z8.b, #116
     a98:	673d3017 	.inst	0x673d3017 ; undefined
     a9c:	052f1605 	ext	z5.b, z5.b, z16.b, #125
     aa0:	22053001 	.inst	0x22053001 ; undefined
     aa4:	1401053e 	b	41f9c <MAIR_ATTR+0x3db9c>
     aa8:	05311d05 	ext	z5.b, z5.b, z8.b, #143
     aac:	02021401 	.inst	0x02021401 ; undefined
     ab0:	64010100 	.inst	0x64010100 ; undefined
     ab4:	05000000 	orr	z0.s, z0.s, #0x1
     ab8:	2e000800 	ext	v0.8b, v0.8b, v0.8b, #1
     abc:	04000000 	add	z0.b, p0/m, z0.b, z0.b
     ac0:	0efb0101 	.inst	0x0efb0101 ; undefined
     ac4:	0101000d 	.inst	0x0101000d ; undefined
     ac8:	00000101 	udf	#257
     acc:	00000100 	udf	#256
     ad0:	1f010101 	fmadd	s1, s8, s1, s0
     ad4:	00000002 	udf	#2
     ad8:	00006600 	udf	#26112
     adc:	1f010200 	fmadd	s0, s16, s1, s0
     ae0:	b5020f02 	cbnz	x2, 4cc0 <MAIR_ATTR+0x8c0>
     ae4:	01000001 	.inst	0x01000001 ; undefined
     ae8:	000001b5 	udf	#437
     aec:	00230501 	.inst	0x00230501 ; NYI
     af0:	3ca80209 	.inst	0x3ca80209 ; undefined
     af4:	00000008 	udf	#8
     af8:	05150000 	mov	z0.b, p5/z, #0
     afc:	26051401 	.inst	0x26051401 ; undefined
     b00:	2f0c0530 	ushr	v16.8b, v9.8b, #4
     b04:	05210105 	ext	z5.b, z5.b, z8.b, #8
     b08:	0c05302a 	.inst	0x0c05302a ; undefined
     b0c:	2101052f 	.inst	0x2101052f ; undefined
     b10:	05301c05 	ext	z5.b, z5.b, z0.b, #135
     b14:	02021401 	.inst	0x02021401 ; undefined
     b18:	94010100 	bl	40f18 <MAIR_ATTR+0x3cb18>
     b1c:	05000000 	orr	z0.s, z0.s, #0x1
     b20:	41000800 	.inst	0x41000800 ; undefined
     b24:	04000000 	add	z0.b, p0/m, z0.b, z0.b
     b28:	0efb0101 	.inst	0x0efb0101 ; undefined
     b2c:	0101000d 	.inst	0x0101000d ; undefined
     b30:	00000101 	udf	#257
     b34:	00000100 	udf	#256
     b38:	1f010101 	fmadd	s1, s8, s1, s0
     b3c:	00000003 	udf	#3
     b40:	00007300 	udf	#29440
     b44:	0000a000 	udf	#40960
     b48:	1f010200 	fmadd	s0, s16, s1, s0
     b4c:	cb050f02 	sub	x2, x24, x5, lsl #3
     b50:	01000001 	.inst	0x01000001 ; undefined
     b54:	000001cb 	udf	#459
     b58:	0000a601 	udf	#42497
     b5c:	00c30200 	.inst	0x00c30200 ; undefined
     b60:	ae020000 	.inst	0xae020000 ; undefined
     b64:	02000000 	.inst	0x02000000 ; undefined
     b68:	09001805 	.inst	0x09001805 ; undefined
     b6c:	083ce002 	.inst	0x083ce002 ; undefined
     b70:	00000000 	udf	#0
     b74:	010a0300 	.inst	0x010a0300 ; undefined
     b78:	05311605 	ext	z5.b, z5.b, z16.b, #141
     b7c:	14052028 	b	148c1c <TCR_VALUE+0x48c0c>
     b80:	410f0574 	.inst	0x410f0574 ; undefined
     b84:	052e1e05 	ext	z5.b, z5.b, z16.b, #119
     b88:	1c052f0f 	ldr	s15, b168 <MAIR_ATTR+0x6d68>
     b8c:	2f0f052e 	ushr	v14.8b, v9.8b, #1
     b90:	052e1b05 	ext	z5.b, z5.b, z24.b, #118
     b94:	1f053001 	fmadd	s1, s0, s5, s12
     b98:	053c0d03 	ext	z3.b, z3.b, z8.b, #227
     b9c:	0f05310a 	.inst	0x0f05310a ; undefined
     ba0:	08080576 	stxrb	w8, w22, [x11]
     ba4:	2f090512 	ushr	v18.8b, v8.8b, #7
     ba8:	053f0505 	ext	z5.b, z5.b, z8.b, #249
     bac:	03024b01 	.inst	0x03024b01 ; undefined
     bb0:	4c010100 	.inst	0x4c010100 ; undefined
     bb4:	05000000 	orr	z0.s, z0.s, #0x1
     bb8:	2e000800 	ext	v0.8b, v0.8b, v0.8b, #1
     bbc:	04000000 	add	z0.b, p0/m, z0.b, z0.b
     bc0:	0efb0101 	.inst	0x0efb0101 ; undefined
     bc4:	0101000d 	.inst	0x0101000d ; undefined
     bc8:	00000101 	udf	#257
     bcc:	00000100 	udf	#256
     bd0:	1f010101 	fmadd	s1, s8, s1, s0
     bd4:	00000002 	udf	#2
     bd8:	00007300 	udf	#29440
     bdc:	1f010200 	fmadd	s0, s16, s1, s0
     be0:	da020f02 	.inst	0xda020f02 ; undefined
     be4:	01000001 	.inst	0x01000001 ; undefined
     be8:	000001da 	udf	#474
     bec:	00160501 	.inst	0x00160501 ; undefined
     bf0:	3de80209 	ldr	q9, [x16, #40960]
     bf4:	00000008 	udf	#8
     bf8:	05160000 	mov	z0.b, p6/z, #0
     bfc:	02021401 	.inst	0x02021401 ; undefined
     c00:	6f010100 	.inst	0x6f010100 ; undefined
     c04:	05000001 	orr	z1.s, z1.s, #0x1
     c08:	3c000800 	.inst	0x3c000800 ; undefined
     c0c:	04000000 	add	z0.b, p0/m, z0.b, z0.b
     c10:	0efb0101 	.inst	0x0efb0101 ; undefined
     c14:	0101000d 	.inst	0x0101000d ; undefined
     c18:	00000101 	udf	#257
     c1c:	00000100 	udf	#256
     c20:	1f010101 	fmadd	s1, s8, s1, s0
     c24:	00000003 	udf	#3
     c28:	00007300 	udf	#29440
     c2c:	0000a000 	udf	#40960
     c30:	1f010200 	fmadd	s0, s16, s1, s0
     c34:	e7040f02 	.inst	0xe7040f02 ; undefined
     c38:	01000001 	.inst	0x01000001 ; undefined
     c3c:	000001e7 	udf	#487
     c40:	0000a601 	udf	#42497
     c44:	00c30200 	.inst	0x00c30200 ; undefined
     c48:	05020000 	orr	z0.d, z0.d, #0x1
     c4c:	02090016 	.inst	0x02090016 ; undefined
     c50:	00083df0 	.inst	0x00083df0 ; undefined
     c54:	00000000 	udf	#0
     c58:	2f050516 	mvni	v22.2s, #0xa8
     c5c:	052f3e3d 	.inst	0x052f3e3d ; undefined
     c60:	1705300d 	b	fffffffffc14cc94 <IRQ_SOURCE_EL0_CORE_0+0xffffbc14cc34>
     c64:	2f01052e 	mvni	v14.2s, #0x29
     c68:	053f3405 	.inst	0x053f3405 ; undefined
     c6c:	0d054b10 	.inst	0x0d054b10 ; undefined
     c70:	2e1a0522 	.inst	0x2e1a0522 ; undefined
     c74:	052f0d05 	ext	z5.b, z5.b, z8.b, #123
     c78:	0d052e16 	.inst	0x0d052e16 ; undefined
     c7c:	2e1b052f 	.inst	0x2e1b052f ; undefined
     c80:	052f0d05 	ext	z5.b, z5.b, z8.b, #123
     c84:	09052e17 	.inst	0x09052e17 ; undefined
     c88:	220b052f 	.inst	0x220b052f ; undefined
     c8c:	05221f05 	ext	z5.b, z5.b, z24.b, #23
     c90:	15053c12 	b	414fcd8 <TCR_VALUE+0x404fcc8>
     c94:	2f1b053c 	ushr	v28.4h, v9.4h, #5
     c98:	053a1805 	ext	z5.b, z5.b, z0.b, #214
     c9c:	10053c21 	adr	x1, b420 <MAIR_ATTR+0x7020>
     ca0:	2d160520 	stp	s0, s1, [x9, #176]
     ca4:	053c1f05 	ext	z5.b, z5.b, z24.b, #231
     ca8:	1c05200c 	ldr	s12, b0a8 <MAIR_ATTR+0x6ca8>
     cac:	3c0b0535 	str	b21, [x9], #176
     cb0:	05221005 	ext	z5.b, z5.b, z0.b, #20
     cb4:	1d052e08 	.inst	0x1d052e08 ; undefined
     cb8:	01040200 	.inst	0x01040200 ; undefined
     cbc:	3d15052e 	str	b14, [x9, #1345]
     cc0:	052e0d05 	ext	z5.b, z5.b, z8.b, #115
     cc4:	04020023 	.inst	0x04020023 ; undefined
     cc8:	0d052e01 	.inst	0x0d052e01 ; undefined
     ccc:	0029053d 	.inst	0x0029053d ; NYI
     cd0:	4a010402 	eor	w2, w0, w1, lsl #1
     cd4:	05300c05 	ext	z5.b, z5.b, z0.b, #131
     cd8:	34052101 	cbz	w1, b0f8 <MAIR_ATTR+0x6cf8>
     cdc:	4b100531 	sub	w17, w9, w16, lsl #1
     ce0:	05220d05 	ext	z5.b, z5.b, z8.b, #19
     ce4:	0d052e1a 	.inst	0x0d052e1a ; undefined
     ce8:	2e16052f 	.inst	0x2e16052f ; undefined
     cec:	052f0d05 	ext	z5.b, z5.b, z8.b, #123
     cf0:	0d052e1b 	.inst	0x0d052e1b ; undefined
     cf4:	2e17052f 	.inst	0x2e17052f ; undefined
     cf8:	052f0905 	ext	z5.b, z5.b, z8.b, #122
     cfc:	1f05220b 	fmadd	s11, s16, s5, s8
     d00:	3c120522 	str	b2, [x9], #-224
     d04:	053c1505 	ext	z5.b, z5.b, z8.b, #229
     d08:	18052f1b 	ldr	w27, b2e8 <MAIR_ATTR+0x6ee8>
     d0c:	3c21053a 	.inst	0x3c21053a ; undefined
     d10:	05201005 	ext	z5.b, z5.b, z0.b, #4
     d14:	1f052d16 	fmadd	s22, s8, s5, s11
     d18:	200c053c 	.inst	0x200c053c ; undefined
     d1c:	211b0535 	.inst	0x211b0535 ; undefined
     d20:	053c0e05 	ext	z5.b, z5.b, z16.b, #227
     d24:	17053c11 	b	fffffffffc14fd68 <IRQ_SOURCE_EL0_CORE_0+0xffffbc14fd08>
     d28:	3a25052f 	.inst	0x3a25052f ; undefined
     d2c:	02003105 	.inst	0x02003105 ; undefined
     d30:	054a0104 	.inst	0x054a0104 ; undefined
     d34:	0402003a 	.inst	0x0402003a ; undefined
     d38:	25053c01 	cmplt	p1.b, p7/z, z0.b, #5
     d3c:	01040200 	.inst	0x01040200 ; undefined
     d40:	331c0520 	bfi	w0, w9, #4, #2
     d44:	053c0b05 	ext	z5.b, z5.b, z24.b, #226
     d48:	08052210 	stxrb	w5, w16, [x16]
     d4c:	001d052e 	.inst	0x001d052e ; undefined
     d50:	2e010402 	.inst	0x2e010402 ; undefined
     d54:	053d1505 	ext	z5.b, z5.b, z8.b, #237
     d58:	23052e0d 	.inst	0x23052e0d ; undefined
     d5c:	01040200 	.inst	0x01040200 ; undefined
     d60:	3d0d052e 	str	b14, [x9, #833]
     d64:	02002905 	.inst	0x02002905 ; undefined
     d68:	054a0104 	.inst	0x054a0104 ; undefined
     d6c:	0105300c 	.inst	0x0105300c ; undefined
     d70:	00020222 	.inst	0x00020222 ; undefined
     d74:	01430101 	.inst	0x01430101 ; undefined
     d78:	00050000 	.inst	0x00050000 ; undefined
     d7c:	003c0008 	.inst	0x003c0008 ; NYI
     d80:	01040000 	.inst	0x01040000 ; undefined
     d84:	0d0efb01 	.inst	0x0d0efb01 ; undefined
     d88:	01010100 	.inst	0x01010100 ; undefined
     d8c:	00000001 	udf	#1
     d90:	01000001 	.inst	0x01000001 ; undefined
     d94:	031f0101 	.inst	0x031f0101 ; undefined
     d98:	00000000 	udf	#0
     d9c:	00000073 	udf	#115
     da0:	000000a0 	udf	#160
     da4:	021f0102 	.inst	0x021f0102 ; undefined
     da8:	01f4040f 	.inst	0x01f4040f ; undefined
     dac:	f4010000 	.inst	0xf4010000 ; undefined
     db0:	01000001 	.inst	0x01000001 ; undefined
     db4:	000000a6 	udf	#166
     db8:	0000c302 	udf	#49922
     dbc:	24050200 	cmphs	p0.b, p0/z, z16.b, z5.b
     dc0:	dc020900 	.inst	0xdc020900 ; undefined
     dc4:	00000840 	udf	#2112
     dc8:	15000000 	b	4000dc8 <TCR_VALUE+0x3f00db8>
     dcc:	05140105 	mov	z5.b, p4/z, #8
     dd0:	0b053029 	add	w9, w1, w5, lsl #12
     dd4:	0521212f 	mov	z15.b, b9
     dd8:	09052205 	.inst	0x09052205 ; undefined
     ddc:	05660b03 	ext	z3.b, {z24.b, z25.b}, #50
     de0:	20780313 	.inst	0x20780313 ; undefined
     de4:	052f1105 	ext	z5.b, z5.b, z8.b, #124
     de8:	13052f09 	sbfx	w9, w24, #5, #7
     dec:	2f110522 	ushr	v2.4h, v9.4h, #15
     df0:	052f0905 	ext	z5.b, z5.b, z8.b, #122
     df4:	1605250e 	b	fffffffff814a22c <IRQ_SOURCE_EL0_CORE_0+0xffffb814a1cc>
     df8:	230e052e 	.inst	0x230e052e ; undefined
     dfc:	052e1805 	ext	z5.b, z5.b, z0.b, #118
     e00:	18052f0e 	ldr	w14, b3e0 <MAIR_ATTR+0x6fe0>
     e04:	230e052e 	.inst	0x230e052e ; undefined
     e08:	052e1805 	ext	z5.b, z5.b, z0.b, #118
     e0c:	1805310e 	ldr	w14, b42c <MAIR_ATTR+0x702c>
     e10:	230e052e 	.inst	0x230e052e ; undefined
     e14:	052e1605 	ext	z5.b, z5.b, z16.b, #117
     e18:	19052f01 	.inst	0x19052f01 ; undefined
     e1c:	2f0b053e 	ushr	v30.8b, v9.8b, #5
     e20:	02001505 	.inst	0x02001505 ; undefined
     e24:	05200104 	ext	z4.b, z4.b, z8.b, #0
     e28:	0402001d 	.inst	0x0402001d ; undefined
     e2c:	0c053c01 	.inst	0x0c053c01 ; undefined
     e30:	01040200 	.inst	0x01040200 ; undefined
     e34:	2f0e0520 	ushr	v0.8b, v9.8b, #2
     e38:	052e1605 	ext	z5.b, z5.b, z16.b, #117
     e3c:	1e052f01 	.inst	0x1e052f01 ; undefined
     e40:	1401053e 	b	42338 <MAIR_ATTR+0x3df38>
     e44:	05301c05 	ext	z5.b, z5.b, z0.b, #135
     e48:	1505300b 	b	414ce74 <TCR_VALUE+0x404ce64>
     e4c:	01040200 	.inst	0x01040200 ; undefined
     e50:	001d0520 	.inst	0x001d0520 ; undefined
     e54:	3c010402 	str	b2, [x0], #16
     e58:	02000c05 	.inst	0x02000c05 ; undefined
     e5c:	05200104 	ext	z4.b, z4.b, z8.b, #0
     e60:	16052f0e 	b	fffffffff814ca98 <IRQ_SOURCE_EL0_CORE_0+0xffffb814ca38>
     e64:	2f01052e 	mvni	v14.2s, #0x29
     e68:	053e1605 	ext	z5.b, z5.b, z16.b, #245
     e6c:	1505130b 	b	4145a98 <TCR_VALUE+0x4045a88>
     e70:	01040200 	.inst	0x01040200 ; undefined
     e74:	001d0520 	.inst	0x001d0520 ; undefined
     e78:	3c010402 	str	b2, [x0], #16
     e7c:	02000c05 	.inst	0x02000c05 ; undefined
     e80:	05200104 	ext	z4.b, z4.b, z8.b, #0
     e84:	01053015 	.inst	0x01053015 ; undefined
     e88:	2224054b 	.inst	0x2224054b ; undefined
     e8c:	053d0e05 	ext	z5.b, z5.b, z16.b, #235
     e90:	1c052005 	ldr	s5, b290 <MAIR_ATTR+0x6e90>
     e94:	03040200 	.inst	0x03040200 ; undefined
     e98:	00090521 	.inst	0x00090521 ; undefined
     e9c:	3c030402 	str	b2, [x0], #48
     ea0:	02002605 	.inst	0x02002605 ; undefined
     ea4:	052d0304 	ext	z4.b, z4.b, z24.b, #104
     ea8:	04020018 	.inst	0x04020018 ; undefined
     eac:	1c053c01 	ldr	s1, b62c <MAIR_ATTR+0x722c>
     eb0:	01040200 	.inst	0x01040200 ; undefined
     eb4:	3101054a 	adds	w10, w10, #0x41
     eb8:	01000402 	.inst	0x01000402 ; undefined
     ebc:	0000a601 	udf	#42497
     ec0:	08000500 	stxrb	w0, w0, [x8]
     ec4:	00004100 	udf	#16640
     ec8:	01010400 	.inst	0x01010400 ; undefined
     ecc:	000d0efb 	.inst	0x000d0efb ; undefined
     ed0:	01010101 	.inst	0x01010101 ; undefined
     ed4:	01000000 	.inst	0x01000000 ; undefined
     ed8:	01010000 	.inst	0x01010000 ; undefined
     edc:	00031f01 	.inst	0x00031f01 ; undefined
     ee0:	73000000 	.inst	0x73000000 ; undefined
     ee4:	a0000000 	.inst	0xa0000000 ; undefined
     ee8:	02000000 	.inst	0x02000000 ; undefined
     eec:	0f021f01 	.inst	0x0f021f01 ; undefined
     ef0:	00020205 	.inst	0x00020205 ; undefined
     ef4:	02020100 	.inst	0x02020100 ; undefined
     ef8:	a6010000 	.inst	0xa6010000 ; undefined
     efc:	02000000 	.inst	0x02000000 ; undefined
     f00:	000000c3 	udf	#195
     f04:	0000ae02 	udf	#44546
     f08:	1e050200 	.inst	0x1e050200 ; undefined
     f0c:	b0020900 	adrp	x0, 4121000 <TCR_VALUE+0x4020ff0>
     f10:	00000842 	udf	#2114
     f14:	16000000 	b	fffffffff8000f14 <IRQ_SOURCE_EL0_CORE_0+0xffffb8000eb4>
     f18:	3d300505 	str	b5, [x8, #3073]
     f1c:	59595959 	.inst	0x59595959 ; undefined
     f20:	05595959 	mov	z25.h, p9/m, #-54
     f24:	1f053e01 	fmadd	s1, s16, s5, s15
     f28:	2f05053e 	mvni	v30.2s, #0xa9
     f2c:	5959593d 	.inst	0x5959593d ; undefined
     f30:	01055959 	.inst	0x01055959 ; undefined
     f34:	3e2b053e 	.inst	0x3e2b053e ; undefined
     f38:	053d0505 	ext	z5.b, z5.b, z8.b, #233
     f3c:	0816030d 	stxrb	w22, w13, [x24]
     f40:	03110520 	.inst	0x03110520 ; undefined
     f44:	0d05206d 	.inst	0x0d05206d ; undefined
     f48:	23110522 	.inst	0x23110522 ; undefined
     f4c:	03220d05 	.inst	0x03220d05 ; undefined
     f50:	292c200c 	stp	w12, w8, [x0, #-160]
     f54:	09030105 	.inst	0x09030105 ; undefined
     f58:	3e1a0520 	.inst	0x3e1a0520 ; undefined
     f5c:	05310505 	ext	z5.b, z5.b, z8.b, #137
     f60:	03023001 	.inst	0x03023001 ; undefined
     f64:	dc010100 	.inst	0xdc010100 ; undefined
     f68:	05000000 	orr	z0.s, z0.s, #0x1
     f6c:	41000800 	.inst	0x41000800 ; undefined
     f70:	04000000 	add	z0.b, p0/m, z0.b, z0.b
     f74:	0efb0101 	.inst	0x0efb0101 ; undefined
     f78:	0101000d 	.inst	0x0101000d ; undefined
     f7c:	00000101 	udf	#257
     f80:	00000100 	udf	#256
     f84:	1f010101 	fmadd	s1, s8, s1, s0
     f88:	00000003 	udf	#3
     f8c:	00007300 	udf	#29440
     f90:	0000a000 	udf	#40960
     f94:	1f010200 	fmadd	s0, s16, s1, s0
     f98:	12050f02 	and	w2, w24, #0x78000000
     f9c:	01000002 	.inst	0x01000002 ; undefined
     fa0:	00000212 	udf	#530
     fa4:	0000a601 	udf	#42497
     fa8:	00c30200 	.inst	0x00c30200 ; undefined
     fac:	f3020000 	.inst	0xf3020000 ; undefined
     fb0:	02000000 	.inst	0x02000000 ; undefined
     fb4:	09003c05 	.inst	0x09003c05 ; undefined
     fb8:	08449c02 	ldaxrb	w2, [x0]
     fbc:	00000000 	udf	#0
     fc0:	1c051600 	ldr	s0, b280 <MAIR_ATTR+0x6e80>
     fc4:	4a20053e 	eon	w30, w9, w0, lsl #1
     fc8:	2fc80805 	.inst	0x2fc80805 ; undefined
     fcc:	05761d05 	ext	z5.b, {z8.b, z9.b}, #183
     fd0:	09052029 	.inst	0x09052029 ; undefined
     fd4:	3d150520 	str	b0, [x9, #1345]
     fd8:	053c1105 	ext	z5.b, z5.b, z8.b, #228
     fdc:	1a052e0e 	.inst	0x1a052e0e ; undefined
     fe0:	3c0e053d 	str	b29, [x9], #224
     fe4:	201a053e 	.inst	0x201a053e ; undefined
     fe8:	05202605 	.inst	0x05202605 ; undefined
     fec:	21053d01 	.inst	0x21053d01 ; undefined
     ff0:	3d0e053e 	str	b30, [x9, #897]
     ff4:	05201c05 	ext	z5.b, z5.b, z0.b, #7
     ff8:	3f052105 	.inst	0x3f052105 ; undefined
     ffc:	2e340530 	uhadd	v16.8b, v9.8b, v20.8b
    1000:	052e0e05 	ext	z5.b, z5.b, z16.b, #115
    1004:	3005202a 	adr	x10, b409 <MAIR_ATTR+0x7009>
    1008:	5905053c 	.inst	0x5905053c ; undefined
    100c:	05300e05 	ext	z5.b, z5.b, z16.b, #131
    1010:	0e05201c 	tbl	v28.8b, {v0.16b, v1.16b}, v5.8b
    1014:	202a0521 	.inst	0x202a0521 ; undefined
    1018:	053c3005 	tbl	z5.b, {z0.b}, z28.b
    101c:	1b055901 	madd	w1, w8, w5, w22
    1020:	2f13053f 	ushr	v31.4h, v9.4h, #13
    1024:	053c0905 	ext	z5.b, z5.b, z8.b, #226
    1028:	2605220e 	.inst	0x2605220e ; undefined
    102c:	2f010520 	mvni	v0.2s, #0x29
    1030:	053e1d05 	ext	z5.b, z5.b, z8.b, #247
    1034:	09052f13 	.inst	0x09052f13 ; undefined
    1038:	220e053c 	.inst	0x220e053c ; undefined
    103c:	05202805 	tbl	z5.b, {z0.b, z1.b}, z0.b
    1040:	03022f01 	.inst	0x03022f01 ; undefined
    1044:	60010100 	.inst	0x60010100 ; undefined
    1048:	05000000 	orr	z0.s, z0.s, #0x1
    104c:	33000800 	bfxil	w0, w0, #0, #3
    1050:	04000000 	add	z0.b, p0/m, z0.b, z0.b
    1054:	0efb0101 	.inst	0x0efb0101 ; undefined
    1058:	0101000d 	.inst	0x0101000d ; undefined
    105c:	00000101 	udf	#257
    1060:	00000100 	udf	#256
    1064:	1f010101 	fmadd	s1, s8, s1, s0
    1068:	00000002 	udf	#2
    106c:	0000a000 	udf	#40960
    1070:	1f010200 	fmadd	s0, s16, s1, s0
    1074:	19030f02 	.inst	0x19030f02 ; undefined
    1078:	00000002 	udf	#2
    107c:	00000219 	udf	#537
    1080:	0000a600 	udf	#42496
    1084:	12050100 	and	w0, w8, #0x8000000
    1088:	6c020900 	stnp	d0, d2, [x8, #32]
    108c:	00000846 	udf	#2118
    1090:	15000000 	b	4001090 <TCR_VALUE+0x3f01080>
    1094:	05310905 	ext	z5.b, z5.b, z8.b, #138
    1098:	2e0e0305 	ext	v5.8b, v24.8b, v14.8b, #0
    109c:	33180534 	bfi	w20, w9, #8, #2
    10a0:	05790c05 	ext	z5.b, {z0.b, z1.b}, #203
    10a4:	02024b01 	.inst	0x02024b01 ; undefined
    10a8:	Address 0x00000000000010a8 is out of bounds.


Disassembly of section .debug_line_str:

0000000000000000 <.debug_line_str>:
   0:	6d6f682f 	ldp	d15, d26, [x1, #-272]
   4:	75792f65 	.inst	0x75792f65 ; undefined
   8:	442f6e61 	.inst	0x442f6e61 ; undefined
   c:	746b7365 	.inst	0x746b7365 ; undefined
  10:	702f706f 	adr	x15, 5ee1f <MAIR_ATTR+0x5aa1f>
  14:	656a6f72 	fnmls	z18.h, p3/m, z27.h, z10.h
  18:	2f737463 	.inst	0x2f737463 ; undefined
  1c:	625f6970 	.inst	0x625f6970 ; undefined
  20:	6d657261 	ldp	d1, d28, [x19, #-432]
  24:	6c617465 	ldnp	d5, d29, [x3, #-496]
  28:	3369702f 	.inst	0x3369702f ; undefined
  2c:	726f6300 	.inst	0x726f6300 ; undefined
  30:	6d730065 	ldp	d5, d0, [x3, #-208]
  34:	00532e74 	.inst	0x00532e74 ; undefined
  38:	65746e69 	fnmls	z9.h, p3/m, z19.h, z20.h
  3c:	70757272 	adr	x18, eae8b <__kernel_end_addr+0x52843>
  40:	72690074 	.inst	0x72690074 ; undefined
  44:	00532e71 	.inst	0x00532e71 ; undefined
  48:	6c697475 	ldnp	d21, d29, [x3, #-368]
  4c:	00797469 	.inst	0x00797469 ; undefined
  50:	6c697475 	ldnp	d21, d29, [x3, #-368]
  54:	2e797469 	uabd	v9.4h, v3.4h, v25.4h
  58:	6f620053 	mla	v19.8h, v2.8h, v2.h[2]
  5c:	6300746f 	.inst	0x6300746f ; undefined
  60:	2e307472 	uabd	v18.8b, v3.8b, v16.8b
  64:	6d6d0053 	ldp	d19, d0, [x2, #-304]
  68:	5f6d6d00 	.inst	0x5f6d6d00 ; undefined
  6c:	6c697475 	ldnp	d21, d29, [x3, #-368]
  70:	6400532e 	.inst	0x6400532e ; undefined
  74:	63697665 	.inst	0x63697665 ; undefined
  78:	69740065 	ldpsw	x5, x0, [x3, #-96]
  7c:	5f72656d 	.inst	0x5f72656d ; undefined
  80:	65746e69 	fnmls	z9.h, p3/m, z19.h, z20.h
  84:	63616672 	.inst	0x63616672 ; undefined
  88:	00532e65 	.inst	0x00532e65 ; undefined
  8c:	75626564 	.inst	0x75626564 ; undefined
  90:	65642f67 	fmls	z7.h, p3/m, z27.h, z4.h
  94:	2e677562 	uabd	v2.4h, v11.4h, v7.4h
  98:	65640063 	fmla	z3.h, p0/m, z3.h, z4.h
  9c:	00677562 	.inst	0x00677562 ; undefined
  a0:	6e692f2e 	uqsub	v14.8h, v25.8h, v9.8h
  a4:	79740063 	ldrh	w3, [x3, #6656]
  a8:	2e736570 	umax	v16.4h, v11.4h, v19.4h
  ac:	72700068 	.inst	0x72700068 ; undefined
  b0:	2e746e69 	umin	v9.4h, v19.4h, v20.4h
  b4:	6f630068 	mla	v8.8h, v3.8h, v3.h[2]
  b8:	632f6572 	.inst	0x632f6572 ; undefined
  bc:	3265726f 	.inst	0x3265726f ; undefined
  c0:	6400632e 	.inst	0x6400632e ; undefined
  c4:	63697665 	.inst	0x63697665 ; undefined
  c8:	00682e65 	.inst	0x00682e65 ; undefined
  cc:	65726f63 	fnmls	z3.h, p3/m, z27.h, z18.h
  d0:	726f632f 	.inst	0x726f632f ; undefined
  d4:	632e3365 	.inst	0x632e3365 ; undefined
  d8:	726f6300 	.inst	0x726f6300 ; undefined
  dc:	6f632f65 	.inst	0x6f632f65 ; undefined
  e0:	2e306572 	umax	v18.8b, v11.8b, v16.8b
  e4:	6f630063 	mla	v3.8h, v3.8h, v3.h[2]
  e8:	632f6572 	.inst	0x632f6572 ; undefined
  ec:	3165726f 	adds	w15, w19, #0x95c, lsl #12
  f0:	7500632e 	.inst	0x7500632e ; undefined
  f4:	696c6974 	ldpsw	x20, x26, [x11, #-160]
  f8:	682e7974 	.inst	0x682e7974 ; undefined
  fc:	746e6900 	.inst	0x746e6900 ; undefined
 100:	75727265 	.inst	0x75727265 ; undefined
 104:	692f7470 	stgp	x16, x29, [x3, #-544]
 108:	7265746e 	.inst	0x7265746e ; undefined
 10c:	74707572 	.inst	0x74707572 ; undefined
 110:	6900632e 	stgp	x14, x24, [x25]
 114:	7265746e 	.inst	0x7265746e ; undefined
 118:	74707572 	.inst	0x74707572 ; undefined
 11c:	7300682e 	.inst	0x7300682e ; undefined
 120:	54666c65 	b.pl	cceac <__kernel_end_addr+0x34864>  // b.nfrst
 124:	2f747365 	fcmla	v5.4h, v27.4h, v20.h[1], #270
 128:	666c6573 	.inst	0x666c6573 ; undefined
 12c:	73655474 	.inst	0x73655474 ; undefined
 130:	00632e74 	.inst	0x00632e74 ; undefined
 134:	666c6573 	.inst	0x666c6573 ; undefined
 138:	74736554 	.inst	0x74736554 ; undefined
 13c:	69747500 	ldpsw	x0, x29, [x8, #-96]
 140:	7974696c 	ldrh	w12, [x11, #6708]
 144:	6972702f 	ldpsw	x15, x28, [x1, #-112]
 148:	632e746e 	.inst	0x632e746e ; undefined
 14c:	73752f00 	.inst	0x73752f00 ; undefined
 150:	696c2f72 	ldpsw	x18, x11, [x27, #-160]
 154:	63672f62 	.inst	0x63672f62 ; undefined
 158:	72632d63 	.inst	0x72632d63 ; undefined
 15c:	2f73736f 	fcmla	v15.4h, v27.4h, v19.h[1], #270
 160:	63726161 	.inst	0x63726161 ; undefined
 164:	2d343668 	stp	s8, s13, [x19, #-96]
 168:	756e696c 	.inst	0x756e696c ; undefined
 16c:	6e672d78 	uqsub	v24.8h, v11.8h, v7.8h
 170:	31312f75 	adds	w21, w27, #0xc4b
 174:	636e692f 	.inst	0x636e692f ; undefined
 178:	6564756c 	fnmls	z12.h, p5/m, z11.h, z4.h
 17c:	64747300 	.inst	0x64747300 ; undefined
 180:	2d746e69 	ldp	s9, s27, [x19, #-96]
 184:	2e636367 	rsubhn	v7.4h, v27.4s, v3.4s
 188:	74730068 	.inst	0x74730068 ; undefined
 18c:	67726164 	.inst	0x67726164 ; undefined
 190:	3c00682e 	.inst	0x3c00682e ; undefined
 194:	6c697562 	ldnp	d2, d29, [x11, #-368]
 198:	6e692d74 	uqsub	v20.8h, v11.8h, v9.8h
 19c:	616d003e 	.inst	0x616d003e ; undefined
 1a0:	632e6e69 	.inst	0x632e6e69 ; undefined
 1a4:	2f6d6d00 	.inst	0x2f6d6d00 ; undefined
 1a8:	632e6d6d 	.inst	0x632e6d6d ; undefined
 1ac:	2e6d6d00 	umin	v0.4h, v8.4h, v13.4h
 1b0:	6d6d0068 	ldp	d8, d0, [x3, #-304]
 1b4:	5f6d6d2f 	.inst	0x5f6d6d2f ; undefined
 1b8:	6f6c6c61 	.inst	0x6f6c6c61 ; undefined
 1bc:	6f746163 	umlsl2	v3.4s, v11.8h, v4.h[3]
 1c0:	00632e72 	.inst	0x00632e72 ; undefined
 1c4:	69766564 	ldpsw	x4, x25, [x11, #-80]
 1c8:	742f6563 	.inst	0x742f6563 ; undefined
 1cc:	72656d69 	.inst	0x72656d69 ; undefined
 1d0:	6400632e 	.inst	0x6400632e ; undefined
 1d4:	63697665 	.inst	0x63697665 ; undefined
 1d8:	70732f65 	adr	x5, e67c7 <__kernel_end_addr+0x4e17f>
 1dc:	00632e69 	.inst	0x00632e69 ; undefined
 1e0:	69766564 	ldpsw	x4, x25, [x11, #-80]
 1e4:	692f6563 	stgp	x3, x25, [x11, #-544]
 1e8:	632e6332 	.inst	0x632e6332 ; undefined
 1ec:	76656400 	.inst	0x76656400 ; undefined
 1f0:	2f656369 	umlsl	v9.4s, v27.4h, v5.h[2]
 1f4:	74726175 	.inst	0x74726175 ; undefined
 1f8:	6400632e 	.inst	0x6400632e ; undefined
 1fc:	63697665 	.inst	0x63697665 ; undefined
 200:	65642f65 	fmls	z5.h, p3/m, z27.h, z4.h
 204:	65636976 	fnmls	z22.h, p2/m, z11.h, z3.h
 208:	6400632e 	.inst	0x6400632e ; undefined
 20c:	63697665 	.inst	0x63697665 ; undefined
 210:	70672f65 	adr	x5, ce7ff <__kernel_end_addr+0x361b7>
 214:	632e6f69 	.inst	0x632e6f69 ; undefined
 218:	61747300 	.inst	0x61747300 ; undefined
 21c:	632e7472 	.inst	0x632e7472 ; undefined
	...

Disassembly of section .debug_info:

0000000000000000 <.debug_info>:
       0:	00000025 	udf	#37
       4:	08010005 	stxrb	w1, w5, [x0]
       8:	00000000 	udf	#0
       c:	00000001 	udf	#1
      10:	08010000 	stxrb	w1, w0, [x0]
      14:	00000000 	udf	#0
      18:	0006b000 	.inst	0x0006b000 ; undefined
      1c:	0b000000 	add	w0, w0, w0
      20:	38000000 	sturb	w0, [x0]
      24:	01000000 	.inst	0x01000000 ; undefined
      28:	00002580 	udf	#9600
      2c:	01000500 	.inst	0x01000500 ; undefined
      30:	00001408 	udf	#5128
      34:	00880100 	.inst	0x00880100 ; undefined
      38:	08000000 	stxrb	w0, w0, [x0]
      3c:	00000008 	udf	#8
      40:	22d80000 	.inst	0x22d80000 ; undefined
      44:	00000044 	udf	#68
      48:	0000000b 	udf	#11
      4c:	00000038 	udf	#56
      50:	00258001 	.inst	0x00258001 ; NYI
      54:	00050000 	.inst	0x00050000 ; undefined
      58:	00280801 	.inst	0x00280801 ; NYI
      5c:	14010000 	b	4005c <MAIR_ATTR+0x3bc5c>
      60:	58000001 	ldr	x1, 60 <SW_SYNC_EXCEPTION+0x50>
      64:	00000819 	udf	#2073
      68:	dc000000 	.inst	0xdc000000 ; undefined
      6c:	00005401 	udf	#21505
      70:	00000b00 	udf	#2816
      74:	00003800 	udf	#14336
      78:	1f800100 	.inst	0x1f800100 ; undefined
      7c:	05000000 	orr	z0.s, z0.s, #0x1
      80:	3c080100 	stur	b0, [x8, #128]
      84:	01000000 	.inst	0x01000000 ; undefined
      88:	00000195 	udf	#405
      8c:	0000000c 	udf	#12
      90:	00000066 	udf	#102
      94:	0000000b 	udf	#11
      98:	00000038 	udf	#56
      9c:	00258001 	.inst	0x00258001 ; NYI
      a0:	00050000 	.inst	0x00050000 ; undefined
      a4:	004e0801 	.inst	0x004e0801 ; undefined
      a8:	3e010000 	.inst	0x3e010000 ; undefined
      ac:	00000002 	udf	#2
      b0:	00000820 	udf	#2080
      b4:	90000000 	adrp	x0, 0 <EL0>
      b8:	00007220 	udf	#29216
      bc:	00000b00 	udf	#2816
      c0:	00003800 	udf	#14336
      c4:	24800100 	cmphs	p0.s, p0/z, z8.s, z0.s
      c8:	05000000 	orr	z0.s, z0.s, #0x1
      cc:	62080100 	.inst	0x62080100 ; undefined
      d0:	01000000 	.inst	0x01000000 ; undefined
      d4:	000002da 	udf	#730
      d8:	00083010 	.inst	0x00083010 ; undefined
      dc:	00000000 	udf	#0
      e0:	00007f34 	udf	#32564
      e4:	00000b00 	udf	#2816
      e8:	00003800 	udf	#14336
      ec:	f9800100 	prfm	pldl1keep, [x8]
      f0:	05000001 	orr	z1.s, z1.s, #0x1
      f4:	76080100 	.inst	0x76080100 ; undefined
      f8:	08000000 	stxrb	w0, w0, [x0]
      fc:	00000098 	udf	#152
     100:	00008c0c 	udf	#35852
     104:	00000000 	udf	#0
     108:	08304400 	.inst	0x08304400 ; undefined
     10c:	00000000 	udf	#0
     110:	0001d800 	.inst	0x0001d800 ; undefined
     114:	00000000 	udf	#0
     118:	00033100 	.inst	0x00033100 ; undefined
     11c:	08010100 	stxrb	w1, w0, [x8]
     120:	00000139 	udf	#313
     124:	66070201 	.inst	0x66070201 ; undefined
     128:	05000001 	orr	z1.s, z1.s, #0x1
     12c:	00323375 	.inst	0x00323375 ; NYI
     130:	00004606 	udf	#17926
     134:	07040100 	.inst	0x07040100 ; undefined
     138:	000001ac 	udf	#428
     13c:	34367505 	cbz	w5, 6cfdc <MAIR_ATTR+0x68bdc>
     140:	00570700 	.inst	0x00570700 ; undefined
     144:	08010000 	stxrb	w1, w0, [x0]
     148:	0001a207 	.inst	0x0001a207 ; undefined
     14c:	07080100 	.inst	0x07080100 ; undefined
     150:	000001a7 	udf	#423
     154:	3b060101 	.inst	0x3b060101 ; undefined
     158:	01000001 	.inst	0x01000001 ; undefined
     15c:	01de0502 	.inst	0x01de0502 ; undefined
     160:	04090000 	umax	z0.b, p0/m, z0.b, z0.b
     164:	746e6905 	.inst	0x746e6905 ; undefined
     168:	05080100 	.inst	0x05080100 ; undefined
     16c:	000001ef 	udf	#495
     170:	0001e80a 	.inst	0x0001e80a ; undefined
     174:	05040300 	.inst	0x05040300 ; undefined
     178:	00000073 	udf	#115
     17c:	00000098 	udf	#152
     180:	0000980b 	udf	#38923
     184:	06000c00 	.inst	0x06000c00 ; undefined
     188:	000000a4 	udf	#164
     18c:	42080101 	.inst	0x42080101 ; undefined
     190:	0d000001 	st1	{v1.b}[0], [x0]
     194:	0000009d 	udf	#157
     198:	00018f0e 	.inst	0x00018f0e ; undefined
     19c:	06130100 	.inst	0x06130100 ; undefined
     1a0:	00083084 	.inst	0x00083084 ; undefined
     1a4:	00000000 	udf	#0
     1a8:	00000198 	udf	#408
     1ac:	00000000 	udf	#0
     1b0:	01a89c01 	.inst	0x01a89c01 ; undefined
     1b4:	b9070000 	str	w0, [x0, #1792]
     1b8:	14000001 	b	1bc <THREAD_HW_CONTEXT_SIZE+0x9c>
     1bc:	0000004d 	udf	#77
     1c0:	7450700f 	.inst	0x7450700f ; undefined
     1c4:	0a160100 	and	w0, w8, w22
     1c8:	000001a8 	udf	#424
     1cc:	07789102 	.inst	0x07789102 ; undefined
     1d0:	00000147 	udf	#327
     1d4:	00004d2c 	udf	#19756
     1d8:	309c1000 	adr	x0, fffffffffff383d9 <IRQ_SOURCE_EL0_CORE_0+0xffffbff38379>
     1dc:	00000008 	udf	#8
     1e0:	009c0000 	.inst	0x009c0000 ; undefined
     1e4:	00000000 	udf	#0
     1e8:	014b0000 	.inst	0x014b0000 ; undefined
     1ec:	61020000 	.inst	0x61020000 ; undefined
     1f0:	1a000001 	adc	w1, w0, w0
     1f4:	00004d0d 	udf	#19725
     1f8:	48910200 	stllrh	w0, [x16]
     1fc:	00018202 	.inst	0x00018202 ; undefined
     200:	a80e1c00 	stnp	x0, x7, [x0, #224]
     204:	02000001 	.inst	0x02000001 ; undefined
     208:	d0047091 	adrp	x17, 8e12000 <TCR_VALUE+0x8d11ff0>
     20c:	00000830 	udf	#2096
     210:	48000000 	stxrh	w0, w0, [x0]
     214:	00000000 	udf	#0
     218:	02000000 	.inst	0x02000000 ; undefined
     21c:	00000161 	udf	#353
     220:	004d111f 	.inst	0x004d111f ; undefined
     224:	91020000 	add	x0, x0, #0x80
     228:	01340240 	.inst	0x01340240 ; undefined
     22c:	12210000 	and	w0, w0, #0x80000000
     230:	000001a8 	udf	#424
     234:	7fb89103 	fmulx	s3, s8, v24.s[1]
     238:	5c040000 	ldr	d0, 8238 <MAIR_ATTR+0x3e38>
     23c:	00000831 	udf	#2097
     240:	9c000000 	ldr	q0, 240 <THREAD_HW_CONTEXT_SIZE+0x120>
     244:	00000000 	udf	#0
     248:	02000000 	.inst	0x02000000 ; undefined
     24c:	00000161 	udf	#353
     250:	004d0d32 	.inst	0x004d0d32 ; undefined
     254:	91020000 	add	x0, x0, #0x80
     258:	01820260 	.inst	0x01820260 ; undefined
     25c:	0e340000 	saddl	v0.8h, v0.8b, v20.8b
     260:	000001a8 	udf	#424
     264:	04689102 	asr	z2.s, z8.s, #24
     268:	00083190 	.inst	0x00083190 ; undefined
     26c:	00000000 	udf	#0
     270:	00000048 	udf	#72
     274:	00000000 	udf	#0
     278:	00016102 	.inst	0x00016102 ; undefined
     27c:	4d113700 	.inst	0x4d113700 ; undefined
     280:	02000000 	.inst	0x02000000 ; undefined
     284:	34025891 	cbz	w17, 4d94 <MAIR_ATTR+0x994>
     288:	39000001 	strb	w1, [x0]
     28c:	0001a812 	.inst	0x0001a812 ; undefined
     290:	50910200 	adr	x0, fffffffffff222d2 <IRQ_SOURCE_EL0_CORE_0+0xffffbff22272>
     294:	06000000 	.inst	0x06000000 ; undefined
     298:	0000004d 	udf	#77
     29c:	00012b11 	.inst	0x00012b11 ; undefined
     2a0:	06080100 	.inst	0x06080100 ; undefined
     2a4:	00083044 	.inst	0x00083044 ; undefined
     2a8:	00000000 	udf	#0
     2ac:	00000040 	udf	#64
     2b0:	00000000 	udf	#0
     2b4:	d9039c01 	.inst	0xd9039c01 ; undefined
     2b8:	1c000001 	ldr	s1, 2b8 <THREAD_HW_CONTEXT_SIZE+0x198>
     2bc:	00000098 	udf	#152
     2c0:	03789102 	.inst	0x03789102 ; undefined
     2c4:	00000187 	udf	#391
     2c8:	0000982f 	udf	#38959
     2cc:	70910200 	adr	x0, fffffffffff2230f <IRQ_SOURCE_EL0_CORE_0+0xffffbff222af>
     2d0:	0001cf03 	.inst	0x0001cf03 ; undefined
     2d4:	00984400 	.inst	0x00984400 ; undefined
     2d8:	91020000 	add	x0, x0, #0x80
     2dc:	01790368 	.inst	0x01790368 ; undefined
     2e0:	3c530000 	ldur	b0, [x0, #-208]
     2e4:	02000000 	.inst	0x02000000 ; undefined
     2e8:	00006491 	udf	#25745
     2ec:	00000087 	udf	#135
     2f0:	08010005 	stxrb	w1, w5, [x0]
     2f4:	00000178 	udf	#376
     2f8:	00009802 	udf	#38914
     2fc:	00b60c00 	.inst	0x00b60c00 ; undefined
     300:	00000000 	udf	#0
     304:	321c0000 	orr	w0, w0, #0x10
     308:	00000008 	udf	#8
     30c:	00180000 	.inst	0x00180000 ; undefined
     310:	00000000 	udf	#0
     314:	040e0000 	.inst	0x040e0000 ; undefined
     318:	01010000 	.inst	0x01010000 ; undefined
     31c:	00013908 	.inst	0x00013908 ; undefined
     320:	07020100 	.inst	0x07020100 ; undefined
     324:	00000166 	udf	#358
     328:	ac070401 	stnp	q1, q1, [x0, #224]
     32c:	01000001 	.inst	0x01000001 ; undefined
     330:	01a20708 	.inst	0x01a20708 ; undefined
     334:	08010000 	stxrb	w1, w0, [x0]
     338:	0001a707 	.inst	0x0001a707 ; undefined
     33c:	01f80300 	.inst	0x01f80300 ; undefined
     340:	40020000 	.inst	0x40020000 ; undefined
     344:	00006306 	udf	#25350
     348:	00630400 	.inst	0x00630400 ; undefined
     34c:	05000000 	orr	z0.s, z0.s, #0x1
     350:	00006908 	udf	#26888
     354:	08010100 	stxrb	w1, w0, [x8]
     358:	00000142 	udf	#322
     35c:	00020a06 	.inst	0x00020a06 ; undefined
     360:	06050100 	.inst	0x06050100 ; undefined
     364:	0008321c 	.inst	0x0008321c ; undefined
     368:	00000000 	udf	#0
     36c:	00000018 	udf	#24
     370:	00000000 	udf	#0
     374:	87009c01 	.inst	0x87009c01 ; undefined
     378:	05000000 	orr	z0.s, z0.s, #0x1
     37c:	d5080100 	sys	#0, C0, C1, #0, x0
     380:	02000001 	.inst	0x02000001 ; undefined
     384:	00000098 	udf	#152
     388:	0000cc0c 	udf	#52236
     38c:	00000000 	udf	#0
     390:	08323400 	.inst	0x08323400 ; undefined
     394:	00000000 	udf	#0
     398:	00001800 	udf	#6144
     39c:	00000000 	udf	#0
     3a0:	00046e00 	.inst	0x00046e00 ; undefined
     3a4:	08010100 	stxrb	w1, w0, [x8]
     3a8:	00000139 	udf	#313
     3ac:	66070201 	.inst	0x66070201 ; undefined
     3b0:	01000001 	.inst	0x01000001 ; undefined
     3b4:	01ac0704 	.inst	0x01ac0704 ; undefined
     3b8:	08010000 	stxrb	w1, w0, [x0]
     3bc:	0001a207 	.inst	0x0001a207 ; undefined
     3c0:	07080100 	.inst	0x07080100 ; undefined
     3c4:	000001a7 	udf	#423
     3c8:	0001f803 	.inst	0x0001f803 ; undefined
     3cc:	06400200 	.inst	0x06400200 ; undefined
     3d0:	00000063 	udf	#99
     3d4:	00006304 	udf	#25348
     3d8:	08050000 	stxrb	w5, w0, [x0]
     3dc:	00000069 	udf	#105
     3e0:	42080101 	.inst	0x42080101 ; undefined
     3e4:	06000001 	.inst	0x06000001 ; undefined
     3e8:	0000021a 	udf	#538
     3ec:	34060501 	cbz	w1, c48c <MAIR_ATTR+0x808c>
     3f0:	00000832 	udf	#2098
     3f4:	18000000 	ldr	w0, 3f4 <THREAD_HW_CONTEXT_SIZE+0x2d4>
     3f8:	00000000 	udf	#0
     3fc:	01000000 	.inst	0x01000000 ; undefined
     400:	012d009c 	.inst	0x012d009c ; undefined
     404:	00050000 	.inst	0x00050000 ; undefined
     408:	02320801 	.inst	0x02320801 ; undefined
     40c:	98040000 	ldrsw	x0, 840c <MAIR_ATTR+0x400c>
     410:	0c000000 	st4	{v0.8b-v3.8b}, [x0]
     414:	000000d9 	udf	#217
     418:	00000000 	udf	#0
     41c:	0008324c 	.inst	0x0008324c ; undefined
     420:	00000000 	udf	#0
     424:	00000018 	udf	#24
     428:	00000000 	udf	#0
     42c:	000004ce 	udf	#1230
     430:	00387503 	.inst	0x00387503 ; NYI
     434:	00003704 	udf	#14084
     438:	08010100 	stxrb	w1, w0, [x8]
     43c:	00000139 	udf	#313
     440:	66070201 	.inst	0x66070201 ; undefined
     444:	01000001 	.inst	0x01000001 ; undefined
     448:	01ac0704 	.inst	0x01ac0704 ; undefined
     44c:	75030000 	.inst	0x75030000 ; undefined
     450:	07003436 	.inst	0x07003436 ; undefined
     454:	00000056 	udf	#86
     458:	a2070801 	.inst	0xa2070801 ; undefined
     45c:	01000001 	.inst	0x01000001 ; undefined
     460:	01a70708 	.inst	0x01a70708 ; undefined
     464:	01010000 	.inst	0x01010000 ; undefined
     468:	00013b06 	.inst	0x00013b06 ; undefined
     46c:	05020100 	orr	z0.d, z0.d, #0x1ff
     470:	000001de 	udf	#478
     474:	69050405 	stgp	x5, x1, [x0, #160]
     478:	0100746e 	.inst	0x0100746e ; undefined
     47c:	01ef0508 	.inst	0x01ef0508 ; undefined
     480:	2e060000 	ext	v0.8b, v0.8b, v6.8b, #0
     484:	90000000 	adrp	x0, 0 <EL0>
     488:	07000000 	.inst	0x07000000 ; undefined
     48c:	0000005d 	udf	#93
     490:	2e0200ff 	ext	v31.8b, v7.8b, v2.8b, #0
     494:	08000002 	stxrb	w0, w2, [x0]
     498:	00000080 	udf	#128
     49c:	80000309 	.inst	0x80000309 ; undefined
     4a0:	00000009 	udf	#9
     4a4:	54020000 	b.eq	44a4 <MAIR_ATTR+0xa4>  // b.none
     4a8:	09000002 	.inst	0x09000002 ; undefined
     4ac:	00000080 	udf	#128
     4b0:	81000309 	.inst	0x81000309 ; undefined
     4b4:	00000009 	udf	#9
     4b8:	49020000 	.inst	0x49020000 ; undefined
     4bc:	0a000002 	and	w2, w0, w0
     4c0:	00000080 	udf	#128
     4c4:	82000309 	.inst	0x82000309 ; undefined
     4c8:	00000009 	udf	#9
     4cc:	71020000 	subs	w0, w0, #0x80
     4d0:	0b000002 	add	w2, w0, w0
     4d4:	00000080 	udf	#128
     4d8:	83000309 	.inst	0x83000309 ; undefined
     4dc:	00000009 	udf	#9
     4e0:	e8080000 	.inst	0xe8080000 ; undefined
     4e4:	03000001 	.inst	0x03000001 ; undefined
     4e8:	00720504 	.inst	0x00720504 ; undefined
     4ec:	00f70000 	.inst	0x00f70000 ; undefined
     4f0:	f7090000 	.inst	0xf7090000 ; undefined
     4f4:	0a000000 	and	w0, w0, w0
     4f8:	04080b00 	smax	z0.b, p2/m, z0.b, z24.b
     4fc:	01000001 	.inst	0x01000001 ; undefined
     500:	01420801 	.inst	0x01420801 ; undefined
     504:	fd0c0000 	str	d0, [x0, #6144]
     508:	0d000000 	st1	{v0.b}[0], [x0]
     50c:	00000239 	udf	#569
     510:	4c060d01 	.inst	0x4c060d01 ; undefined
     514:	00000832 	udf	#2098
     518:	18000000 	ldr	w0, 518 <THREAD_HW_CONTEXT_SIZE+0x3f8>
     51c:	00000000 	udf	#0
     520:	01000000 	.inst	0x01000000 ; undefined
     524:	025f0e9c 	.inst	0x025f0e9c ; undefined
     528:	0f010000 	.inst	0x0f010000 ; undefined
     52c:	00004c10 	udf	#19472
     530:	4f000000 	.inst	0x4f000000 ; undefined
     534:	05000001 	orr	z1.s, z1.s, #0x1
     538:	f1080100 	subs	x0, x8, #0x200
     53c:	06000002 	.inst	0x06000002 ; undefined
     540:	00000098 	udf	#152
     544:	0000e60c 	udf	#58892
     548:	00000000 	udf	#0
     54c:	08326400 	.inst	0x08326400 ; undefined
     550:	00000000 	udf	#0
     554:	00004c00 	udf	#19456
     558:	00000000 	udf	#0
     55c:	00053500 	.inst	0x00053500 ; undefined
     560:	38750500 	.inst	0x38750500 ; undefined
     564:	00370400 	.inst	0x00370400 ; NYI
     568:	01030000 	.inst	0x01030000 ; undefined
     56c:	00013908 	.inst	0x00013908 ; undefined
     570:	07020300 	.inst	0x07020300 ; undefined
     574:	00000166 	udf	#358
     578:	ac070403 	stnp	q3, q1, [x0, #224]
     57c:	05000001 	orr	z1.s, z1.s, #0x1
     580:	00343675 	.inst	0x00343675 ; NYI
     584:	00005607 	udf	#22023
     588:	07080300 	.inst	0x07080300 ; undefined
     58c:	000001a2 	udf	#418
     590:	a7070803 	.inst	0xa7070803 ; undefined
     594:	07000001 	.inst	0x07000001 ; undefined
     598:	000002d6 	udf	#726
     59c:	00450407 	.inst	0x00450407 ; undefined
     5a0:	45030000 	.inst	0x45030000 ; undefined
     5a4:	0000a70e 	udf	#42766
     5a8:	02bb0100 	.inst	0x02bb0100 ; undefined
     5ac:	01000000 	.inst	0x01000000 ; undefined
     5b0:	0000029a 	udf	#666
     5b4:	02f30101 	.inst	0x02f30101 ; undefined
     5b8:	01040000 	.inst	0x01040000 ; undefined
     5bc:	00000302 	udf	#770
     5c0:	03110105 	.inst	0x03110105 ; undefined
     5c4:	01060000 	.inst	0x01060000 ; undefined
     5c8:	00000320 	udf	#800
     5cc:	032f0107 	.inst	0x032f0107 ; undefined
     5d0:	01030000 	.inst	0x01030000 ; undefined
     5d4:	0000033e 	udf	#830
     5d8:	d7080002 	.inst	0xd7080002 ; undefined
     5dc:	03000002 	.inst	0x03000002 ; undefined
     5e0:	0064024e 	.inst	0x0064024e ; undefined
     5e4:	cb040000 	sub	x0, x0, x4
     5e8:	03000002 	.inst	0x03000002 ; undefined
     5ec:	0000c46b 	udf	#50283
     5f0:	002e0200 	.inst	0x002e0200 ; NYI
     5f4:	04000000 	add	z0.b, p0/m, z0.b, z0.b
     5f8:	00000a09 	udf	#2569
     5fc:	00d50b04 	.inst	0x00d50b04 ; undefined
     600:	4c020000 	.inst	0x4c020000 ; undefined
     604:	00000000 	udf	#0
     608:	00029104 	.inst	0x00029104 ; undefined
     60c:	e66a0300 	.inst	0xe66a0300 ; undefined
     610:	02000000 	.inst	0x02000000 ; undefined
     614:	0000002e 	udf	#46
     618:	02ab0400 	.inst	0x02ab0400 ; undefined
     61c:	69030000 	stgp	x0, x0, [x0, #96]
     620:	000000f7 	udf	#247
     624:	00002e02 	udf	#11778
     628:	7c040000 	stur	h0, [x0, #64]
     62c:	03000002 	.inst	0x03000002 ; undefined
     630:	00010d68 	.inst	0x00010d68 ; undefined
     634:	002e0200 	.inst	0x002e0200 ; NYI
     638:	a7020000 	.inst	0xa7020000 ; undefined
     63c:	00000000 	udf	#0
     640:	0001f804 	.inst	0x0001f804 ; undefined
     644:	1e400300 	.inst	0x1e400300 ; undefined
     648:	02000001 	.inst	0x02000001 ; undefined
     64c:	0000011e 	udf	#286
     650:	24080900 	cmphs	p0.b, p2/z, z8.b, z8.b
     654:	03000001 	.inst	0x03000001 ; undefined
     658:	01420801 	.inst	0x01420801 ; undefined
     65c:	e30a0000 	.inst	0xe30a0000 ; undefined
     660:	01000002 	.inst	0x01000002 ; undefined
     664:	32640608 	.inst	0x32640608 ; undefined
     668:	00000008 	udf	#8
     66c:	004c0000 	.inst	0x004c0000 ; undefined
     670:	00000000 	udf	#0
     674:	9c010000 	ldr	q0, 2674 <THREAD_HW_CONTEXT_SIZE+0x2554>
     678:	00025f0b 	.inst	0x00025f0b ; undefined
     67c:	110a0100 	add	w0, w8, #0x280
     680:	0000004c 	udf	#76
     684:	03800000 	.inst	0x03800000 ; undefined
     688:	00050000 	.inst	0x00050000 ; undefined
     68c:	03a00801 	.inst	0x03a00801 ; undefined
     690:	980a0000 	ldrsw	x0, 14690 <MAIR_ATTR+0x10290>
     694:	0c000000 	st4	{v0.8b-v3.8b}, [x0]
     698:	000000fd 	udf	#253
     69c:	00000000 	udf	#0
     6a0:	000832b0 	.inst	0x000832b0 ; undefined
     6a4:	00000000 	udf	#0
     6a8:	000000f0 	udf	#240
     6ac:	00000000 	udf	#0
     6b0:	000005b5 	udf	#1461
     6b4:	00387506 	.inst	0x00387506 ; NYI
     6b8:	00003704 	udf	#14084
     6bc:	08010200 	stxrb	w1, w0, [x16]
     6c0:	00000139 	udf	#313
     6c4:	66070202 	.inst	0x66070202 ; undefined
     6c8:	06000001 	.inst	0x06000001 ; undefined
     6cc:	00323375 	.inst	0x00323375 ; NYI
     6d0:	00004f06 	udf	#20230
     6d4:	07040200 	.inst	0x07040200 ; undefined
     6d8:	000001ac 	udf	#428
     6dc:	34367506 	cbz	w6, 6d57c <MAIR_ATTR+0x6917c>
     6e0:	00600700 	.inst	0x00600700 ; undefined
     6e4:	08020000 	stxrb	w2, w0, [x0]
     6e8:	0001a207 	.inst	0x0001a207 ; undefined
     6ec:	07080200 	.inst	0x07080200 ; undefined
     6f0:	000001a7 	udf	#423
     6f4:	6369470b 	.inst	0x6369470b ; undefined
     6f8:	d2032800 	eor	x0, x0, #0xe00000ffe00000ff
     6fc:	0000d410 	udf	#54288
     700:	048d0300 	uabd	z0.s, p0/m, z0.s, z24.s
     704:	45d40000 	saddlb	z0.d, z0.s, z20.s
     708:	00000000 	udf	#0
     70c:	00039b03 	.inst	0x00039b03 ; undefined
     710:	00d4d500 	.inst	0x00d4d500 ; undefined
     714:	03040000 	.inst	0x03040000 ; undefined
     718:	0000037b 	udf	#891
     71c:	000045d6 	udf	#17878
     720:	8b031000 	add	x0, x0, x3, lsl #4
     724:	d7000003 	.inst	0xd7000003 ; undefined
     728:	00000045 	udf	#69
     72c:	034d0314 	.inst	0x034d0314 ; undefined
     730:	45d80000 	saddlb	z0.d, z0.s, z24.s
     734:	18000000 	ldr	w0, 734 <THREAD_HW_CONTEXT_SIZE+0x614>
     738:	0003e903 	.inst	0x0003e903 ; undefined
     73c:	0045d900 	.inst	0x0045d900 ; undefined
     740:	031c0000 	.inst	0x031c0000 ; undefined
     744:	000003fa 	udf	#1018
     748:	000045da 	udf	#17882
     74c:	68032000 	.inst	0x68032000 ; undefined
     750:	db000004 	.inst	0xdb000004 ; undefined
     754:	00000045 	udf	#69
     758:	450c0024 	.inst	0x450c0024 ; undefined
     75c:	e4000000 	.inst	0xe4000000 ; undefined
     760:	0d000000 	st1	{v0.b}[0], [x0]
     764:	00000067 	udf	#103
     768:	df0e0002 	.inst	0xdf0e0002 ; undefined
     76c:	07000003 	.inst	0x07000003 ; undefined
     770:	00004f04 	udf	#20228
     774:	0e040400 	dup	v0.2s, v0.s[0]
     778:	0000010f 	udf	#271
     77c:	00044f04 	.inst	0x00044f04 ; undefined
     780:	5e040000 	sha1c	q0, s0, v4.4s
     784:	01000003 	.inst	0x01000003 ; undefined
     788:	00042304 	.inst	0x00042304 ; undefined
     78c:	cf040200 	.inst	0xcf040200 ; undefined
     790:	03000004 	.inst	0x03000004 ; undefined
     794:	045e0f00 	.inst	0x045e0f00 ; undefined
     798:	01200000 	.inst	0x01200000 ; undefined
     79c:	a4100b04 	ld1rqb	{z4.b}, p2/z, [x24, x16]
     7a0:	01000002 	.inst	0x01000002 ; undefined
     7a4:	0c003078 	.inst	0x0c003078 ; undefined
     7a8:	00000056 	udf	#86
     7ac:	31780100 	adds	w0, w8, #0xe00, lsl #12
     7b0:	00560d00 	.inst	0x00560d00 ; undefined
     7b4:	01080000 	.inst	0x01080000 ; undefined
     7b8:	0e003278 	tbx	v24.8b, {v19.16b, v20.16b}, v0.8b
     7bc:	00000056 	udf	#86
     7c0:	33780110 	.inst	0x33780110 ; undefined
     7c4:	00560f00 	.inst	0x00560f00 ; undefined
     7c8:	01180000 	.inst	0x01180000 ; undefined
     7cc:	10003478 	adr	x24, e58 <THREAD_HW_CONTEXT_SIZE+0xd38>
     7d0:	00000056 	udf	#86
     7d4:	35780120 	cbnz	w0, f07f8 <__kernel_end_addr+0x581b0>
     7d8:	00561100 	.inst	0x00561100 ; undefined
     7dc:	01280000 	.inst	0x01280000 ; undefined
     7e0:	12003678 	and	w24, w19, #0x3fff
     7e4:	00000056 	udf	#86
     7e8:	37780130 	tbnz	w16, #15, 80c <THREAD_HW_CONTEXT_SIZE+0x6ec>
     7ec:	00561300 	.inst	0x00561300 ; undefined
     7f0:	01380000 	.inst	0x01380000 ; undefined
     7f4:	14003878 	b	e9d4 <MAIR_ATTR+0xa5d4>
     7f8:	00000056 	udf	#86
     7fc:	39780140 	ldrb	w0, [x10, #3584]
     800:	00561500 	.inst	0x00561500 ; undefined
     804:	01480000 	.inst	0x01480000 ; undefined
     808:	00303178 	.inst	0x00303178 ; NYI
     80c:	00005616 	udf	#22038
     810:	78015000 	sturh	w0, [x0, #21]
     814:	17003131 	b	fffffffffc00ccd8 <IRQ_SOURCE_EL0_CORE_0+0xffffbc00cc78>
     818:	00000056 	udf	#86
     81c:	31780158 	adds	w24, w10, #0xe00, lsl #12
     820:	56180032 	.inst	0x56180032 ; undefined
     824:	60000000 	.inst	0x60000000 ; undefined
     828:	33317801 	.inst	0x33317801 ; undefined
     82c:	00561900 	.inst	0x00561900 ; undefined
     830:	01680000 	.inst	0x01680000 ; undefined
     834:	00343178 	.inst	0x00343178 ; NYI
     838:	0000561a 	udf	#22042
     83c:	78017000 	sturh	w0, [x0, #23]
     840:	1b003531 	madd	w17, w9, w0, w13
     844:	00000056 	udf	#86
     848:	31780178 	adds	w24, w11, #0xe00, lsl #12
     84c:	561c0036 	.inst	0x561c0036 ; undefined
     850:	80000000 	.inst	0x80000000 ; undefined
     854:	37317801 	tbnz	w1, #6, 3754 <THREAD_HW_CONTEXT_SIZE+0x3634>
     858:	00561d00 	.inst	0x00561d00 ; undefined
     85c:	01880000 	.inst	0x01880000 ; undefined
     860:	00383178 	.inst	0x00383178 ; NYI
     864:	0000561e 	udf	#22046
     868:	78019000 	sturh	w0, [x0, #25]
     86c:	1f003931 	fmadd	s17, s9, s0, s14
     870:	00000056 	udf	#86
     874:	32780198 	.inst	0x32780198 ; undefined
     878:	56200030 	.inst	0x56200030 ; undefined
     87c:	a0000000 	.inst	0xa0000000 ; undefined
     880:	31327801 	adds	w1, w0, #0xc9e
     884:	00562100 	.inst	0x00562100 ; undefined
     888:	01a80000 	.inst	0x01a80000 ; undefined
     88c:	00323278 	.inst	0x00323278 ; NYI
     890:	00005622 	udf	#22050
     894:	7801b000 	sturh	w0, [x0, #27]
     898:	23003332 	.inst	0x23003332 ; undefined
     89c:	00000056 	udf	#86
     8a0:	327801b8 	.inst	0x327801b8 ; undefined
     8a4:	56240034 	.inst	0x56240034 ; undefined
     8a8:	c0000000 	mov	za0h.b[w12, 0], p0/m, z0.b
     8ac:	35327801 	cbnz	w1, 657ac <MAIR_ATTR+0x613ac>
     8b0:	00562500 	.inst	0x00562500 ; undefined
     8b4:	01c80000 	.inst	0x01c80000 ; undefined
     8b8:	00363278 	.inst	0x00363278 ; NYI
     8bc:	00005626 	udf	#22054
     8c0:	7801d000 	sturh	w0, [x0, #29]
     8c4:	27003732 	.inst	0x27003732 ; undefined
     8c8:	00000056 	udf	#86
     8cc:	327801d8 	.inst	0x327801d8 ; undefined
     8d0:	56280038 	.inst	0x56280038 ; undefined
     8d4:	e0000000 	ld1b	{za0h.b[w12, 0]}, p0/z, [x0, x0]
     8d8:	39327801 	strb	w1, [x0, #3230]
     8dc:	00562900 	.inst	0x00562900 ; undefined
     8e0:	01e80000 	.inst	0x01e80000 ; undefined
     8e4:	00303378 	.inst	0x00303378 ; NYI
     8e8:	0000562a 	udf	#22058
     8ec:	7301f000 	.inst	0x7301f000 ; undefined
     8f0:	2b003070 	adds	w16, w3, w0, lsl #12
     8f4:	00000056 	udf	#86
     8f8:	041b07f8 	bic	z24.b, p1/m, z24.b, z31.b
     8fc:	562c0000 	.inst	0x562c0000 ; undefined
     900:	00000000 	udf	#0
     904:	73650801 	.inst	0x73650801 ; undefined
     908:	562d0072 	.inst	0x562d0072 ; undefined
     90c:	08000000 	stxrb	w0, w0, [x0]
     910:	6c650801 	ldnp	d1, d2, [x0, #-432]
     914:	562e0072 	.inst	0x562e0072 ; undefined
     918:	10000000 	adr	x0, 918 <THREAD_HW_CONTEXT_SIZE+0x7f8>
     91c:	03760701 	.inst	0x03760701 ; undefined
     920:	562f0000 	.inst	0x562f0000 ; undefined
     924:	18000000 	ldr	w0, 924 <THREAD_HW_CONTEXT_SIZE+0x804>
     928:	0b100001 	add	w1, w0, w16
     92c:	04000004 	add	z4.b, p0/m, z4.b, z0.b
     930:	010f1c30 	.inst	0x010f1c30 ; undefined
     934:	01020000 	.inst	0x01020000 ; undefined
     938:	00013b06 	.inst	0x00013b06 ; undefined
     93c:	05020200 	orr	z0.d, z0.d, #0x1ffff
     940:	000001de 	udf	#478
     944:	69050411 	stgp	x17, x1, [x0, #160]
     948:	0200746e 	.inst	0x0200746e ; undefined
     94c:	01ef0508 	.inst	0x01ef0508 ; undefined
     950:	cd120000 	.inst	0xcd120000 ; undefined
     954:	04000003 	add	z3.b, p0/m, z3.b, z0.b
     958:	a4050636 	ld1rqb	{z22.b}, p1/z, [x17, x5]
     95c:	18000003 	ldr	w3, 95c <THREAD_HW_CONTEXT_SIZE+0x83c>
     960:	00000056 	udf	#86
     964:	00043905 	.inst	0x00043905 ; undefined
     968:	00561700 	.inst	0x00561700 ; undefined
     96c:	99130000 	stlur	w0, [x0, #-208]
     970:	01000004 	.inst	0x01000004 ; undefined
     974:	33600624 	.inst	0x33600624 ; undefined
     978:	00000008 	udf	#8
     97c:	00400000 	.inst	0x00400000 ; undefined
     980:	00000000 	udf	#0
     984:	9c010000 	ldr	q0, 2984 <THREAD_HW_CONTEXT_SIZE+0x2864>
     988:	00000316 	udf	#790
     98c:	66547014 	.inst	0x66547014 ; undefined
     990:	27240100 	.inst	0x27240100 ; undefined
     994:	00000316 	udf	#790
     998:	00789102 	.inst	0x00789102 ; undefined
     99c:	02a40815 	.inst	0x02a40815 ; undefined
     9a0:	a8160000 	stnp	x0, x0, [x0, #352]
     9a4:	01000004 	.inst	0x01000004 ; undefined
     9a8:	32f80d13 	.inst	0x32f80d13 ; undefined
     9ac:	00000008 	udf	#8
     9b0:	00680000 	.inst	0x00680000 ; undefined
     9b4:	00000000 	udf	#0
     9b8:	9c010000 	ldr	q0, 29b8 <THREAD_HW_CONTEXT_SIZE+0x2898>
     9bc:	00000369 	udf	#873
     9c0:	0003bc09 	.inst	0x0003bc09 ; undefined
     9c4:	002e1500 	.inst	0x002e1500 ; NYI
     9c8:	91020000 	add	x0, x0, #0x80
     9cc:	047a097f 	.inst	0x047a097f ; undefined
     9d0:	2e160000 	ext	v0.8b, v0.8b, v22.8b, #0
     9d4:	02000000 	.inst	0x02000000 ; undefined
     9d8:	39057e91 	strb	w17, [x20, #351]
     9dc:	17000004 	b	fffffffffc0009ec <IRQ_SOURCE_EL0_CORE_0+0xffffbc00098c>
     9e0:	00000056 	udf	#86
     9e4:	0003a405 	.inst	0x0003a405 ; undefined
     9e8:	00561800 	.inst	0x00561800 ; undefined
     9ec:	17000000 	b	fffffffffc0009ec <IRQ_SOURCE_EL0_CORE_0+0xffffbc00098c>
     9f0:	000004c3 	udf	#1219
     9f4:	b0060501 	adrp	x1, c0a1000 <TCR_VALUE+0xbfa0ff0>
     9f8:	00000832 	udf	#2098
     9fc:	48000000 	stxrh	w0, w0, [x0]
     a00:	00000000 	udf	#0
     a04:	01000000 	.inst	0x01000000 ; undefined
     a08:	00e1009c 	.inst	0x00e1009c ; undefined
     a0c:	00050000 	.inst	0x00050000 ; undefined
     a10:	052a0801 	ext	z1.b, z1.b, z0.b, #82
     a14:	98050000 	ldrsw	x0, aa14 <MAIR_ATTR+0x6614>
     a18:	0c000000 	st4	{v0.8b-v3.8b}, [x0]
     a1c:	0000011f 	udf	#287
     a20:	00000000 	udf	#0
     a24:	000833a0 	.inst	0x000833a0 ; undefined
     a28:	00000000 	udf	#0
     a2c:	000000bc 	udf	#188
     a30:	00000000 	udf	#0
     a34:	00000671 	udf	#1649
     a38:	00387503 	.inst	0x00387503 ; NYI
     a3c:	00003704 	udf	#14084
     a40:	08010200 	stxrb	w1, w0, [x16]
     a44:	00000139 	udf	#313
     a48:	66070202 	.inst	0x66070202 ; undefined
     a4c:	02000001 	.inst	0x02000001 ; undefined
     a50:	01ac0704 	.inst	0x01ac0704 ; undefined
     a54:	75030000 	.inst	0x75030000 ; undefined
     a58:	07003436 	.inst	0x07003436 ; undefined
     a5c:	00000056 	udf	#86
     a60:	a2070802 	.inst	0xa2070802 ; undefined
     a64:	04000001 	add	z1.b, p0/m, z1.b, z0.b
     a68:	000004f2 	udf	#1266
     a6c:	00007706 	udf	#30470
     a70:	00770100 	.inst	0x00770100 ; undefined
     a74:	4c010000 	.inst	0x4c010000 ; undefined
     a78:	01000000 	.inst	0x01000000 ; undefined
     a7c:	0000004c 	udf	#76
     a80:	2e080600 	.inst	0x2e080600 ; undefined
     a84:	04000000 	add	z0.b, p0/m, z0.b, z0.b
     a88:	00000510 	udf	#1296
     a8c:	00009205 	udf	#37381
     a90:	00770100 	.inst	0x00770100 ; undefined
     a94:	4c010000 	.inst	0x4c010000 ; undefined
     a98:	00000000 	udf	#0
     a9c:	00050107 	.inst	0x00050107 ; undefined
     aa0:	10050100 	adr	x0, aac0 <MAIR_ATTR+0x66c0>
     aa4:	0000004c 	udf	#76
     aa8:	000000a8 	udf	#168
     aac:	00004c01 	udf	#19457
     ab0:	db080000 	.inst	0xdb080000 ; undefined
     ab4:	01000004 	.inst	0x01000004 ; undefined
     ab8:	33a00604 	.inst	0x33a00604 ; undefined
     abc:	00000008 	udf	#8
     ac0:	00bc0000 	.inst	0x00bc0000 ; undefined
     ac4:	00000000 	udf	#0
     ac8:	9c010000 	ldr	q0, 2ac8 <THREAD_HW_CONTEXT_SIZE+0x29a8>
     acc:	0004f909 	.inst	0x0004f909 ; undefined
     ad0:	21040100 	.inst	0x21040100 ; undefined
     ad4:	0000002e 	udf	#46
     ad8:	0a7f9102 	.inst	0x0a7f9102 ; undefined
     adc:	00000501 	udf	#1281
     ae0:	4c100501 	.inst	0x4c100501 ; undefined
     ae4:	01000000 	.inst	0x01000000 ; undefined
     ae8:	0000004c 	udf	#76
     aec:	1f000000 	fmadd	s0, s0, s0, s0
     af0:	05000004 	orr	z4.s, z4.s, #0x1
     af4:	d7080100 	.inst	0xd7080100 ; undefined
     af8:	0c000005 	st4	{v5.8b-v8.8b}, [x0]
     afc:	00000098 	udf	#152
     b00:	00013d0c 	.inst	0x00013d0c ; undefined
     b04:	00000000 	udf	#0
     b08:	08345c00 	.inst	0x08345c00 ; undefined
     b0c:	00000000 	udf	#0
     b10:	00068c00 	.inst	0x00068c00 ; undefined
     b14:	00000000 	udf	#0
     b18:	0006fc00 	.inst	0x0006fc00 ; undefined
     b1c:	06010300 	.inst	0x06010300 ; undefined
     b20:	0000013b 	udf	#315
     b24:	de050203 	.inst	0xde050203 ; undefined
     b28:	0d000001 	st1	{v1.b}[0], [x0]
     b2c:	6e690504 	uhadd	v4.8h, v8.8h, v9.8h
     b30:	20050074 	.inst	0x20050074 ; undefined
     b34:	02000005 	.inst	0x02000005 ; undefined
     b38:	004f182b 	.inst	0x004f182b ; undefined
     b3c:	08030000 	stxrb	w3, w0, [x0]
     b40:	0001ef05 	.inst	0x0001ef05 ; undefined
     b44:	08010300 	stxrb	w1, w0, [x24]
     b48:	00000139 	udf	#313
     b4c:	66070203 	.inst	0x66070203 ; undefined
     b50:	03000001 	.inst	0x03000001 ; undefined
     b54:	01ac0704 	.inst	0x01ac0704 ; undefined
     b58:	1f050000 	fmadd	s0, s0, s5, s0
     b5c:	02000005 	.inst	0x02000005 ; undefined
     b60:	00771937 	.inst	0x00771937 ; undefined
     b64:	08030000 	stxrb	w3, w0, [x0]
     b68:	0001a707 	.inst	0x0001a707 ; undefined
     b6c:	05d50500 	mov	z0.d, p5/z, #40
     b70:	28030000 	stnp	w0, w0, [x0, #24]
     b74:	00008a1b 	udf	#35355
     b78:	05760e00 	ext	z0.b, {z16.b, z17.b}, #179
     b7c:	04200000 	add	z0.b, z0.b, z0.b
     b80:	0000c900 	udf	#51456
     b84:	05900400 	mov	z0.s, p0/z, #32
     b88:	00c90000 	.inst	0x00c90000 ; undefined
     b8c:	04000000 	add	z0.b, p0/m, z0.b, z0.b
     b90:	00000580 	udf	#1408
     b94:	000000c9 	udf	#201
     b98:	05580408 	mov	z8.h, p8/z, #32
     b9c:	00c90000 	.inst	0x00c90000 ; undefined
     ba0:	04100000 	mul	z0.b, p0/m, z0.b, z0.b
     ba4:	0000054e 	udf	#1358
     ba8:	0000003c 	udf	#60
     bac:	05e40418 	.inst	0x05e40418 ; undefined
     bb0:	003c0000 	.inst	0x003c0000 ; NYI
     bb4:	001c0000 	.inst	0x001c0000 ; undefined
     bb8:	7805080f 	sttrh	w15, [x0, #80]
     bbc:	03000005 	.inst	0x03000005 ; undefined
     bc0:	007e1863 	.inst	0x007e1863 ; undefined
     bc4:	75100000 	.inst	0x75100000 ; undefined
     bc8:	04050038 	.inst	0x04050038 ; undefined
     bcc:	0000561c 	udf	#22044
     bd0:	07080300 	.inst	0x07080300 ; undefined
     bd4:	000001a2 	udf	#418
     bd8:	00052811 	.inst	0x00052811 ; undefined
     bdc:	063c0600 	.inst	0x063c0600 ; undefined
     be0:	000000fb 	udf	#251
     be4:	0000d712 	udf	#55058
     be8:	e8130000 	.inst	0xe8130000 ; undefined
     bec:	01000001 	.inst	0x01000001 ; undefined
     bf0:	003c054d 	.inst	0x003c054d ; NYI
     bf4:	37900000 	tbnz	w0, #18, bf4 <THREAD_HW_CONTEXT_SIZE+0xad4>
     bf8:	00000008 	udf	#8
     bfc:	03580000 	.inst	0x03580000 ; undefined
     c00:	00000000 	udf	#0
     c04:	9c010000 	ldr	q0, 2c04 <THREAD_HW_CONTEXT_SIZE+0x2ae4>
     c08:	00000197 	udf	#407
     c0c:	00056f01 	.inst	0x00056f01 ; undefined
     c10:	97184d00 	bl	fffffffffc614010 <IRQ_SOURCE_EL0_CORE_0+0xffffbc613fb0>
     c14:	03000001 	.inst	0x03000001 ; undefined
     c18:	1476f891 	b	1dbee5c <TCR_VALUE+0x1cbee4c>
     c1c:	0005c202 	.inst	0x0005c202 ; undefined
     c20:	a80a4f00 	stnp	x0, x19, [x24, #160]
     c24:	03000001 	.inst	0x03000001 ; undefined
     c28:	0277a891 	.inst	0x0277a891 ; undefined
     c2c:	000005c9 	udf	#1481
     c30:	003c0950 	.inst	0x003c0950 ; NYI
     c34:	91030000 	add	x0, x0, #0xc0
     c38:	17027fbc 	b	fffffffffc0a0b28 <IRQ_SOURCE_EL0_CORE_0+0xffffbc0a0ac8>
     c3c:	51000005 	sub	w5, w0, #0x0
     c40:	0000430d 	udf	#17165
     c44:	b0910300 	adrp	x0, ffffffff22061000 <IRQ_SOURCE_EL0_CORE_0+0xfffee2060fa0>
     c48:	0539027f 	ext	z31.b, z31.b, z19.b, #200
     c4c:	0b520000 	add	w0, w0, w18, lsr #0
     c50:	000001b9 	udf	#441
     c54:	7fa89103 	fmulx	s3, s8, v8.s[1]
     c58:	0005b602 	.inst	0x0005b602 ; undefined
     c5c:	cb0d5300 	sub	x0, x24, x13, lsl #20
     c60:	03000000 	.inst	0x03000000 ; undefined
     c64:	06778891 	.inst	0x06778891 ; undefined
     c68:	000837ec 	.inst	0x000837ec ; undefined
     c6c:	00000000 	udf	#0
     c70:	000002e0 	udf	#736
     c74:	00000000 	udf	#0
     c78:	57006907 	.inst	0x57006907 ; undefined
     c7c:	0000003c 	udf	#60
     c80:	7fb89103 	fmulx	s3, s8, v24.s[1]
     c84:	a30a0000 	.inst	0xa30a0000 ; undefined
     c88:	03000001 	.inst	0x03000001 ; undefined
     c8c:	01420801 	.inst	0x01420801 ; undefined
     c90:	9c150000 	ldr	q0, 2ac90 <MAIR_ATTR+0x26890>
     c94:	08000001 	stxrb	w0, w1, [x0]
     c98:	0000019c 	udf	#412
     c9c:	000001b9 	udf	#441
     ca0:	00007716 	udf	#30486
     ca4:	0003ff00 	.inst	0x0003ff00 ; undefined
     ca8:	00019c0a 	.inst	0x00019c0a ; undefined
     cac:	05401700 	eor	z0.b, z0.b, #0x44
     cb0:	45010000 	.inst	0x45010000 ; undefined
     cb4:	08373806 	.inst	0x08373806 ; undefined
     cb8:	00000000 	udf	#0
     cbc:	00005800 	udf	#22528
     cc0:	00000000 	udf	#0
     cc4:	169c0100 	b	fffffffffa7010c4 <IRQ_SOURCE_EL0_CORE_0+0xffffba701064>
     cc8:	01000002 	.inst	0x01000002 ; undefined
     ccc:	000005c2 	udf	#1474
     cd0:	01972045 	.inst	0x01972045 ; undefined
     cd4:	91020000 	add	x0, x0, #0x80
     cd8:	08c70168 	ldlarb	w8, [x11]
     cdc:	2c450000 	ldnp	s0, s0, [x0, #40]
     ce0:	0000003c 	udf	#60
     ce4:	06649102 	.inst	0x06649102 ; undefined
     ce8:	00083748 	.inst	0x00083748 ; undefined
     cec:	00000000 	udf	#0
     cf0:	00000038 	udf	#56
     cf4:	00000000 	udf	#0
     cf8:	47006907 	.inst	0x47006907 ; undefined
     cfc:	0000003c 	udf	#60
     d00:	007c9102 	.inst	0x007c9102 ; undefined
     d04:	05a41800 	trn1	z0.q, z0.q, z4.q
     d08:	37010000 	tbnz	w0, #0, 2d08 <THREAD_HW_CONTEXT_SIZE+0x2be8>
     d0c:	00003c0c 	udf	#15372
     d10:	0836b000 	.inst	0x0836b000 ; undefined
     d14:	00000000 	udf	#0
     d18:	00008800 	udf	#34816
     d1c:	00000000 	udf	#0
     d20:	719c0100 	.inst	0x719c0100 ; undefined
     d24:	01000002 	.inst	0x01000002 ; undefined
     d28:	000005c2 	udf	#1474
     d2c:	01b92437 	.inst	0x01b92437 ; undefined
     d30:	91020000 	add	x0, x0, #0x80
     d34:	05ee0168 	.inst	0x05ee0168 ; undefined
     d38:	30370000 	adr	x0, 6ed39 <MAIR_ATTR+0x6a939>
     d3c:	0000003c 	udf	#60
     d40:	01649102 	.inst	0x01649102 ; undefined
     d44:	00000589 	udf	#1417
     d48:	00434237 	.inst	0x00434237 ; undefined
     d4c:	91020000 	add	x0, x0, #0x80
     d50:	08c70258 	ldlarb	w24, [x18]
     d54:	09390000 	.inst	0x09390000 ; undefined
     d58:	0000003c 	udf	#60
     d5c:	007c9102 	.inst	0x007c9102 ; undefined
     d60:	0005a30b 	.inst	0x0005a30b ; undefined
     d64:	003c2500 	.inst	0x003c2500 ; NYI
     d68:	35b80000 	cbnz	w0, fffffffffff70d68 <IRQ_SOURCE_EL0_CORE_0+0xffffbff70d08>
     d6c:	00000008 	udf	#8
     d70:	00f80000 	.inst	0x00f80000 ; undefined
     d74:	00000000 	udf	#0
     d78:	9c010000 	ldr	q0, 2d78 <THREAD_HW_CONTEXT_SIZE+0x2c58>
     d7c:	00000306 	udf	#774
     d80:	0005c201 	.inst	0x0005c201 ; undefined
     d84:	b9252500 	str	w0, [x8, #9508]
     d88:	03000001 	.inst	0x03000001 ; undefined
     d8c:	017fb891 	.inst	0x017fb891 ; undefined
     d90:	000005ee 	udf	#1518
     d94:	003c3125 	.inst	0x003c3125 ; NYI
     d98:	91030000 	add	x0, x0, #0xc0
     d9c:	89017fb4 	.inst	0x89017fb4 ; undefined
     da0:	25000005 	cmpge	p5.b, p0/z, z0.b, #0
     da4:	00006b44 	udf	#27460
     da8:	a8910300 	stp	x0, x0, [x24], #272
     dac:	0598027f 	mov	z31.s, p8/z, #19
     db0:	0a270000 	bic	w0, w0, w7
     db4:	00000306 	udf	#774
     db8:	02689102 	.inst	0x02689102 ; undefined
     dbc:	000005bb 	udf	#1467
     dc0:	03160a28 	.inst	0x03160a28 ; undefined
     dc4:	91020000 	add	x0, x0, #0x80
     dc8:	08c70248 	ldlarb	w8, [x18]
     dcc:	09290000 	.inst	0x09290000 ; undefined
     dd0:	0000003c 	udf	#60
     dd4:	067c9102 	.inst	0x067c9102 ; undefined
     dd8:	00083654 	.inst	0x00083654 ; undefined
     ddc:	00000000 	udf	#0
     de0:	00000050 	udf	#80
     de4:	00000000 	udf	#0
     de8:	30006907 	adr	x7, 1b09 <THREAD_HW_CONTEXT_SIZE+0x19e9>
     dec:	0000003c 	udf	#60
     df0:	00789102 	.inst	0x00789102 ; undefined
     df4:	019c0800 	.inst	0x019c0800 ; undefined
     df8:	03160000 	.inst	0x03160000 ; undefined
     dfc:	77090000 	.inst	0x77090000 ; undefined
     e00:	09000000 	.inst	0x09000000 ; undefined
     e04:	019c0800 	.inst	0x019c0800 ; undefined
     e08:	03260000 	.inst	0x03260000 ; undefined
     e0c:	77090000 	.inst	0x77090000 ; undefined
     e10:	18000000 	ldr	w0, e10 <THREAD_HW_CONTEXT_SIZE+0xcf0>
     e14:	05610b00 	ext	z0.b, {z24.b, z25.b}, #10
     e18:	3c110000 	stur	b0, [x0, #-240]
     e1c:	d4000000 	.inst	0xd4000000 ; undefined
     e20:	00000834 	udf	#2100
     e24:	e4000000 	.inst	0xe4000000 ; undefined
     e28:	00000000 	udf	#0
     e2c:	01000000 	.inst	0x01000000 ; undefined
     e30:	0003bb9c 	.inst	0x0003bb9c ; undefined
     e34:	05c20100 	mov	z0.d, #0x1ff
     e38:	20110000 	.inst	0x20110000 ; undefined
     e3c:	000001b9 	udf	#441
     e40:	7fb89103 	fmulx	s3, s8, v24.s[1]
     e44:	0005ee01 	.inst	0x0005ee01 ; undefined
     e48:	3c2c1100 	.inst	0x3c2c1100 ; undefined
     e4c:	03000000 	.inst	0x03000000 ; undefined
     e50:	017fb491 	.inst	0x017fb491 ; undefined
     e54:	00000589 	udf	#1417
     e58:	006b3f11 	.inst	0x006b3f11 ; undefined
     e5c:	91030000 	add	x0, x0, #0xc0
     e60:	bb027fa8 	.inst	0xbb027fa8 ; undefined
     e64:	13000005 	sbfx	w5, w0, #0, #1
     e68:	0003160a 	.inst	0x0003160a ; undefined
     e6c:	58910200 	ldr	x0, fffffffffff22eac <IRQ_SOURCE_EL0_CORE_0+0xffffbff22e4c>
     e70:	00059802 	.inst	0x00059802 ; undefined
     e74:	bb0a1400 	.inst	0xbb0a1400 ; undefined
     e78:	02000003 	.inst	0x02000003 ; undefined
     e7c:	c7024891 	.inst	0xc7024891 ; undefined
     e80:	15000008 	b	4000ea0 <TCR_VALUE+0x3f00e90>
     e84:	00003c09 	udf	#15369
     e88:	7c910200 	.inst	0x7c910200 ; undefined
     e8c:	08353806 	.inst	0x08353806 ; undefined
     e90:	00000000 	udf	#0
     e94:	00005000 	udf	#20480
     e98:	00000000 	udf	#0
     e9c:	00690700 	.inst	0x00690700 ; undefined
     ea0:	00003c1c 	udf	#15388
     ea4:	78910200 	ldursh	x0, [x16, #-240]
     ea8:	9c080000 	ldr	q0, 10ea8 <MAIR_ATTR+0xcaa8>
     eac:	cb000001 	sub	x1, x0, x0
     eb0:	09000003 	.inst	0x09000003 ; undefined
     eb4:	00000077 	udf	#119
     eb8:	3419000f 	cbz	w15, 32eb8 <MAIR_ATTR+0x2eab8>
     ebc:	01000005 	.inst	0x01000005 ; undefined
     ec0:	003c0c06 	.inst	0x003c0c06 ; NYI
     ec4:	345c0000 	cbz	w0, b8ec4 <__kernel_end_addr+0x2087c>
     ec8:	00000008 	udf	#8
     ecc:	00780000 	.inst	0x00780000 ; undefined
     ed0:	00000000 	udf	#0
     ed4:	9c010000 	ldr	q0, 2ed4 <THREAD_HW_CONTEXT_SIZE+0x2db4>
     ed8:	0005c201 	.inst	0x0005c201 ; undefined
     edc:	b91e0600 	str	w0, [x16, #7684]
     ee0:	02000001 	.inst	0x02000001 ; undefined
     ee4:	ee016891 	.inst	0xee016891 ; undefined
     ee8:	06000005 	.inst	0x06000005 ; undefined
     eec:	00003c2a 	udf	#15402
     ef0:	64910200 	fcmla	z0.s, p0/m, z16.s, z17.s, #0
     ef4:	00053901 	.inst	0x00053901 ; undefined
     ef8:	97400600 	bl	fffffffffd0026f8 <IRQ_SOURCE_EL0_CORE_0+0xffffbd002698>
     efc:	02000001 	.inst	0x02000001 ; undefined
     f00:	25025891 	bic	p1.b, p6/z, p4.b, p2.b
     f04:	0800000c 	stxrb	w0, w12, [x0]
     f08:	00003c09 	udf	#15369
     f0c:	7c910200 	.inst	0x7c910200 ; undefined
     f10:	01570000 	.inst	0x01570000 ; undefined
     f14:	00050000 	.inst	0x00050000 ; undefined
     f18:	07580801 	.inst	0x07580801 ; undefined
     f1c:	98060000 	ldrsw	x0, cf1c <MAIR_ATTR+0x8b1c>
     f20:	0c000000 	st4	{v0.8b-v3.8b}, [x0]
     f24:	0000019e 	udf	#414
     f28:	00000000 	udf	#0
     f2c:	00083ae8 	.inst	0x00083ae8 ; undefined
     f30:	00000000 	udf	#0
     f34:	000000e0 	udf	#224
     f38:	00000000 	udf	#0
     f3c:	00000960 	udf	#2400
     f40:	00387504 	.inst	0x00387504 ; NYI
     f44:	00003704 	udf	#14084
     f48:	08010200 	stxrb	w1, w0, [x16]
     f4c:	00000139 	udf	#313
     f50:	66070202 	.inst	0x66070202 ; undefined
     f54:	02000001 	.inst	0x02000001 ; undefined
     f58:	01ac0704 	.inst	0x01ac0704 ; undefined
     f5c:	75040000 	.inst	0x75040000 ; undefined
     f60:	07003436 	.inst	0x07003436 ; undefined
     f64:	0000005b 	udf	#91
     f68:	00004c07 	udf	#19463
     f6c:	07080200 	.inst	0x07080200 ; undefined
     f70:	000001a2 	udf	#418
     f74:	a7070802 	.inst	0xa7070802 ; undefined
     f78:	05000001 	orr	z1.s, z1.s, #0x1
     f7c:	0000025f 	udf	#607
     f80:	00560e09 	.inst	0x00560e09 ; undefined
     f84:	03090000 	.inst	0x03090000 ; undefined
     f88:	00098400 	.inst	0x00098400 ; undefined
     f8c:	00000000 	udf	#0
     f90:	00064705 	.inst	0x00064705 ; undefined
     f94:	2e040b00 	ext	v0.8b, v24.8b, v4.8b, #1
     f98:	09000000 	.inst	0x09000000 ; undefined
     f9c:	09700003 	.inst	0x09700003 ; undefined
     fa0:	00000000 	udf	#0
     fa4:	02390100 	.inst	0x02390100 ; undefined
     fa8:	fd030000 	str	d0, [x0, #1536]
     fac:	05f70106 	.inst	0x05f70106 ; undefined
     fb0:	1e010000 	.inst	0x1e010000 ; undefined
     fb4:	067d0111 	.inst	0x067d0111 ; undefined
     fb8:	1d010000 	.inst	0x1d010000 ; undefined
     fbc:	06c10111 	.inst	0x06c10111 ; undefined
     fc0:	1f010000 	fmadd	s0, s0, s1, s0
     fc4:	06190111 	.inst	0x06190111 ; undefined
     fc8:	15010000 	b	4040fc8 <TCR_VALUE+0x3f40fb8>
     fcc:	0670010d 	.inst	0x0670010d ; undefined
     fd0:	1d030000 	.inst	0x1d030000 ; undefined
     fd4:	060a0106 	.inst	0x060a0106 ; undefined
     fd8:	34040000 	cbz	w0, 8fd8 <MAIR_ATTR+0x4bd8>
     fdc:	06420806 	.inst	0x06420806 ; undefined
     fe0:	0d010000 	.inst	0x0d010000 ; undefined
     fe4:	00015305 	.inst	0x00015305 ; undefined
     fe8:	083ae800 	.inst	0x083ae800 ; undefined
     fec:	00000000 	udf	#0
     ff0:	0000e000 	udf	#57344
     ff4:	00000000 	udf	#0
     ff8:	539c0100 	.inst	0x539c0100 ; undefined
     ffc:	01000001 	.inst	0x01000001 ; undefined
    1000:	00000619 	udf	#1561
    1004:	030d1501 	.inst	0x030d1501 ; undefined
    1008:	00000624 	udf	#1572
    100c:	00004c18 	udf	#19480
    1010:	06520300 	.inst	0x06520300 ; undefined
    1014:	4c190000 	.inst	0x4c190000 ; undefined
    1018:	03000000 	.inst	0x03000000 ; undefined
    101c:	00000690 	udf	#1680
    1020:	00004c1a 	udf	#19482
    1024:	06ae0100 	.inst	0x06ae0100 ; undefined
    1028:	1c010000 	ldr	s0, 3028 <THREAD_HW_CONTEXT_SIZE+0x2f08>
    102c:	067d0111 	.inst	0x067d0111 ; undefined
    1030:	1d010000 	.inst	0x1d010000 ; undefined
    1034:	05f70111 	.inst	0x05f70111 ; undefined
    1038:	1e010000 	.inst	0x1e010000 ; undefined
    103c:	06c10111 	.inst	0x06c10111 ; undefined
    1040:	1f010000 	fmadd	s0, s0, s1, s0
    1044:	3afc0911 	.inst	0x3afc0911 ; undefined
    1048:	00000008 	udf	#8
    104c:	00bc0000 	.inst	0x00bc0000 ; undefined
    1050:	00000000 	udf	#0
    1054:	690a0000 	stgp	x0, x0, [x0, #320]
    1058:	0d210100 	.inst	0x0d210100 ; undefined
    105c:	0000002e 	udf	#46
    1060:	007f9102 	.inst	0x007f9102 ; undefined
    1064:	05040b00 	.inst	0x05040b00 ; undefined
    1068:	00746e69 	.inst	0x00746e69 ; undefined
    106c:	00029c00 	.inst	0x00029c00 ; undefined
    1070:	01000500 	.inst	0x01000500 ; undefined
    1074:	00080d08 	.inst	0x00080d08 ; undefined
    1078:	00980a00 	.inst	0x00980a00 ; undefined
    107c:	a50c0000 	ld1rqw	{z0.s}, p0/z, [x0, x12, lsl #2]
    1080:	00000001 	udf	#1
    1084:	c8000000 	stxr	w0, x0, [x0]
    1088:	0000083b 	udf	#2107
    108c:	e0000000 	ld1b	{za0h.b[w12, 0]}, p0/z, [x0, x0]
    1090:	00000000 	udf	#0
    1094:	0d000000 	st1	{v0.b}[0], [x0]
    1098:	0600000a 	.inst	0x0600000a ; undefined
    109c:	04003875 	saddv	d21, p6, z3.b
    10a0:	00000037 	udf	#55
    10a4:	39080102 	strb	w2, [x8, #512]
    10a8:	02000001 	.inst	0x02000001 ; undefined
    10ac:	01660702 	.inst	0x01660702 ; undefined
    10b0:	04020000 	.inst	0x04020000 ; undefined
    10b4:	0001ac07 	.inst	0x0001ac07 ; undefined
    10b8:	36750600 	tbz	w0, #14, ffffffffffffb178 <IRQ_SOURCE_EL0_CORE_0+0xffffbfffb118>
    10bc:	56070034 	.inst	0x56070034 ; undefined
    10c0:	02000000 	.inst	0x02000000 ; undefined
    10c4:	01a20708 	.inst	0x01a20708 ; undefined
    10c8:	b5070000 	cbnz	x0, f0c8 <MAIR_ATTR+0xacc8>
    10cc:	20000008 	.inst	0x20000008 ; undefined
    10d0:	00009914 	udf	#39188
    10d4:	07f90100 	.inst	0x07f90100 ; undefined
    10d8:	09150000 	.inst	0x09150000 ; undefined
    10dc:	0000004c 	udf	#76
    10e0:	07780100 	.inst	0x07780100 ; undefined
    10e4:	09160000 	.inst	0x09160000 ; undefined
    10e8:	0000004c 	udf	#76
    10ec:	08750108 	.inst	0x08750108 ; undefined
    10f0:	09170000 	.inst	0x09170000 ; undefined
    10f4:	0000004c 	udf	#76
    10f8:	08640110 	.inst	0x08640110 ; undefined
    10fc:	09180000 	.inst	0x09180000 ; undefined
    1100:	0000004c 	udf	#76
    1104:	d4030018 	.inst	0xd4030018 ; undefined
    1108:	19000007 	stlurb	w7, [x0]
    110c:	0000005d 	udf	#93
    1110:	00070d07 	.inst	0x00070d07 ; undefined
    1114:	eb1b4000 	subs	x0, x0, x27, lsl #16
    1118:	01000000 	.inst	0x01000000 ; undefined
    111c:	000007c2 	udf	#1986
    1120:	004c091c 	.inst	0x004c091c ; undefined
    1124:	01000000 	.inst	0x01000000 ; undefined
    1128:	00000848 	udf	#2120
    112c:	004c091d 	.inst	0x004c091d ; undefined
    1130:	01080000 	.inst	0x01080000 ; undefined
    1134:	000006e5 	udf	#1765
    1138:	004c091e 	.inst	0x004c091e ; undefined
    113c:	01100000 	.inst	0x01100000 ; undefined
    1140:	00000768 	udf	#1896
    1144:	004c091f 	.inst	0x004c091f ; undefined
    1148:	01180000 	.inst	0x01180000 ; undefined
    114c:	000006d6 	udf	#1750
    1150:	00991321 	.inst	0x00991321 ; undefined
    1154:	00200000 	.inst	0x00200000 ; NYI
    1158:	0008a403 	.inst	0x0008a403 ; undefined
    115c:	00a32200 	.inst	0x00a32200 ; undefined
    1160:	920b0000 	and	x0, x0, #0x20000000200000
    1164:	30000007 	adr	x7, 1165 <THREAD_HW_CONTEXT_SIZE+0x1045>
    1168:	10240302 	adr	x2, 491c8 <MAIR_ATTR+0x44dc8>
    116c:	00000158 	udf	#344
    1170:	0006f501 	.inst	0x0006f501 ; undefined
    1174:	4c092500 	.inst	0x4c092500 ; undefined
    1178:	00000000 	udf	#0
    117c:	0007a101 	.inst	0x0007a101 ; undefined
    1180:	4c092600 	.inst	0x4c092600 ; undefined
    1184:	08000000 	stxrb	w0, w0, [x0]
    1188:	0008c101 	.inst	0x0008c101 ; undefined
    118c:	4c092700 	.inst	0x4c092700 ; undefined
    1190:	10000000 	adr	x0, 1190 <THREAD_HW_CONTEXT_SIZE+0x1070>
    1194:	00070201 	.inst	0x00070201 ; undefined
    1198:	4c092800 	.inst	0x4c092800 ; undefined
    119c:	18000000 	ldr	w0, 119c <THREAD_HW_CONTEXT_SIZE+0x107c>
    11a0:	00085a01 	.inst	0x00085a01 ; undefined
    11a4:	4c092900 	.inst	0x4c092900 ; undefined
    11a8:	20000000 	.inst	0x20000000 ; undefined
    11ac:	00064701 	.inst	0x00064701 ; undefined
    11b0:	4c092a00 	.inst	0x4c092a00 ; undefined
    11b4:	28000000 	stnp	w0, w0, [x0]
    11b8:	00073901 	.inst	0x00073901 ; undefined
    11bc:	58162b00 	ldr	x0, 2d71c <MAIR_ATTR+0x2931c>
    11c0:	30000001 	adr	x1, 11c1 <THREAD_HW_CONTEXT_SIZE+0x10a1>
    11c4:	00eb0c00 	.inst	0x00eb0c00 ; undefined
    11c8:	01680000 	.inst	0x01680000 ; undefined
    11cc:	680d0000 	.inst	0x680d0000 ; undefined
    11d0:	07000001 	.inst	0x07000001 ; undefined
    11d4:	07080200 	.inst	0x07080200 ; undefined
    11d8:	000001a7 	udf	#423
    11dc:	0007e803 	.inst	0x0007e803 ; undefined
    11e0:	00f52c00 	.inst	0x00f52c00 ; undefined
    11e4:	01020000 	.inst	0x01020000 ; undefined
    11e8:	00013b06 	.inst	0x00013b06 ; undefined
    11ec:	05020200 	orr	z0.d, z0.d, #0x1ffff
    11f0:	000001de 	udf	#478
    11f4:	6905040e 	stgp	x14, x1, [x0, #160]
    11f8:	0200746e 	.inst	0x0200746e ; undefined
    11fc:	01ef0508 	.inst	0x01ef0508 ; undefined
    1200:	b4080000 	cbz	x0, 11200 <MAIR_ATTR+0xce00>
    1204:	05000007 	orr	z7.s, z7.s, #0x1
    1208:	00016f19 	.inst	0x00016f19 ; undefined
    120c:	08030900 	stxrb	w3, w0, [x8]
    1210:	00000984 	udf	#2436
    1214:	04000000 	add	z0.b, p0/m, z0.b, z0.b
    1218:	00000647 	udf	#1607
    121c:	002e0b07 	.inst	0x002e0b07 ; NYI
    1220:	94090000 	bl	241220 <TCR_VALUE+0x141210>
    1224:	38000008 	sturb	w8, [x0]
    1228:	00083ca0 	.inst	0x00083ca0 ; undefined
    122c:	00000000 	udf	#0
    1230:	00000008 	udf	#8
    1234:	00000000 	udf	#0
    1238:	53099c01 	.inst	0x53099c01 ; undefined
    123c:	33000007 	bfxil	w7, w0, #0, #1
    1240:	00083c98 	.inst	0x00083c98 ; undefined
    1244:	00000000 	udf	#0
    1248:	00000008 	udf	#8
    124c:	00000000 	udf	#0
    1250:	200f9c01 	.inst	0x200f9c01 ; undefined
    1254:	01000008 	.inst	0x01000008 ; undefined
    1258:	3c00061d 	str	b29, [x16], #0
    125c:	00000008 	udf	#8
    1260:	00980000 	.inst	0x00980000 ; undefined
    1264:	00000000 	udf	#0
    1268:	9c010000 	ldr	q0, 3268 <THREAD_HW_CONTEXT_SIZE+0x3148>
    126c:	00000237 	udf	#567
    1270:	0007e210 	.inst	0x0007e210 ; undefined
    1274:	2e1d0100 	ext	v0.8b, v8.8b, v29.8b, #0
    1278:	00000237 	udf	#567
    127c:	04689102 	asr	z2.s, z8.s, #24
    1280:	0000080c 	udf	#2060
    1284:	004c1023 	.inst	0x004c1023 ; undefined
    1288:	36040000 	tbz	w0, #0, ffffffffffff9288 <IRQ_SOURCE_EL0_CORE_0+0xffffbfff9228>
    128c:	24000008 	cmphs	p8.b, p0/z, z0.b, z0.b
    1290:	00004c10 	udf	#19472
    1294:	08880800 	stllrb	w0, [x0]
    1298:	09290000 	.inst	0x09290000 ; undefined
    129c:	0000004c 	udf	#76
    12a0:	00789102 	.inst	0x00789102 ; undefined
    12a4:	016f0811 	.inst	0x016f0811 ; undefined
    12a8:	4b120000 	sub	w0, w0, w18
    12ac:	01000007 	.inst	0x01000007 ; undefined
    12b0:	3be00618 	.inst	0x3be00618 ; undefined
    12b4:	00000008 	udf	#8
    12b8:	00200000 	.inst	0x00200000 ; NYI
    12bc:	00000000 	udf	#0
    12c0:	9c010000 	ldr	q0, 32c0 <THREAD_HW_CONTEXT_SIZE+0x31a0>
    12c4:	00078c05 	.inst	0x00078c05 ; undefined
    12c8:	3bd81300 	.inst	0x3bd81300 ; undefined
    12cc:	00000008 	udf	#8
    12d0:	00080000 	.inst	0x00080000 ; undefined
    12d4:	00000000 	udf	#0
    12d8:	9c010000 	ldr	q0, 32d8 <THREAD_HW_CONTEXT_SIZE+0x31b8>
    12dc:	0007ac05 	.inst	0x0007ac05 ; undefined
    12e0:	3bd00f00 	.inst	0x3bd00f00 ; undefined
    12e4:	00000008 	udf	#8
    12e8:	00080000 	.inst	0x00080000 ; undefined
    12ec:	00000000 	udf	#0
    12f0:	9c010000 	ldr	q0, 32f0 <THREAD_HW_CONTEXT_SIZE+0x31d0>
    12f4:	00071c05 	.inst	0x00071c05 ; undefined
    12f8:	3bc80b00 	.inst	0x3bc80b00 ; undefined
    12fc:	00000008 	udf	#8
    1300:	00080000 	.inst	0x00080000 ; undefined
    1304:	00000000 	udf	#0
    1308:	9c010000 	ldr	q0, 3308 <THREAD_HW_CONTEXT_SIZE+0x31e8>
    130c:	0000da00 	udf	#55808
    1310:	01000500 	.inst	0x01000500 ; undefined
    1314:	00094908 	.inst	0x00094908 ; undefined
    1318:	00980400 	.inst	0x00980400 ; undefined
    131c:	b20c0000 	orr	x0, x0, #0x10000000100000
    1320:	00000001 	udf	#1
    1324:	a8000000 	stnp	x0, x0, [x0]
    1328:	0000083c 	udf	#2108
    132c:	38000000 	sturb	w0, [x0]
    1330:	00000000 	udf	#0
    1334:	b3000000 	.inst	0xb3000000 ; undefined
    1338:	0100000a 	.inst	0x0100000a ; undefined
    133c:	01390801 	.inst	0x01390801 ; undefined
    1340:	02010000 	.inst	0x02010000 ; undefined
    1344:	00016607 	.inst	0x00016607 ; undefined
    1348:	07040100 	.inst	0x07040100 ; undefined
    134c:	000001ac 	udf	#428
    1350:	a2070801 	.inst	0xa2070801 ; undefined
    1354:	01000001 	.inst	0x01000001 ; undefined
    1358:	01a70708 	.inst	0x01a70708 ; undefined
    135c:	f3050000 	.inst	0xf3050000 ; undefined
    1360:	01000008 	.inst	0x01000008 ; undefined
    1364:	3cd80610 	ldr	q16, [x16], #-128
    1368:	00000008 	udf	#8
    136c:	00080000 	.inst	0x00080000 ; undefined
    1370:	00000000 	udf	#0
    1374:	9c010000 	ldr	q0, 3374 <THREAD_HW_CONTEXT_SIZE+0x3254>
    1378:	00090202 	.inst	0x00090202 ; undefined
    137c:	3cc40c00 	ldr	q0, [x0, #64]!
    1380:	00000008 	udf	#8
    1384:	00140000 	.inst	0x00140000 ; undefined
    1388:	00000000 	udf	#0
    138c:	9c010000 	ldr	q0, 338c <THREAD_HW_CONTEXT_SIZE+0x326c>
    1390:	00000096 	udf	#150
    1394:	6e667003 	uabdl2	v3.4s, v0.8h, v6.8h
    1398:	96250c00 	bl	fffffffff8944398 <IRQ_SOURCE_EL0_CORE_0+0xffffb8944338>
    139c:	02000000 	.inst	0x02000000 ; undefined
    13a0:	06007891 	.inst	0x06007891 ; undefined
    13a4:	08cc0208 	ldlarb	w8, [x16]
    13a8:	b0080000 	adrp	x0, 10002000 <TCR_VALUE+0xff01ff0>
    13ac:	0000083c 	udf	#2108
    13b0:	14000000 	b	13b0 <THREAD_HW_CONTEXT_SIZE+0x1290>
    13b4:	00000000 	udf	#0
    13b8:	01000000 	.inst	0x01000000 ; undefined
    13bc:	0000c39c 	udf	#50076
    13c0:	66700300 	.inst	0x66700300 ; undefined
    13c4:	2108006e 	.inst	0x2108006e ; undefined
    13c8:	00000096 	udf	#150
    13cc:	00789102 	.inst	0x00789102 ; undefined
    13d0:	0008e007 	.inst	0x0008e007 ; undefined
    13d4:	0d040100 	.inst	0x0d040100 ; undefined
    13d8:	00083ca8 	.inst	0x00083ca8 ; undefined
    13dc:	00000000 	udf	#0
    13e0:	00000008 	udf	#8
    13e4:	00000000 	udf	#0
    13e8:	af009c01 	.inst	0xaf009c01 ; undefined
    13ec:	05000001 	orr	z1.s, z1.s, #0x1
    13f0:	cc080100 	.inst	0xcc080100 ; undefined
    13f4:	07000009 	.inst	0x07000009 ; undefined
    13f8:	00000098 	udf	#152
    13fc:	0001c40c 	.inst	0x0001c40c ; undefined
    1400:	00000000 	udf	#0
    1404:	083ce000 	.inst	0x083ce000 ; undefined
    1408:	00000000 	udf	#0
    140c:	00010800 	.inst	0x00010800 ; undefined
    1410:	00000000 	udf	#0
    1414:	000b1b00 	.inst	0x000b1b00 ; undefined
    1418:	08010100 	stxrb	w1, w0, [x8]
    141c:	00000139 	udf	#313
    1420:	66070201 	.inst	0x66070201 ; undefined
    1424:	05000001 	orr	z1.s, z1.s, #0x1
    1428:	00323375 	.inst	0x00323375 ; NYI
    142c:	00004606 	udf	#17926
    1430:	07040100 	.inst	0x07040100 ; undefined
    1434:	000001ac 	udf	#428
    1438:	34367505 	cbz	w5, 6e2d8 <MAIR_ATTR+0x69ed8>
    143c:	00570700 	.inst	0x00570700 ; undefined
    1440:	08010000 	stxrb	w1, w0, [x0]
    1444:	0001a207 	.inst	0x0001a207 ; undefined
    1448:	07080100 	.inst	0x07080100 ; undefined
    144c:	000001a7 	udf	#423
    1450:	00093608 	.inst	0x00093608 ; undefined
    1454:	e4032000 	stnt1b	{z0.d}, p0, [z0.d, x3]
    1458:	0000cb10 	udf	#51984
    145c:	093c0200 	.inst	0x093c0200 ; undefined
    1460:	3ce50000 	.inst	0x3ce50000 ; undefined
    1464:	00000000 	udf	#0
    1468:	00039b02 	.inst	0x00039b02 ; undefined
    146c:	003ce600 	.inst	0x003ce600 ; NYI
    1470:	02040000 	.inst	0x02040000 ; undefined
    1474:	00000965 	udf	#2405
    1478:	00003ce7 	udf	#15591
    147c:	7f020800 	.inst	0x7f020800 ; undefined
    1480:	e8000009 	.inst	0xe8000009 ; undefined
    1484:	0000003c 	udf	#60
    1488:	0996020c 	.inst	0x0996020c ; undefined
    148c:	3ce90000 	.inst	0x3ce90000 ; undefined
    1490:	10000000 	adr	x0, 1490 <THREAD_HW_CONTEXT_SIZE+0x1370>
    1494:	00098902 	.inst	0x00098902 ; undefined
    1498:	003cea00 	.inst	0x003cea00 ; NYI
    149c:	02140000 	.inst	0x02140000 ; undefined
    14a0:	00000975 	udf	#2421
    14a4:	00003ceb 	udf	#15595
    14a8:	29021800 	stp	w0, w6, [x0, #16]
    14ac:	ec000009 	.inst	0xec000009 ; undefined
    14b0:	0000003c 	udf	#60
    14b4:	0101001c 	.inst	0x0101001c ; undefined
    14b8:	00013b06 	.inst	0x00013b06 ; undefined
    14bc:	05020100 	orr	z0.d, z0.d, #0x1ff
    14c0:	000001de 	udf	#478
    14c4:	69050409 	stgp	x9, x1, [x0, #160]
    14c8:	0100746e 	.inst	0x0100746e ; undefined
    14cc:	01ef0508 	.inst	0x01ef0508 ; undefined
    14d0:	56060000 	.inst	0x56060000 ; undefined
    14d4:	07000009 	.inst	0x07000009 ; undefined
    14d8:	0000004d 	udf	#77
    14dc:	86380309 	.inst	0x86380309 ; undefined
    14e0:	00000009 	udf	#9
    14e4:	6f060000 	.inst	0x6f060000 ; undefined
    14e8:	08000009 	stxrb	w0, w9, [x0]
    14ec:	0000004d 	udf	#77
    14f0:	86400309 	.inst	0x86400309 ; undefined
    14f4:	00000009 	udf	#9
    14f8:	520a0000 	eor	w0, w0, #0x400000
    14fc:	01000009 	.inst	0x01000009 ; undefined
    1500:	01211125 	.inst	0x01211125 ; undefined
    1504:	4d030000 	.inst	0x4d030000 ; undefined
    1508:	00000000 	udf	#0
    150c:	0001e80b 	.inst	0x0001e80b ; undefined
    1510:	05040400 	.inst	0x05040400 ; undefined
    1514:	000000d9 	udf	#217
    1518:	00000138 	udf	#312
    151c:	00013803 	.inst	0x00013803 ; undefined
    1520:	0c000400 	st4	{v0.4h-v3.4h}, [x0]
    1524:	00014508 	.inst	0x00014508 ; undefined
    1528:	08010100 	stxrb	w1, w0, [x8]
    152c:	00000142 	udf	#322
    1530:	00013e0d 	.inst	0x00013e0d ; undefined
    1534:	091a0e00 	.inst	0x091a0e00 ; undefined
    1538:	0d010000 	.inst	0x0d010000 ; undefined
    153c:	00004d0c 	udf	#19724
    1540:	00015c00 	.inst	0x00015c00 ; undefined
    1544:	0f000400 	movi	v0.2s, #0x0
    1548:	000003cd 	udf	#973
    154c:	50062401 	adr	x1, d9ce <MAIR_ATTR+0x95ce>
    1550:	0000083d 	udf	#2109
    1554:	98000000 	ldrsw	x0, 1554 <THREAD_HW_CONTEXT_SIZE+0x1434>
    1558:	00000000 	udf	#0
    155c:	01000000 	.inst	0x01000000 ; undefined
    1560:	0001899c 	.inst	0x0001899c ; undefined
    1564:	09521000 	.inst	0x09521000 ; undefined
    1568:	25010000 	cmpge	p0.b, p0/z, z0.b, #1
    156c:	004d0311 	.inst	0x004d0311 ; undefined
    1570:	00000000 	udf	#0
    1574:	00094711 	.inst	0x00094711 ; undefined
    1578:	060b0100 	.inst	0x060b0100 ; undefined
    157c:	00083ce0 	.inst	0x00083ce0 ; undefined
    1580:	00000000 	udf	#0
    1584:	00000070 	udf	#112
    1588:	00000000 	udf	#0
    158c:	1a129c01 	.inst	0x1a129c01 ; undefined
    1590:	01000009 	.inst	0x01000009 ; undefined
    1594:	004d0c0d 	.inst	0x004d0c0d ; undefined
    1598:	00040000 	.inst	0x00040000 ; undefined
    159c:	00680000 	.inst	0x00680000 ; undefined
    15a0:	00050000 	.inst	0x00050000 ; undefined
    15a4:	0af50801 	bic	w1, w0, w21, ror #2
    15a8:	98020000 	ldrsw	x0, 55a8 <MAIR_ATTR+0x11a8>
    15ac:	0c000000 	st4	{v0.8b-v3.8b}, [x0]
    15b0:	000001d3 	udf	#467
    15b4:	00000000 	udf	#0
    15b8:	00083de8 	.inst	0x00083de8 ; undefined
    15bc:	00000000 	udf	#0
    15c0:	00000008 	udf	#8
    15c4:	00000000 	udf	#0
    15c8:	00000bb3 	udf	#2995
    15cc:	39080101 	strb	w1, [x8, #512]
    15d0:	01000001 	.inst	0x01000001 ; undefined
    15d4:	01660702 	.inst	0x01660702 ; undefined
    15d8:	04010000 	sub	z0.b, p0/m, z0.b, z0.b
    15dc:	0001ac07 	.inst	0x0001ac07 ; undefined
    15e0:	07080100 	.inst	0x07080100 ; undefined
    15e4:	000001a2 	udf	#418
    15e8:	a7070801 	.inst	0xa7070801 ; undefined
    15ec:	03000001 	.inst	0x03000001 ; undefined
    15f0:	000009a0 	udf	#2464
    15f4:	e8060501 	.inst	0xe8060501 ; undefined
    15f8:	0000083d 	udf	#2109
    15fc:	08000000 	stxrb	w0, w0, [x0]
    1600:	00000000 	udf	#0
    1604:	01000000 	.inst	0x01000000 ; undefined
    1608:	028d009c 	.inst	0x028d009c ; undefined
    160c:	00050000 	.inst	0x00050000 ; undefined
    1610:	0b2d0801 	add	w1, w0, w13, uxtb #2
    1614:	980d0000 	ldrsw	x0, 1b614 <MAIR_ATTR+0x17214>
    1618:	0c000000 	st4	{v0.8b-v3.8b}, [x0]
    161c:	000001e0 	udf	#480
    1620:	00000000 	udf	#0
    1624:	00083df0 	.inst	0x00083df0 ; undefined
    1628:	00000000 	udf	#0
    162c:	000002ec 	udf	#748
    1630:	00000000 	udf	#0
    1634:	00000c03 	udf	#3075
    1638:	00387506 	.inst	0x00387506 ; NYI
    163c:	00003704 	udf	#14084
    1640:	08010400 	stxrb	w1, w0, [x0]
    1644:	00000139 	udf	#313
    1648:	66070204 	.inst	0x66070204 ; undefined
    164c:	06000001 	.inst	0x06000001 ; undefined
    1650:	00323375 	.inst	0x00323375 ; NYI
    1654:	00005406 	udf	#21510
    1658:	00450e00 	.inst	0x00450e00 ; undefined
    165c:	04040000 	.inst	0x04040000 ; undefined
    1660:	0001ac07 	.inst	0x0001ac07 ; undefined
    1664:	36750600 	tbz	w0, #14, ffffffffffffb724 <IRQ_SOURCE_EL0_CORE_0+0xffffbfffb6c4>
    1668:	65070034 	.inst	0x65070034 ; undefined
    166c:	04000000 	add	z0.b, p0/m, z0.b, z0.b
    1670:	01a20708 	.inst	0x01a20708 ; undefined
    1674:	3f070000 	.inst	0x3f070000 ; undefined
    1678:	0200000a 	.inst	0x0200000a ; undefined
    167c:	004f170b 	.inst	0x004f170b ; undefined
    1680:	080f0000 	stxrb	w15, w0, [x0]
    1684:	0000002e 	udf	#46
    1688:	a7070804 	.inst	0xa7070804 ; undefined
    168c:	09000001 	.inst	0x09000001 ; undefined
    1690:	000002d6 	udf	#726
    1694:	00000054 	udf	#84
    1698:	0000c445 	udf	#50245
    169c:	02bb0100 	.inst	0x02bb0100 ; undefined
    16a0:	01000000 	.inst	0x01000000 ; undefined
    16a4:	0000029a 	udf	#666
    16a8:	02f30101 	.inst	0x02f30101 ; undefined
    16ac:	01040000 	.inst	0x01040000 ; undefined
    16b0:	00000302 	udf	#770
    16b4:	03110105 	.inst	0x03110105 ; undefined
    16b8:	01060000 	.inst	0x01060000 ; undefined
    16bc:	00000320 	udf	#800
    16c0:	032f0107 	.inst	0x032f0107 ; undefined
    16c4:	01030000 	.inst	0x01030000 ; undefined
    16c8:	0000033e 	udf	#830
    16cc:	d7070002 	.inst	0xd7070002 ; undefined
    16d0:	03000002 	.inst	0x03000002 ; undefined
    16d4:	0085024e 	.inst	0x0085024e ; undefined
    16d8:	69100000 	stgp	x0, x0, [x0, #512]
    16dc:	20006332 	.inst	0x20006332 ; undefined
    16e0:	3610a103 	tbz	w3, #2, 2b00 <THREAD_HW_CONTEXT_SIZE+0x29e0>
    16e4:	02000001 	.inst	0x02000001 ; undefined
    16e8:	00000a1e 	udf	#2590
    16ec:	00006ca2 	udf	#27810
    16f0:	64020000 	.inst	0x64020000 ; undefined
    16f4:	a300000a 	.inst	0xa300000a ; undefined
    16f8:	0000006c 	udf	#108
    16fc:	0a530204 	and	w4, w16, w19, lsr #0
    1700:	6ca40000 	stp	d0, d0, [x0], #-448
    1704:	08000000 	stxrb	w0, w0, [x0]
    1708:	000a2602 	.inst	0x000a2602 ; undefined
    170c:	006ca500 	.inst	0x006ca500 ; undefined
    1710:	020c0000 	.inst	0x020c0000 ; undefined
    1714:	000009d8 	udf	#2520
    1718:	00006ca6 	udf	#27814
    171c:	d0021000 	adrp	x0, 4203000 <TCR_VALUE+0x4102ff0>
    1720:	a7000009 	.inst	0xa7000009 ; undefined
    1724:	0000006c 	udf	#108
    1728:	0a040214 	and	w20, w16, w4
    172c:	6ca80000 	stp	d0, d0, [x0], #-384
    1730:	18000000 	ldr	w0, 1730 <THREAD_HW_CONTEXT_SIZE+0x1610>
    1734:	0009e202 	.inst	0x0009e202 ; undefined
    1738:	006ca900 	.inst	0x006ca900 ; undefined
    173c:	001c0000 	.inst	0x001c0000 ; undefined
    1740:	000a5f09 	.inst	0x000a5f09 ; undefined
    1744:	00005400 	udf	#21504
    1748:	015dac00 	.inst	0x015dac00 ; undefined
    174c:	b2010000 	orr	x0, x0, #0x8000000080000000
    1750:	00000009 	udf	#9
    1754:	0009f601 	.inst	0x0009f601 ; undefined
    1758:	31010100 	adds	w0, w8, #0x40
    175c:	0200000a 	.inst	0x0200000a ; undefined
    1760:	0009be01 	.inst	0x0009be01 ; undefined
    1764:	07000300 	.inst	0x07000300 ; undefined
    1768:	00000a60 	udf	#2656
    176c:	3602b103 	tbz	w3, #0, 6d8c <MAIR_ATTR+0x298c>
    1770:	0a000001 	and	w1, w0, w0
    1774:	000002ab 	udf	#683
    1778:	00017969 	.inst	0x00017969 ; undefined
    177c:	002e0800 	.inst	0x002e0800 ; NYI
    1780:	0a000000 	and	w0, w0, w0
    1784:	0000027c 	udf	#636
    1788:	00018e68 	.inst	0x00018e68 ; undefined
    178c:	002e0800 	.inst	0x002e0800 ; NYI
    1790:	c4080000 	ld1sb	{z0.d}, p0/z, [x0, z8.d, uxtw]
    1794:	00000000 	udf	#0
    1798:	000a4a0b 	.inst	0x000a4a0b ; undefined
    179c:	015d2a00 	.inst	0x015d2a00 ; undefined
    17a0:	3f600000 	.inst	0x3f600000 ; undefined
    17a4:	00000008 	udf	#8
    17a8:	017c0000 	.inst	0x017c0000 ; undefined
    17ac:	00000000 	udf	#0
    17b0:	9c010000 	ldr	q0, 37b0 <THREAD_HW_CONTEXT_SIZE+0x3690>
    17b4:	00000202 	udf	#514
    17b8:	00088303 	.inst	0x00088303 ; undefined
    17bc:	5b1a2a00 	.inst	0x5b1a2a00 ; undefined
    17c0:	02000000 	.inst	0x02000000 ; undefined
    17c4:	45035891 	.inst	0x45035891 ; undefined
    17c8:	2a00000a 	orr	w10, w0, w0
    17cc:	00007824 	udf	#30756
    17d0:	50910200 	adr	x0, fffffffffff23812 <IRQ_SOURCE_EL0_CORE_0+0xffffbff237b2>
    17d4:	0008c703 	.inst	0x0008c703 ; undefined
    17d8:	5b2e2a00 	.inst	0x5b2e2a00 ; undefined
    17dc:	02000000 	.inst	0x02000000 ; undefined
    17e0:	720c4891 	ands	w17, w4, #0xfff0007f
    17e4:	2b007465 	adds	w5, w3, w0, lsl #29
    17e8:	0000015d 	udf	#349
    17ec:	057c9102 	.inst	0x057c9102 ; undefined
    17f0:	00000a0f 	udf	#2575
    17f4:	005b0931 	.inst	0x005b0931 ; undefined
    17f8:	91020000 	add	x0, x0, #0x80
    17fc:	0a640570 	bic	w16, w11, w4, lsr #1
    1800:	0b3f0000 	add	w0, w0, wzr, uxtb
    1804:	0000006c 	udf	#108
    1808:	006c9102 	.inst	0x006c9102 ; undefined
    180c:	000a6b0b 	.inst	0x000a6b0b ; undefined
    1810:	015d1000 	.inst	0x015d1000 ; undefined
    1814:	3e3c0000 	.inst	0x3e3c0000 ; undefined
    1818:	00000008 	udf	#8
    181c:	01240000 	.inst	0x01240000 ; undefined
    1820:	00000000 	udf	#0
    1824:	9c010000 	ldr	q0, 3824 <THREAD_HW_CONTEXT_SIZE+0x3704>
    1828:	00000276 	udf	#630
    182c:	00088303 	.inst	0x00088303 ; undefined
    1830:	5b1a1000 	.inst	0x5b1a1000 ; undefined
    1834:	02000000 	.inst	0x02000000 ; undefined
    1838:	45035891 	.inst	0x45035891 ; undefined
    183c:	1000000a 	adr	x10, 183c <THREAD_HW_CONTEXT_SIZE+0x171c>
    1840:	00007824 	udf	#30756
    1844:	50910200 	adr	x0, fffffffffff23886 <IRQ_SOURCE_EL0_CORE_0+0xffffbff23826>
    1848:	0008c703 	.inst	0x0008c703 ; undefined
    184c:	5b2e1000 	.inst	0x5b2e1000 ; undefined
    1850:	02000000 	.inst	0x02000000 ; undefined
    1854:	720c4891 	ands	w17, w4, #0xfff0007f
    1858:	11007465 	add	w5, w3, #0x1d
    185c:	0000015d 	udf	#349
    1860:	057c9102 	.inst	0x057c9102 ; undefined
    1864:	00000a0f 	udf	#2575
    1868:	005b0917 	.inst	0x005b0917 ; undefined
    186c:	91020000 	add	x0, x0, #0x80
    1870:	0a640570 	bic	w16, w11, w4, lsr #1
    1874:	0b200000 	add	w0, w0, w0, uxtb
    1878:	0000006c 	udf	#108
    187c:	006c9102 	.inst	0x006c9102 ; undefined
    1880:	0009a911 	.inst	0x0009a911 ; undefined
    1884:	06050100 	.inst	0x06050100 ; undefined
    1888:	00083df0 	.inst	0x00083df0 ; undefined
    188c:	00000000 	udf	#0
    1890:	0000004c 	udf	#76
    1894:	00000000 	udf	#0
    1898:	b0009c01 	adrp	x1, 1382000 <TCR_VALUE+0x1281ff0>
    189c:	05000002 	orr	z2.s, z2.s, #0x1
    18a0:	4f080100 	.inst	0x4f080100 ; undefined
    18a4:	0c00000c 	st4	{v12.8b-v15.8b}, [x0]
    18a8:	00000098 	udf	#152
    18ac:	0001ed0c 	.inst	0x0001ed0c ; undefined
    18b0:	00000000 	udf	#0
    18b4:	0840dc00 	ldaxrb	w0, [x0]
    18b8:	00000000 	udf	#0
    18bc:	0001d400 	.inst	0x0001d400 ; undefined
    18c0:	00000000 	udf	#0
    18c4:	000d7600 	.inst	0x000d7600 ; undefined
    18c8:	38750300 	ldaddlb	w21, w0, [x24]
    18cc:	00370400 	.inst	0x00370400 ; NYI
    18d0:	01020000 	.inst	0x01020000 ; undefined
    18d4:	00013908 	.inst	0x00013908 ; undefined
    18d8:	31750300 	adds	w0, w24, #0xd40, lsl #12
    18dc:	48050036 	stxrh	w5, w22, [x1]
    18e0:	02000000 	.inst	0x02000000 ; undefined
    18e4:	01660702 	.inst	0x01660702 ; undefined
    18e8:	75030000 	.inst	0x75030000 ; undefined
    18ec:	06003233 	.inst	0x06003233 ; undefined
    18f0:	0000005e 	udf	#94
    18f4:	00004f04 	udf	#20228
    18f8:	07040200 	.inst	0x07040200 ; undefined
    18fc:	000001ac 	udf	#428
    1900:	a2070802 	.inst	0xa2070802 ; undefined
    1904:	0d000001 	st1	{v1.b}[0], [x0]
    1908:	00000a3f 	udf	#2623
    190c:	59170b02 	.inst	0x59170b02 ; undefined
    1910:	0e000000 	tbl	v0.8b, {v0.16b}, v0.8b
    1914:	00000a8b 	udf	#2699
    1918:	005e0407 	.inst	0x005e0407 ; undefined
    191c:	22030000 	.inst	0x22030000 ; undefined
    1920:	00009d06 	udf	#40198
    1924:	0ad20500 	and	w0, w8, w18, ror #1
    1928:	05000000 	orr	z0.s, z0.s, #0x1
    192c:	00000b0a 	udf	#2826
    1930:	0a7e0501 	bic	w1, w8, w30, lsr #1
    1934:	00020000 	.inst	0x00020000 ; undefined
    1938:	000abb0f 	.inst	0x000abb0f ; undefined
    193c:	29034200 	stp	w0, w16, [x16, #24]
    1940:	00012f10 	.inst	0x00012f10 ; undefined
    1944:	0ab50100 	bic	w0, w8, w21, asr #0
    1948:	6c2a0000 	stnp	d0, d0, [x0, #-352]
    194c:	00000000 	udf	#0
    1950:	00039b01 	.inst	0x00039b01 ; undefined
    1954:	013f2b00 	.inst	0x013f2b00 ; undefined
    1958:	01040000 	.inst	0x01040000 ; undefined
    195c:	00000b04 	udf	#2820
    1960:	00006c2c 	udf	#27692
    1964:	96011800 	bl	fffffffff8047964 <IRQ_SOURCE_EL0_CORE_0+0xffffb8047904>
    1968:	2d000009 	stp	s9, s0, [x0]
    196c:	0000015b 	udf	#347
    1970:	0aad011c 	bic	w28, w8, w13, asr #0
    1974:	6c2e0000 	stnp	d0, d0, [x0, #-288]
    1978:	24000000 	cmphs	p0.b, p0/z, z0.b, z0.b
    197c:	000aca01 	.inst	0x000aca01 ; undefined
    1980:	006c2f00 	.inst	0x006c2f00 ; undefined
    1984:	01280000 	.inst	0x01280000 ; undefined
    1988:	00000b19 	udf	#2841
    198c:	00006c30 	udf	#27696
    1990:	30012c00 	adr	x0, 3f11 <THREAD_HW_CONTEXT_SIZE+0x3df1>
    1994:	3100000b 	adds	w11, w0, #0x0
    1998:	0000006c 	udf	#108
    199c:	09750130 	.inst	0x09750130 ; undefined
    19a0:	6c320000 	stnp	d0, d0, [x0, #-224]
    19a4:	34000000 	cbz	w0, 19a4 <THREAD_HW_CONTEXT_SIZE+0x1884>
    19a8:	000aa501 	.inst	0x000aa501 ; undefined
    19ac:	006c3300 	.inst	0x006c3300 ; undefined
    19b0:	01380000 	.inst	0x01380000 ; undefined
    19b4:	00000ac0 	udf	#2752
    19b8:	00003e34 	udf	#15924
    19bc:	fd013c00 	str	d0, [x0, #632]
    19c0:	3500000a 	cbnz	w10, 19c0 <THREAD_HW_CONTEXT_SIZE+0x18a0>
    19c4:	0000006c 	udf	#108
    19c8:	6c09003e 	stnp	d30, d0, [x1, #144]
    19cc:	3f000000 	.inst	0x3f000000 ; undefined
    19d0:	0a000001 	and	w1, w0, w0
    19d4:	00000144 	udf	#324
    19d8:	2f040004 	.inst	0x2f040004 ; undefined
    19dc:	02000001 	.inst	0x02000001 ; undefined
    19e0:	01a70708 	.inst	0x01a70708 ; undefined
    19e4:	6c090000 	stnp	d0, d0, [x0, #144]
    19e8:	5b000000 	.inst	0x5b000000 ; undefined
    19ec:	0a000001 	and	w1, w0, w0
    19f0:	00000144 	udf	#324
    19f4:	4b040001 	sub	w1, w0, w4
    19f8:	10000001 	adr	x1, 19f8 <THREAD_HW_CONTEXT_SIZE+0x18d8>
    19fc:	000001f8 	udf	#504
    1a00:	54064001 	b.ne	e200 <MAIR_ATTR+0x9e00>  // b.any
    1a04:	00000842 	udf	#2114
    1a08:	5c000000 	ldr	d0, 1a08 <THREAD_HW_CONTEXT_SIZE+0x18e8>
    1a0c:	00000000 	udf	#0
    1a10:	01000000 	.inst	0x01000000 ; undefined
    1a14:	0001ac9c 	.inst	0x0001ac9c ; undefined
    1a18:	74730600 	.inst	0x74730600 ; undefined
    1a1c:	1f400072 	fmadd	d18, d3, d0, d0
    1a20:	000001ac 	udf	#428
    1a24:	11689102 	add	w2, w8, #0xa24, lsl #12
    1a28:	00084260 	.inst	0x00084260 ; undefined
    1a2c:	00000000 	udf	#0
    1a30:	00000040 	udf	#64
    1a34:	00000000 	udf	#0
    1a38:	01006912 	.inst	0x01006912 ; undefined
    1a3c:	01b90e41 	.inst	0x01b90e41 ; undefined
    1a40:	91020000 	add	x0, x0, #0x80
    1a44:	1300007c 	sbfx	w28, w3, #0, #1
    1a48:	0001b208 	.inst	0x0001b208 ; undefined
    1a4c:	08010200 	stxrb	w1, w0, [x16]
    1a50:	00000142 	udf	#322
    1a54:	69050414 	stgp	x20, x1, [x0, #160]
    1a58:	1500746e 	b	401ec10 <TCR_VALUE+0x3f1ec00>
    1a5c:	00000b21 	udf	#2849
    1a60:	2e043a01 	ext	v1.8b, v16.8b, v4.8b, #7
    1a64:	24000000 	cmphs	p0.b, p0/z, z0.b, z0.b
    1a68:	00000842 	udf	#2114
    1a6c:	30000000 	adr	x0, 1a6d <THREAD_HW_CONTEXT_SIZE+0x194d>
    1a70:	00000000 	udf	#0
    1a74:	01000000 	.inst	0x01000000 ; undefined
    1a78:	0b40079c 	add	w28, w28, w0, lsr #1
    1a7c:	e4340000 	.inst	0xe4340000 ; undefined
    1a80:	00000841 	udf	#2113
    1a84:	40000000 	.inst	0x40000000 ; undefined
    1a88:	00000000 	udf	#0
    1a8c:	01000000 	.inst	0x01000000 ; undefined
    1a90:	0002079c 	.inst	0x0002079c ; undefined
    1a94:	00630600 	.inst	0x00630600 ; undefined
    1a98:	002e1934 	.inst	0x002e1934 ; NYI
    1a9c:	91020000 	add	x0, x0, #0x80
    1aa0:	4f0b007f 	.inst	0x4f0b007f ; undefined
    1aa4:	3000000b 	adr	x11, 1aa5 <THREAD_HW_CONTEXT_SIZE+0x1985>
    1aa8:	000841dc 	.inst	0x000841dc ; undefined
    1aac:	00000000 	udf	#0
    1ab0:	00000008 	udf	#8
    1ab4:	00000000 	udf	#0
    1ab8:	28079c01 	stnp	w1, w7, [x0, #60]
    1abc:	2b000005 	adds	w5, w0, w0
    1ac0:	0008419c 	.inst	0x0008419c ; undefined
    1ac4:	00000000 	udf	#0
    1ac8:	00000040 	udf	#64
    1acc:	00000000 	udf	#0
    1ad0:	02489c01 	.inst	0x02489c01 ; undefined
    1ad4:	63060000 	.inst	0x63060000 ; undefined
    1ad8:	2e162b00 	ext	v0.8b, v24.8b, v22.8b, #5
    1adc:	02000000 	.inst	0x02000000 ; undefined
    1ae0:	07007f91 	.inst	0x07007f91 ; undefined
    1ae4:	00000a74 	udf	#2676
    1ae8:	0840e408 	ldaxrb	w8, [x0]
    1aec:	00000000 	udf	#0
    1af0:	0000b800 	udf	#47104
    1af4:	00000000 	udf	#0
    1af8:	9b9c0100 	.inst	0x9b9c0100 ; undefined
    1afc:	16000002 	b	fffffffff8001b04 <IRQ_SOURCE_EL0_CORE_0+0xffffb8001aa4>
    1b00:	00000a94 	udf	#2708
    1b04:	781f0801 	sttrh	w1, [x0, #-16]
    1b08:	02000000 	.inst	0x02000000 ; undefined
    1b0c:	36086c91 	tbz	w17, #1, 289c <THREAD_HW_CONTEXT_SIZE+0x277c>
    1b10:	0900000b 	.inst	0x0900000b ; undefined
    1b14:	0000006c 	udf	#108
    1b18:	087c9102 	.inst	0x087c9102 ; undefined
    1b1c:	00000adc 	udf	#2780
    1b20:	00006c0a 	udf	#27658
    1b24:	78910200 	ldursh	x0, [x16, #-240]
    1b28:	000a9d08 	.inst	0x000a9d08 ; undefined
    1b2c:	006c0b00 	.inst	0x006c0b00 ; undefined
    1b30:	91020000 	add	x0, x0, #0x80
    1b34:	e60b0074 	.inst	0xe60b0074 ; undefined
    1b38:	0400000a 	add	z10.b, p0/m, z10.b, z0.b
    1b3c:	000840dc 	.inst	0x000840dc ; undefined
    1b40:	00000000 	udf	#0
    1b44:	00000008 	udf	#8
    1b48:	00000000 	udf	#0
    1b4c:	d2009c01 	eor	x1, x0, #0xff00ff00ff00ff
    1b50:	05000002 	orr	z2.s, z2.s, #0x1
    1b54:	bb080100 	.inst	0xbb080100 ; undefined
    1b58:	0c00000d 	st4	{v13.8b-v16.8b}, [x0]
    1b5c:	00000098 	udf	#152
    1b60:	0001fb0c 	.inst	0x0001fb0c ; undefined
    1b64:	00000000 	udf	#0
    1b68:	0842b000 	ldaxrb	w0, [x0]
    1b6c:	00000000 	udf	#0
    1b70:	0001ec00 	.inst	0x0001ec00 ; undefined
    1b74:	00000000 	udf	#0
    1b78:	000ebd00 	.inst	0x000ebd00 ; undefined
    1b7c:	08010200 	stxrb	w1, w0, [x16]
    1b80:	00000139 	udf	#313
    1b84:	36317504 	tbz	w4, #6, 4a24 <MAIR_ATTR+0x624>
    1b88:	003f0500 	.inst	0x003f0500 ; NYI
    1b8c:	02020000 	.inst	0x02020000 ; undefined
    1b90:	00016607 	.inst	0x00016607 ; undefined
    1b94:	33750400 	.inst	0x33750400 ; undefined
    1b98:	55060032 	.inst	0x55060032 ; undefined
    1b9c:	05000000 	orr	z0.s, z0.s, #0x1
    1ba0:	00000046 	udf	#70
    1ba4:	ac070402 	stnp	q2, q1, [x0, #224]
    1ba8:	04000001 	add	z1.b, p0/m, z1.b, z0.b
    1bac:	00343675 	.inst	0x00343675 ; NYI
    1bb0:	00006607 	udf	#26119
    1bb4:	07080200 	.inst	0x07080200 ; undefined
    1bb8:	000001a2 	udf	#418
    1bbc:	000a3f0d 	.inst	0x000a3f0d ; undefined
    1bc0:	170b0200 	b	fffffffffc2c23c0 <IRQ_SOURCE_EL0_CORE_0+0xffffbc2c2360>
    1bc4:	00000050 	udf	#80
    1bc8:	000b8906 	.inst	0x000b8906 ; undefined
    1bcc:	00005500 	udf	#21760
    1bd0:	00ac0d00 	.inst	0x00ac0d00 ; undefined
    1bd4:	80030000 	.inst	0x80030000 ; undefined
    1bd8:	0000000b 	udf	#11
    1bdc:	000bba03 	.inst	0x000bba03 ; undefined
    1be0:	b1030100 	adds	x0, x8, #0xc0
    1be4:	0200000b 	.inst	0x0200000b ; undefined
    1be8:	000b6c03 	.inst	0x000b6c03 ; undefined
    1bec:	c2030300 	.inst	0xc2030300 ; undefined
    1bf0:	0400000b 	add	z11.b, p0/m, z11.b, z0.b
    1bf4:	000b6003 	.inst	0x000b6003 ; undefined
    1bf8:	06000500 	.inst	0x06000500 ; undefined
    1bfc:	00000a8b 	udf	#2699
    1c00:	00000055 	udf	#85
    1c04:	0000cd22 	udf	#52514
    1c08:	0ad20300 	and	w0, w24, w18, ror #0
    1c0c:	03000000 	.inst	0x03000000 ; undefined
    1c10:	00000b0a 	udf	#2826
    1c14:	0a7e0301 	bic	w1, w24, w30, lsr #0
    1c18:	00020000 	.inst	0x00020000 ; undefined
    1c1c:	000abb07 	.inst	0x000abb07 ; undefined
    1c20:	69294200 	stgp	x0, x16, [x16, #-736]
    1c24:	01000001 	.inst	0x01000001 ; undefined
    1c28:	00000ab5 	udf	#2741
    1c2c:	006d0b2a 	.inst	0x006d0b2a ; undefined
    1c30:	01000000 	.inst	0x01000000 ; undefined
    1c34:	0000039b 	udf	#923
    1c38:	01790b2b 	.inst	0x01790b2b ; undefined
    1c3c:	01040000 	.inst	0x01040000 ; undefined
    1c40:	00000b04 	udf	#2820
    1c44:	006d0b2c 	.inst	0x006d0b2c ; undefined
    1c48:	01180000 	.inst	0x01180000 ; undefined
    1c4c:	00000996 	udf	#2454
    1c50:	01950b2d 	.inst	0x01950b2d ; undefined
    1c54:	011c0000 	.inst	0x011c0000 ; undefined
    1c58:	00000aad 	udf	#2733
    1c5c:	006d0b2e 	.inst	0x006d0b2e ; undefined
    1c60:	01240000 	.inst	0x01240000 ; undefined
    1c64:	00000aca 	udf	#2762
    1c68:	006d0b2f 	.inst	0x006d0b2f ; undefined
    1c6c:	01280000 	.inst	0x01280000 ; undefined
    1c70:	00000b19 	udf	#2841
    1c74:	006d0b30 	.inst	0x006d0b30 ; undefined
    1c78:	012c0000 	.inst	0x012c0000 ; undefined
    1c7c:	00000b30 	udf	#2864
    1c80:	006d0b31 	.inst	0x006d0b31 ; undefined
    1c84:	01300000 	.inst	0x01300000 ; undefined
    1c88:	00000975 	udf	#2421
    1c8c:	006d0b32 	.inst	0x006d0b32 ; undefined
    1c90:	01340000 	.inst	0x01340000 ; undefined
    1c94:	00000aa5 	udf	#2725
    1c98:	006d0b33 	.inst	0x006d0b33 ; undefined
    1c9c:	01380000 	.inst	0x01380000 ; undefined
    1ca0:	00000ac0 	udf	#2752
    1ca4:	00350b34 	.inst	0x00350b34 ; NYI
    1ca8:	013c0000 	.inst	0x013c0000 ; undefined
    1cac:	00000afd 	udf	#2813
    1cb0:	006d0b35 	.inst	0x006d0b35 ; undefined
    1cb4:	003e0000 	.inst	0x003e0000 ; NYI
    1cb8:	00006d08 	udf	#27912
    1cbc:	00017900 	.inst	0x00017900 ; undefined
    1cc0:	017e0900 	.inst	0x017e0900 ; undefined
    1cc4:	00040000 	.inst	0x00040000 ; undefined
    1cc8:	00016905 	.inst	0x00016905 ; undefined
    1ccc:	07080200 	.inst	0x07080200 ; undefined
    1cd0:	000001a7 	udf	#423
    1cd4:	00006d08 	udf	#27912
    1cd8:	00019500 	.inst	0x00019500 ; undefined
    1cdc:	017e0900 	.inst	0x017e0900 ; undefined
    1ce0:	00010000 	.inst	0x00010000 ; undefined
    1ce4:	00018505 	.inst	0x00018505 ; undefined
    1ce8:	09360700 	.inst	0x09360700 ; undefined
    1cec:	e4200000 	.inst	0xe4200000 ; undefined
    1cf0:	00000206 	udf	#518
    1cf4:	00093c01 	.inst	0x00093c01 ; undefined
    1cf8:	4609e500 	.inst	0x4609e500 ; undefined
    1cfc:	00000000 	udf	#0
    1d00:	00039b01 	.inst	0x00039b01 ; undefined
    1d04:	4609e600 	.inst	0x4609e600 ; undefined
    1d08:	04000000 	add	z0.b, p0/m, z0.b, z0.b
    1d0c:	00096501 	.inst	0x00096501 ; undefined
    1d10:	4609e700 	.inst	0x4609e700 ; undefined
    1d14:	08000000 	stxrb	w0, w0, [x0]
    1d18:	00097f01 	.inst	0x00097f01 ; undefined
    1d1c:	4609e800 	.inst	0x4609e800 ; undefined
    1d20:	0c000000 	st4	{v0.8b-v3.8b}, [x0]
    1d24:	00099601 	.inst	0x00099601 ; undefined
    1d28:	4609e900 	.inst	0x4609e900 ; undefined
    1d2c:	10000000 	adr	x0, 1d2c <THREAD_HW_CONTEXT_SIZE+0x1c0c>
    1d30:	00098901 	.inst	0x00098901 ; undefined
    1d34:	4609ea00 	.inst	0x4609ea00 ; undefined
    1d38:	14000000 	b	1d38 <THREAD_HW_CONTEXT_SIZE+0x1c18>
    1d3c:	00097501 	.inst	0x00097501 ; undefined
    1d40:	4609eb00 	.inst	0x4609eb00 ; undefined
    1d44:	18000000 	ldr	w0, 1d44 <THREAD_HW_CONTEXT_SIZE+0x1c24>
    1d48:	00092901 	.inst	0x00092901 ; undefined
    1d4c:	4609ec00 	.inst	0x4609ec00 ; undefined
    1d50:	1c000000 	ldr	s0, 1d50 <THREAD_HW_CONTEXT_SIZE+0x1c30>
    1d54:	06010200 	.inst	0x06010200 ; undefined
    1d58:	0000013b 	udf	#315
    1d5c:	de050202 	.inst	0xde050202 ; undefined
    1d60:	0e000001 	tbl	v1.8b, {v0.16b}, v0.8b
    1d64:	6e690504 	uhadd	v4.8h, v8.8h, v9.8h
    1d68:	08020074 	stxrb	w2, w20, [x3]
    1d6c:	0001ef05 	.inst	0x0001ef05 ; undefined
    1d70:	0a740f00 	bic	w0, w24, w20, lsr #3
    1d74:	3b030000 	.inst	0x3b030000 ; undefined
    1d78:	00023406 	.inst	0x00023406 ; undefined
    1d7c:	00ac0a00 	.inst	0x00ac0a00 ; undefined
    1d80:	10000000 	adr	x0, 1d80 <THREAD_HW_CONTEXT_SIZE+0x1c60>
    1d84:	000001e8 	udf	#488
    1d88:	14050404 	b	142d98 <TCR_VALUE+0x42d88>
    1d8c:	4b000002 	sub	w2, w0, w0
    1d90:	0a000002 	and	w2, w0, w0
    1d94:	0000024b 	udf	#587
    1d98:	08120011 	stxrb	w18, w17, [x0]
    1d9c:	00000258 	udf	#600
    1da0:	42080102 	.inst	0x42080102 ; undefined
    1da4:	13000001 	sbfx	w1, w0, #0, #1
    1da8:	00000251 	udf	#593
    1dac:	00067014 	.inst	0x00067014 ; undefined
    1db0:	06390100 	.inst	0x06390100 ; undefined
    1db4:	00084480 	.inst	0x00084480 ; undefined
    1db8:	00000000 	udf	#0
    1dbc:	0000001c 	udf	#28
    1dc0:	00000000 	udf	#0
    1dc4:	99159c01 	.inst	0x99159c01 ; undefined
    1dc8:	0100000b 	.inst	0x0100000b ; undefined
    1dcc:	43f8061e 	.inst	0x43f8061e ; undefined
    1dd0:	00000008 	udf	#8
    1dd4:	00880000 	.inst	0x00880000 ; undefined
    1dd8:	00000000 	udf	#0
    1ddc:	9c010000 	ldr	q0, 3ddc <THREAD_HW_CONTEXT_SIZE+0x3cbc>
    1de0:	000002a5 	udf	#677
    1de4:	000b9416 	.inst	0x000b9416 ; undefined
    1de8:	251e0100 	cmpge	p0.b, p0/z, z8.b, #-2
    1dec:	00000079 	udf	#121
    1df0:	007c9102 	.inst	0x007c9102 ; undefined
    1df4:	000b750b 	.inst	0x000b750b ; undefined
    1df8:	43681300 	.inst	0x43681300 ; undefined
    1dfc:	00000008 	udf	#8
    1e00:	00900000 	.inst	0x00900000 ; undefined
    1e04:	00000000 	udf	#0
    1e08:	9c010000 	ldr	q0, 3e08 <THREAD_HW_CONTEXT_SIZE+0x3ce8>
    1e0c:	000ba70b 	.inst	0x000ba70b ; undefined
    1e10:	42b00500 	.inst	0x42b00500 ; undefined
    1e14:	00000008 	udf	#8
    1e18:	00b80000 	.inst	0x00b80000 ; undefined
    1e1c:	00000000 	udf	#0
    1e20:	9c010000 	ldr	q0, 3e20 <THREAD_HW_CONTEXT_SIZE+0x3d00>
    1e24:	0002e100 	.inst	0x0002e100 ; undefined
    1e28:	01000500 	.inst	0x01000500 ; undefined
    1e2c:	000f0b08 	.inst	0x000f0b08 ; undefined
    1e30:	00980d00 	.inst	0x00980d00 ; undefined
    1e34:	0b0c0000 	add	w0, w0, w12
    1e38:	00000002 	udf	#2
    1e3c:	9c000000 	ldr	q0, 1e3c <THREAD_HW_CONTEXT_SIZE+0x1d1c>
    1e40:	00000844 	udf	#2116
    1e44:	d0000000 	adrp	x0, 3000 <THREAD_HW_CONTEXT_SIZE+0x2ee0>
    1e48:	00000001 	udf	#1
    1e4c:	67000000 	.inst	0x67000000 ; undefined
    1e50:	0600000f 	.inst	0x0600000f ; undefined
    1e54:	04003875 	saddv	d21, p6, z3.b
    1e58:	00000037 	udf	#55
    1e5c:	39080103 	strb	w3, [x8, #512]
    1e60:	03000001 	.inst	0x03000001 ; undefined
    1e64:	01660702 	.inst	0x01660702 ; undefined
    1e68:	75060000 	.inst	0x75060000 ; undefined
    1e6c:	06003233 	.inst	0x06003233 ; undefined
    1e70:	00000054 	udf	#84
    1e74:	00004507 	udf	#17671
    1e78:	07040300 	.inst	0x07040300 ; undefined
    1e7c:	000001ac 	udf	#428
    1e80:	34367506 	cbz	w6, 6ed20 <MAIR_ATTR+0x6a920>
    1e84:	00650700 	.inst	0x00650700 ; undefined
    1e88:	08030000 	stxrb	w3, w0, [x0]
    1e8c:	0001a207 	.inst	0x0001a207 ; undefined
    1e90:	0a3f0800 	bic	w0, w0, wzr, lsl #2
    1e94:	0b020000 	add	w0, w0, w2
    1e98:	00004f17 	udf	#20247
    1e9c:	07080300 	.inst	0x07080300 ; undefined
    1ea0:	000001a7 	udf	#423
    1ea4:	00006c09 	udf	#27657
    1ea8:	00008f00 	udf	#36608
    1eac:	00780a00 	.inst	0x00780a00 ; undefined
    1eb0:	00010000 	.inst	0x00010000 ; undefined
    1eb4:	00007f07 	udf	#32519
    1eb8:	02d60e00 	.inst	0x02d60e00 ; undefined
    1ebc:	04070000 	.inst	0x04070000 ; undefined
    1ec0:	00000054 	udf	#84
    1ec4:	d70e4503 	.inst	0xd70e4503 ; undefined
    1ec8:	02000000 	.inst	0x02000000 ; undefined
    1ecc:	000002bb 	udf	#699
    1ed0:	029a0200 	.inst	0x029a0200 ; undefined
    1ed4:	02010000 	.inst	0x02010000 ; undefined
    1ed8:	000002f3 	udf	#755
    1edc:	03020204 	.inst	0x03020204 ; undefined
    1ee0:	02050000 	.inst	0x02050000 ; undefined
    1ee4:	00000311 	udf	#785
    1ee8:	03200206 	.inst	0x03200206 ; undefined
    1eec:	02070000 	.inst	0x02070000 ; undefined
    1ef0:	0000032f 	udf	#815
    1ef4:	033e0203 	.inst	0x033e0203 ; undefined
    1ef8:	00020000 	.inst	0x00020000 ; undefined
    1efc:	0002d708 	.inst	0x0002d708 ; undefined
    1f00:	024e0300 	.inst	0x024e0300 ; undefined
    1f04:	00000094 	udf	#148
    1f08:	000c940b 	.inst	0x000c940b ; undefined
    1f0c:	08500c00 	ldxrb	w0, [x0]
    1f10:	00000108 	udf	#264
    1f14:	00039b01 	.inst	0x00039b01 ; undefined
    1f18:	6c0b5100 	stnp	d0, d20, [x8, #176]
    1f1c:	00000000 	udf	#0
    1f20:	000b2b01 	.inst	0x000b2b01 ; undefined
    1f24:	8f0b5200 	.inst	0x8f0b5200 ; undefined
    1f28:	04000000 	add	z0.b, p0/m, z0.b, z0.b
    1f2c:	0c830b00 	st4	{v0.2s-v3.2s}, [x24], x3
    1f30:	55a00000 	.inst	0x55a00000 ; undefined
    1f34:	0001bd10 	.inst	0x0001bd10 ; undefined
    1f38:	0ccd0100 	ld4	{v0.8b-v3.8b}, [x8], x13
    1f3c:	0b560000 	add	w0, w0, w22, lsr #0
    1f40:	000001cd 	udf	#461
    1f44:	0ca00100 	.inst	0x0ca00100 ; undefined
    1f48:	18570000 	ldr	w0, aff48 <__kernel_end_addr+0x17900>
    1f4c:	000000e3 	udf	#227
    1f50:	0c560118 	.inst	0x0c560118 ; undefined
    1f54:	18580000 	ldr	w0, b1f54 <__kernel_end_addr+0x1990c>
    1f58:	000000e3 	udf	#227
    1f5c:	0c760124 	.inst	0x0c760124 ; undefined
    1f60:	18590000 	ldr	w0, b3f60 <__kernel_end_addr+0x1b918>
    1f64:	000000e3 	udf	#227
    1f68:	0c660130 	.inst	0x0c660130 ; undefined
    1f6c:	185a0000 	ldr	w0, b5f6c <__kernel_end_addr+0x1d924>
    1f70:	000000e3 	udf	#227
    1f74:	0c11013c 	.inst	0x0c11013c ; undefined
    1f78:	185b0000 	ldr	w0, b7f78 <__kernel_end_addr+0x1f930>
    1f7c:	000000e3 	udf	#227
    1f80:	0cbd0148 	.inst	0x0cbd0148 ; undefined
    1f84:	185c0000 	ldr	w0, b9f84 <__kernel_end_addr+0x2193c>
    1f88:	000000e3 	udf	#227
    1f8c:	0cae0154 	.inst	0x0cae0154 ; undefined
    1f90:	185d0000 	ldr	w0, bbf90 <__kernel_end_addr+0x23948>
    1f94:	000000e3 	udf	#227
    1f98:	0bcc0160 	.inst	0x0bcc0160 ; undefined
    1f9c:	185e0000 	ldr	w0, bdf9c <__kernel_end_addr+0x25954>
    1fa0:	000000e3 	udf	#227
    1fa4:	0bda016c 	.inst	0x0bda016c ; undefined
    1fa8:	185f0000 	ldr	w0, bffa8 <__kernel_end_addr+0x27960>
    1fac:	000000e3 	udf	#227
    1fb0:	0bf00178 	.inst	0x0bf00178 ; undefined
    1fb4:	18600000 	ldr	w0, c1fb4 <__kernel_end_addr+0x2996c>
    1fb8:	000000e3 	udf	#227
    1fbc:	039b0184 	.inst	0x039b0184 ; undefined
    1fc0:	0b610000 	.inst	0x0b610000 ; undefined
    1fc4:	0000006c 	udf	#108
    1fc8:	0c880190 	st4	{v16.8b-v19.8b}, [x12], x8
    1fcc:	0b620000 	.inst	0x0b620000 ; undefined
    1fd0:	0000006c 	udf	#108
    1fd4:	0c2b0194 	.inst	0x0c2b0194 ; undefined
    1fd8:	0b630000 	.inst	0x0b630000 ; undefined
    1fdc:	0000008f 	udf	#143
    1fe0:	6c090098 	stnp	d24, d0, [x4, #144]
    1fe4:	cd000000 	.inst	0xcd000000 ; undefined
    1fe8:	0a000001 	and	w1, w0, w0
    1fec:	00000078 	udf	#120
    1ff0:	bd070005 	str	s5, [x0, #1792]
    1ff4:	0f000001 	.inst	0x0f000001 ; undefined
    1ff8:	00000a09 	udf	#2569
    1ffc:	e4060b04 	.inst	0xe4060b04 ; undefined
    2000:	10000001 	adr	x1, 2000 <THREAD_HW_CONTEXT_SIZE+0x1ee0>
    2004:	0000005b 	udf	#91
    2008:	02cb0c00 	.inst	0x02cb0c00 ; undefined
    200c:	3c230000 	.inst	0x3c230000 ; undefined
    2010:	00000846 	udf	#2118
    2014:	30000000 	adr	x0, 2015 <THREAD_HW_CONTEXT_SIZE+0x1ef5>
    2018:	00000000 	udf	#0
    201c:	01000000 	.inst	0x01000000 ; undefined
    2020:	00021d9c 	.inst	0x00021d9c ; undefined
    2024:	0c4f0400 	.inst	0x0c4f0400 ; undefined
    2028:	15230000 	b	48c2028 <TCR_VALUE+0x47c2018>
    202c:	0000002e 	udf	#46
    2030:	056f9102 	.inst	0x056f9102 ; undefined
    2034:	00000cd8 	udf	#3288
    2038:	00450924 	.inst	0x00450924 ; undefined
    203c:	91020000 	add	x0, x0, #0x80
    2040:	910c007c 	add	x28, x3, #0x300
    2044:	1d000002 	.inst	0x1d000002 ; undefined
    2048:	0008460c 	.inst	0x0008460c ; undefined
    204c:	00000000 	udf	#0
    2050:	00000030 	udf	#48
    2054:	00000000 	udf	#0
    2058:	02569c01 	.inst	0x02569c01 ; undefined
    205c:	4f040000 	.inst	0x4f040000 ; undefined
    2060:	1d00000c 	.inst	0x1d00000c ; undefined
    2064:	00002e13 	udf	#11795
    2068:	6f910200 	mla	v0.4s, v16.4s, v17.s[0]
    206c:	000cd805 	.inst	0x000cd805 ; undefined
    2070:	45091e00 	.inst	0x45091e00 ; undefined
    2074:	02000000 	.inst	0x02000000 ; undefined
    2078:	11007c91 	add	w17, w4, #0x1f
    207c:	000002ab 	udf	#683
    2080:	7c061101 	stur	h1, [x8, #97]
    2084:	00000845 	udf	#2117
    2088:	90000000 	adrp	x0, 2000 <THREAD_HW_CONTEXT_SIZE+0x1ee0>
    208c:	00000000 	udf	#0
    2090:	01000000 	.inst	0x01000000 ; undefined
    2094:	0002839c 	.inst	0x0002839c ; undefined
    2098:	0c4f0400 	.inst	0x0c4f0400 ; undefined
    209c:	19110000 	stlurb	w0, [x0, #-240]
    20a0:	0000002e 	udf	#46
    20a4:	007f9102 	.inst	0x007f9102 ; undefined
    20a8:	00027c12 	.inst	0x00027c12 ; undefined
    20ac:	06050100 	.inst	0x06050100 ; undefined
    20b0:	0008449c 	.inst	0x0008449c ; undefined
    20b4:	00000000 	udf	#0
    20b8:	000000e0 	udf	#224
    20bc:	00000000 	udf	#0
    20c0:	4f049c01 	.inst	0x4f049c01 ; undefined
    20c4:	0500000c 	orr	z12.s, z12.s, #0x1
    20c8:	00002e1f 	udf	#11807
    20cc:	6f910200 	mla	v0.4s, v16.4s, v17.s[0]
    20d0:	000c4704 	.inst	0x000c4704 ; undefined
    20d4:	d7330500 	.inst	0xd7330500 ; undefined
    20d8:	02000000 	.inst	0x02000000 ; undefined
    20dc:	06056891 	.inst	0x06056891 ; undefined
    20e0:	0700000c 	.inst	0x0700000c ; undefined
    20e4:	00002e08 	udf	#11784
    20e8:	7f910200 	.inst	0x7f910200 ; undefined
    20ec:	000c2105 	.inst	0x000c2105 ; undefined
    20f0:	2e080800 	ext	v0.8b, v0.8b, v8.8b, #1
    20f4:	02000000 	.inst	0x02000000 ; undefined
    20f8:	3e057e91 	.inst	0x3e057e91 ; undefined
    20fc:	0a00000c 	and	w12, w0, w0
    2100:	00004509 	udf	#17673
    2104:	78910200 	ldursh	x0, [x16, #-240]
    2108:	01170000 	.inst	0x01170000 ; undefined
    210c:	00050000 	.inst	0x00050000 ; undefined
    2110:	10360801 	adr	x1, 6e210 <MAIR_ATTR+0x69e10>
    2114:	98060000 	ldrsw	x0, e114 <MAIR_ATTR+0x9d14>
    2118:	0c000000 	st4	{v0.8b-v3.8b}, [x0]
    211c:	00000219 	udf	#537
    2120:	00000000 	udf	#0
    2124:	0008466c 	.inst	0x0008466c ; undefined
    2128:	00000000 	udf	#0
    212c:	00000054 	udf	#84
    2130:	00000000 	udf	#0
    2134:	00001047 	udf	#4167
    2138:	00064207 	.inst	0x00064207 ; undefined
    213c:	0c010100 	.inst	0x0c010100 ; undefined
    2140:	00000049 	udf	#73
    2144:	00000049 	udf	#73
    2148:	00004904 	udf	#18692
    214c:	00500400 	.inst	0x00500400 ; undefined
    2150:	08000000 	stxrb	w0, w0, [x0]
    2154:	6e690504 	uhadd	v4.8h, v8.8h, v9.8h
    2158:	08090074 	stxrb	w9, w20, [x3]
    215c:	0002140a 	.inst	0x0002140a ; undefined
    2160:	05040100 	.inst	0x05040100 ; undefined
    2164:	00000049 	udf	#73
    2168:	0008466c 	.inst	0x0008466c ; undefined
    216c:	00000000 	udf	#0
    2170:	00000054 	udf	#84
    2174:	00000000 	udf	#0
    2178:	00fe9c01 	.inst	0x00fe9c01 ; undefined
    217c:	e9010000 	.inst	0xe9010000 ; undefined
    2180:	0700000c 	.inst	0x0700000c ; undefined
    2184:	00004909 	udf	#18697
    2188:	7c910200 	.inst	0x7c910200 ; undefined
    218c:	00387505 	.inst	0x00387505 ; NYI
    2190:	0000fe04 	udf	#65028
    2194:	36750500 	tbz	w0, #14, ffffffffffffc234 <IRQ_SOURCE_EL0_CORE_0+0xffffbfffc1d4>
    2198:	13070034 	sbfiz	w20, w1, #25, #1
    219c:	0b000001 	add	w1, w0, w0
    21a0:	00000d0c 	udf	#3340
    21a4:	140a0110 	b	2825e4 <TCR_VALUE+0x1825d4>
    21a8:	000000c7 	udf	#199
    21ac:	0004f903 	.inst	0x0004f903 ; undefined
    21b0:	820c0b00 	.inst	0x820c0b00 ; undefined
    21b4:	00000000 	udf	#0
    21b8:	000d0103 	.inst	0x000d0103 ; undefined
    21bc:	820c0c00 	.inst	0x820c0c00 ; undefined
    21c0:	01000000 	.inst	0x01000000 ; undefined
    21c4:	000cde03 	.inst	0x000cde03 ; undefined
    21c8:	8b0d0d00 	add	x0, x8, x13, lsl #3
    21cc:	08000000 	stxrb	w0, w0, [x0]
    21d0:	0cee0c00 	.inst	0x0cee0c00 ; undefined
    21d4:	0f010000 	.inst	0x0f010000 ; undefined
    21d8:	00009506 	udf	#38150
    21dc:	04f90100 	add	z0.d, z8.d, z25.d
    21e0:	09110000 	.inst	0x09110000 ; undefined
    21e4:	0000008b 	udf	#139
    21e8:	01709102 	.inst	0x01709102 ; undefined
    21ec:	00000d01 	udf	#3329
    21f0:	008b0912 	.inst	0x008b0912 ; undefined
    21f4:	91020000 	add	x0, x0, #0x80
    21f8:	0ce40168 	.inst	0x0ce40168 ; undefined
    21fc:	18200000 	ldr	w0, 421fc <MAIR_ATTR+0x3ddfc>
    2200:	000000c7 	udf	#199
    2204:	00589102 	.inst	0x00589102 ; undefined
    2208:	39080102 	strb	w2, [x8, #512]
    220c:	02000001 	.inst	0x02000001 ; undefined
    2210:	01660702 	.inst	0x01660702 ; undefined
    2214:	04020000 	.inst	0x04020000 ; undefined
    2218:	0001ac07 	.inst	0x0001ac07 ; undefined
    221c:	07080200 	.inst	0x07080200 ; undefined
    2220:	000001a2 	udf	#418
	...

Disassembly of section .debug_abbrev:

0000000000000000 <.debug_abbrev>:
       0:	10001101 	adr	x1, 220 <THREAD_HW_CONTEXT_SIZE+0x100>
       4:	12011117 	and	w23, w8, #0x8000000f
       8:	1b0e030f 	madd	w15, w24, w14, w0
       c:	130e250e 	sbfiz	w14, w8, #18, #10
      10:	00000005 	udf	#5
      14:	10001101 	adr	x1, 234 <THREAD_HW_CONTEXT_SIZE+0x114>
      18:	12011117 	and	w23, w8, #0x8000000f
      1c:	1b0e030f 	madd	w15, w24, w14, w0
      20:	130e250e 	sbfiz	w14, w8, #18, #10
      24:	00000005 	udf	#5
      28:	10001101 	adr	x1, 248 <THREAD_HW_CONTEXT_SIZE+0x128>
      2c:	12011117 	and	w23, w8, #0x8000000f
      30:	1b0e030f 	madd	w15, w24, w14, w0
      34:	130e250e 	sbfiz	w14, w8, #18, #10
      38:	00000005 	udf	#5
      3c:	10001101 	adr	x1, 25c <THREAD_HW_CONTEXT_SIZE+0x13c>
      40:	03175517 	.inst	0x03175517 ; undefined
      44:	250e1b0e 	cmpge	p14.b, p6/z, z24.b, #14
      48:	0005130e 	.inst	0x0005130e ; undefined
      4c:	11010000 	add	w0, w0, #0x40
      50:	11171000 	add	w0, w0, #0x5c4
      54:	030f1201 	.inst	0x030f1201 ; undefined
      58:	250e1b0e 	cmpge	p14.b, p6/z, z24.b, #14
      5c:	0005130e 	.inst	0x0005130e ; undefined
      60:	11010000 	add	w0, w0, #0x40
      64:	11171000 	add	w0, w0, #0x5c4
      68:	030f1201 	.inst	0x030f1201 ; undefined
      6c:	250e1b0e 	cmpge	p14.b, p6/z, z24.b, #14
      70:	0005130e 	.inst	0x0005130e ; undefined
      74:	24010000 	cmphs	p0.b, p0/z, z0.b, z1.b
      78:	3e0b0b00 	.inst	0x3e0b0b00 ; undefined
      7c:	000e030b 	.inst	0x000e030b ; undefined
      80:	00340200 	.inst	0x00340200 ; NYI
      84:	213a0e03 	.inst	0x213a0e03 ; undefined
      88:	390b3b01 	strb	w1, [x24, #718]
      8c:	0213490b 	.inst	0x0213490b ; undefined
      90:	03000018 	.inst	0x03000018 ; undefined
      94:	0e030005 	tbl	v5.8b, {v0.16b}, v3.8b
      98:	3b01213a 	.inst	0x3b01213a ; undefined
      9c:	0b390821 	add	w1, w1, w25, uxtb #2
      a0:	18021349 	ldr	w9, 4308 <THREAD_HW_CONTEXT_SIZE+0x41e8>
      a4:	0b040000 	add	w0, w0, w4
      a8:	12011101 	and	w1, w8, #0x8000000f
      ac:	05000007 	orr	z7.s, z7.s, #0x1
      b0:	08030016 	stxrb	w3, w22, [x0]
      b4:	3b02213a 	.inst	0x3b02213a ; undefined
      b8:	1c21390b 	ldr	s11, 427d8 <MAIR_ATTR+0x3e3d8>
      bc:	00001349 	udf	#4937
      c0:	0b000f06 	add	w6, w24, w0, lsl #3
      c4:	13490821 	.inst	0x13490821 ; undefined
      c8:	34070000 	cbz	w0, e0c8 <MAIR_ATTR+0x9cc8>
      cc:	3a0e0300 	adcs	w0, w24, w14
      d0:	0b3b0121 	add	w1, w9, w27, uxtb
      d4:	49102139 	.inst	0x49102139 ; undefined
      d8:	3c193f13 	str	b19, [x24, #-109]!
      dc:	08000019 	stxrb	w0, w25, [x0]
      e0:	0e250111 	saddl	v17.8h, v8.8b, v5.8b
      e4:	1f030b13 	fmadd	s19, s24, s3, s2
      e8:	01111f1b 	.inst	0x01111f1b ; undefined
      ec:	17100712 	b	fffffffffc401d34 <IRQ_SOURCE_EL0_CORE_0+0xffffbc401cd4>
      f0:	24090000 	cmphs	p0.b, p0/z, z0.b, z9.b
      f4:	3e0b0b00 	.inst	0x3e0b0b00 ; undefined
      f8:	0008030b 	.inst	0x0008030b ; undefined
      fc:	012e0a00 	.inst	0x012e0a00 ; undefined
     100:	0e03193f 	uzp1	v31.8b, v9.8b, v3.8b
     104:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     108:	19270b39 	.inst	0x19270b39 ; undefined
     10c:	193c1349 	.inst	0x193c1349 ; undefined
     110:	00001301 	udf	#4865
     114:	4900050b 	.inst	0x4900050b ; undefined
     118:	0c000013 	st4	{v19.8b-v22.8b}, [x0]
     11c:	00000018 	udf	#24
     120:	4900260d 	.inst	0x4900260d ; undefined
     124:	0e000013 	tbl	v19.8b, {v0.16b}, v0.8b
     128:	193f012e 	.inst	0x193f012e ; undefined
     12c:	0b3a0e03 	add	w3, w16, w26, uxtb #3
     130:	0b390b3b 	add	w27, w25, w25, uxtb #2
     134:	01111927 	.inst	0x01111927 ; undefined
     138:	18400712 	ldr	w18, 80218 <indirect_core_1+0x4>
     13c:	1301197c 	sbfx	w28, w11, #1, #6
     140:	340f0000 	cbz	w0, 1e140 <MAIR_ATTR+0x19d40>
     144:	3a080300 	adcs	w0, w24, w8
     148:	390b3b0b 	strb	w11, [x24, #718]
     14c:	0213490b 	.inst	0x0213490b ; undefined
     150:	10000018 	adr	x24, 150 <THREAD_HW_CONTEXT_SIZE+0x30>
     154:	0111010b 	.inst	0x0111010b ; undefined
     158:	13010712 	sbfx	w18, w24, #1, #1
     15c:	2e110000 	ext	v0.8b, v0.8b, v17.8b, #0
     160:	03193f01 	.inst	0x03193f01 ; undefined
     164:	3b0b3a0e 	.inst	0x3b0b3a0e ; undefined
     168:	270b390b 	.inst	0x270b390b ; undefined
     16c:	12011119 	and	w25, w8, #0x8000000f
     170:	7c184007 	stur	h7, [x0, #-124]
     174:	00000019 	udf	#25
     178:	0b002401 	add	w1, w0, w0, lsl #9
     17c:	030b3e0b 	.inst	0x030b3e0b ; undefined
     180:	0200000e 	.inst	0x0200000e ; undefined
     184:	0e250111 	saddl	v17.8h, v8.8b, v5.8b
     188:	1f030b13 	fmadd	s19, s24, s3, s2
     18c:	01111f1b 	.inst	0x01111f1b ; undefined
     190:	17100712 	b	fffffffffc401dd8 <IRQ_SOURCE_EL0_CORE_0+0xffffbc401d78>
     194:	2e030000 	ext	v0.8b, v0.8b, v3.8b, #0
     198:	03193f01 	.inst	0x03193f01 ; undefined
     19c:	3b0b3a0e 	.inst	0x3b0b3a0e ; undefined
     1a0:	270b390b 	.inst	0x270b390b ; undefined
     1a4:	01193c19 	.inst	0x01193c19 ; undefined
     1a8:	04000013 	add	z19.b, p0/m, z19.b, z0.b
     1ac:	13490005 	.inst	0x13490005 ; undefined
     1b0:	0f050000 	.inst	0x0f050000 ; undefined
     1b4:	490b0b00 	.inst	0x490b0b00 ; undefined
     1b8:	06000013 	.inst	0x06000013 ; undefined
     1bc:	193f002e 	.inst	0x193f002e ; undefined
     1c0:	0b3a0e03 	add	w3, w16, w26, uxtb #3
     1c4:	0b390b3b 	add	w27, w25, w25, uxtb #2
     1c8:	01111927 	.inst	0x01111927 ; undefined
     1cc:	18400712 	ldr	w18, 802ac <indirect_core_2+0x8>
     1d0:	0000197c 	udf	#6524
     1d4:	00240100 	.inst	0x00240100 ; NYI
     1d8:	0b3e0b0b 	add	w11, w24, w30, uxtb #2
     1dc:	00000e03 	udf	#3587
     1e0:	25011102 	cmpge	p2.b, p4/z, z8.b, #1
     1e4:	030b130e 	.inst	0x030b130e ; undefined
     1e8:	111f1b1f 	add	wsp, w24, #0x7c6
     1ec:	10071201 	adr	x1, e42c <MAIR_ATTR+0xa02c>
     1f0:	03000017 	.inst	0x03000017 ; undefined
     1f4:	193f012e 	.inst	0x193f012e ; undefined
     1f8:	0b3a0e03 	add	w3, w16, w26, uxtb #3
     1fc:	0b390b3b 	add	w27, w25, w25, uxtb #2
     200:	193c1927 	.inst	0x193c1927 ; undefined
     204:	00001301 	udf	#4865
     208:	49000504 	.inst	0x49000504 ; undefined
     20c:	05000013 	orr	z19.s, z19.s, #0x1
     210:	0b0b000f 	add	w15, w0, w11
     214:	00001349 	udf	#4937
     218:	3f002e06 	.inst	0x3f002e06 ; undefined
     21c:	3a0e0319 	adcs	w25, w24, w14
     220:	390b3b0b 	strb	w11, [x24, #718]
     224:	1119270b 	add	w11, w24, #0x649
     228:	40071201 	.inst	0x40071201 ; undefined
     22c:	00197c18 	.inst	0x00197c18 ; undefined
     230:	24010000 	cmphs	p0.b, p0/z, z0.b, z1.b
     234:	3e0b0b00 	.inst	0x3e0b0b00 ; undefined
     238:	000e030b 	.inst	0x000e030b ; undefined
     23c:	00340200 	.inst	0x00340200 ; NYI
     240:	213a0e03 	.inst	0x213a0e03 ; undefined
     244:	390b3b01 	strb	w1, [x24, #718]
     248:	13490b21 	.inst	0x13490b21 ; undefined
     24c:	00001802 	udf	#6146
     250:	03001603 	.inst	0x03001603 ; undefined
     254:	02213a08 	.inst	0x02213a08 ; undefined
     258:	21390b3b 	.inst	0x21390b3b ; undefined
     25c:	0013491c 	.inst	0x0013491c ; undefined
     260:	01110400 	.inst	0x01110400 ; undefined
     264:	0b130e25 	add	w5, w17, w19, lsl #3
     268:	1f1b1f03 	fmadd	s3, s24, s27, s7
     26c:	07120111 	.inst	0x07120111 ; undefined
     270:	00001710 	udf	#5904
     274:	0b002405 	add	w5, w0, w0, lsl #9
     278:	030b3e0b 	.inst	0x030b3e0b ; undefined
     27c:	06000008 	.inst	0x06000008 ; undefined
     280:	13490101 	.inst	0x13490101 ; undefined
     284:	00001301 	udf	#4865
     288:	49002107 	.inst	0x49002107 ; undefined
     28c:	000b2f13 	.inst	0x000b2f13 ; undefined
     290:	012e0800 	.inst	0x012e0800 ; undefined
     294:	0e03193f 	uzp1	v31.8b, v9.8b, v3.8b
     298:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     29c:	19270b39 	.inst	0x19270b39 ; undefined
     2a0:	193c1349 	.inst	0x193c1349 ; undefined
     2a4:	00001301 	udf	#4865
     2a8:	49000509 	.inst	0x49000509 ; undefined
     2ac:	0a000013 	and	w19, w0, w0
     2b0:	00000018 	udf	#24
     2b4:	0b000f0b 	add	w11, w24, w0, lsl #3
     2b8:	0013490b 	.inst	0x0013490b ; undefined
     2bc:	00260c00 	.inst	0x00260c00 ; NYI
     2c0:	00001349 	udf	#4937
     2c4:	3f012e0d 	.inst	0x3f012e0d ; undefined
     2c8:	3a0e0319 	adcs	w25, w24, w14
     2cc:	390b3b0b 	strb	w11, [x24, #718]
     2d0:	1119270b 	add	w11, w24, #0x649
     2d4:	40071201 	.inst	0x40071201 ; undefined
     2d8:	00197c18 	.inst	0x00197c18 ; undefined
     2dc:	00340e00 	.inst	0x00340e00 ; NYI
     2e0:	0b3a0e03 	add	w3, w16, w26, uxtb #3
     2e4:	0b390b3b 	add	w27, w25, w25, uxtb #2
     2e8:	193f1349 	.inst	0x193f1349 ; undefined
     2ec:	0000193c 	udf	#6460
     2f0:	00280100 	.inst	0x00280100 ; NYI
     2f4:	0b1c0e03 	add	w3, w16, w28, lsl #3
     2f8:	05020000 	orr	z0.d, z0.d, #0x1
     2fc:	00134900 	.inst	0x00134900 ; undefined
     300:	00240300 	.inst	0x00240300 ; NYI
     304:	0b3e0b0b 	add	w11, w24, w30, uxtb #2
     308:	00000e03 	udf	#3587
     30c:	3f012e04 	.inst	0x3f012e04 ; undefined
     310:	3a0e0319 	adcs	w25, w24, w14
     314:	390b3b0b 	strb	w11, [x24, #718]
     318:	19270621 	.inst	0x19270621 ; undefined
     31c:	1301193c 	sbfx	w28, w9, #1, #6
     320:	16050000 	b	fffffffff8140320 <IRQ_SOURCE_EL0_CORE_0+0xffffb81402c0>
     324:	3a080300 	adcs	w0, w24, w8
     328:	0b3b0221 	add	w1, w17, w27, uxtb
     32c:	491c2139 	.inst	0x491c2139 ; undefined
     330:	06000013 	.inst	0x06000013 ; undefined
     334:	0e250111 	saddl	v17.8h, v8.8b, v5.8b
     338:	1f030b13 	fmadd	s19, s24, s3, s2
     33c:	01111f1b 	.inst	0x01111f1b ; undefined
     340:	17100712 	b	fffffffffc401f88 <IRQ_SOURCE_EL0_CORE_0+0xffffbc401f28>
     344:	04070000 	.inst	0x04070000 ; undefined
     348:	3e0e0301 	.inst	0x3e0e0301 ; undefined
     34c:	490b0b0b 	.inst	0x490b0b0b ; undefined
     350:	3b0b3a13 	.inst	0x3b0b3a13 ; undefined
     354:	010b390b 	.inst	0x010b390b ; undefined
     358:	08000013 	stxrb	w0, w19, [x0]
     35c:	0e030016 	tbl	v22.8b, {v0.16b}, v3.8b
     360:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     364:	13490b39 	.inst	0x13490b39 ; undefined
     368:	0f090000 	.inst	0x0f090000 ; undefined
     36c:	490b0b00 	.inst	0x490b0b00 ; undefined
     370:	0a000013 	and	w19, w0, w0
     374:	193f012e 	.inst	0x193f012e ; undefined
     378:	0b3a0e03 	add	w3, w16, w26, uxtb #3
     37c:	0b390b3b 	add	w27, w25, w25, uxtb #2
     380:	01111927 	.inst	0x01111927 ; undefined
     384:	18400712 	ldr	w18, 80464 <enable_core3_timer+0xf8>
     388:	0000197c 	udf	#6524
     38c:	0300340b 	.inst	0x0300340b ; undefined
     390:	3b0b3a0e 	.inst	0x3b0b3a0e ; undefined
     394:	490b390b 	.inst	0x490b390b ; undefined
     398:	3c193f13 	str	b19, [x24, #-109]!
     39c:	00000019 	udf	#25
     3a0:	03000d01 	.inst	0x03000d01 ; undefined
     3a4:	04213a08 	eor3	z8.d, z8.d, z1.d, z16.d
     3a8:	21390b3b 	.inst	0x21390b3b ; undefined
     3ac:	38134909 	sttrb	w9, [x8, #-204]
     3b0:	0200000b 	.inst	0x0200000b ; undefined
     3b4:	0b0b0024 	add	w4, w1, w11
     3b8:	0e030b3e 	.inst	0x0e030b3e ; undefined
     3bc:	0d030000 	.inst	0x0d030000 ; undefined
     3c0:	3a0e0300 	adcs	w0, w24, w14
     3c4:	0b3b0321 	add	w1, w25, w27, uxtb
     3c8:	49092139 	.inst	0x49092139 ; undefined
     3cc:	000b3813 	.inst	0x000b3813 ; undefined
     3d0:	00280400 	.inst	0x00280400 ; NYI
     3d4:	0b1c0e03 	add	w3, w16, w28, lsl #3
     3d8:	2e050000 	ext	v0.8b, v0.8b, v5.8b, #0
     3dc:	03193f00 	.inst	0x03193f00 ; undefined
     3e0:	01213a0e 	.inst	0x01213a0e ; undefined
     3e4:	21390b3b 	.inst	0x21390b3b ; undefined
     3e8:	4919270c 	.inst	0x4919270c ; undefined
     3ec:	00193c13 	.inst	0x00193c13 ; undefined
     3f0:	00160600 	.inst	0x00160600 ; undefined
     3f4:	213a0803 	.inst	0x213a0803 ; undefined
     3f8:	390b3b02 	strb	w2, [x24, #718]
     3fc:	13491c21 	.inst	0x13491c21 ; undefined
     400:	0d070000 	.inst	0x0d070000 ; undefined
     404:	3a0e0300 	adcs	w0, w24, w14
     408:	0b3b0421 	add	w1, w1, w27, uxtb #1
     40c:	49092139 	.inst	0x49092139 ; undefined
     410:	00053813 	.inst	0x00053813 ; undefined
     414:	000d0800 	.inst	0x000d0800 ; undefined
     418:	213a0803 	.inst	0x213a0803 ; undefined
     41c:	390b3b04 	strb	w4, [x24, #718]
     420:	13490921 	.inst	0x13490921 ; undefined
     424:	00000538 	udf	#1336
     428:	03003409 	.inst	0x03003409 ; undefined
     42c:	01213a0e 	.inst	0x01213a0e ; undefined
     430:	21390b3b 	.inst	0x21390b3b ; undefined
     434:	02134907 	.inst	0x02134907 ; undefined
     438:	0a000018 	and	w24, w0, w0
     43c:	0e250111 	saddl	v17.8h, v8.8b, v5.8b
     440:	1f030b13 	fmadd	s19, s24, s3, s2
     444:	01111f1b 	.inst	0x01111f1b ; undefined
     448:	17100712 	b	fffffffffc402090 <IRQ_SOURCE_EL0_CORE_0+0xffffbc402030>
     44c:	130b0000 	sbfiz	w0, w0, #21, #1
     450:	0b080301 	add	w1, w24, w8
     454:	3b0b3a0b 	.inst	0x3b0b3a0b ; undefined
     458:	010b390b 	.inst	0x010b390b ; undefined
     45c:	0c000013 	st4	{v19.8b-v22.8b}, [x0]
     460:	13490101 	.inst	0x13490101 ; undefined
     464:	00001301 	udf	#4865
     468:	4900210d 	.inst	0x4900210d ; undefined
     46c:	000b2f13 	.inst	0x000b2f13 ; undefined
     470:	01040e00 	.inst	0x01040e00 ; undefined
     474:	0b3e0e03 	add	w3, w16, w30, uxtb #3
     478:	13490b0b 	.inst	0x13490b0b ; undefined
     47c:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     480:	13010b39 	sbfx	w25, w25, #1, #2
     484:	130f0000 	sbfiz	w0, w0, #17, #1
     488:	0b0e0301 	add	w1, w24, w14
     48c:	3b0b3a05 	.inst	0x3b0b3a05 ; undefined
     490:	010b390b 	.inst	0x010b390b ; undefined
     494:	10000013 	adr	x19, 494 <THREAD_HW_CONTEXT_SIZE+0x374>
     498:	0e030016 	tbl	v22.8b, {v0.16b}, v3.8b
     49c:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     4a0:	13490b39 	.inst	0x13490b39 ; undefined
     4a4:	24110000 	cmphs	p0.b, p0/z, z0.b, z17.b
     4a8:	3e0b0b00 	.inst	0x3e0b0b00 ; undefined
     4ac:	0008030b 	.inst	0x0008030b ; undefined
     4b0:	002e1200 	.inst	0x002e1200 ; NYI
     4b4:	0e03193f 	uzp1	v31.8b, v9.8b, v3.8b
     4b8:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     4bc:	19270b39 	.inst	0x19270b39 ; undefined
     4c0:	0000193c 	udf	#6460
     4c4:	3f012e13 	.inst	0x3f012e13 ; undefined
     4c8:	3a0e0319 	adcs	w25, w24, w14
     4cc:	390b3b0b 	strb	w11, [x24, #718]
     4d0:	1119270b 	add	w11, w24, #0x649
     4d4:	40071201 	.inst	0x40071201 ; undefined
     4d8:	01197c18 	.inst	0x01197c18 ; undefined
     4dc:	14000013 	b	528 <THREAD_HW_CONTEXT_SIZE+0x408>
     4e0:	08030005 	stxrb	w3, w5, [x0]
     4e4:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     4e8:	13490b39 	.inst	0x13490b39 ; undefined
     4ec:	00001802 	udf	#6146
     4f0:	0b000f15 	add	w21, w24, w0, lsl #3
     4f4:	0013490b 	.inst	0x0013490b ; undefined
     4f8:	012e1600 	.inst	0x012e1600 ; undefined
     4fc:	0b3a0e03 	add	w3, w16, w26, uxtb #3
     500:	0b390b3b 	add	w27, w25, w25, uxtb #2
     504:	07120111 	.inst	0x07120111 ; undefined
     508:	197c1840 	.inst	0x197c1840 ; undefined
     50c:	00001301 	udf	#4865
     510:	3f002e17 	.inst	0x3f002e17 ; undefined
     514:	3a0e0319 	adcs	w25, w24, w14
     518:	390b3b0b 	strb	w11, [x24, #718]
     51c:	1119270b 	add	w11, w24, #0x649
     520:	40071201 	.inst	0x40071201 ; undefined
     524:	00197a18 	.inst	0x00197a18 ; undefined
     528:	05010000 	orr	z0.s, z0.s, #0x1
     52c:	00134900 	.inst	0x00134900 ; undefined
     530:	00240200 	.inst	0x00240200 ; NYI
     534:	0b3e0b0b 	add	w11, w24, w30, uxtb #2
     538:	00000e03 	udf	#3587
     53c:	03001603 	.inst	0x03001603 ; undefined
     540:	02213a08 	.inst	0x02213a08 ; undefined
     544:	21390b3b 	.inst	0x21390b3b ; undefined
     548:	0013491c 	.inst	0x0013491c ; undefined
     54c:	012e0400 	.inst	0x012e0400 ; undefined
     550:	0e03193f 	uzp1	v31.8b, v9.8b, v3.8b
     554:	3b03213a 	.inst	0x3b03213a ; undefined
     558:	0621390b 	.inst	0x0621390b ; undefined
     55c:	193c1927 	.inst	0x193c1927 ; undefined
     560:	00001301 	udf	#4865
     564:	25011105 	cmpge	p5.b, p4/z, z8.b, #1
     568:	030b130e 	.inst	0x030b130e ; undefined
     56c:	111f1b1f 	add	wsp, w24, #0x7c6
     570:	10071201 	adr	x1, e7b0 <MAIR_ATTR+0xa3b0>
     574:	06000017 	.inst	0x06000017 ; undefined
     578:	0b0b000f 	add	w15, w0, w11
     57c:	00001349 	udf	#4937
     580:	3f012e07 	.inst	0x3f012e07 ; undefined
     584:	3a0e0319 	adcs	w25, w24, w14
     588:	390b3b0b 	strb	w11, [x24, #718]
     58c:	4919270b 	.inst	0x4919270b ; undefined
     590:	01193c13 	.inst	0x01193c13 ; undefined
     594:	08000013 	stxrb	w0, w19, [x0]
     598:	193f012e 	.inst	0x193f012e ; undefined
     59c:	0b3a0e03 	add	w3, w16, w26, uxtb #3
     5a0:	0b390b3b 	add	w27, w25, w25, uxtb #2
     5a4:	01111927 	.inst	0x01111927 ; undefined
     5a8:	18400712 	ldr	w18, 80688 <enable_core3_timer+0x31c>
     5ac:	0000197c 	udf	#6524
     5b0:	03000509 	.inst	0x03000509 ; undefined
     5b4:	3b0b3a0e 	.inst	0x3b0b3a0e ; undefined
     5b8:	490b390b 	.inst	0x490b390b ; undefined
     5bc:	00180213 	.inst	0x00180213 ; undefined
     5c0:	012e0a00 	.inst	0x012e0a00 ; undefined
     5c4:	0e03193f 	uzp1	v31.8b, v9.8b, v3.8b
     5c8:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     5cc:	19270b39 	.inst	0x19270b39 ; undefined
     5d0:	193c1349 	.inst	0x193c1349 ; undefined
     5d4:	01000000 	.inst	0x01000000 ; undefined
     5d8:	0e030005 	tbl	v5.8b, {v0.16b}, v3.8b
     5dc:	3b01213a 	.inst	0x3b01213a ; undefined
     5e0:	490b390b 	.inst	0x490b390b ; undefined
     5e4:	00180213 	.inst	0x00180213 ; undefined
     5e8:	00340200 	.inst	0x00340200 ; NYI
     5ec:	213a0e03 	.inst	0x213a0e03 ; undefined
     5f0:	390b3b01 	strb	w1, [x24, #718]
     5f4:	0213490b 	.inst	0x0213490b ; undefined
     5f8:	03000018 	.inst	0x03000018 ; undefined
     5fc:	0b0b0024 	add	w4, w1, w11
     600:	0e030b3e 	.inst	0x0e030b3e ; undefined
     604:	0d040000 	.inst	0x0d040000 ; undefined
     608:	490e0300 	.inst	0x490e0300 ; undefined
     60c:	340b3813 	cbz	w19, 16d0c <MAIR_ATTR+0x1290c>
     610:	05000019 	orr	z25.s, z25.s, #0x1
     614:	0e030016 	tbl	v22.8b, {v0.16b}, v3.8b
     618:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     61c:	13490b39 	.inst	0x13490b39 ; undefined
     620:	0b060000 	add	w0, w0, w6
     624:	12011101 	and	w1, w8, #0x8000000f
     628:	07000007 	.inst	0x07000007 ; undefined
     62c:	08030034 	stxrb	w3, w20, [x1]
     630:	3b01213a 	.inst	0x3b01213a ; undefined
     634:	0e21390b 	.inst	0x0e21390b ; undefined
     638:	18021349 	ldr	w9, 48a0 <MAIR_ATTR+0x4a0>
     63c:	01080000 	.inst	0x01080000 ; undefined
     640:	01134901 	.inst	0x01134901 ; undefined
     644:	09000013 	.inst	0x09000013 ; undefined
     648:	13490021 	.inst	0x13490021 ; undefined
     64c:	00000b2f 	udf	#2863
     650:	0b000f0a 	add	w10, w24, w0, lsl #3
     654:	13490821 	.inst	0x13490821 ; undefined
     658:	2e0b0000 	ext	v0.8b, v0.8b, v11.8b, #0
     65c:	3a0e0301 	adcs	w1, w24, w14
     660:	0b3b0121 	add	w1, w9, w27, uxtb
     664:	270c2139 	.inst	0x270c2139 ; undefined
     668:	11134919 	add	w25, w8, #0x4d2
     66c:	40071201 	.inst	0x40071201 ; undefined
     670:	01197a18 	.inst	0x01197a18 ; undefined
     674:	0c000013 	st4	{v19.8b-v22.8b}, [x0]
     678:	0e250111 	saddl	v17.8h, v8.8b, v5.8b
     67c:	1f030b13 	fmadd	s19, s24, s3, s2
     680:	01111f1b 	.inst	0x01111f1b ; undefined
     684:	17100712 	b	fffffffffc4022cc <IRQ_SOURCE_EL0_CORE_0+0xffffbc40226c>
     688:	240d0000 	cmphs	p0.b, p0/z, z0.b, z13.b
     68c:	3e0b0b00 	.inst	0x3e0b0b00 ; undefined
     690:	0008030b 	.inst	0x0008030b ; undefined
     694:	01130e00 	.inst	0x01130e00 ; undefined
     698:	0b0b0e03 	add	w3, w16, w11, lsl #3
     69c:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     6a0:	00001301 	udf	#4865
     6a4:	0b000f0f 	add	w15, w24, w0, lsl #3
     6a8:	1000000b 	adr	x11, 6a8 <THREAD_HW_CONTEXT_SIZE+0x588>
     6ac:	08030016 	stxrb	w3, w22, [x0]
     6b0:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     6b4:	13490b39 	.inst	0x13490b39 ; undefined
     6b8:	2e110000 	ext	v0.8b, v0.8b, v17.8b, #0
     6bc:	03193f01 	.inst	0x03193f01 ; undefined
     6c0:	3b0b3a0e 	.inst	0x3b0b3a0e ; undefined
     6c4:	270b390b 	.inst	0x270b390b ; undefined
     6c8:	01193c19 	.inst	0x01193c19 ; undefined
     6cc:	12000013 	and	w19, w0, #0x1
     6d0:	13490005 	.inst	0x13490005 ; undefined
     6d4:	2e130000 	ext	v0.8b, v0.8b, v19.8b, #0
     6d8:	03193f01 	.inst	0x03193f01 ; undefined
     6dc:	3b0b3a0e 	.inst	0x3b0b3a0e ; undefined
     6e0:	270b390b 	.inst	0x270b390b ; undefined
     6e4:	11134919 	add	w25, w8, #0x4d2
     6e8:	40071201 	.inst	0x40071201 ; undefined
     6ec:	01197c18 	.inst	0x01197c18 ; undefined
     6f0:	14000013 	b	73c <THREAD_HW_CONTEXT_SIZE+0x61c>
     6f4:	00000018 	udf	#24
     6f8:	49002615 	.inst	0x49002615 ; undefined
     6fc:	16000013 	b	fffffffff8000748 <IRQ_SOURCE_EL0_CORE_0+0xffffb80006e8>
     700:	13490021 	.inst	0x13490021 ; undefined
     704:	0000052f 	udf	#1327
     708:	3f012e17 	.inst	0x3f012e17 ; undefined
     70c:	3a0e0319 	adcs	w25, w24, w14
     710:	390b3b0b 	strb	w11, [x24, #718]
     714:	1119270b 	add	w11, w24, #0x649
     718:	40071201 	.inst	0x40071201 ; undefined
     71c:	01197c18 	.inst	0x01197c18 ; undefined
     720:	18000013 	ldr	w19, 720 <THREAD_HW_CONTEXT_SIZE+0x600>
     724:	0e03012e 	tbl	v14.8b, {v9.16b}, v3.8b
     728:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     72c:	19270b39 	.inst	0x19270b39 ; undefined
     730:	01111349 	.inst	0x01111349 ; undefined
     734:	18400712 	ldr	w18, 80814 <interrupt_init+0x14>
     738:	1301197c 	sbfx	w28, w11, #1, #6
     73c:	2e190000 	ext	v0.8b, v0.8b, v25.8b, #0
     740:	3a0e0301 	adcs	w1, w24, w14
     744:	390b3b0b 	strb	w11, [x24, #718]
     748:	4919270b 	.inst	0x4919270b ; undefined
     74c:	12011113 	and	w19, w8, #0x8000000f
     750:	7a184007 	.inst	0x7a184007 ; undefined
     754:	00000019 	udf	#25
     758:	3f002e01 	.inst	0x3f002e01 ; undefined
     75c:	3a0e0319 	adcs	w25, w24, w14
     760:	390b3b0b 	strb	w11, [x24, #718]
     764:	3c19270b 	str	b11, [x24], #-110
     768:	02000019 	.inst	0x02000019 ; undefined
     76c:	0b0b0024 	add	w4, w1, w11
     770:	0e030b3e 	.inst	0x0e030b3e ; undefined
     774:	34030000 	cbz	w0, 6774 <MAIR_ATTR+0x2374>
     778:	3a0e0300 	adcs	w0, w24, w14
     77c:	0b3b0121 	add	w1, w9, w27, uxtb
     780:	49102139 	.inst	0x49102139 ; undefined
     784:	3c193f13 	str	b19, [x24, #-109]!
     788:	04000019 	add	z25.b, p0/m, z25.b, z0.b
     78c:	08030016 	stxrb	w3, w22, [x0]
     790:	3b02213a 	.inst	0x3b02213a ; undefined
     794:	1c21390b 	ldr	s11, 42eb4 <MAIR_ATTR+0x3eab4>
     798:	00001349 	udf	#4937
     79c:	03003405 	.inst	0x03003405 ; undefined
     7a0:	01213a0e 	.inst	0x01213a0e ; undefined
     7a4:	0b390b3b 	add	w27, w25, w25, uxtb #2
     7a8:	193f1349 	.inst	0x193f1349 ; undefined
     7ac:	00001802 	udf	#6146
     7b0:	25011106 	cmpge	p6.b, p4/z, z8.b, #1
     7b4:	030b130e 	.inst	0x030b130e ; undefined
     7b8:	111f1b1f 	add	wsp, w24, #0x7c6
     7bc:	10071201 	adr	x1, e9fc <MAIR_ATTR+0xa5fc>
     7c0:	07000017 	.inst	0x07000017 ; undefined
     7c4:	13490035 	.inst	0x13490035 ; undefined
     7c8:	2e080000 	ext	v0.8b, v0.8b, v8.8b, #0
     7cc:	03193f01 	.inst	0x03193f01 ; undefined
     7d0:	3b0b3a0e 	.inst	0x3b0b3a0e ; undefined
     7d4:	270b390b 	.inst	0x270b390b ; undefined
     7d8:	11134919 	add	w25, w8, #0x4d2
     7dc:	40071201 	.inst	0x40071201 ; undefined
     7e0:	01197c18 	.inst	0x01197c18 ; undefined
     7e4:	09000013 	.inst	0x09000013 ; undefined
     7e8:	0111010b 	.inst	0x0111010b ; undefined
     7ec:	00000712 	udf	#1810
     7f0:	0300340a 	.inst	0x0300340a ; undefined
     7f4:	3b0b3a08 	.inst	0x3b0b3a08 ; undefined
     7f8:	490b390b 	.inst	0x490b390b ; undefined
     7fc:	00180213 	.inst	0x00180213 ; undefined
     800:	00240b00 	.inst	0x00240b00 ; NYI
     804:	0b3e0b0b 	add	w11, w24, w30, uxtb #2
     808:	00000803 	udf	#2051
     80c:	000d0100 	.inst	0x000d0100 ; undefined
     810:	213a0e03 	.inst	0x213a0e03 ; undefined
     814:	390b3b03 	strb	w3, [x24, #718]
     818:	3813490b 	sttrb	w11, [x8, #-204]
     81c:	0200000b 	.inst	0x0200000b ; undefined
     820:	0b0b0024 	add	w4, w1, w11
     824:	0e030b3e 	.inst	0x0e030b3e ; undefined
     828:	16030000 	b	fffffffff80c0828 <IRQ_SOURCE_EL0_CORE_0+0xffffb80c07c8>
     82c:	3a0e0300 	adcs	w0, w24, w14
     830:	0b3b0321 	add	w1, w25, w27, uxtb
     834:	49022139 	.inst	0x49022139 ; undefined
     838:	04000013 	add	z19.b, p0/m, z19.b, z0.b
     83c:	0e030034 	tbl	v20.8b, {v1.16b}, v3.8b
     840:	3b01213a 	.inst	0x3b01213a ; undefined
     844:	490b390b 	.inst	0x490b390b ; undefined
     848:	3c193f13 	str	b19, [x24, #-109]!
     84c:	05000019 	orr	z25.s, z25.s, #0x1
     850:	193f002e 	.inst	0x193f002e ; undefined
     854:	213a0e03 	.inst	0x213a0e03 ; undefined
     858:	390b3b01 	strb	w1, [x24, #718]
     85c:	01110621 	.inst	0x01110621 ; undefined
     860:	18400712 	ldr	w18, 80940 <interrupt_init+0x140>
     864:	0000197a 	udf	#6522
     868:	03001606 	.inst	0x03001606 ; undefined
     86c:	02213a08 	.inst	0x02213a08 ; undefined
     870:	21390b3b 	.inst	0x21390b3b ; undefined
     874:	0013491c 	.inst	0x0013491c ; undefined
     878:	01130700 	.inst	0x01130700 ; undefined
     87c:	0b0b0e03 	add	w3, w16, w11, lsl #3
     880:	3b03213a 	.inst	0x3b03213a ; undefined
     884:	1021390b 	adr	x11, 42fa4 <MAIR_ATTR+0x3eba4>
     888:	00001301 	udf	#4865
     88c:	03003408 	.inst	0x03003408 ; undefined
     890:	01213a0e 	.inst	0x01213a0e ; undefined
     894:	0b390b3b 	add	w27, w25, w25, uxtb #2
     898:	18021349 	ldr	w9, 4b00 <MAIR_ATTR+0x700>
     89c:	2e090000 	ext	v0.8b, v0.8b, v9.8b, #0
     8a0:	03193f00 	.inst	0x03193f00 ; undefined
     8a4:	01213a0e 	.inst	0x01213a0e ; undefined
     8a8:	21390b3b 	.inst	0x21390b3b ; undefined
     8ac:	11192706 	add	w6, w24, #0x649
     8b0:	40071201 	.inst	0x40071201 ; undefined
     8b4:	00197a18 	.inst	0x00197a18 ; undefined
     8b8:	01110a00 	.inst	0x01110a00 ; undefined
     8bc:	0b130e25 	add	w5, w17, w19, lsl #3
     8c0:	1f1b1f03 	fmadd	s3, s24, s27, s7
     8c4:	07120111 	.inst	0x07120111 ; undefined
     8c8:	00001710 	udf	#5904
     8cc:	0301130b 	.inst	0x0301130b ; undefined
     8d0:	3a050b0e 	.inst	0x3a050b0e ; undefined
     8d4:	390b3b0b 	strb	w11, [x24, #718]
     8d8:	0013010b 	.inst	0x0013010b ; undefined
     8dc:	01010c00 	.inst	0x01010c00 ; undefined
     8e0:	13011349 	sbfx	w9, w26, #1, #4
     8e4:	210d0000 	.inst	0x210d0000 ; undefined
     8e8:	2f134900 	.inst	0x2f134900 ; undefined
     8ec:	0e00000b 	tbl	v11.8b, {v0.16b}, v0.8b
     8f0:	0b0b0024 	add	w4, w1, w11
     8f4:	08030b3e 	stxrb	w3, w30, [x25]
     8f8:	2e0f0000 	ext	v0.8b, v0.8b, v15.8b, #0
     8fc:	03193f01 	.inst	0x03193f01 ; undefined
     900:	3b0b3a0e 	.inst	0x3b0b3a0e ; undefined
     904:	270b390b 	.inst	0x270b390b ; undefined
     908:	12011119 	and	w25, w8, #0x8000000f
     90c:	7a184007 	.inst	0x7a184007 ; undefined
     910:	00130119 	.inst	0x00130119 ; undefined
     914:	00051000 	.inst	0x00051000 ; undefined
     918:	0b3a0e03 	add	w3, w16, w26, uxtb #3
     91c:	0b390b3b 	add	w27, w25, w25, uxtb #2
     920:	18021349 	ldr	w9, 4b88 <MAIR_ATTR+0x788>
     924:	0f110000 	.inst	0x0f110000 ; undefined
     928:	490b0b00 	.inst	0x490b0b00 ; undefined
     92c:	12000013 	and	w19, w0, #0x1
     930:	193f002e 	.inst	0x193f002e ; undefined
     934:	0b3a0e03 	add	w3, w16, w26, uxtb #3
     938:	0b390b3b 	add	w27, w25, w25, uxtb #2
     93c:	01111927 	.inst	0x01111927 ; undefined
     940:	18400712 	ldr	w18, 80a20 <interrupt_init+0x220>
     944:	0000197c 	udf	#6524
     948:	00240100 	.inst	0x00240100 ; NYI
     94c:	0b3e0b0b 	add	w11, w24, w30, uxtb #2
     950:	00000e03 	udf	#3587
     954:	3f012e02 	.inst	0x3f012e02 ; undefined
     958:	3a0e0319 	adcs	w25, w24, w14
     95c:	0b3b0121 	add	w1, w9, w27, uxtb
     960:	27062139 	.inst	0x27062139 ; undefined
     964:	12011119 	and	w25, w8, #0x8000000f
     968:	7a184007 	.inst	0x7a184007 ; undefined
     96c:	00130119 	.inst	0x00130119 ; undefined
     970:	00050300 	.inst	0x00050300 ; undefined
     974:	213a0803 	.inst	0x213a0803 ; undefined
     978:	390b3b01 	strb	w1, [x24, #718]
     97c:	0213490b 	.inst	0x0213490b ; undefined
     980:	04000018 	add	z24.b, p0/m, z24.b, z0.b
     984:	0e250111 	saddl	v17.8h, v8.8b, v5.8b
     988:	1f030b13 	fmadd	s19, s24, s3, s2
     98c:	01111f1b 	.inst	0x01111f1b ; undefined
     990:	17100712 	b	fffffffffc4025d8 <IRQ_SOURCE_EL0_CORE_0+0xffffbc402578>
     994:	2e050000 	ext	v0.8b, v0.8b, v5.8b, #0
     998:	03193f00 	.inst	0x03193f00 ; undefined
     99c:	3b0b3a0e 	.inst	0x3b0b3a0e ; undefined
     9a0:	270b390b 	.inst	0x270b390b ; undefined
     9a4:	12011119 	and	w25, w8, #0x8000000f
     9a8:	7a184007 	.inst	0x7a184007 ; undefined
     9ac:	06000019 	.inst	0x06000019 ; undefined
     9b0:	0b0b000f 	add	w15, w0, w11
     9b4:	2e070000 	ext	v0.8b, v0.8b, v7.8b, #0
     9b8:	3a0e0300 	adcs	w0, w24, w14
     9bc:	390b3b0b 	strb	w11, [x24, #718]
     9c0:	1201110b 	and	w11, w8, #0x8000000f
     9c4:	7a184007 	.inst	0x7a184007 ; undefined
     9c8:	00000019 	udf	#25
     9cc:	0b002401 	add	w1, w0, w0, lsl #9
     9d0:	030b3e0b 	.inst	0x030b3e0b ; undefined
     9d4:	0200000e 	.inst	0x0200000e ; undefined
     9d8:	0e03000d 	tbl	v13.8b, {v0.16b}, v3.8b
     9dc:	3b03213a 	.inst	0x3b03213a ; undefined
     9e0:	0921390b 	.inst	0x0921390b ; undefined
     9e4:	0b381349 	add	w9, w26, w24, uxtb #4
     9e8:	05030000 	orr	z0.d, z0.d, #0x100000000
     9ec:	00134900 	.inst	0x00134900 ; undefined
     9f0:	00180400 	.inst	0x00180400 ; undefined
     9f4:	16050000 	b	fffffffff81409f4 <IRQ_SOURCE_EL0_CORE_0+0xffffb8140994>
     9f8:	3a080300 	adcs	w0, w24, w8
     9fc:	0b3b0221 	add	w1, w17, w27, uxtb
     a00:	491c2139 	.inst	0x491c2139 ; undefined
     a04:	06000013 	.inst	0x06000013 ; undefined
     a08:	0e030034 	tbl	v20.8b, {v1.16b}, v3.8b
     a0c:	3b01213a 	.inst	0x3b01213a ; undefined
     a10:	0c21390b 	.inst	0x0c21390b ; undefined
     a14:	18021349 	ldr	w9, 4c7c <MAIR_ATTR+0x87c>
     a18:	11070000 	add	w0, w0, #0x1c0
     a1c:	130e2501 	sbfiz	w1, w8, #18, #10
     a20:	1b1f030b 	madd	w11, w24, wzr, w0
     a24:	1201111f 	and	wsp, w8, #0x8000000f
     a28:	00171007 	.inst	0x00171007 ; undefined
     a2c:	01130800 	.inst	0x01130800 ; undefined
     a30:	0b0b0e03 	add	w3, w16, w11, lsl #3
     a34:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     a38:	13010b39 	sbfx	w25, w25, #1, #2
     a3c:	24090000 	cmphs	p0.b, p0/z, z0.b, z9.b
     a40:	3e0b0b00 	.inst	0x3e0b0b00 ; undefined
     a44:	0008030b 	.inst	0x0008030b ; undefined
     a48:	012e0a00 	.inst	0x012e0a00 ; undefined
     a4c:	0e03193f 	uzp1	v31.8b, v9.8b, v3.8b
     a50:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     a54:	19270b39 	.inst	0x19270b39 ; undefined
     a58:	1301193c 	sbfx	w28, w9, #1, #6
     a5c:	2e0b0000 	ext	v0.8b, v0.8b, v11.8b, #0
     a60:	03193f01 	.inst	0x03193f01 ; undefined
     a64:	3b0b3a0e 	.inst	0x3b0b3a0e ; undefined
     a68:	270b390b 	.inst	0x270b390b ; undefined
     a6c:	3c134919 	.inst	0x3c134919 ; undefined
     a70:	00130119 	.inst	0x00130119 ; undefined
     a74:	000f0c00 	.inst	0x000f0c00 ; undefined
     a78:	13490b0b 	.inst	0x13490b0b ; undefined
     a7c:	260d0000 	.inst	0x260d0000 ; undefined
     a80:	00134900 	.inst	0x00134900 ; undefined
     a84:	012e0e00 	.inst	0x012e0e00 ; undefined
     a88:	0e03193f 	uzp1	v31.8b, v9.8b, v3.8b
     a8c:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     a90:	13490b39 	.inst	0x13490b39 ; undefined
     a94:	1301193c 	sbfx	w28, w9, #1, #6
     a98:	2e0f0000 	ext	v0.8b, v0.8b, v15.8b, #0
     a9c:	03193f01 	.inst	0x03193f01 ; undefined
     aa0:	3b0b3a0e 	.inst	0x3b0b3a0e ; undefined
     aa4:	270b390b 	.inst	0x270b390b ; undefined
     aa8:	12011119 	and	w25, w8, #0x8000000f
     aac:	7c184007 	stur	h7, [x0, #-124]
     ab0:	00130119 	.inst	0x00130119 ; undefined
     ab4:	012e1000 	.inst	0x012e1000 ; undefined
     ab8:	0e03193f 	uzp1	v31.8b, v9.8b, v3.8b
     abc:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     ac0:	19270b39 	.inst	0x19270b39 ; undefined
     ac4:	0000193c 	udf	#6460
     ac8:	3f012e11 	.inst	0x3f012e11 ; undefined
     acc:	3a0e0319 	adcs	w25, w24, w14
     ad0:	390b3b0b 	strb	w11, [x24, #718]
     ad4:	1119270b 	add	w11, w24, #0x649
     ad8:	40071201 	.inst	0x40071201 ; undefined
     adc:	00197c18 	.inst	0x00197c18 ; undefined
     ae0:	012e1200 	.inst	0x012e1200 ; undefined
     ae4:	0e03193f 	uzp1	v31.8b, v9.8b, v3.8b
     ae8:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     aec:	13490b39 	.inst	0x13490b39 ; undefined
     af0:	0000193c 	udf	#6460
     af4:	00240100 	.inst	0x00240100 ; NYI
     af8:	0b3e0b0b 	add	w11, w24, w30, uxtb #2
     afc:	00000e03 	udf	#3587
     b00:	25011102 	cmpge	p2.b, p4/z, z8.b, #1
     b04:	030b130e 	.inst	0x030b130e ; undefined
     b08:	111f1b1f 	add	wsp, w24, #0x7c6
     b0c:	10071201 	adr	x1, ed4c <MAIR_ATTR+0xa94c>
     b10:	03000017 	.inst	0x03000017 ; undefined
     b14:	193f002e 	.inst	0x193f002e ; undefined
     b18:	0b3a0e03 	add	w3, w16, w26, uxtb #3
     b1c:	0b390b3b 	add	w27, w25, w25, uxtb #2
     b20:	01111927 	.inst	0x01111927 ; undefined
     b24:	18400712 	ldr	w18, 80c04 <interrupt_init+0x404>
     b28:	0000197a 	udf	#6522
     b2c:	00280100 	.inst	0x00280100 ; NYI
     b30:	0b1c0e03 	add	w3, w16, w28, lsl #3
     b34:	0d020000 	.inst	0x0d020000 ; undefined
     b38:	3a0e0300 	adcs	w0, w24, w14
     b3c:	0b3b0321 	add	w1, w25, w27, uxtb
     b40:	490b2139 	.inst	0x490b2139 ; undefined
     b44:	000b3813 	.inst	0x000b3813 ; undefined
     b48:	00050300 	.inst	0x00050300 ; undefined
     b4c:	213a0e03 	.inst	0x213a0e03 ; undefined
     b50:	390b3b01 	strb	w1, [x24, #718]
     b54:	0213490b 	.inst	0x0213490b ; undefined
     b58:	04000018 	add	z24.b, p0/m, z24.b, z0.b
     b5c:	0b0b0024 	add	w4, w1, w11
     b60:	0e030b3e 	.inst	0x0e030b3e ; undefined
     b64:	34050000 	cbz	w0, ab64 <MAIR_ATTR+0x6764>
     b68:	3a0e0300 	adcs	w0, w24, w14
     b6c:	0b3b0121 	add	w1, w9, w27, uxtb
     b70:	13490b39 	.inst	0x13490b39 ; undefined
     b74:	00001802 	udf	#6146
     b78:	03001606 	.inst	0x03001606 ; undefined
     b7c:	02213a08 	.inst	0x02213a08 ; undefined
     b80:	21390b3b 	.inst	0x21390b3b ; undefined
     b84:	0013491c 	.inst	0x0013491c ; undefined
     b88:	00160700 	.inst	0x00160700 ; undefined
     b8c:	0b3a0e03 	add	w3, w16, w26, uxtb #3
     b90:	0b390b3b 	add	w27, w25, w25, uxtb #2
     b94:	00001349 	udf	#4937
     b98:	49000508 	.inst	0x49000508 ; undefined
     b9c:	09000013 	.inst	0x09000013 ; undefined
     ba0:	0e030104 	tbl	v4.8b, {v8.16b}, v3.8b
     ba4:	0b07213e 	add	w30, w9, w7, lsl #8
     ba8:	13490421 	.inst	0x13490421 ; undefined
     bac:	3b03213a 	.inst	0x3b03213a ; undefined
     bb0:	0e21390b 	.inst	0x0e21390b ; undefined
     bb4:	00001301 	udf	#4865
     bb8:	3f012e0a 	.inst	0x3f012e0a ; undefined
     bbc:	3a0e0319 	adcs	w25, w24, w14
     bc0:	0b3b0321 	add	w1, w25, w27, uxtb
     bc4:	27062139 	.inst	0x27062139 ; undefined
     bc8:	01193c19 	.inst	0x01193c19 ; undefined
     bcc:	0b000013 	add	w19, w0, w0
     bd0:	193f012e 	.inst	0x193f012e ; undefined
     bd4:	213a0e03 	.inst	0x213a0e03 ; undefined
     bd8:	390b3b01 	strb	w1, [x24, #718]
     bdc:	19270c21 	.inst	0x19270c21 ; undefined
     be0:	01111349 	.inst	0x01111349 ; undefined
     be4:	18400712 	ldr	w18, 80cc4 <interrupt_init+0x4c4>
     be8:	1301197a 	sbfx	w26, w11, #1, #6
     bec:	340c0000 	cbz	w0, 18bec <MAIR_ATTR+0x147ec>
     bf0:	3a080300 	adcs	w0, w24, w8
     bf4:	0b3b0121 	add	w1, w9, w27, uxtb
     bf8:	49102139 	.inst	0x49102139 ; undefined
     bfc:	00180213 	.inst	0x00180213 ; undefined
     c00:	01110d00 	.inst	0x01110d00 ; undefined
     c04:	0b130e25 	add	w5, w17, w19, lsl #3
     c08:	1f1b1f03 	fmadd	s3, s24, s27, s7
     c0c:	07120111 	.inst	0x07120111 ; undefined
     c10:	00001710 	udf	#5904
     c14:	4900350e 	.inst	0x4900350e ; undefined
     c18:	0f000013 	.inst	0x0f000013 ; undefined
     c1c:	0b0b000f 	add	w15, w0, w11
     c20:	00001349 	udf	#4937
     c24:	03011310 	.inst	0x03011310 ; undefined
     c28:	3a0b0b08 	.inst	0x3a0b0b08 ; undefined
     c2c:	390b3b0b 	strb	w11, [x24, #718]
     c30:	0013010b 	.inst	0x0013010b ; undefined
     c34:	002e1100 	.inst	0x002e1100 ; NYI
     c38:	0e03193f 	uzp1	v31.8b, v9.8b, v3.8b
     c3c:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     c40:	19270b39 	.inst	0x19270b39 ; undefined
     c44:	07120111 	.inst	0x07120111 ; undefined
     c48:	197c1840 	.inst	0x197c1840 ; undefined
     c4c:	01000000 	.inst	0x01000000 ; undefined
     c50:	0e03000d 	tbl	v13.8b, {v0.16b}, v3.8b
     c54:	3b03213a 	.inst	0x3b03213a ; undefined
     c58:	0b21390b 	.inst	0x0b21390b ; undefined
     c5c:	0b381349 	add	w9, w26, w24, uxtb #4
     c60:	24020000 	cmphs	p0.b, p0/z, z0.b, z2.b
     c64:	3e0b0b00 	.inst	0x3e0b0b00 ; undefined
     c68:	000e030b 	.inst	0x000e030b ; undefined
     c6c:	00160300 	.inst	0x00160300 ; undefined
     c70:	213a0803 	.inst	0x213a0803 ; undefined
     c74:	390b3b02 	strb	w2, [x24, #718]
     c78:	13491c21 	.inst	0x13491c21 ; undefined
     c7c:	35040000 	cbnz	w0, 8c7c <MAIR_ATTR+0x487c>
     c80:	00134900 	.inst	0x00134900 ; undefined
     c84:	00280500 	.inst	0x00280500 ; NYI
     c88:	0b1c0e03 	add	w3, w16, w28, lsl #3
     c8c:	05060000 	.inst	0x05060000 ; undefined
     c90:	3a080300 	adcs	w0, w24, w8
     c94:	0b3b0121 	add	w1, w9, w27, uxtb
     c98:	13490b39 	.inst	0x13490b39 ; undefined
     c9c:	00001802 	udf	#6146
     ca0:	3f012e07 	.inst	0x3f012e07 ; undefined
     ca4:	3a0e0319 	adcs	w25, w24, w14
     ca8:	0b3b0121 	add	w1, w9, w27, uxtb
     cac:	27062139 	.inst	0x27062139 ; undefined
     cb0:	12011119 	and	w25, w8, #0x8000000f
     cb4:	7a184007 	.inst	0x7a184007 ; undefined
     cb8:	00130119 	.inst	0x00130119 ; undefined
     cbc:	00340800 	.inst	0x00340800 ; NYI
     cc0:	213a0e03 	.inst	0x213a0e03 ; undefined
     cc4:	390b3b01 	strb	w1, [x24, #718]
     cc8:	13490b21 	.inst	0x13490b21 ; undefined
     ccc:	00001802 	udf	#6146
     cd0:	49010109 	.inst	0x49010109 ; undefined
     cd4:	00130113 	.inst	0x00130113 ; undefined
     cd8:	00210a00 	.inst	0x00210a00 ; NYI
     cdc:	0b2f1349 	add	w9, w26, w15, uxtb #4
     ce0:	2e0b0000 	ext	v0.8b, v0.8b, v11.8b, #0
     ce4:	03193f00 	.inst	0x03193f00 ; undefined
     ce8:	01213a0e 	.inst	0x01213a0e ; undefined
     cec:	21390b3b 	.inst	0x21390b3b ; undefined
     cf0:	11192706 	add	w6, w24, #0x649
     cf4:	40071201 	.inst	0x40071201 ; undefined
     cf8:	00197a18 	.inst	0x00197a18 ; undefined
     cfc:	01110c00 	.inst	0x01110c00 ; undefined
     d00:	0b130e25 	add	w5, w17, w19, lsl #3
     d04:	1f1b1f03 	fmadd	s3, s24, s27, s7
     d08:	07120111 	.inst	0x07120111 ; undefined
     d0c:	00001710 	udf	#5904
     d10:	0300160d 	.inst	0x0300160d ; undefined
     d14:	3b0b3a0e 	.inst	0x3b0b3a0e ; undefined
     d18:	490b390b 	.inst	0x490b390b ; undefined
     d1c:	0e000013 	tbl	v19.8b, {v0.16b}, v0.8b
     d20:	0e030104 	tbl	v4.8b, {v8.16b}, v3.8b
     d24:	0b0b0b3e 	add	w30, w25, w11, lsl #2
     d28:	0b3a1349 	add	w9, w26, w26, uxtb #4
     d2c:	0b390b3b 	add	w27, w25, w25, uxtb #2
     d30:	00001301 	udf	#4865
     d34:	0301130f 	.inst	0x0301130f ; undefined
     d38:	3a0b0b0e 	.inst	0x3a0b0b0e ; undefined
     d3c:	390b3b0b 	strb	w11, [x24, #718]
     d40:	0013010b 	.inst	0x0013010b ; undefined
     d44:	012e1000 	.inst	0x012e1000 ; undefined
     d48:	0e03193f 	uzp1	v31.8b, v9.8b, v3.8b
     d4c:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     d50:	19270b39 	.inst	0x19270b39 ; undefined
     d54:	07120111 	.inst	0x07120111 ; undefined
     d58:	197c1840 	.inst	0x197c1840 ; undefined
     d5c:	00001301 	udf	#4865
     d60:	11010b11 	add	w17, w24, #0x42
     d64:	00071201 	.inst	0x00071201 ; undefined
     d68:	00341200 	.inst	0x00341200 ; NYI
     d6c:	0b3a0803 	add	w3, w0, w26, uxtb #2
     d70:	0b390b3b 	add	w27, w25, w25, uxtb #2
     d74:	18021349 	ldr	w9, 4fdc <MAIR_ATTR+0xbdc>
     d78:	0f130000 	.inst	0x0f130000 ; undefined
     d7c:	490b0b00 	.inst	0x490b0b00 ; undefined
     d80:	14000013 	b	dcc <THREAD_HW_CONTEXT_SIZE+0xcac>
     d84:	0b0b0024 	add	w4, w1, w11
     d88:	08030b3e 	stxrb	w3, w30, [x25]
     d8c:	2e150000 	ext	v0.8b, v0.8b, v21.8b, #0
     d90:	03193f00 	.inst	0x03193f00 ; undefined
     d94:	3b0b3a0e 	.inst	0x3b0b3a0e ; undefined
     d98:	270b390b 	.inst	0x270b390b ; undefined
     d9c:	11134919 	add	w25, w8, #0x4d2
     da0:	40071201 	.inst	0x40071201 ; undefined
     da4:	00197a18 	.inst	0x00197a18 ; undefined
     da8:	00051600 	.inst	0x00051600 ; undefined
     dac:	0b3a0e03 	add	w3, w16, w26, uxtb #3
     db0:	0b390b3b 	add	w27, w25, w25, uxtb #2
     db4:	18021349 	ldr	w9, 501c <MAIR_ATTR+0xc1c>
     db8:	01000000 	.inst	0x01000000 ; undefined
     dbc:	0e03000d 	tbl	v13.8b, {v0.16b}, v3.8b
     dc0:	3b03213a 	.inst	0x3b03213a ; undefined
     dc4:	490b390b 	.inst	0x490b390b ; undefined
     dc8:	000b3813 	.inst	0x000b3813 ; undefined
     dcc:	00240200 	.inst	0x00240200 ; NYI
     dd0:	0b3e0b0b 	add	w11, w24, w30, uxtb #2
     dd4:	00000e03 	udf	#3587
     dd8:	03002803 	.inst	0x03002803 ; undefined
     ddc:	000b1c0e 	.inst	0x000b1c0e ; undefined
     de0:	00160400 	.inst	0x00160400 ; undefined
     de4:	213a0803 	.inst	0x213a0803 ; undefined
     de8:	390b3b02 	strb	w2, [x24, #718]
     dec:	13491c21 	.inst	0x13491c21 ; undefined
     df0:	35050000 	cbnz	w0, adf0 <MAIR_ATTR+0x69f0>
     df4:	00134900 	.inst	0x00134900 ; undefined
     df8:	01040600 	.inst	0x01040600 ; undefined
     dfc:	213e0e03 	.inst	0x213e0e03 ; undefined
     e00:	04210b07 	.inst	0x04210b07 ; undefined
     e04:	213a1349 	.inst	0x213a1349 ; undefined
     e08:	390b3b03 	strb	w3, [x24, #718]
     e0c:	13010621 	sbfx	w1, w17, #1, #1
     e10:	13070000 	sbfiz	w0, w0, #25, #1
     e14:	0b0e0301 	add	w1, w24, w14
     e18:	03213a0b 	.inst	0x03213a0b ; undefined
     e1c:	21390b3b 	.inst	0x21390b3b ; undefined
     e20:	00130110 	.inst	0x00130110 ; undefined
     e24:	01010800 	.inst	0x01010800 ; undefined
     e28:	13011349 	sbfx	w9, w26, #1, #4
     e2c:	21090000 	.inst	0x21090000 ; undefined
     e30:	2f134900 	.inst	0x2f134900 ; undefined
     e34:	0a00000b 	and	w11, w0, w0
     e38:	13490005 	.inst	0x13490005 ; undefined
     e3c:	2e0b0000 	ext	v0.8b, v0.8b, v11.8b, #0
     e40:	3a0e0300 	adcs	w0, w24, w14
     e44:	0b3b0121 	add	w1, w9, w27, uxtb
     e48:	270d2139 	.inst	0x270d2139 ; undefined
     e4c:	12011119 	and	w25, w8, #0x8000000f
     e50:	7c184007 	stur	h7, [x0, #-124]
     e54:	0c000019 	st4	{v25.8b-v28.8b}, [x0]
     e58:	0e250111 	saddl	v17.8h, v8.8b, v5.8b
     e5c:	1f030b13 	fmadd	s19, s24, s3, s2
     e60:	01111f1b 	.inst	0x01111f1b ; undefined
     e64:	17100712 	b	fffffffffc402aac <IRQ_SOURCE_EL0_CORE_0+0xffffbc402a4c>
     e68:	160d0000 	b	fffffffff8340e68 <IRQ_SOURCE_EL0_CORE_0+0xffffb8340e08>
     e6c:	3a0e0300 	adcs	w0, w24, w14
     e70:	390b3b0b 	strb	w11, [x24, #718]
     e74:	0013490b 	.inst	0x0013490b ; undefined
     e78:	00240e00 	.inst	0x00240e00 ; NYI
     e7c:	0b3e0b0b 	add	w11, w24, w30, uxtb #2
     e80:	00000803 	udf	#2051
     e84:	3f012e0f 	.inst	0x3f012e0f ; undefined
     e88:	3a0e0319 	adcs	w25, w24, w14
     e8c:	390b3b0b 	strb	w11, [x24, #718]
     e90:	3c19270b 	str	b11, [x24], #-110
     e94:	00130119 	.inst	0x00130119 ; undefined
     e98:	012e1000 	.inst	0x012e1000 ; undefined
     e9c:	0e03193f 	uzp1	v31.8b, v9.8b, v3.8b
     ea0:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     ea4:	19270b39 	.inst	0x19270b39 ; undefined
     ea8:	193c1349 	.inst	0x193c1349 ; undefined
     eac:	00001301 	udf	#4865
     eb0:	00001811 	udf	#6161
     eb4:	000f1200 	.inst	0x000f1200 ; undefined
     eb8:	13490b0b 	.inst	0x13490b0b ; undefined
     ebc:	26130000 	.inst	0x26130000 ; undefined
     ec0:	00134900 	.inst	0x00134900 ; undefined
     ec4:	002e1400 	.inst	0x002e1400 ; NYI
     ec8:	0e03193f 	uzp1	v31.8b, v9.8b, v3.8b
     ecc:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     ed0:	19270b39 	.inst	0x19270b39 ; undefined
     ed4:	07120111 	.inst	0x07120111 ; undefined
     ed8:	197c1840 	.inst	0x197c1840 ; undefined
     edc:	2e150000 	ext	v0.8b, v0.8b, v21.8b, #0
     ee0:	03193f01 	.inst	0x03193f01 ; undefined
     ee4:	3b0b3a0e 	.inst	0x3b0b3a0e ; undefined
     ee8:	270b390b 	.inst	0x270b390b ; undefined
     eec:	12011119 	and	w25, w8, #0x8000000f
     ef0:	7c184007 	stur	h7, [x0, #-124]
     ef4:	00130119 	.inst	0x00130119 ; undefined
     ef8:	00051600 	.inst	0x00051600 ; undefined
     efc:	0b3a0e03 	add	w3, w16, w26, uxtb #3
     f00:	0b390b3b 	add	w27, w25, w25, uxtb #2
     f04:	18021349 	ldr	w9, 516c <MAIR_ATTR+0xd6c>
     f08:	01000000 	.inst	0x01000000 ; undefined
     f0c:	0e03000d 	tbl	v13.8b, {v0.16b}, v3.8b
     f10:	3b03213a 	.inst	0x3b03213a ; undefined
     f14:	490b390b 	.inst	0x490b390b ; undefined
     f18:	000b3813 	.inst	0x000b3813 ; undefined
     f1c:	00280200 	.inst	0x00280200 ; NYI
     f20:	0b1c0e03 	add	w3, w16, w28, lsl #3
     f24:	24030000 	cmphs	p0.b, p0/z, z0.b, z3.b
     f28:	3e0b0b00 	.inst	0x3e0b0b00 ; undefined
     f2c:	000e030b 	.inst	0x000e030b ; undefined
     f30:	00050400 	.inst	0x00050400 ; undefined
     f34:	213a0e03 	.inst	0x213a0e03 ; undefined
     f38:	390b3b01 	strb	w1, [x24, #718]
     f3c:	0213490b 	.inst	0x0213490b ; undefined
     f40:	05000018 	orr	z24.s, z24.s, #0x1
     f44:	0e030034 	tbl	v20.8b, {v1.16b}, v3.8b
     f48:	3b01213a 	.inst	0x3b01213a ; undefined
     f4c:	490b390b 	.inst	0x490b390b ; undefined
     f50:	00180213 	.inst	0x00180213 ; undefined
     f54:	00160600 	.inst	0x00160600 ; undefined
     f58:	213a0803 	.inst	0x213a0803 ; undefined
     f5c:	390b3b02 	strb	w2, [x24, #718]
     f60:	13491c21 	.inst	0x13491c21 ; undefined
     f64:	35070000 	cbnz	w0, ef64 <MAIR_ATTR+0xab64>
     f68:	00134900 	.inst	0x00134900 ; undefined
     f6c:	00160800 	.inst	0x00160800 ; undefined
     f70:	0b3a0e03 	add	w3, w16, w26, uxtb #3
     f74:	0b390b3b 	add	w27, w25, w25, uxtb #2
     f78:	00001349 	udf	#4937
     f7c:	49010109 	.inst	0x49010109 ; undefined
     f80:	00130113 	.inst	0x00130113 ; undefined
     f84:	00210a00 	.inst	0x00210a00 ; NYI
     f88:	0b2f1349 	add	w9, w26, w15, uxtb #4
     f8c:	130b0000 	sbfiz	w0, w0, #21, #1
     f90:	0b0e0301 	add	w1, w24, w14
     f94:	03213a0b 	.inst	0x03213a0b ; undefined
     f98:	0b390b3b 	add	w27, w25, w25, uxtb #2
     f9c:	00001301 	udf	#4865
     fa0:	3f012e0c 	.inst	0x3f012e0c ; undefined
     fa4:	3a0e0319 	adcs	w25, w24, w14
     fa8:	0b3b0121 	add	w1, w9, w27, uxtb
     fac:	27062139 	.inst	0x27062139 ; undefined
     fb0:	12011119 	and	w25, w8, #0x8000000f
     fb4:	7a184007 	.inst	0x7a184007 ; undefined
     fb8:	00130119 	.inst	0x00130119 ; undefined
     fbc:	01110d00 	.inst	0x01110d00 ; undefined
     fc0:	0b130e25 	add	w5, w17, w19, lsl #3
     fc4:	1f1b1f03 	fmadd	s3, s24, s27, s7
     fc8:	07120111 	.inst	0x07120111 ; undefined
     fcc:	00001710 	udf	#5904
     fd0:	0301040e 	.inst	0x0301040e ; undefined
     fd4:	0b0b3e0e 	add	w14, w16, w11, lsl #15
     fd8:	3a13490b 	.inst	0x3a13490b ; undefined
     fdc:	390b3b0b 	strb	w11, [x24, #718]
     fe0:	0013010b 	.inst	0x0013010b ; undefined
     fe4:	012e0f00 	.inst	0x012e0f00 ; undefined
     fe8:	0e03193f 	uzp1	v31.8b, v9.8b, v3.8b
     fec:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
     ff0:	19270b39 	.inst	0x19270b39 ; undefined
     ff4:	1301193c 	sbfx	w28, w9, #1, #6
     ff8:	05100000 	mov	z0.b, p0/z, #0
     ffc:	00134900 	.inst	0x00134900 ; undefined
    1000:	012e1100 	.inst	0x012e1100 ; undefined
    1004:	0e03193f 	uzp1	v31.8b, v9.8b, v3.8b
    1008:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
    100c:	19270b39 	.inst	0x19270b39 ; undefined
    1010:	07120111 	.inst	0x07120111 ; undefined
    1014:	197c1840 	.inst	0x197c1840 ; undefined
    1018:	00001301 	udf	#4865
    101c:	3f012e12 	.inst	0x3f012e12 ; undefined
    1020:	3a0e0319 	adcs	w25, w24, w14
    1024:	390b3b0b 	strb	w11, [x24, #718]
    1028:	1119270b 	add	w11, w24, #0x649
    102c:	40071201 	.inst	0x40071201 ; undefined
    1030:	00197a18 	.inst	0x00197a18 ; undefined
    1034:	34010000 	cbz	w0, 3034 <THREAD_HW_CONTEXT_SIZE+0x2f14>
    1038:	3a0e0300 	adcs	w0, w24, w14
    103c:	0b3b0121 	add	w1, w9, w27, uxtb
    1040:	13490b39 	.inst	0x13490b39 ; undefined
    1044:	00001802 	udf	#6146
    1048:	0b002402 	add	w2, w0, w0, lsl #9
    104c:	030b3e0b 	.inst	0x030b3e0b ; undefined
    1050:	0300000e 	.inst	0x0300000e ; undefined
    1054:	0e03000d 	tbl	v13.8b, {v0.16b}, v3.8b
    1058:	3b01213a 	.inst	0x3b01213a ; undefined
    105c:	490b390b 	.inst	0x490b390b ; undefined
    1060:	000b3813 	.inst	0x000b3813 ; undefined
    1064:	00050400 	.inst	0x00050400 ; undefined
    1068:	00001349 	udf	#4937
    106c:	03001605 	.inst	0x03001605 ; undefined
    1070:	02213a08 	.inst	0x02213a08 ; undefined
    1074:	21390b3b 	.inst	0x21390b3b ; undefined
    1078:	0013491c 	.inst	0x0013491c ; undefined
    107c:	01110600 	.inst	0x01110600 ; undefined
    1080:	0b130e25 	add	w5, w17, w19, lsl #3
    1084:	1f1b1f03 	fmadd	s3, s24, s27, s7
    1088:	07120111 	.inst	0x07120111 ; undefined
    108c:	00001710 	udf	#5904
    1090:	3f012e07 	.inst	0x3f012e07 ; undefined
    1094:	3a0e0319 	adcs	w25, w24, w14
    1098:	390b3b0b 	strb	w11, [x24, #718]
    109c:	4919270b 	.inst	0x4919270b ; undefined
    10a0:	01193c13 	.inst	0x01193c13 ; undefined
    10a4:	08000013 	stxrb	w0, w19, [x0]
    10a8:	0b0b0024 	add	w4, w1, w11
    10ac:	08030b3e 	stxrb	w3, w30, [x25]
    10b0:	0f090000 	.inst	0x0f090000 ; undefined
    10b4:	000b0b00 	.inst	0x000b0b00 ; undefined
    10b8:	012e0a00 	.inst	0x012e0a00 ; undefined
    10bc:	0e03193f 	uzp1	v31.8b, v9.8b, v3.8b
    10c0:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
    10c4:	19270b39 	.inst	0x19270b39 ; undefined
    10c8:	01111349 	.inst	0x01111349 ; undefined
    10cc:	18400712 	ldr	w18, 811ac <current_el_sp0_serror+0x2c>
    10d0:	1301197c 	sbfx	w28, w11, #1, #6
    10d4:	130b0000 	sbfiz	w0, w0, #21, #1
    10d8:	0b0e0301 	add	w1, w24, w14
    10dc:	3b0b3a0b 	.inst	0x3b0b3a0b ; undefined
    10e0:	010b390b 	.inst	0x010b390b ; undefined
    10e4:	0c000013 	st4	{v19.8b-v22.8b}, [x0]
    10e8:	0e030016 	tbl	v22.8b, {v0.16b}, v3.8b
    10ec:	0b3b0b3a 	add	w26, w25, w27, uxtb #2
    10f0:	13490b39 	.inst	0x13490b39 ; undefined
    10f4:	Address 0x00000000000010f4 is out of bounds.


Disassembly of section .debug_aranges:

0000000000000000 <.debug_aranges>:
   0:	0000002c 	udf	#44
   4:	00000002 	udf	#2
   8:	00080000 	.inst	0x00080000 ; undefined
   c:	00000000 	udf	#0
  10:	00080100 	.inst	0x00080100 ; undefined
  14:	00000000 	udf	#0
  18:	00000330 	udf	#816
	...
  30:	0000002c 	udf	#44
  34:	00290002 	.inst	0x00290002 ; NYI
  38:	00080000 	.inst	0x00080000 ; undefined
  3c:	00000000 	udf	#0
  40:	00080800 	.inst	0x00080800 ; undefined
  44:	00000000 	udf	#0
  48:	00001158 	udf	#4440
	...
  60:	0000002c 	udf	#44
  64:	00520002 	.inst	0x00520002 ; undefined
  68:	00080000 	.inst	0x00080000 ; undefined
  6c:	00000000 	udf	#0
  70:	00081958 	.inst	0x00081958 ; undefined
  74:	00000000 	udf	#0
  78:	000000dc 	udf	#220
	...
  90:	0000003c 	udf	#60
  94:	007b0002 	.inst	0x007b0002 ; undefined
  98:	00080000 	.inst	0x00080000 ; undefined
  9c:	00000000 	udf	#0
  a0:	00080000 	.inst	0x00080000 ; undefined
  a4:	00000000 	udf	#0
  a8:	000000c8 	udf	#200
  ac:	00000000 	udf	#0
  b0:	00081a38 	.inst	0x00081a38 ; undefined
  b4:	00000000 	udf	#0
  b8:	00000098 	udf	#152
	...
  d0:	0000002c 	udf	#44
  d4:	009e0002 	.inst	0x009e0002 ; undefined
  d8:	00080000 	.inst	0x00080000 ; undefined
  dc:	00000000 	udf	#0
  e0:	00082000 	.inst	0x00082000 ; undefined
  e4:	00000000 	udf	#0
  e8:	00001010 	udf	#4112
	...
 100:	0000002c 	udf	#44
 104:	00c70002 	.inst	0x00c70002 ; undefined
 108:	00080000 	.inst	0x00080000 ; undefined
 10c:	00000000 	udf	#0
 110:	00083010 	.inst	0x00083010 ; undefined
 114:	00000000 	udf	#0
 118:	00000034 	udf	#52
	...
 130:	0000002c 	udf	#44
 134:	00ef0002 	.inst	0x00ef0002 ; undefined
 138:	00080000 	.inst	0x00080000 ; undefined
 13c:	00000000 	udf	#0
 140:	00083044 	.inst	0x00083044 ; undefined
 144:	00000000 	udf	#0
 148:	000001d8 	udf	#472
	...
 160:	0000002c 	udf	#44
 164:	02ec0002 	.inst	0x02ec0002 ; undefined
 168:	00080000 	.inst	0x00080000 ; undefined
 16c:	00000000 	udf	#0
 170:	0008321c 	.inst	0x0008321c ; undefined
 174:	00000000 	udf	#0
 178:	00000018 	udf	#24
	...
 190:	0000002c 	udf	#44
 194:	03770002 	.inst	0x03770002 ; undefined
 198:	00080000 	.inst	0x00080000 ; undefined
 19c:	00000000 	udf	#0
 1a0:	00083234 	.inst	0x00083234 ; undefined
 1a4:	00000000 	udf	#0
 1a8:	00000018 	udf	#24
	...
 1c0:	0000002c 	udf	#44
 1c4:	04020002 	.inst	0x04020002 ; undefined
 1c8:	00080000 	.inst	0x00080000 ; undefined
 1cc:	00000000 	udf	#0
 1d0:	0008324c 	.inst	0x0008324c ; undefined
 1d4:	00000000 	udf	#0
 1d8:	00000018 	udf	#24
	...
 1f0:	0000002c 	udf	#44
 1f4:	05330002 	ext	z2.b, z2.b, z0.b, #152
 1f8:	00080000 	.inst	0x00080000 ; undefined
 1fc:	00000000 	udf	#0
 200:	00083264 	.inst	0x00083264 ; undefined
 204:	00000000 	udf	#0
 208:	0000004c 	udf	#76
	...
 220:	0000002c 	udf	#44
 224:	06860002 	.inst	0x06860002 ; undefined
 228:	00080000 	.inst	0x00080000 ; undefined
 22c:	00000000 	udf	#0
 230:	000832b0 	.inst	0x000832b0 ; undefined
 234:	00000000 	udf	#0
 238:	000000f0 	udf	#240
	...
 250:	0000002c 	udf	#44
 254:	0a0a0002 	and	w2, w0, w10
 258:	00080000 	.inst	0x00080000 ; undefined
 25c:	00000000 	udf	#0
 260:	000833a0 	.inst	0x000833a0 ; undefined
 264:	00000000 	udf	#0
 268:	000000bc 	udf	#188
	...
 280:	0000002c 	udf	#44
 284:	0aef0002 	bic	w2, w0, w15, ror #0
 288:	00080000 	.inst	0x00080000 ; undefined
 28c:	00000000 	udf	#0
 290:	0008345c 	.inst	0x0008345c ; undefined
 294:	00000000 	udf	#0
 298:	0000068c 	udf	#1676
	...
 2b0:	0000002c 	udf	#44
 2b4:	0f120002 	.inst	0x0f120002 ; undefined
 2b8:	00080000 	.inst	0x00080000 ; undefined
 2bc:	00000000 	udf	#0
 2c0:	00083ae8 	.inst	0x00083ae8 ; undefined
 2c4:	00000000 	udf	#0
 2c8:	000000e0 	udf	#224
	...
 2e0:	0000002c 	udf	#44
 2e4:	106d0002 	adr	x2, da2e4 <__kernel_end_addr+0x41c9c>
 2e8:	00080000 	.inst	0x00080000 ; undefined
 2ec:	00000000 	udf	#0
 2f0:	00083bc8 	.inst	0x00083bc8 ; undefined
 2f4:	00000000 	udf	#0
 2f8:	000000e0 	udf	#224
	...
 310:	0000002c 	udf	#44
 314:	130d0002 	sbfiz	w2, w0, #19, #1
 318:	00080000 	.inst	0x00080000 ; undefined
 31c:	00000000 	udf	#0
 320:	00083ca8 	.inst	0x00083ca8 ; undefined
 324:	00000000 	udf	#0
 328:	00000038 	udf	#56
	...
 340:	0000002c 	udf	#44
 344:	13eb0002 	.inst	0x13eb0002 ; undefined
 348:	00080000 	.inst	0x00080000 ; undefined
 34c:	00000000 	udf	#0
 350:	00083ce0 	.inst	0x00083ce0 ; undefined
 354:	00000000 	udf	#0
 358:	00000108 	udf	#264
	...
 370:	0000002c 	udf	#44
 374:	159e0002 	b	678037c <TCR_VALUE+0x668036c>
 378:	00080000 	.inst	0x00080000 ; undefined
 37c:	00000000 	udf	#0
 380:	00083de8 	.inst	0x00083de8 ; undefined
 384:	00000000 	udf	#0
 388:	00000008 	udf	#8
	...
 3a0:	0000002c 	udf	#44
 3a4:	160a0002 	b	fffffffff82803ac <IRQ_SOURCE_EL0_CORE_0+0xffffb828034c>
 3a8:	00080000 	.inst	0x00080000 ; undefined
 3ac:	00000000 	udf	#0
 3b0:	00083df0 	.inst	0x00083df0 ; undefined
 3b4:	00000000 	udf	#0
 3b8:	000002ec 	udf	#748
	...
 3d0:	0000002c 	udf	#44
 3d4:	189b0002 	ldr	w2, fffffffffff363d4 <IRQ_SOURCE_EL0_CORE_0+0xffffbff36374>
 3d8:	00080000 	.inst	0x00080000 ; undefined
 3dc:	00000000 	udf	#0
 3e0:	000840dc 	.inst	0x000840dc ; undefined
 3e4:	00000000 	udf	#0
 3e8:	000001d4 	udf	#468
	...
 400:	0000002c 	udf	#44
 404:	1b4f0002 	.inst	0x1b4f0002 ; undefined
 408:	00080000 	.inst	0x00080000 ; undefined
 40c:	00000000 	udf	#0
 410:	000842b0 	.inst	0x000842b0 ; undefined
 414:	00000000 	udf	#0
 418:	000001ec 	udf	#492
	...
 430:	0000002c 	udf	#44
 434:	1e250002 	fcvtau	w2, s0
 438:	00080000 	.inst	0x00080000 ; undefined
 43c:	00000000 	udf	#0
 440:	0008449c 	.inst	0x0008449c ; undefined
 444:	00000000 	udf	#0
 448:	000001d0 	udf	#464
	...
 460:	0000002c 	udf	#44
 464:	210a0002 	.inst	0x210a0002 ; undefined
 468:	00080000 	.inst	0x00080000 ; undefined
 46c:	00000000 	udf	#0
 470:	0008466c 	.inst	0x0008466c ; undefined
 474:	00000000 	udf	#0
 478:	00000054 	udf	#84
	...

Disassembly of section .debug_str:

0000000000000000 <.debug_str>:
   0:	65726f63 	fnmls	z3.h, p3/m, z27.h, z18.h
   4:	746d732f 	.inst	0x746d732f ; undefined
   8:	2f00532e 	.inst	0x2f00532e ; undefined
   c:	656d6f68 	fnmls	z8.h, p3/m, z27.h, z13.h
  10:	6175792f 	.inst	0x6175792f ; undefined
  14:	65442f6e 	fmaxnmv	h14, p3, z27.h
  18:	6f746b73 	umlsl2	v19.4s, v27.8h, v4.h[7]
  1c:	72702f70 	.inst	0x72702f70 ; undefined
  20:	63656a6f 	.inst	0x63656a6f ; undefined
  24:	702f7374 	adr	x20, 5ee93 <MAIR_ATTR+0x5aa93>
  28:	61625f69 	.inst	0x61625f69 ; undefined
  2c:	656d6572 	fnmls	z18.h, p1/m, z11.h, z13.h
  30:	2f6c6174 	umlsl	v20.4s, v11.4h, v12.h[2]
  34:	00336970 	.inst	0x00336970 ; NYI
  38:	20554e47 	.inst	0x20554e47 ; undefined
  3c:	32205341 	orr	w1, w26, #0x1fffff
  40:	0038332e 	.inst	0x0038332e ; NYI
  44:	65746e69 	fnmls	z9.h, p3/m, z19.h, z20.h
  48:	70757272 	adr	x18, eae97 <__kernel_end_addr+0x5284f>
  4c:	72692f74 	.inst	0x72692f74 ; undefined
  50:	00532e71 	.inst	0x00532e71 ; undefined
  54:	6c697475 	ldnp	d21, d29, [x3, #-368]
  58:	2f797469 	.inst	0x2f797469 ; undefined
  5c:	6c697475 	ldnp	d21, d29, [x3, #-368]
  60:	2e797469 	uabd	v9.4h, v3.4h, v25.4h
  64:	6f620053 	mla	v19.8h, v2.8h, v2.h[2]
  68:	632f746f 	.inst	0x632f746f ; undefined
  6c:	2e307472 	uabd	v18.8b, v3.8b, v16.8b
  70:	6d6d0053 	ldp	d19, d0, [x2, #-304]
  74:	5f6d6d2f 	.inst	0x5f6d6d2f ; undefined
  78:	6c697475 	ldnp	d21, d29, [x3, #-368]
  7c:	6400532e 	.inst	0x6400532e ; undefined
  80:	63697665 	.inst	0x63697665 ; undefined
  84:	69742f65 	ldpsw	x5, x11, [x27, #-96]
  88:	5f72656d 	.inst	0x5f72656d ; undefined
  8c:	65746e69 	fnmls	z9.h, p3/m, z19.h, z20.h
  90:	63616672 	.inst	0x63616672 ; undefined
  94:	00532e65 	.inst	0x00532e65 ; undefined
  98:	20554e47 	.inst	0x20554e47 ; undefined
  9c:	20393943 	.inst	0x20393943 ; undefined
  a0:	332e3131 	.inst	0x332e3131 ; undefined
  a4:	2d20302e 	stp	s14, s12, [x1, #-256]
  a8:	6e65676d 	umax	v13.8h, v27.8h, v5.8h
  ac:	6c617265 	ldnp	d5, d28, [x19, #-496]
  b0:	6765722d 	.inst	0x6765722d ; undefined
  b4:	6e6f2d73 	uqsub	v19.8h, v11.8h, v15.8h
  b8:	2d20796c 	stp	s12, s30, [x11, #-256]
  bc:	74696c6d 	.inst	0x74696c6d ; undefined
  c0:	2d656c74 	ldp	s20, s27, [x3, #-216]
  c4:	69646e65 	ldpsw	x5, x27, [x19, #-224]
  c8:	2d206e61 	stp	s1, s27, [x19, #-256]
  cc:	6962616d 	ldpsw	x13, x24, [x11, #-240]
  d0:	36706c3d 	tbz	w29, #14, e54 <THREAD_HW_CONTEXT_SIZE+0xd34>
  d4:	672d2034 	.inst	0x672d2034 ; undefined
  d8:	304f2d20 	adr	x0, 9e67d <__kernel_end_addr+0x6035>
  dc:	74732d20 	.inst	0x74732d20 ; undefined
  e0:	39633d64 	ldrb	w4, [x11, #2255]
  e4:	662d2039 	.inst	0x662d2039 ; undefined
  e8:	65657266 	fnmls	z6.h, p4/m, z19.h, z5.h
  ec:	6e617473 	uabd	v19.8h, v3.8h, v1.8h
  f0:	676e6964 	.inst	0x676e6964 ; undefined
  f4:	61662d20 	.inst	0x61662d20 ; undefined
  f8:	636e7973 	.inst	0x636e7973 ; undefined
  fc:	6e6f7268 	uabdl2	v8.4s, v19.8h, v15.8h
 100:	2d73756f 	ldp	s15, s29, [x11, #-104]
 104:	69776e75 	ldpsw	x21, x27, [x19, #-72]
 108:	742d646e 	.inst	0x742d646e ; undefined
 10c:	656c6261 	fnmls	z1.h, p0/m, z19.h, z12.h
 110:	662d2073 	.inst	0x662d2073 ; undefined
 114:	63617473 	.inst	0x63617473 ; undefined
 118:	6c632d6b 	ldnp	d11, d11, [x11, #-464]
 11c:	2d687361 	ldp	s1, s28, [x27, #-192]
 120:	746f7270 	.inst	0x746f7270 ; undefined
 124:	69746365 	ldpsw	x5, x24, [x27, #-96]
 128:	5f006e6f 	.inst	0x5f006e6f ; undefined
 12c:	7373615f 	.inst	0x7373615f ; undefined
 130:	00747265 	.inst	0x00747265 ; undefined
 134:	646d5070 	.inst	0x646d5070 ; undefined
 138:	736e7500 	.inst	0x736e7500 ; undefined
 13c:	656e6769 	fnmls	z9.h, p1/m, z27.h, z14.h
 140:	68632064 	.inst	0x68632064 ; undefined
 144:	62007261 	.inst	0x62007261 ; undefined
 148:	5f746f6f 	.inst	0x5f746f6f ; undefined
 14c:	61727473 	.inst	0x61727473 ; undefined
 150:	61745f70 	.inst	0x61745f70 ; undefined
 154:	5f656c62 	.inst	0x5f656c62 ; undefined
 158:	72646461 	.inst	0x72646461 ; undefined
 15c:	306c655f 	adr	xzr, d8e05 <__kernel_end_addr+0x407bd>
 160:	6d657400 	ldp	d0, d29, [x0, #-432]
 164:	68730070 	.inst	0x68730070 ; undefined
 168:	2074726f 	.inst	0x2074726f ; undefined
 16c:	69736e75 	ldpsw	x21, x27, [x19, #-104]
 170:	64656e67 	.inst	0x64656e67 ; undefined
 174:	746e6920 	.inst	0x746e6920 ; undefined
 178:	6e696c00 	umin	v0.8h, v0.8h, v9.8h
 17c:	756e5f65 	.inst	0x756e5f65 ; undefined
 180:	5070006d 	adr	x13, e018e <__kernel_end_addr+0x47b46>
 184:	64006475 	.inst	0x64006475 ; undefined
 188:	6d5f6762 	ldp	d2, d25, [x27, #496]
 18c:	64006773 	.inst	0x64006773 ; undefined
 190:	6c707369 	ldnp	d9, d28, [x27, #-256]
 194:	705f7961 	adr	x1, bf0c3 <__kernel_end_addr+0x26a7b>
 198:	5f656761 	.inst	0x5f656761 ; undefined
 19c:	6c626174 	ldnp	d20, d24, [x11, #-480]
 1a0:	6f6c0065 	mla	v5.8h, v3.8h, v12.h[2]
 1a4:	6c20676e 	stnp	d14, d25, [x27, #-512]
 1a8:	20676e6f 	.inst	0x20676e6f ; undefined
 1ac:	69736e75 	ldpsw	x21, x27, [x19, #-104]
 1b0:	64656e67 	.inst	0x64656e67 ; undefined
 1b4:	746e6920 	.inst	0x746e6920 ; undefined
 1b8:	6f6f6200 	umlsl2	v0.4s, v16.8h, v15.h[2]
 1bc:	74735f74 	.inst	0x74735f74 ; undefined
 1c0:	5f706172 	.inst	0x5f706172 ; undefined
 1c4:	6c626174 	ldnp	d20, d24, [x11, #-480]
 1c8:	64615f65 	.inst	0x64615f65 ; undefined
 1cc:	66007264 	.inst	0x66007264 ; undefined
 1d0:	5f656c69 	.inst	0x5f656c69 ; undefined
 1d4:	656d616e 	fnmls	z14.h, p0/m, z11.h, z13.h
 1d8:	6e6f6300 	rsubhn2	v0.8h, v24.4s, v15.4s
 1dc:	68730064 	.inst	0x68730064 ; undefined
 1e0:	2074726f 	.inst	0x2074726f ; undefined
 1e4:	00746e69 	.inst	0x00746e69 ; undefined
 1e8:	6e697270 	uabdl2	v16.4s, v19.8h, v9.8h
 1ec:	6c006b74 	stnp	d20, d26, [x27]
 1f0:	20676e6f 	.inst	0x20676e6f ; undefined
 1f4:	00746e69 	.inst	0x00746e69 ; undefined
 1f8:	74726175 	.inst	0x74726175 ; undefined
 1fc:	6972775f 	ldpsw	xzr, x29, [x26, #-112]
 200:	735f6574 	.inst	0x735f6574 ; undefined
 204:	6e697274 	uabdl2	v20.4s, v19.8h, v9.8h
 208:	75660067 	.inst	0x75660067 ; undefined
 20c:	635f636e 	.inst	0x635f636e ; undefined
 210:	5f65726f 	sqdmlsl	s15, h19, v5.h[2]
 214:	72746e65 	.inst	0x72746e65 ; undefined
 218:	75660079 	.inst	0x75660079 ; undefined
 21c:	635f636e 	.inst	0x635f636e ; undefined
 220:	5f65726f 	sqdmlsl	s15, h19, v5.h[2]
 224:	5f787561 	sqshl	d1, d11, #56
 228:	72746e65 	.inst	0x72746e65 ; undefined
 22c:	70730079 	adr	x25, e623b <__kernel_end_addr+0x4dbf3>
 230:	63655269 	.inst	0x63655269 ; undefined
 234:	66754276 	.inst	0x66754276 ; undefined
 238:	65737500 	fnmls	z0.h, p5/m, z8.h, z19.h
 23c:	6f635f72 	.inst	0x6f635f72 ; undefined
 240:	655f6572 	fcmne	p2.h, p1/z, z11.h, z31.h
 244:	7972746e 	ldrh	w14, [x3, #6458]
 248:	63326900 	.inst	0x63326900 ; undefined
 24c:	76636552 	.inst	0x76636552 ; undefined
 250:	00667542 	.inst	0x00667542 ; undefined
 254:	53697073 	.inst	0x53697073 ; undefined
 258:	42646e65 	.inst	0x42646e65 ; undefined
 25c:	63006675 	.inst	0x63006675 ; undefined
 260:	5f65726f 	sqdmlsl	s15, h19, v5.h[2]
 264:	736e6f63 	.inst	0x736e6f63 ; undefined
 268:	5f656c6f 	.inst	0x5f656c6f ; undefined
 26c:	6b636f6c 	.inst	0x6b636f6c ; undefined
 270:	63326900 	.inst	0x63326900 ; undefined
 274:	646e6553 	.inst	0x646e6553 ; undefined
 278:	00667542 	.inst	0x00667542 ; undefined
 27c:	6f697067 	fcmla	v7.8h, v3.8h, v9.h[1], #270
 280:	6e69705f 	uabdl2	v31.4s, v2.8h, v9.8h
 284:	6e75665f 	umax	v31.8h, v18.8h, v21.8h
 288:	65735f63 	fnmla	z3.h, p7/m, z27.h, z19.h
 28c:	7463656c 	.inst	0x7463656c ; undefined
 290:	69706700 	ldpsw	x0, x25, [x24, #-128]
 294:	65735f6f 	fnmla	z15.h, p7/m, z27.h, z19.h
 298:	50470074 	adr	x20, 8e2a6 <boot_strap_table_addr+0x2a6>
 29c:	465f4f49 	.inst	0x465f4f49 ; undefined
 2a0:	5f434e55 	.inst	0x5f434e55 ; undefined
 2a4:	5054554f 	adr	x15, a8d4e <__kernel_end_addr+0x10706>
 2a8:	67005455 	.inst	0x67005455 ; undefined
 2ac:	5f6f6970 	.inst	0x5f6f6970 ; undefined
 2b0:	5f6e6970 	.inst	0x5f6e6970 ; undefined
 2b4:	62616e65 	.inst	0x62616e65 ; undefined
 2b8:	4700656c 	.inst	0x4700656c ; undefined
 2bc:	5f4f4950 	.inst	0x5f4f4950 ; undefined
 2c0:	434e5546 	.inst	0x434e5546 ; undefined
 2c4:	504e495f 	adr	xzr, 9cbee <__kernel_end_addr+0x45a6>
 2c8:	67005455 	.inst	0x67005455 ; undefined
 2cc:	5f6f6970 	.inst	0x5f6f6970 ; undefined
 2d0:	61656c63 	.inst	0x61656c63 ; undefined
 2d4:	475f0072 	.inst	0x475f0072 ; undefined
 2d8:	416f6970 	.inst	0x416f6970 ; undefined
 2dc:	7546746c 	.inst	0x7546746c ; undefined
 2e0:	6300636e 	.inst	0x6300636e ; undefined
 2e4:	5f6d6d6f 	.inst	0x5f6d6d6f ; undefined
 2e8:	65726f63 	fnmls	z3.h, p3/m, z27.h, z18.h
 2ec:	746e655f 	.inst	0x746e655f ; undefined
 2f0:	47007972 	.inst	0x47007972 ; undefined
 2f4:	5f4f4950 	.inst	0x5f4f4950 ; undefined
 2f8:	434e5546 	.inst	0x434e5546 ; undefined
 2fc:	544c415f 	bc.nv	98b24 <__kernel_end_addr+0x4dc>
 300:	50470030 	adr	x16, 8e306 <boot_strap_table_addr+0x306>
 304:	465f4f49 	.inst	0x465f4f49 ; undefined
 308:	5f434e55 	.inst	0x5f434e55 ; undefined
 30c:	31544c41 	adds	w1, w2, #0x513, lsl #12
 310:	49504700 	.inst	0x49504700 ; undefined
 314:	55465f4f 	.inst	0x55465f4f ; undefined
 318:	415f434e 	.inst	0x415f434e ; undefined
 31c:	0032544c 	.inst	0x0032544c ; NYI
 320:	4f495047 	.inst	0x4f495047 ; undefined
 324:	4e55465f 	.inst	0x4e55465f ; undefined
 328:	4c415f43 	.inst	0x4c415f43 ; undefined
 32c:	47003354 	.inst	0x47003354 ; undefined
 330:	5f4f4950 	.inst	0x5f4f4950 ; undefined
 334:	434e5546 	.inst	0x434e5546 ; undefined
 338:	544c415f 	bc.nv	98b60 <__kernel_end_addr+0x518>
 33c:	50470034 	adr	x20, 8e342 <boot_strap_table_addr+0x342>
 340:	465f4f49 	.inst	0x465f4f49 ; undefined
 344:	5f434e55 	.inst	0x5f434e55 ; undefined
 348:	35544c41 	cbnz	w1, a8cd0 <__kernel_end_addr+0x10688>
 34c:	71726900 	subs	w0, w8, #0xc9a, lsl #12
 350:	616e655f 	.inst	0x616e655f ; undefined
 354:	5f656c62 	.inst	0x5f656c62 ; undefined
 358:	69736162 	ldpsw	x2, x24, [x11, #-104]
 35c:	4e490063 	.inst	0x4e490063 ; undefined
 360:	52495f54 	.inst	0x52495f54 ; undefined
 364:	53415f51 	.inst	0x53415f51 ; undefined
 368:	5f434e59 	.inst	0x5f434e59 ; undefined
 36c:	45435845 	usubwb	z5.h, z2.h, z3.b
 370:	4f495450 	shl	v16.2d, v2.2d, #9
 374:	7073004e 	adr	x14, e637f <__kernel_end_addr+0x4dd37>
 378:	69007273 	stgp	x19, x28, [x19]
 37c:	655f7172 	fcmne	p2.h, p4/z, z11.h, z31.h
 380:	6c62616e 	ldnp	d14, d24, [x11, #-480]
 384:	65725f65 	fnmla	z5.h, p7/m, z27.h, z18.h
 388:	69003167 	stgp	x7, x12, [x11]
 38c:	655f7172 	fcmne	p2.h, p4/z, z11.h, z31.h
 390:	6c62616e 	ldnp	d14, d24, [x11, #-480]
 394:	65725f65 	fnmla	z5.h, p7/m, z27.h, z18.h
 398:	72003267 	ands	w7, w19, #0x1fff
 39c:	72657365 	.inst	0x72657365 ; undefined
 3a0:	00646576 	.inst	0x00646576 ; undefined
 3a4:	64616572 	.inst	0x64616572 ; undefined
 3a8:	726f635f 	.inst	0x726f635f ; undefined
 3ac:	745f3065 	.inst	0x745f3065 ; undefined
 3b0:	72656d69 	.inst	0x72656d69 ; undefined
 3b4:	6174735f 	.inst	0x6174735f ; undefined
 3b8:	00737574 	.inst	0x00737574 ; undefined
 3bc:	69547369 	ldpsw	x9, x28, [x27, #160]
 3c0:	4972656d 	.inst	0x4972656d ; undefined
 3c4:	7265746e 	.inst	0x7265746e ; undefined
 3c8:	74707572 	.inst	0x74707572 ; undefined
 3cc:	6d697400 	ldp	d0, d29, [x0, #-368]
 3d0:	695f7265 	ldpsw	x5, x28, [x19, #248]
 3d4:	685f7172 	.inst	0x685f7172 ; undefined
 3d8:	6c646e61 	ldnp	d1, d27, [x19, #-448]
 3dc:	5f007265 	.inst	0x5f007265 ; undefined
 3e0:	5f544e49 	.inst	0x5f544e49 ; undefined
 3e4:	45505954 	usubwb	z20.h, z10.h, z16.b
 3e8:	71726900 	subs	w0, w8, #0xc9a, lsl #12
 3ec:	7369645f 	.inst	0x7369645f ; undefined
 3f0:	656c6261 	fnmls	z1.h, p0/m, z19.h, z12.h
 3f4:	6765725f 	.inst	0x6765725f ; undefined
 3f8:	72690031 	.inst	0x72690031 ; undefined
 3fc:	69645f71 	ldpsw	x17, x23, [x27, #-224]
 400:	6c626173 	ldnp	d19, d24, [x11, #-480]
 404:	65725f65 	fnmla	z5.h, p7/m, z27.h, z18.h
 408:	54003267 	b.vc	a54 <THREAD_HW_CONTEXT_SIZE+0x934>
 40c:	46706172 	.inst	0x46706172 ; undefined
 410:	656d6172 	fnmls	z18.h, p0/m, z11.h, z13.h
 414:	63736544 	.inst	0x63736544 ; undefined
 418:	7400745f 	.inst	0x7400745f ; undefined
 41c:	5f706172 	.inst	0x5f706172 ; undefined
 420:	49006f6e 	.inst	0x49006f6e ; undefined
 424:	535f544e 	.inst	0x535f544e ; undefined
 428:	59535f57 	.inst	0x59535f57 ; undefined
 42c:	455f434e 	saddwb	z14.h, z26.h, z31.b
 430:	50454358 	adr	x24, 8ac9a <core_2_kernel_stack+0xc9a>
 434:	4e4f4954 	.inst	0x4e4f4954 ; undefined
 438:	61657200 	.inst	0x61657200 ; undefined
 43c:	6f635f64 	.inst	0x6f635f64 ; undefined
 440:	5f306572 	.inst	0x5f306572 ; undefined
 444:	5f717269 	sqdmlsl	s9, h19, v1.h[3]
 448:	74617473 	.inst	0x74617473 ; undefined
 44c:	49007375 	.inst	0x49007375 ; undefined
 450:	535f544e 	.inst	0x535f544e ; undefined
 454:	59535f57 	.inst	0x59535f57 ; undefined
 458:	4c414353 	.inst	0x4c414353 ; undefined
 45c:	7254004c 	.inst	0x7254004c ; undefined
 460:	72467061 	.inst	0x72467061 ; undefined
 464:	00656d61 	.inst	0x00656d61 ; undefined
 468:	5f717269 	sqdmlsl	s9, h19, v1.h[3]
 46c:	61736964 	.inst	0x61736964 ; undefined
 470:	5f656c62 	.inst	0x5f656c62 ; undefined
 474:	69736162 	ldpsw	x2, x24, [x11, #-104]
 478:	73690063 	.inst	0x73690063 ; undefined
 47c:	6e756f43 	umin	v3.8h, v26.8h, v21.8h
 480:	53726574 	.inst	0x53726574 ; undefined
 484:	72757461 	.inst	0x72757461 ; undefined
 488:	64657461 	.inst	0x64657461 ; undefined
 48c:	71726900 	subs	w0, w8, #0xc9a, lsl #12
 490:	6e65705f 	uabdl2	v31.4s, v2.8h, v5.8h
 494:	676e6964 	.inst	0x676e6964 ; undefined
 498:	72736900 	.inst	0x72736900 ; undefined
 49c:	7369645f 	.inst	0x7369645f ; undefined
 4a0:	63746170 	.inst	0x63746170 ; undefined
 4a4:	00726568 	.inst	0x00726568 ; undefined
 4a8:	65747865 	fnmls	z5.h, p6/m, z3.h, z20.h
 4ac:	6c616e72 	ldnp	d18, d27, [x19, #-496]
 4b0:	7973615f 	ldrh	wzr, [x10, #6576]
 4b4:	695f636e 	ldpsw	x14, x24, [x27, #248]
 4b8:	685f7172 	.inst	0x685f7172 ; undefined
 4bc:	6c646e61 	ldnp	d1, d27, [x19, #-448]
 4c0:	70007265 	adr	x5, 130f <THREAD_HW_CONTEXT_SIZE+0x11ef>
 4c4:	72676f72 	.inst	0x72676f72 ; undefined
 4c8:	675f6d61 	.inst	0x675f6d61 ; undefined
 4cc:	49006369 	.inst	0x49006369 ; undefined
 4d0:	495f544e 	.inst	0x495f544e ; undefined
 4d4:	4c41564e 	.inst	0x4c41564e ; undefined
 4d8:	73004449 	.inst	0x73004449 ; undefined
 4dc:	6b636174 	.inst	0x6b636174 ; undefined
 4e0:	6363615f 	.inst	0x6363615f ; undefined
 4e4:	5f737365 	sqdmlsl	s5, h27, v3.h[3]
 4e8:	666c6573 	.inst	0x666c6573 ; undefined
 4ec:	7365745f 	.inst	0x7365745f ; undefined
 4f0:	656d0074 	fmla	z20.h, p0/m, z3.h, z13.h
 4f4:	7465736d 	.inst	0x7465736d ; undefined
 4f8:	726f6300 	.inst	0x726f6300 ; undefined
 4fc:	64695f65 	.inst	0x64695f65 ; undefined
 500:	74656700 	.inst	0x74656700 ; undefined
 504:	726f635f 	.inst	0x726f635f ; undefined
 508:	74735f65 	.inst	0x74735f65 ; undefined
 50c:	006b6361 	.inst	0x006b6361 ; undefined
 510:	636d656d 	.inst	0x636d656d ; undefined
 514:	6900726c 	stgp	x12, x28, [x19]
 518:	6765746e 	.inst	0x6765746e ; undefined
 51c:	75007265 	.inst	0x75007265 ; undefined
 520:	36746e69 	tbz	w9, #14, ffffffffffff92ec <IRQ_SOURCE_EL0_CORE_0+0xffffbfff928c>
 524:	00745f34 	.inst	0x00745f34 ; undefined
 528:	74726175 	.inst	0x74726175 ; undefined
 52c:	6e65735f 	uabdl2	v31.4s, v26.8h, v5.8h
 530:	00635f64 	.inst	0x00635f64 ; undefined
 534:	64616572 	.inst	0x64616572 ; undefined
 538:	7274735f 	.inst	0x7274735f ; undefined
 53c:	00676e69 	.inst	0x00676e69 ; undefined
 540:	74697277 	.inst	0x74697277 ; undefined
 544:	6f635f65 	.inst	0x6f635f65 ; undefined
 548:	6c6f736e 	ldnp	d14, d28, [x27, #-272]
 54c:	5f5f0065 	.inst	0x5f5f0065 ; undefined
 550:	6f5f7267 	fcmla	v7.8h, v19.8h, v31.h[0], #270
 554:	00736666 	.inst	0x00736666 ; undefined
 558:	72765f5f 	.inst	0x72765f5f ; undefined
 55c:	706f745f 	adr	xzr, df3e7 <__kernel_end_addr+0x46d9f>
 560:	78656800 	ldrh	w0, [x0, x5]
 564:	5f6f745f 	sqshl	d31, d2, #47
 568:	69727473 	ldpsw	x19, x29, [x3, #-112]
 56c:	6600676e 	.inst	0x6600676e ; undefined
 570:	616d726f 	.inst	0x616d726f ; undefined
 574:	5f5f0074 	.inst	0x5f5f0074 ; undefined
 578:	6c5f6176 	ldnp	d22, d24, [x11, #496]
 57c:	00747369 	.inst	0x00747369 ; undefined
 580:	72675f5f 	.inst	0x72675f5f ; undefined
 584:	706f745f 	adr	xzr, df40f <__kernel_end_addr+0x46dc7>
 588:	67696400 	.inst	0x67696400 ; undefined
 58c:	00737469 	.inst	0x00737469 ; undefined
 590:	74735f5f 	.inst	0x74735f5f ; undefined
 594:	006b6361 	.inst	0x006b6361 ; undefined
 598:	69676964 	ldpsw	x4, x26, [x11, #-200]
 59c:	6d5f7374 	ldp	d20, d28, [x27, #496]
 5a0:	75007061 	.inst	0x75007061 ; undefined
 5a4:	69636564 	ldpsw	x4, x25, [x11, #-232]
 5a8:	5f6c616d 	.inst	0x5f6c616d ; undefined
 5ac:	735f6f74 	.inst	0x735f6f74 ; undefined
 5b0:	6e697274 	uabdl2	v20.4s, v19.8h, v9.8h
 5b4:	72610067 	.inst	0x72610067 ; undefined
 5b8:	64007367 	.inst	0x64007367 ; undefined
 5bc:	74696769 	.inst	0x74696769 ; undefined
 5c0:	75625f73 	.inst	0x75625f73 ; undefined
 5c4:	72656666 	.inst	0x72656666 ; undefined
 5c8:	66756200 	.inst	0x66756200 ; undefined
 5cc:	5f726566 	.inst	0x5f726566 ; undefined
 5d0:	657a6973 	fnmls	z19.h, p2/m, z11.h, z26.h
 5d4:	675f5f00 	.inst	0x675f5f00 ; undefined
 5d8:	5f63756e 	sqshl	d14, d11, #35
 5dc:	6c5f6176 	ldnp	d22, d24, [x11, #496]
 5e0:	00747369 	.inst	0x00747369 ; undefined
 5e4:	72765f5f 	.inst	0x72765f5f ; undefined
 5e8:	66666f5f 	.inst	0x66666f5f ; undefined
 5ec:	6f700073 	mla	v19.8h, v3.8h, v0.h[3]
 5f0:	69746973 	ldpsw	x19, x26, [x11, #-96]
 5f4:	74006e6f 	.inst	0x74006e6f ; undefined
 5f8:	5f706172 	.inst	0x5f706172 ; undefined
 5fc:	65726f63 	fnmls	z3.h, p3/m, z27.h, z18.h
 600:	745f335f 	.inst	0x745f335f ; undefined
 604:	6c655f6f 	ldnp	d15, d23, [x27, #-432]
 608:	6e690031 	uaddl2	v17.4s, v1.8h, v9.8h
 60c:	72726574 	.inst	0x72726574 ; undefined
 610:	5f747075 	sqdmlsl	s21, h3, v4.h[3]
 614:	74696e69 	.inst	0x74696e69 ; undefined
 618:	616e6500 	.inst	0x616e6500 ; undefined
 61c:	5f656c62 	.inst	0x5f656c62 ; undefined
 620:	00717269 	.inst	0x00717269 ; undefined
 624:	7570635f 	.inst	0x7570635f ; undefined
 628:	726f635f 	.inst	0x726f635f ; undefined
 62c:	5f315f65 	.inst	0x5f315f65 ; undefined
 630:	6c69616d 	ldnp	d13, d24, [x11, #-368]
 634:	5f786f62 	.inst	0x5f786f62 ; undefined
 638:	6c6c6f70 	ldnp	d16, d27, [x27, #-320]
 63c:	6464615f 	.inst	0x6464615f ; undefined
 640:	616d0072 	.inst	0x616d0072 ; undefined
 644:	63006e69 	.inst	0x63006e69 ; undefined
 648:	5f65726f 	sqdmlsl	s15, h19, v5.h[2]
 64c:	6e756f63 	umin	v3.8h, v27.8h, v21.8h
 650:	635f0074 	.inst	0x635f0074 ; undefined
 654:	635f7570 	.inst	0x635f7570 ; undefined
 658:	5f65726f 	sqdmlsl	s15, h19, v5.h[2]
 65c:	616d5f32 	.inst	0x616d5f32 ; undefined
 660:	6f626c69 	.inst	0x6f626c69 ; undefined
 664:	6f705f78 	.inst	0x6f705f78 ; undefined
 668:	615f6c6c 	.inst	0x615f6c6c ; undefined
 66c:	00726464 	.inst	0x00726464 ; undefined
 670:	69766564 	ldpsw	x4, x25, [x11, #-80]
 674:	5f736563 	.inst	0x5f736563 ; undefined
 678:	74696e69 	.inst	0x74696e69 ; undefined
 67c:	61727400 	.inst	0x61727400 ; undefined
 680:	6f635f70 	.inst	0x6f635f70 ; undefined
 684:	325f6572 	.inst	0x325f6572 ; undefined
 688:	5f6f745f 	sqshl	d31, d2, #47
 68c:	00316c65 	.inst	0x00316c65 ; NYI
 690:	7570635f 	.inst	0x7570635f ; undefined
 694:	726f635f 	.inst	0x726f635f ; undefined
 698:	5f335f65 	.inst	0x5f335f65 ; undefined
 69c:	6c69616d 	ldnp	d13, d24, [x11, #-368]
 6a0:	5f786f62 	.inst	0x5f786f62 ; undefined
 6a4:	6c6c6f70 	ldnp	d16, d27, [x27, #-320]
 6a8:	6464615f 	.inst	0x6464615f ; undefined
 6ac:	72740072 	.inst	0x72740072 ; undefined
 6b0:	635f7061 	.inst	0x635f7061 ; undefined
 6b4:	5f65726f 	sqdmlsl	s15, h19, v5.h[2]
 6b8:	6f745f31 	.inst	0x6f745f31 ; undefined
 6bc:	316c655f 	cmn	w10, #0xb19, lsl #12
 6c0:	6d756a00 	ldp	d0, d26, [x16, #-176]
 6c4:	6f745f70 	.inst	0x6f745f70 ; undefined
 6c8:	316c655f 	cmn	w10, #0xb19, lsl #12
 6cc:	726f635f 	.inst	0x726f635f ; undefined
 6d0:	6e6f5f65 	uqrshl	v5.8h, v27.8h, v15.8h
 6d4:	6f630065 	mla	v5.8h, v3.8h, v3.h[2]
 6d8:	685f6572 	.inst	0x685f6572 ; undefined
 6dc:	5f706165 	.inst	0x5f706165 ; undefined
 6e0:	6f666e69 	.inst	0x6f666e69 ; undefined
 6e4:	67657300 	.inst	0x67657300 ; undefined
 6e8:	646e655f 	.inst	0x646e655f ; undefined
 6ec:	6464615f 	.inst	0x6464615f ; undefined
 6f0:	61705f72 	.inst	0x61705f72 ; undefined
 6f4:	72656b00 	.inst	0x72656b00 ; undefined
 6f8:	5f6c656e 	.inst	0x5f6c656e ; undefined
 6fc:	72617473 	.inst	0x72617473 ; undefined
 700:	65680074 	fmla	z20.h, p0/m, z3.h, z8.h
 704:	735f7061 	.inst	0x735f7061 ; undefined
 708:	74726174 	.inst	0x74726174 ; undefined
 70c:	726f4300 	.inst	0x726f4300 ; undefined
 710:	6d654d65 	ldp	d5, d19, [x11, #-432]
 714:	49676553 	.inst	0x49676553 ; undefined
 718:	006f666e 	.inst	0x006f666e ; undefined
 71c:	5f746573 	.inst	0x5f746573 ; undefined
 720:	625f7075 	.inst	0x625f7075 ; undefined
 724:	5f746f6f 	.inst	0x5f746f6f ; undefined
 728:	61727473 	.inst	0x61727473 ; undefined
 72c:	61705f70 	.inst	0x61705f70 ; undefined
 730:	745f6567 	.inst	0x745f6567 ; undefined
 734:	656c6261 	fnmls	z1.h, p0/m, z19.h, z12.h
 738:	726f6300 	.inst	0x726f6300 ; undefined
 73c:	65735f65 	fnmla	z5.h, p7/m, z27.h, z19.h
 740:	6e656d67 	umin	v7.8h, v11.8h, v5.8h
 744:	6e695f74 	uqrshl	v20.8h, v27.8h, v9.8h
 748:	6d006f66 	stp	d6, d27, [x27]
 74c:	6e695f6d 	uqrshl	v13.8h, v27.8h, v9.8h
 750:	76007469 	.inst	0x76007469 ; undefined
 754:	75747269 	.inst	0x75747269 ; undefined
 758:	735f6c61 	.inst	0x735f6c61 ; undefined
 75c:	656d6765 	fnmls	z5.h, p1/m, z27.h, z13.h
 760:	695f746e 	ldpsw	x14, x29, [x3, #248]
 764:	0074696e 	.inst	0x0074696e ; undefined
 768:	5f676573 	.inst	0x5f676573 ; undefined
 76c:	5f646e65 	.inst	0x5f646e65 ; undefined
 770:	72646461 	.inst	0x72646461 ; undefined
 774:	0061765f 	.inst	0x0061765f ; undefined
 778:	70616568 	adr	x8, c3427 <__kernel_end_addr+0x2addf>
 77c:	6174735f 	.inst	0x6174735f ; undefined
 780:	705f7472 	adr	x18, bf60f <__kernel_end_addr+0x26fc7>
 784:	615f7968 	.inst	0x615f7968 ; undefined
 788:	00726464 	.inst	0x00726464 ; undefined
 78c:	6572666b 	fnmls	z11.h, p1/m, z19.h, z18.h
 790:	654d0065 	fadd	z5.h, z3.h, z13.h
 794:	79726f6d 	ldrh	w13, [x27, #6454]
 798:	6174654d 	.inst	0x6174654d ; undefined
 79c:	61746144 	.inst	0x61746144 ; undefined
 7a0:	72656b00 	.inst	0x72656b00 ; undefined
 7a4:	5f6c656e 	.inst	0x5f6c656e ; undefined
 7a8:	00646e65 	.inst	0x00646e65 ; undefined
 7ac:	6c616d6b 	ldnp	d11, d27, [x11, #-496]
 7b0:	00636f6c 	.inst	0x00636f6c ; undefined
 7b4:	4d737953 	.inst	0x4d737953 ; undefined
 7b8:	726f6d65 	.inst	0x726f6d65 ; undefined
 7bc:	666e4979 	.inst	0x666e4979 ; undefined
 7c0:	6573006f 	fmla	z15.h, p0/m, z3.h, z19.h
 7c4:	74735f67 	.inst	0x74735f67 ; undefined
 7c8:	5f747261 	sqdmlsl	s1, h19, v4.h[3]
 7cc:	72646461 	.inst	0x72646461 ; undefined
 7d0:	0061705f 	.inst	0x0061705f ; undefined
 7d4:	70616548 	adr	x8, c347f <__kernel_end_addr+0x2ae37>
 7d8:	6d676553 	ldp	d19, d25, [x10, #-400]
 7dc:	5f746e65 	.inst	0x5f746e65 ; undefined
 7e0:	49700074 	.inst	0x49700074 ; undefined
 7e4:	006f666e 	.inst	0x006f666e ; undefined
 7e8:	6f6d654d 	sqshlu	v13.2d, v10.2d, #45
 7ec:	654d7972 	fcmne	p2.h, p6/z, z11.h, z13.h
 7f0:	61446174 	.inst	0x61446174 ; undefined
 7f4:	745f6174 	.inst	0x745f6174 ; undefined
 7f8:	61656800 	.inst	0x61656800 ; undefined
 7fc:	69735f70 	ldpsw	x16, x23, [x27, #-104]
 800:	695f657a 	ldpsw	x26, x25, [x11, #248]
 804:	79625f6e 	ldrh	w14, [x27, #4398]
 808:	00736574 	.inst	0x00736574 ; undefined
 80c:	656b5f5f 	fnmla	z31.h, p7/m, z26.h, z11.h
 810:	6c656e72 	ldnp	d18, d27, [x19, #-432]
 814:	6174735f 	.inst	0x6174735f ; undefined
 818:	615f7472 	.inst	0x615f7472 ; undefined
 81c:	00726464 	.inst	0x00726464 ; undefined
 820:	73796870 	.inst	0x73796870 ; undefined
 824:	6c616369 	ldnp	d9, d24, [x27, #-496]
 828:	6765735f 	.inst	0x6765735f ; undefined
 82c:	746e656d 	.inst	0x746e656d ; undefined
 830:	696e695f 	ldpsw	xzr, x26, [x10, #-144]
 834:	5f5f0074 	.inst	0x5f5f0074 ; undefined
 838:	6e72656b 	umax	v11.8h, v11.8h, v18.8h
 83c:	655f6c65 	fcmeq	p5.h, p3/z, z3.h, z31.h
 840:	615f646e 	.inst	0x615f646e ; undefined
 844:	00726464 	.inst	0x00726464 ; undefined
 848:	5f676573 	.inst	0x5f676573 ; undefined
 84c:	72617473 	.inst	0x72617473 ; undefined
 850:	64615f74 	.inst	0x64615f74 ; undefined
 854:	765f7264 	.inst	0x765f7264 ; undefined
 858:	65680061 	fmla	z1.h, p0/m, z3.h, z8.h
 85c:	735f7061 	.inst	0x735f7061 ; undefined
 860:	00657a69 	.inst	0x00657a69 ; undefined
 864:	70616568 	adr	x8, c3513 <__kernel_end_addr+0x2aecb>
 868:	6c6c615f 	ldnp	d31, d24, [x10, #-320]
 86c:	635f636f 	.inst	0x635f636f ; undefined
 870:	746e756f 	.inst	0x746e756f ; undefined
 874:	61656800 	.inst	0x61656800 ; undefined
 878:	74735f70 	.inst	0x74735f70 ; undefined
 87c:	5f747261 	sqdmlsl	s1, h19, v4.h[3]
 880:	615f6176 	.inst	0x615f6176 ; undefined
 884:	00726464 	.inst	0x00726464 ; undefined
 888:	6e72656b 	umax	v11.8h, v11.8h, v18.8h
 88c:	735f6c65 	.inst	0x735f6c65 ; undefined
 890:	00657a69 	.inst	0x00657a69 ; undefined
 894:	5f6d656d 	.inst	0x5f6d656d ; undefined
 898:	6c6c616d 	ldnp	d13, d24, [x11, #-320]
 89c:	745f636f 	.inst	0x745f636f ; undefined
 8a0:	00747365 	.inst	0x00747365 ; undefined
 8a4:	65726f43 	fnmls	z3.h, p3/m, z26.h, z18.h
 8a8:	536d654d 	.inst	0x536d654d ; undefined
 8ac:	6e496765 	.inst	0x6e496765 ; undefined
 8b0:	745f6f66 	.inst	0x745f6f66 ; undefined
 8b4:	61654800 	.inst	0x61654800 ; undefined
 8b8:	67655370 	.inst	0x67655370 ; undefined
 8bc:	746e656d 	.inst	0x746e656d ; undefined
 8c0:	72656b00 	.inst	0x72656b00 ; undefined
 8c4:	735f656e 	.inst	0x735f656e ; undefined
 8c8:	00657a69 	.inst	0x00657a69 ; undefined
 8cc:	646e6966 	.inst	0x646e6966 ; undefined
 8d0:	78656e5f 	.inst	0x78656e5f ; undefined
 8d4:	72665f74 	.inst	0x72665f74 ; undefined
 8d8:	705f6565 	adr	x5, bf587 <__kernel_end_addr+0x26f3f>
 8dc:	00656761 	.inst	0x00656761 ; undefined
 8e0:	5f6d656d 	.inst	0x5f6d656d ; undefined
 8e4:	6f697270 	fcmla	v16.8h, v19.8h, v9.h[1], #270
 8e8:	79746972 	ldrh	w18, [x11, #6708]
 8ec:	6575715f 	fnmls	z31.h, p4/m, z10.h, z21.h
 8f0:	61006575 	.inst	0x61006575 ; undefined
 8f4:	636f6c6c 	.inst	0x636f6c6c ; undefined
 8f8:	726f7461 	.inst	0x726f7461 ; undefined
 8fc:	696e695f 	ldpsw	xzr, x26, [x10, #-144]
 900:	69660074 	ldpsw	x20, x0, [x3, #-208]
 904:	6e5f646e 	.inst	0x6e5f646e ; undefined
 908:	5f747865 	sqdmlsl	s5, h3, v4.h[7]
 90c:	65657266 	fnmls	z6.h, p4/m, z19.h, z5.h
 910:	6761705f 	.inst	0x6761705f ; undefined
 914:	66625f65 	.inst	0x66625f65 ; undefined
 918:	65670073 	fmla	z19.h, p0/m, z3.h, z7.h
 91c:	79735f74 	ldrh	w20, [x27, #6574]
 920:	6d657473 	ldp	d19, d29, [x3, #-432]
 924:	6b6c635f 	.inst	0x6b6c635f ; undefined
 928:	6d697400 	ldp	d0, d29, [x0, #-368]
 92c:	705f7265 	adr	x5, bf77b <__kernel_end_addr+0x27133>
 930:	69646572 	ldpsw	x18, x25, [x11, #-224]
 934:	69540076 	ldpsw	x22, x0, [x3, #160]
 938:	0072656d 	.inst	0x0072656d ; undefined
 93c:	656d6974 	fnmls	z20.h, p2/m, z11.h, z13.h
 940:	6f6c5f72 	.inst	0x6f6c5f72 ; undefined
 944:	74006461 	.inst	0x74006461 ; undefined
 948:	72656d69 	.inst	0x72656d69 ; undefined
 94c:	696e695f 	ldpsw	xzr, x26, [x10, #-144]
 950:	65730074 	fmla	z20.h, p0/m, z3.h, z19.h
 954:	69745f74 	ldpsw	x20, x23, [x27, #-96]
 958:	5f72656d 	.inst	0x5f72656d ; undefined
 95c:	65746e69 	fnmls	z9.h, p3/m, z19.h, z20.h
 960:	6c617672 	ldnp	d18, d29, [x19, #-496]
 964:	6d697400 	ldp	d0, d29, [x0, #-368]
 968:	635f7265 	.inst	0x635f7265 ; undefined
 96c:	74006c74 	.inst	0x74006c74 ; undefined
 970:	736b6369 	.inst	0x736b6369 ; undefined
 974:	73657200 	.inst	0x73657200 ; undefined
 978:	65767265 	fnmls	z5.h, p4/m, z19.h, z22.h
 97c:	74003264 	.inst	0x74003264 ; undefined
 980:	72656d69 	.inst	0x72656d69 ; undefined
 984:	6b63615f 	.inst	0x6b63615f ; undefined
 988:	6d697400 	ldp	d0, d29, [x0, #-368]
 98c:	6d5f7265 	ldp	d5, d28, [x19, #496]
 990:	72696b73 	.inst	0x72696b73 ; undefined
 994:	65720071 	fmla	z17.h, p0/m, z3.h, z18.h
 998:	76726573 	.inst	0x76726573 ; undefined
 99c:	00316465 	.inst	0x00316465 ; NYI
 9a0:	5f697073 	sqdmlsl	s19, h3, v9.h[2]
 9a4:	74696e69 	.inst	0x74696e69 ; undefined
 9a8:	63326900 	.inst	0x63326900 ; undefined
 9ac:	696e695f 	ldpsw	xzr, x26, [x10, #-144]
 9b0:	32490074 	.inst	0x32490074 ; undefined
 9b4:	55535f43 	.inst	0x55535f43 ; undefined
 9b8:	53454343 	.inst	0x53454343 ; undefined
 9bc:	32490053 	.inst	0x32490053 ; undefined
 9c0:	4c435f43 	.inst	0x4c435f43 ; undefined
 9c4:	5f4b434f 	.inst	0x5f4b434f ; undefined
 9c8:	454d4954 	uaddwb	z20.h, z10.h, z13.b
 9cc:	0054554f 	.inst	0x0054554f ; undefined
 9d0:	5f6b6c63 	.inst	0x5f6b6c63 ; undefined
 9d4:	00766964 	.inst	0x00766964 ; undefined
 9d8:	61746164 	.inst	0x61746164 ; undefined
 9dc:	6669665f 	.inst	0x6669665f ; undefined
 9e0:	6c63006f 	ldnp	d15, d0, [x3, #-464]
 9e4:	74735f6b 	.inst	0x74735f6b ; undefined
 9e8:	63746572 	.inst	0x63746572 ; undefined
 9ec:	69745f68 	ldpsw	x8, x23, [x27, #-96]
 9f0:	756f656d 	.inst	0x756f656d ; undefined
 9f4:	32490074 	.inst	0x32490074 ; undefined
 9f8:	43415f43 	.inst	0x43415f43 ; undefined
 9fc:	52455f4b 	.inst	0x52455f4b ; undefined
 a00:	00524f52 	.inst	0x00524f52 ; undefined
 a04:	61746164 	.inst	0x61746164 ; undefined
 a08:	6c65645f 	ldnp	d31, d25, [x2, #-432]
 a0c:	73007961 	.inst	0x73007961 ; undefined
 a10:	5f657a69 	sqdmlsl	s9, h19, v5.h[6]
 a14:	65747962 	fnmls	z2.h, p6/m, z11.h, z20.h
 a18:	6365725f 	.inst	0x6365725f ; undefined
 a1c:	6f630076 	mla	v22.8h, v3.8h, v3.h[2]
 a20:	6f72746e 	uqshl	v14.2d, v3.2d, #50
 a24:	6c73006c 	ldnp	d12, d0, [x3, #-208]
 a28:	5f657661 	sqshl	d1, d19, #37
 a2c:	72646461 	.inst	0x72646461 ; undefined
 a30:	43324900 	.inst	0x43324900 ; undefined
 a34:	5441445f 	bc.nv	832bc <program_gic+0xc>
 a38:	4f4c5f41 	.inst	0x4f4c5f41 ; undefined
 a3c:	72005353 	ands	w19, w26, #0x1fffff
 a40:	32336765 	orr	w5, w27, #0xffffe07f
 a44:	75427000 	.inst	0x75427000 ; undefined
 a48:	32690066 	.inst	0x32690066 ; undefined
 a4c:	65725f63 	fnmla	z3.h, p7/m, z27.h, z18.h
 a50:	64007663 	.inst	0x64007663 ; undefined
 a54:	5f617461 	sqshl	d1, d3, #33
 a58:	676e656c 	.inst	0x676e656c ; undefined
 a5c:	5f006874 	.inst	0x5f006874 ; undefined
 a60:	5f633269 	sqdmlal	s9, h19, v3.h[2]
 a64:	74617473 	.inst	0x74617473 ; undefined
 a68:	69007375 	stgp	x21, x28, [x27]
 a6c:	735f6332 	.inst	0x735f6332 ; undefined
 a70:	00646e65 	.inst	0x00646e65 ; undefined
 a74:	74726175 	.inst	0x74726175 ; undefined
 a78:	696e695f 	ldpsw	xzr, x26, [x10, #-144]
 a7c:	41550074 	.inst	0x41550074 ; undefined
 a80:	495f5452 	.inst	0x495f5452 ; undefined
 a84:	4c41564e 	.inst	0x4c41564e ; undefined
 a88:	55004449 	.inst	0x55004449 ; undefined
 a8c:	4d747261 	.inst	0x4d747261 ; undefined
 a90:	0065646f 	.inst	0x0065646f ; undefined
 a94:	74726175 	.inst	0x74726175 ; undefined
 a98:	65646f4d 	fnmls	z13.h, p3/m, z26.h, z4.h
 a9c:	72617500 	.inst	0x72617500 ; undefined
 aa0:	72433074 	.inst	0x72433074 ; undefined
 aa4:	5f307500 	sqshl	s0, s8, #16
 aa8:	63736d69 	.inst	0x63736d69 ; undefined
 aac:	5f307500 	sqshl	s0, s8, #16
 ab0:	64726269 	.inst	0x64726269 ; undefined
 ab4:	5f307500 	sqshl	s0, s8, #16
 ab8:	55007264 	.inst	0x55007264 ; undefined
 abc:	00747261 	.inst	0x00747261 ; undefined
 ac0:	65736572 	fnmls	z18.h, p1/m, z11.h, z19.h
 ac4:	64657672 	.inst	0x64657672 ; undefined
 ac8:	30750033 	adr	x19, eaacd <__kernel_end_addr+0x52485>
 acc:	7262665f 	.inst	0x7262665f ; undefined
 ad0:	41550064 	.inst	0x41550064 ; undefined
 ad4:	465f5452 	.inst	0x465f5452 ; undefined
 ad8:	004f4649 	.inst	0x004f4649 ; undefined
 adc:	74726175 	.inst	0x74726175 ; undefined
 ae0:	736d4930 	.inst	0x736d4930 ; undefined
 ae4:	61750063 	.inst	0x61750063 ; undefined
 ae8:	725f7472 	.inst	0x725f7472 ; undefined
 aec:	73696765 	.inst	0x73696765 ; undefined
 af0:	5f726574 	.inst	0x5f726574 ; undefined
 af4:	5f70616d 	.inst	0x5f70616d ; undefined
 af8:	706d7564 	adr	x4, db9a7 <__kernel_end_addr+0x4335f>
 afc:	5f307500 	sqshl	s0, s8, #16
 b00:	00726369 	.inst	0x00726369 ; undefined
 b04:	665f3075 	.inst	0x665f3075 ; undefined
 b08:	41550072 	.inst	0x41550072 ; undefined
 b0c:	495f5452 	.inst	0x495f5452 ; undefined
 b10:	5245544e 	.inst	0x5245544e ; undefined
 b14:	54505552 	bc.cs	a15bc <__kernel_end_addr+0x8f74>  // bc.hs, bc.nlast
 b18:	5f307500 	sqshl	s0, s8, #16
 b1c:	6872636c 	.inst	0x6872636c ; undefined
 b20:	72617500 	.inst	0x72617500 ; undefined
 b24:	65725f74 	fnmla	z20.h, p7/m, z27.h, z18.h
 b28:	645f6461 	fcmla	z1.h, p1/m, z3.h, z31.h, #270
 b2c:	00617461 	.inst	0x00617461 ; undefined
 b30:	635f3075 	.inst	0x635f3075 ; undefined
 b34:	61750072 	.inst	0x61750072 ; undefined
 b38:	4c307472 	.inst	0x4c307472 ; undefined
 b3c:	00687263 	.inst	0x00687263 ; undefined
 b40:	74726175 	.inst	0x74726175 ; undefined
 b44:	6e65735f 	uabdl2	v31.4s, v26.8h, v5.8h
 b48:	61645f64 	.inst	0x61645f64 ; undefined
 b4c:	75006174 	.inst	0x75006174 ; undefined
 b50:	5f747261 	sqdmlsl	s1, h19, v4.h[3]
 b54:	5f717269 	sqdmlsl	s9, h19, v1.h[3]
 b58:	646e6168 	.inst	0x646e6168 ; undefined
 b5c:	0072656c 	.inst	0x0072656c ; undefined
 b60:	5f564544 	.inst	0x5f564544 ; undefined
 b64:	41564e49 	.inst	0x41564e49 ; undefined
 b68:	0044494c 	.inst	0x0044494c ; undefined
 b6c:	5f564544 	.inst	0x5f564544 ; undefined
 b70:	52544e49 	.inst	0x52544e49 ; undefined
 b74:	6d756400 	ldp	d0, d25, [x0, #-176]
 b78:	69745f70 	ldpsw	x16, x23, [x27, #-96]
 b7c:	0072656d 	.inst	0x0072656d ; undefined
 b80:	5f564544 	.inst	0x5f564544 ; undefined
 b84:	54524155 	bc.pl	a53ac <__kernel_end_addr+0xcd64>  // bc.nfrst
 b88:	76654400 	.inst	0x76654400 ; undefined
 b8c:	54656369 	b.ls	cb7f8 <__kernel_end_addr+0x331b0>  // b.plast
 b90:	00657079 	.inst	0x00657079 ; undefined
 b94:	65707974 	fnmls	z20.h, p6/m, z11.h, z16.h
 b98:	67657200 	.inst	0x67657200 ; undefined
 b9c:	65747369 	fnmls	z9.h, p4/m, z27.h, z20.h
 ba0:	75645f72 	.inst	0x75645f72 ; undefined
 ba4:	6400706d 	.inst	0x6400706d ; undefined
 ba8:	5f706d75 	.inst	0x5f706d75 ; undefined
 bac:	74726175 	.inst	0x74726175 ; undefined
 bb0:	56454400 	.inst	0x56454400 ; undefined
 bb4:	4950475f 	.inst	0x4950475f ; undefined
 bb8:	4544004f 	saddlb	z15.h, z2.b, z4.b
 bbc:	50535f56 	adr	x22, a77a6 <__kernel_end_addr+0xf15e>
 bc0:	45440049 	saddlb	z9.h, z2.b, z4.b
 bc4:	49545f56 	.inst	0x49545f56 ; undefined
 bc8:	0052454d 	.inst	0x0052454d ; undefined
 bcc:	6c5f7067 	ldnp	d7, d28, [x3, #496]
 bd0:	645f776f 	fcmla	z15.h, p5/m, z27.h, z31.h, #270
 bd4:	63657465 	.inst	0x63657465 ; undefined
 bd8:	70670074 	adr	x20, cebe7 <__kernel_end_addr+0x3659f>
 bdc:	7973615f 	ldrh	wzr, [x10, #6576]
 be0:	725f636e 	.inst	0x725f636e ; undefined
 be4:	65676465 	fnmls	z5.h, p1/m, z3.h, z7.h
 be8:	7465645f 	.inst	0x7465645f ; undefined
 bec:	00746365 	.inst	0x00746365 ; undefined
 bf0:	615f7067 	.inst	0x615f7067 ; undefined
 bf4:	636e7973 	.inst	0x636e7973 ; undefined
 bf8:	6465665f 	.inst	0x6465665f ; undefined
 bfc:	645f6567 	fcmla	z7.h, p1/m, z11.h, z31.h, #270
 c00:	63657465 	.inst	0x63657465 ; undefined
 c04:	69620074 	ldpsw	x20, x0, [x3, #-240]
 c08:	735f7374 	.inst	0x735f7374 ; undefined
 c0c:	74666968 	.inst	0x74666968 ; undefined
 c10:	5f706700 	.inst	0x5f706700 ; undefined
 c14:	67646572 	.inst	0x67646572 ; undefined
 c18:	65645f65 	fnmla	z5.h, p7/m, z27.h, z4.h
 c1c:	74636574 	.inst	0x74636574 ; undefined
 c20:	67657200 	.inst	0x67657200 ; undefined
 c24:	646e695f 	.inst	0x646e695f ; undefined
 c28:	70007865 	adr	x5, 1b37 <THREAD_HW_CONTEXT_SIZE+0x1a17>
 c2c:	5f647075 	sqdmlsl	s21, h3, v4.h[2]
 c30:	62616e65 	.inst	0x62616e65 ; undefined
 c34:	635f656c 	.inst	0x635f656c ; undefined
 c38:	6b636f6c 	.inst	0x6b636f6c ; undefined
 c3c:	65730073 	fmla	z19.h, p0/m, z3.h, z19.h
 c40:	7463656c 	.inst	0x7463656c ; undefined
 c44:	7000726f 	adr	x15, 1a93 <THREAD_HW_CONTEXT_SIZE+0x1973>
 c48:	75466e69 	.inst	0x75466e69 ; undefined
 c4c:	7000636e 	adr	x14, 18bb <THREAD_HW_CONTEXT_SIZE+0x179b>
 c50:	754e6e69 	.inst	0x754e6e69 ; undefined
 c54:	7067006d 	adr	x13, cec63 <__kernel_end_addr+0x3661b>
 c58:	74756f5f 	.inst	0x74756f5f ; undefined
 c5c:	5f747570 	sqshl	d16, d11, #52
 c60:	61656c63 	.inst	0x61656c63 ; undefined
 c64:	70670072 	adr	x18, cec73 <__kernel_end_addr+0x3662b>
 c68:	6576655f 	fnmls	z31.h, p1/m, z10.h, z22.h
 c6c:	645f746e 	fcmla	z14.h, p5/m, z3.h, z31.h, #270
 c70:	63657465 	.inst	0x63657465 ; undefined
 c74:	70670074 	adr	x20, cec83 <__kernel_end_addr+0x3663b>
 c78:	6e69705f 	uabdl2	v31.4s, v2.8h, v9.8h
 c7c:	76656c5f 	.inst	0x76656c5f ; undefined
 c80:	47006c65 	.inst	0x47006c65 ; undefined
 c84:	006f6970 	.inst	0x006f6970 ; undefined
 c88:	64707570 	.inst	0x64707570 ; undefined
 c8c:	616e655f 	.inst	0x616e655f ; undefined
 c90:	00656c62 	.inst	0x00656c62 ; undefined
 c94:	6f697047 	fcmla	v7.8h, v2.8h, v9.h[1], #270
 c98:	446e6950 	.inst	0x446e6950 ; undefined
 c9c:	00617461 	.inst	0x00617461 ; undefined
 ca0:	6f5f7067 	fcmla	v7.8h, v3.8h, v31.h[0], #270
 ca4:	75707475 	.inst	0x75707475 ; undefined
 ca8:	65735f74 	fnmla	z20.h, p7/m, z27.h, z19.h
 cac:	70670074 	adr	x20, cecbb <__kernel_end_addr+0x36673>
 cb0:	6769685f 	.inst	0x6769685f ; undefined
 cb4:	65645f68 	fnmla	z8.h, p7/m, z27.h, z4.h
 cb8:	74636574 	.inst	0x74636574 ; undefined
 cbc:	5f706700 	.inst	0x5f706700 ; undefined
 cc0:	67646566 	.inst	0x67646566 ; undefined
 cc4:	65645f65 	fnmla	z5.h, p7/m, z27.h, z4.h
 cc8:	74636574 	.inst	0x74636574 ; undefined
 ccc:	5f706700 	.inst	0x5f706700 ; undefined
 cd0:	6c657366 	ldnp	d6, d28, [x27, #-432]
 cd4:	00746365 	.inst	0x00746365 ; undefined
 cd8:	756c6176 	.inst	0x756c6176 ; undefined
 cdc:	74730065 	.inst	0x74730065 ; undefined
 ce0:	5f6b6361 	.inst	0x5f6b6361 ; undefined
 ce4:	6f666e69 	.inst	0x6f666e69 ; undefined
 ce8:	67726100 	.inst	0x67726100 ; undefined
 cec:	6e490063 	.inst	0x6e490063 ; undefined
 cf0:	43747570 	.inst	0x43747570 ; undefined
 cf4:	72746e6f 	.inst	0x72746e6f ; undefined
 cf8:	6e496c6f 	.inst	0x6e496c6f ; undefined
 cfc:	745f6f66 	.inst	0x745f6f66 ; undefined
 d00:	5f6d7600 	sqshl	d0, d16, #45
 d04:	62616e65 	.inst	0x62616e65 ; undefined
 d08:	0064656c 	.inst	0x0064656c ; undefined
 d0c:	75706e49 	.inst	0x75706e49 ; undefined
 d10:	6e6f4374 	raddhn2	v20.8h, v27.4s, v15.4s
 d14:	6c6f7274 	ldnp	d20, d28, [x19, #-272]
 d18:	6f666e49 	.inst	0x6f666e49 ; undefined
	...

Disassembly of section .debug_rnglists:

0000000000000000 <.debug_rnglists>:
   0:	0000001f 	udf	#31
   4:	00080005 	.inst	0x00080005 ; undefined
   8:	00000000 	udf	#0
   c:	08000007 	stxrb	w0, w7, [x0]
  10:	00000000 	udf	#0
  14:	0701c800 	.inst	0x0701c800 ; undefined
  18:	00081a38 	.inst	0x00081a38 ; undefined
  1c:	00000000 	udf	#0
  20:	Address 0x0000000000000020 is out of bounds.


Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	3a434347 	ccmn	w26, w3, #0x7, mi  // mi = first
   4:	62552820 	.inst	0x62552820 ; undefined
   8:	75746e75 	.inst	0x75746e75 ; undefined
   c:	2e313120 	usubw	v0.8h, v9.8h, v17.8b
  10:	2d302e33 	stp	s19, s11, [x17, #-128]
  14:	75627531 	.inst	0x75627531 ; undefined
  18:	3175746e 	adds	w14, w3, #0xd5d, lsl #12
  1c:	2e32327e 	usubw	v30.8h, v19.8h, v18.8b
  20:	20293430 	.inst	0x20293430 ; undefined
  24:	332e3131 	.inst	0x332e3131 ; undefined
  28:	Address 0x0000000000000028 is out of bounds.

