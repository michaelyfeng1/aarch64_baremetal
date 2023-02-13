#ifndef _PROC_H_
#define _PROC_H_

typedef struct _VmInfo {
    u64 pt_addr;
    u64 heap_start_addr;
    u64 kernel_stack_addr;
    u64 user_stack_addr;
    u8 heap_size;
    u8 stak_size;

}VmInfo;

typedef struct _ProcessContext {
    u8 pid;
    u8 state;
    u64 stack_start_add;
    u64 kernel_stack_addr;
    u64 device;
    u64* p_vm_info;
}ProcessContext;

void create_process (void);
void scheduler (void);

#endif
