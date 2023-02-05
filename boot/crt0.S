.section .text.init
.global _start
_start:
    //QEMU set privillege to ring 2
    //Real hardware set privillege to ring 3
    mrs x0, mpidr_el1
    and x0, x0, #0b11 

    cmp x0, #0
    bne halt_core

    mrs x0, CurrentEL
    and x0, x0, #0b1100
    cmp x0, #0b1000

    beq trap_to_el1_from_el2
    
    //Trap from el3 to el2
    mov x0, xzr //Clear x0
    mov x0, #0b1100
    mov x1, #0b1111000000
    orr x0, x0, x1 //Maskout all interrupts

    msr SPSR_EL3, x0
    
    mov x0, xzr
    adr x0, trap_to_el1_from_el2
    msr ELR_EL3, x0
    
    mov x0, xzr
    ldr x0, =core_0_kernel_stack
    msr SP_EL2, x0
    
    eret
    //Trap from el2 to el1
trap_to_el1_from_el2:
    mov x0, xzr
    msr	sctlr_el1, x0
    
    mov x0, xzr
    mov x0, #(1 << 31) //enable AARCH64 Excution at EL1
    msr hcr_el2, x0

    mov x0, xzr //Clear x0
    mov x0, #0b0101
    //orr x0, x0, #0b0101
    mov x1, #0b1111000000 //Maskout all interrupts
    orr x0, x0, x1
    msr SPSR_EL2, x0
    
    mov x0, xzr
    adr x0, indirect_start_call
    msr ELR_EL2, x0

    mov x0, xzr
    ldr x0, =core_0_kernel_stack
    msr SP_EL1, x0
    
    eret

indirect_start_call:
#ifdef PAGING
    bl set_up_bootstrap_page_table_el0
    bl set_up_bootstrap_page_table
    bl set_up_mmu
#endif

    ldr x0, =main
    br x0

// Move to EL0 by generating synchronous exception
move_to_el0:
    mov x0, #0b1111000000
    msr spsr_el1, x0 
    adr x0, main
    msr elr_el1, x0
    
    eret 

halt_core:
    wfe
    b halt_core

.section .text
.global core_one_start
core_one_start:
    wfe

    // ldr x0, =core_1_kernel_stack
    // add x0, x0, #(4096 * 2)
    // mov sp, x0

    // b comm_core_entry

.section .text
.global core_two_start
core_two_start:
    wfe
    
    ldr x0, =core_2_kernel_stack
    add x0, x0, #(4096 * 2)
    mov sp, x0

    mov x0, xzr
    msr	sctlr_el1, x0

    b func_core_entry

.section .text
.global core_three_start
core_three_start:
    wfe
    
    ldr x0, =core_3_kernel_stack
    add x0, x0, #(4096 * 2)
    mov sp, x0

    mov x0, xzr
    msr	sctlr_el1, x0

    b func_core_aux_entry

.global get_core_stack
get_core_stack:
    cmp x0, #1
    beq fetch_stack_1
    cmp x0, #2
    beq fetch_stack_2
    cmp x0, #3
    beq fetch_stack_3

    ldr x0, =core_0_kernel_stack
    ret

fetch_stack_1:
    ldr x0, =core_1_kernel_stack
    ret
fetch_stack_2:
    ldr x0, =core_2_kernel_stack
    ret
fetch_stack_3:
    ldr x0, =core_3_kernel_stack
    ret

.section .data
.balign 4096
core_0_kernel_stack:
    .space 4096 * 2, 0x0

.section .data
.balign 4096
.global core_1_kernel_stack
core_1_kernel_stack:
    .space 4096 * 2, 0x0

.section .data
.balign 4096
.global core_2_kernel_stack
core_2_kernel_stack:
    .space 4096 * 2, 0x0

.section .data
.balign 4096
.global core_3_kernel_stack
core_3_kernel_stack:
    .space 4096 * 2, 0x0
