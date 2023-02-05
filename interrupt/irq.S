.equ THREAD_HW_CONTEXT_SIZE, 288
.equ EL_MASK, 0xF 
.equ EL0    , 0x0
.equ SYSCALL_SYNC_EXCEPTION, 0x00
.equ IRQ_ASYNC_EXCEPTION, 0x01
.equ SW_SYNC_EXCEPTION, 0x10

.section .text
.global interrupt_init
interrupt_init:
    sub sp, sp, #8
    str x30, [sp, #0]     

    ldr x0, =ivt_table_start_addr
    msr vbar_el1, x0
    
   // bl program_gic 
    
    ldr x30, [sp, #0]
    add sp, sp, #8

    ret


.macro trap_enter handler_sp_swap_skip 
    sub sp, sp, #THREAD_HW_CONTEXT_SIZE
    stp x0, x1, [sp, #16 * 0]    
    stp x2, x3, [sp, #16 * 1]  
    stp x4, x5, [sp, #16 * 2] 
    stp x6, x7, [sp, #16 * 3] 
    stp x8, x1, [sp, #16 * 4] 
    stp x10, x11, [sp, #16 * 5] 
    stp x12, x13, [sp, #16 * 6] 
    stp x14, x15, [sp, #16 * 7] 
    stp x16, x17, [sp, #16 * 8]    
    stp x18, x19, [sp, #16 * 9] 
    stp x20, x21, [sp, #16 * 10]
    stp x22, x23, [sp, #16 * 11] 
    stp x24, x25, [sp, #16 * 12] 
    stp x26, x27, [sp, #16 * 13] 
    stp x28, x29, [sp, #16 * 14]
    
    // Hw stores status to registers
    // Hw is running at el1 and read el1 status to check
    // source el level
    mrs x0, spsr_el1 
    and x0, x0, #EL_MASK
    cmp x0, #EL0
    bne \handler_sp_swap_skip
    mrs x0, sp_el0
\handler_sp_swap_skip :
    stp x30, x0, [sp, #16 * 15] 
    
.endm

.macro handler_entry
    mrs x1, esr_el1 
    stp x0, x1, [sp, 16 * 16] //x0 holds exception type at this point
    
    mrs x0, elr_el1 
    mrs x1, spsr_el1
    stp x0, x1, [sp, 16 * 17]

    mov x0, sp //sp points to trap_frame start_addr  
.endm

.macro trap_exit handler_sp_swap_skip 
    
    ldp x30, x0, [sp, 16 * 15] //x0 holds stack pointer and x1 holds previous privillege level 
    and x1, x1, #EL_MASK
    cmp x1, #EL0
    bne \handler_sp_swap_skip
    msr sp_el0, x0             //restore user level stack pointer register and x0 holds garbage otherwise at this point
\handler_sp_swap_skip :
    ldp x30, x0, [sp, 16 * 14] 
    ldp x30, x0, [sp, 16 * 13] 
    ldp x30, x0, [sp, 16 * 12] 
    ldp x30, x0, [sp, 16 * 11] 
    ldp x30, x0, [sp, 16 * 10] 
    ldp x30, x0, [sp, 16 * 9] 
    ldp x30, x0, [sp, 16 * 8] 
    ldp x30, x0, [sp, 16 * 7] 
    ldp x30, x0, [sp, 16 * 6] 
    ldp x30, x0, [sp, 16 * 5] 
    ldp x30, x0, [sp, 16 * 4] 
    ldp x30, x0, [sp, 16 * 3] 
    ldp x30, x0, [sp, 16 * 2] 
    ldp x30, x0, [sp, 16 * 1]     
    ldp x30, x0, [sp, 16 * 0]

    add sp, sp, #THREAD_HW_CONTEXT_SIZE     

    eret
.endm

.macro handler_exit
    ldp x0, x1, [sp, 16 * 17]
    msr elr_el1, x0
    msr spsr_el1, x1
.endm

   
//jump table or interrupt vector table (ivt)
.balign 0x800 //2k aligned
.section .text
.global ivt_table_start_addr
ivt_table_start_addr:
current_el_sp0_sync: //system exception
    b generic_handler

.balign 0x80
curret_el_sp0_irq:
    b generic_handler

.balign 0x80
current_el_sp0_fiq:
    b generic_handler

.balign 0x80
current_el_sp0_serror:
    b generic_handler

.balign 0x80
curret_el_sp1_sync:
    b sync_handler

.balign 0x80
current_el_sp1_irq:
    b irq_handler

.balign 0x80
current_el_sp1_fiq:
    b generic_handler

.balign 0x80
curret_el_sp1_serror:
    b generic_handler

.balign 0x80
lower_el_aarch64_sync:
    b generic_handler

.balign 0x80
lower_el_aarch64_irq:
    b generic_handler

.balign 0x80
lower_el_aarch64_fiq:
    b generic_handler

.balign 0x80
lower_el_aarch64_serror:
    b generic_handler

.balign 0x80
lower_el_aarch32_sync:
    b generic_handler

.balign 0x80
lower_el_aarch32_irq:
    b generic_handler

.balign 0x80
lower_el_aarch32_fiq:
    b generic_handler

.balign 0x80
lower_el_aarch32_serror:
    b generic_handler

irq_handler:
    trap_enter irq_enter_stack_pointer_swap_skip 
    mov x0, #IRQ_ASYNC_EXCEPTION 
    handler_entry 
    bl isr_dispatcher //bl will set ra/x30 register to returning PC
    handler_exit
    trap_exit irq_exist_stack_pointer_swap_skip

sync_handler:
    trap_enter sync_enter_stack_pointer_swap_skip
    mov x0, #SW_SYNC_EXCEPTION
    handler_entry
    bl isr_dispatcher
    handler_exit
    trap_exit sync_exit_stack_pointer_swap_skip

generic_handler:
    mov x0, #0

    b generic_handler

.global enable_irq 
enable_irq:
    msr daifclr, #(1 << 1)
    ret 


 
