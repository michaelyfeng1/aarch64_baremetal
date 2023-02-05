#include "types.h"
#include "utility.h"
#include "device.h"

void gpio_pin_func_select (u8 pinNum, GpioAltFunc pinFunc) {
    
    u8 bits_shift = pinNum * 3 % 30;
    u8 reg_index = pinNum / 10;

    u32 selector = GPIO_REGS->gp_fselect[reg_index];
    selector &= ~(7 << bits_shift);
    selector |= (pinFunc << bits_shift);

    GPIO_REGS->gp_fselect[reg_index] = selector;
}

void gpio_pin_enable(u8 pinNum) {
    GPIO_REGS->pupd_enable = 0;
    delay(150);
    
    GPIO_REGS->pupd_enable_clocks[pinNum / 32] = 1 << (pinNum % 32);
    delay(150);
    
    GPIO_REGS->pupd_enable = 0;
    GPIO_REGS->pupd_enable_clocks[pinNum / 32] = 0;
}


void gpio_set (u8 pinNum) {
    u32 value = 1 << pinNum;

    GPIO_REGS->gp_output_set.data[0] = value;
}

void gpio_clear (u8 pinNum) {
    u32 value = 1 << pinNum;

    GPIO_REGS->gp_output_clear.data[0] = value;
}