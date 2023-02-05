.section .text
.global jump_to_el1_core_one
jump_to_el1_core_one:
    mrs x0, CurrentEL
    and x0, x0, #0b1100
    cmp x0, #0b1000

    beq trap_core_1_to_el1_from_el2
    
    //Trap from el3 to el2
    mov x0, xzr //Clear x0
    mov x0, #0b1100
    mov x1, #0b1111000000
    orr x0, x0, x1 //Maskout all interrupts

    msr SPSR_EL3, x0
    
    mov x0, xzr
    adr x0, trap_core_1_to_el1_from_el2
    msr ELR_EL3, x0
    
    mov x0, xzr
    ldr x0, =core_1_kernel_stack
    msr SP_EL2, x0

    eret
    //Trap from el2 to el1
trap_core_1_to_el1_from_el2:
    mov x0, xzr
   // ldr x0, =Test
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
    adr x0, core_indirect
    msr ELR_EL2, x0
   
    mov x0, xzr    
    ldr x0, =core_1_kernel_stack
    msr SP_EL1, x0

    eret

core_indirect:
#ifdef PAGING
    bl set_up_mmu
#endif
    ldr x0, =comm_core_entry
    br x0

.macro aux_core_trap_to_el1 core_id,call_stack_id,indirect_entry_id, entry_id 
    mrs x0, CurrentEL
    and x0, x0, #0b1100
    cmp x0, #0b1000

    beq \core_id
    
    //Trap from el3 to el2
    mov x0, xzr //Clear x0
    mov x0, #0b1100
    mov x1, #0b1111000000
    orr x0, x0, x1 //Maskout all interrupts

    msr SPSR_EL3, x0
    
    mov x0, xzr
    adr x0, \core_id
    msr ELR_EL3, x0
    
    mov x0, xzr
    ldr x0, =\call_stack_id
    msr SP_EL2, x0
    
    eret
    //Trap from el2 to el1
\core_id :
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
    adr x0, \indirect_entry_id
    msr ELR_EL2, x0

    mov x0, xzr    
    ldr x0, =\call_stack_id
    msr SP_EL1, x0

    eret

\indirect_entry_id:    
#ifdef PAGING
    bl set_up_mmu
#endif

    ldr x0, =\entry_id
    br x0

.endm 

.section .text
.global trap_core_1_to_el1
trap_core_1_to_el1:
    aux_core_trap_to_el1 aux_core_1,core_1_kernel_stack, indirect_core_1, comm_core_entry

.section .text
.global trap_core_2_to_el1
trap_core_2_to_el1:
    aux_core_trap_to_el1 aux_core_2,core_2_kernel_stack, indirect_core_2, comm_core_entry

.section .text
.global trap_core_3_to_el1
trap_core_3_to_el1:
    aux_core_trap_to_el1 aux_core_3,core_3_kernel_stack, indirect_core_3, comm_core_entry

#ifdef PAGING
.equ CNTL_EL0_CORE_0, 0xffff000040000040
.equ IRQ_SOURCE_EL0_CORE_0, 0xffff000040000060
#else
.equ CNTL_EL0_CORE_0, 0x000040000040
.equ IRQ_SOURCE_EL0_CORE_0, 0x000040000060
#endif
.global enable_core0_timer
enable_core0_timer:
    //0x4000_0040 = Core 0 Timers Interrupt control
    //movz x0, #0x40000040
    ldr x0, =CNTL_EL0_CORE_0
    mov x1, #(1<<1)
    str x1, [x0] 
    ret

.global read_core0_irq_status
read_core0_irq_status:
    ldr x1, =IRQ_SOURCE_EL0_CORE_0    
    ldr x0, [x1]    

    ret
 
.global read_core0_timer_status
read_core0_timer_status:
    mrs x0, CNTP_CTL_EL0
    ret


.global enable_core1_irq_status
enable_core1_irq_status:

    ret

.global enable_core2_timer
enable_core2_timer:

    ret

.global enable_core3_timer
enable_core3_timer:

    ret

.balign 256
.section .data
.global core_info
core_info:
    .space 8, 0
