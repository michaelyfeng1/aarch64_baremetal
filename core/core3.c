#include "types.h"
#include "device.h"
#include "utility.h"

void func_core_aux_entry (void) {
 //    __lock_acq_mem ((u64)&core_console_lock);
    uart_write_string ("Hello World core 3\n");
//     __lock_rel_mem ((u64)&core_console_lock);

    while (1);
}
