//User Core

#include "types.h"
#include "utility.h"
#include "device.h"
#include "print.h"

static u8 spiRecvBuf[BUF_SIZE] = {0};
static u8 spiSendBuf[BUF_SIZE] = {0};
static u8 i2cRecvBuf[BUF_SIZE] = {0};
static u8 i2cSendBuf[BUF_SIZE] = {0};

extern u8*  core_info;


void user_core_entry() {
        // atomic mem operation requires mmu_enabled
    extern u64 core_console_lock;
    // __lock_acq_mem ((u64)&core_console_lock);
    printk("Hello from user core\n");
    *(core_info) = 1 << 0;

    // __lock_rel_mem ((u64)&core_console_lock);
    
    while (1);
}
