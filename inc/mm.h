#ifndef __MM_H_
#define __MM_H_

#ifndef __ASSEMBLER__

#define KERNEL_START_VA             0xffff000000000000
#define PAGE_SIZE_4K                4096
#define PAGE_SIZE_2M                1024 * 1024 * 2

#define PAGE_ALIGN_UP_4K(addr)     ((((u64)(addr) + PAGE_SIZE_4K - 1) >> 12) << 12)
#define PAGE_ALIGN_UP_2M(addr)     ((((u64)addr + PAGE_SIZE_2M - 1) >> 21) << 21)
#define PA_UP(v)                   ((((u64)v + PAGE_SIZE - 1) >> 21) << 21)
#define PAGE_ALIGN_DOWN_4K(addr)   (((addr) >> 12) << 12)
#define PAGE_ALIGN_DOWN_2M(addr)   ((addr >> 21) << 21)

#define HEAP_SIZE                   (1024 * 1024 * 1024)       // 1G Physical Memory

#define MAX_CORE_SUPPORT            8

typedef struct HeapSegment {
    u64 heap_size_in_bytes;
    u64 heap_start_phy_addr;
    u64 heap_start_va_addr;
    u64 heap_alloc_count;
}HeapSegment_t;

typedef struct CoreMemSegInfo {
    u64 seg_start_addr_pa;
    u64 seg_start_addr_va;
    u64 seg_end_addr_pa;
    u64 seg_end_addr_va;

    HeapSegment_t core_heap_info;
}CoreMemSegInfo_t;

typedef struct MemoryMetaData{
    u64 kernel_start;
    u64 kernel_end;
    u64 kerne_size;
    u64 heap_start;
    u64 heap_size;
    u64 core_count;
    CoreMemSegInfo_t core_segment_info[MAX_CORE_SUPPORT];
}MemoryMetaData_t;

typedef struct _BlockList {
    void* pMem;
    void* prev;
    void* next;
}BlockList;

void physical_segment_init (MemoryMetaData_t* pInfo);
void virtual_segment_init (void);

void mem_malloc_test (void);

void set_up_mmu (void);

#endif

#endif
