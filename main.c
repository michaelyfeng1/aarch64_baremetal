#include "types.h"
#include "utility.h"
#include "device.h"
#include "interrupt.h"
#include "smp.h"
#include "mm.h"
#include "debug.h"

volatile u64 core_console_lock = 0;

u8 core_count = 2;

int main (void) {
    interrupt_init ();
    devices_init ();

#ifdef DEBUG
    register_dump(DEV_UART);
    register_dump(DEV_SPI);
    register_dump(DEV_TIMER);
    display_page_table ();
#endif

extern void enable_irq (void);
    enable_irq ();

    extern u64 _cpu_core_1_mailbox_poll_addr;
    extern u64 _cpu_core_2_mailbox_poll_addr;
    extern u64 _cpu_core_3_mailbox_poll_addr;

    extern void trap_core_1_to_el1 (void); 
    extern void trap_core_2_to_el1 (void);
    extern void trap_core_3_to_el1 (void);
    extern void jump_to_el1_core_one (void);

    for (u8 i = 1; i < core_count; i++) {
        switch (i) {
            //kernel is loaded to 0x8000000 and linear copy subsequent kernel binary till the end
            //when other code starts running, it remains in physical mode. But kernel image is compiled using virtual address
            //It requries PA of jump function to sucessfully continue to execute.
            case CORE_1:
#ifdef PAGING
                *((u64*)&_cpu_core_1_mailbox_poll_addr) = (u64)jump_to_el1_core_one - KERNEL_START_VA;
#else 
                *((u64*)&_cpu_core_1_mailbox_poll_addr) = (u64)jump_to_el1_core_one;
#endif
                __asm__ volatile ("sev");
                break;
            case CORE_2:                  
                 *((u64*)&_cpu_core_2_mailbox_poll_addr) = (u64)trap_core_2_to_el1 - KERNEL_START_VA;
                __asm__ volatile ("sev");
                break;
            case CORE_3:
                 *((u64*)&_cpu_core_3_mailbox_poll_addr) = (u64)trap_core_3_to_el1 - KERNEL_START_VA;
                 __asm__ volatile ("sev");
                 break;
        }
    }

    user_core_entry ();
    
    return 0;
}   

