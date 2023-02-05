#include "types.h"
#include "device.h"

void uart_register_map_dump (void) {

}

void uart_init (enum UartMode uartMode) {
    reg32 uart0Lcrh = 0;
    reg32 uart0Imsc = 0;
    reg32 uart0Cr = 0;

    switch (uartMode)
    {
    case UART_FIFO:
        uart0Lcrh = (1 << 4) | (1 << 5) | (1 << 6);
        uart0Cr =  (1 << 8) | (1 << 9) | 1;
        break;
    case UART_INTERRUPT:
        uart0Lcrh = (1 << 4) | (1 << 5) | (1 << 6);
        uart0Cr =  (1 << 8) | (1 << 9) | 1;
        break;
    default:
        break;
    } 
    //Clear control register to stop uart
    UART_REGS->u0_cr = 0;

    //Set Baud Rate = 115200 
    UART_REGS->u0_ibrd = 26;
    UART_REGS->u0_fbrd = 0; //Fraction register = 0

    //Enable FIFO buffer and 8 bit transfer (8 bit data mode)
    UART_REGS->u0_lcrh = uart0Lcrh;
    
    //Mask out uart interrupt (using FIFO buffer)
    UART_REGS->u0_imsc = 0;

    //Enable UART0
    UART_REGS->u0_cr = uart0Cr;
}

void uart_send_c (u8 c) {
    while (UART_REGS->u0_fr & (1 << 5));
    UART_REGS->u0_dr = c; //Data register
}

void uart_irq_handler (void) {

}

void uart_send_data (u8 c) {
    //Pull to see FIFO buffer is fill, need to write data to fifo whenenver it is not full
    while (UART_REGS->u0_fr & (1 << 5));
    UART_REGS->u0_dr = c; //Data register
}

u8 uart_read_data () {
    while (UART_REGS->u0_fr & (1 << 4)); //cleared means data is ready

    return UART_REGS->u0_dr;
}

void uart_write_string (char* str) {
    for (int i = 0; str[i] != '\0'; i++) {
        uart_send_data (str[i]);
    }
}
