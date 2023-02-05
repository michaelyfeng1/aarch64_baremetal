#include "types.h"
#include "mm.h"
#include "print.h"

static MemoryMetaData_t SysMemoryInfo = {0};

extern u8 core_count;


//Build up a page table
void set_up_boot_strap_page_table() {

}

void kmalloc() {

}

void kfree() {

}

// Memory Meta Data Init by Core 0 before triggering other cores to start execution 
void mm_init (void) {   

    physical_segment_init( &SysMemoryInfo);
}

void physical_segment_init(MemoryMetaData_t* pInfo) {

    //Heap size might not be correct, not sure mmio start address of RAM
    //The known info shows:
    //Kernel consumes size and loaded to physcak address = 0x800000

    extern u64 __kernel_start_addr;
    extern u64 __kernel_end_addr;

    pInfo->kernel_start = *(u64*)&__kernel_start_addr;
    pInfo->kernel_end = *(u64*)&__kernel_end_addr;

    u64 kernel_size =  pInfo->kernel_end - pInfo->kernel_start;
    kernel_size = ((kernel_size + PAGE_SIZE_4K - 1) >> 21) << 21; 

    pInfo->kerne_size = kernel_size;
    pInfo->core_count = core_count;
    pInfo->heap_start = 0;
    pInfo->heap_size = 0;

}

void virtual_segment_init (void) {

}


void mem_malloc_test (void) {
    
}
