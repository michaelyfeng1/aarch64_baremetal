.section .text
.global enable_irq_timer
enable_irq_timer:
    stp x29, x30, [sp, #-16]!
    
    bl get_system_clk //Read system clock counter
    mov x1, #100
    udiv x0, x0, x1

    bl set_timer_interval
   
    mov x0, #1
    msr CNTP_CTL_EL0, x0

    ldp x29, x30, [sp], #16
    ret  

.global get_system_clk
get_system_clk:
    mrs x0, CNTFRQ_EL0
    ret

.global set_timer_interval
set_timer_interval:
    msr CNTP_TVAL_EL0, x0
    ret


// Read system clock counter
// Program vtal interval registers
// Add and write sum to comparator registers
// Hardware will read system clock counter and trigger interrupt when system counter > comaprator register
// Generic Control register = 32 bit  [2] status = 1 (Timer Condition Met or not) [1] Mask Bit = 0 [0] Enable bit = 1
// CNTL_CTL_EL0 is used to control el system timer (64 bit)
