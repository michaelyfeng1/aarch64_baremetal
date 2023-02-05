extern int main(int argc, void* argv);

// int entry (void) __attribute__((section (".text.init")));
int entry (void) {

    //Preprocess Init Information
    int argc = 1;

#include "types.h"
    typedef struct InputControlInfo {
        u8 core_id;
        u8 vm_enabled;
        u64 stack_info;

    }InputControlInfo_t; 

    u64 core_id;
    u64 vm_enabled;

    // x0 holds core id
    __asm__ volatile (
        "mov %0, x0;"
        : "=r" (core_id)
    );

    // x1 holds vm config
    __asm__ volatile (
        "mov %0, x1;"
        : "=r" (vm_enabled)
    );

    InputControlInfo_t info = {
        core_id,
        vm_enabled
    };
    
    return main(argc, (void*)&info);
}