.global memcpy
memcpy:
    // Context Save - Callee
    stp x3, x4, [sp, #-16]!
    stp x5, x6, [sp, #-16]!

    mov x3, x0  // dst addr
    mov x4, x1  // src addr
    mov x5, x2  // size

    cmp x5, xzr //check size
    beq 2f

1:
    ldrb w6, [x4]
    strb w6, [x3]
    sub x5, x5, 1
    cmp x5, xzr
    bgt 1b

2:
    // Context Restore
    ldp x5, x6, [sp], #16
    ldp x3, x4, [sp], #16
    ret

.global memclr
memclr:
    // Context Save - Callee
    stp x3, x4, [sp, #-16]!

    mov x3, x0  // dst addr
    mov x4, x1  // size

1:
    strb wzr, [x3]
    sub x4, x4, 1
    cmp x4, xzr
    bgt 1b

2:  
    // Context Restore
    ldp x3, x4, [sp], #16

    ret

.global memset
memset:
    // Context Save - Callee
    stp x3, x4, [sp, #-16]!
    stp x5, x6, [sp, #-16]!

    mov x3, x0  // dst addr
    mov x4, x2  // size
    mov x5, x1  // value

1:
    str w5, [x3], #4
    sub x4, x4, #4
    cmp x4, xzr
    bgt 1b

2:  
    // Context Restore
    ldp x5, x6, [sp], #16
    ldp x3, x4, [sp], #16

    ret


.global delay
.global out_word
.global in_word

delay:
    subs x0, x0, #1
    bne delay
    ret

out_word:
    str w1, [x0]
    ret

in_word:
    ldr w0, [x0] 
    ret

// Atomic memory operation is dependent on MMU enablement 
.global __lock_acq_mem
__lock_acq_mem:
	mov	w2, #1
	sevl
l1:	wfe
l2:	ldaxr	w1, [x0]
	cbnz	w1, l1
	stxr	w1, w2, [x0]
	mov     w3, #1
	stlr	w3, [x0]
	cbnz	w1, l2
	ret


.global __lock_rel_mem
__lock_rel_mem:
	stlr	wzr, [x0]
	ret


