#include "types.h"
#include "device.h" 
#include "interrupt.h"
#include "print.h"
void program_gic (void) {
    //disbale all interrupts
    GIC_REGS->irq_disable_basic = 0xffffffff;
    GIC_REGS->irq_disable_reg1 = 0xffffffff;
    GIC_REGS->irq_disable_reg2 = 0xffffffff;
    
    //Uart interrupt bit 
    // GIC_REGS->irq_enable_reg2 = 1 << 25;

    //Timer interrupt bit
    GIC_REGS->irq_enable_basic = 1 << 0;
}


static void external_async_irq_handler () {
   //check timer status
   u8 isTimerInterrupt = 0;
   u8 isCounterSaturated = 0;
extern u64 read_core0_irq_status (void); 
extern u64 read_core0_timer_status (void);
   isTimerInterrupt = (read_core0_irq_status () >> 1 ) ? 1 : 0; //check bcm2836 interrupt controller core 0 irq mmaped register 
   isCounterSaturated = (read_core0_timer_status () & (1 << 2)) ? 1 : 0; //check per core timer control registers to see timer saturation codition is met


   if ( isTimerInterrupt &&
        isCounterSaturated) {
        timer_irq_handler (); 
   
   }
}

void isr_dispatcher (TrapFrameDesc_t* pTf) {
    switch (pTf->trap_no) {
        case INT_IRQ_ASYNC_EXCEPTION:
            external_async_irq_handler ();
            break;
        case INT_SW_SYNC_EXCEPTION: 
            break; 
        default:
            break;
   }    
}
