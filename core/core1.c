#include "types.h"
#include "device.h"
#include "utility.h"

//Communication core
//Setup SPI and I2C
extern u8* core_info;

void comm_core_entry (void) {

     extern u64 core_console_lock;    
    
     while (!(1 & *core_info));

     *(core_info) |= 1 << 1; 
     // __lock_acq_mem ((u64)&core_console_lock);
    
     uart_write_string ("Hello World communication core 1\n");
     // __lock_rel_mem ((u64)&core_console_lock);

     gpio_pin_func_select(7, GPIO_FUNC_OUTPUT);
     gpio_pin_enable (7);

     while (1) {
          gpio_set(7);
          delay(10000);
          gpio_clear(7);
          delay(10000);
     }

     while (1);
}
