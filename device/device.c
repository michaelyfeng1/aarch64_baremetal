#include "types.h"
#include "device.h"
#include "print.h"

static void dump_uart (void) {
    // uart_write_string
    printk("\n------- UART REGS -------\n");
    printk("-- FR   : 0x%x\n", (u64)&UART_REGS->u0_fr);
    printk("-- LBRD : 0x%x\n", (u64)&UART_REGS->u0_ibrd);
    printk("-- FBRD : 0x%x\n", (u64)&UART_REGS->u0_fbrd);
    printk("-- LCRD : 0x%x\n", (u64)&UART_REGS->u0_fbrd);
    printk("-- ICR  : 0x%x\n", (u64)&UART_REGS->u0_icr);
    printk("-- IMSC : 0x%x\n", (u64)&UART_REGS->u0_imsc);
    printk("-- CR   : 0x%x\n", (u64)&UART_REGS->u0_cr);
    printk("-------------------------\n");

}

static void dump_timer (void) {
    printk("\n------- Timer REGS -------\n");
    printk("-- LOAD   : 0x%x\n", (u64)&TIMER_REGS->timer_load);
    printk("-- CTL    : 0x%x\n", (u64)&TIMER_REGS->timer_ctl);
    printk("-- ACK    : 0x%x\n", (u64)&TIMER_REGS->timer_ack);
    printk("-- MSKIRQ : 0x%x\n", (u64)&TIMER_REGS->timer_mskirq);
    printk("-- PREDIV : 0x%x\n", (u64)&TIMER_REGS->timer_prediv);
    printk("-------------------------\n");

}

void register_dump (enum DeviceType type) {
    switch (type) {
        case DEV_UART:
            {
                dump_uart ();
            }
            break;
        case DEV_TIMER:
            {
                dump_timer ();
            }
            break;
        case DEV_SPI:
            {
                //dump_spi ();
            }
            break;
        case DEV_GPIO:
            {
                //dump_gpio ();
            }
            break;
        default:
            break;
    }
}

void devices_init (void) {
    i2c_init ();
    // spi_init ();
    uart_init (UART_FIFO);
    timer_init ();
}
