#include "types.h"
#include "device.h"
#include "utility.h"
#include "print.h"

extern void enable_timer (void);
static u64 timer_interval = 0;
static u64 ticks = 0;
   
   
void timer_init (void) {

extern u64 get_system_clk ();
    timer_interval = get_system_clk () / 100;

#ifdef EMU
    timer_init_emu ();
#else
    TIMER_REGS->timer_prediv = 0x7d;
    TIMER_REGS->timer_load = 19841;
    TIMER_REGS->timer_ctl = 0b10100010;
#endif
}

#ifdef EMU
void timer_init_emu (void) {

extern void enable_irq_timer (void);
extern void enable_core0_timer (void);

    enable_irq_timer ();
    enable_core0_timer ();
}
#endif

void timer_irq_handler (void) {
    extern void set_timer_interval (u64 interval);
    
    ticks++;

    if (ticks % 100 == 0) {
        printk("Timer\n");
    }
    
    set_timer_interval (timer_interval);
}



