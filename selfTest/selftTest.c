#include "types.h"
#include "utility.h"

void stack_access_self_test (u8 core_id) {
    extern u64 get_core_stack(u64 core_id);
 
    #define CORE_0 0
    #define CORE_1 1
    #define CORE_2 2
    #define CORE_3 3

    switch (core_id) {
        case CORE_0:
            memclr((void*)get_core_stack(0), 4096);
            memset((void*)get_core_stack(0), 0xDEADBEEF, 4096);
            break;
        case CORE_1:
            memclr((void*)get_core_stack(1), 4096);
            break;
        case CORE_2:
            memclr((void*)get_core_stack(2), 4096);
            break;
        case CORE_3:
            memclr((void*)get_core_stack(3), 4096);
            break;
        default:
            break;
    }
    
}