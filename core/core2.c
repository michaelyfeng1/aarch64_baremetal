#include "types.h"
#include "device.h"
#include "utility.h"

void func_core_entry (void) {

   // __lock_acq_mem ((u64)&core_console_lock);
    uart_write_string ("Hello World core 2\n");
   // __lock_rel_mem ((u64)&core_console_lock);
    while (1);
}
