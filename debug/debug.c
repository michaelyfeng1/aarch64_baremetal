#include "types.h" 
#include "debug.h"
#include "mm.h"
#include "print.h"


#ifdef DEBUG
void __assert (const char* cond,  const char* dbg_msg, const char* file_name, u32 line_num) {
    printk ("     condition fails : %s \n\
     dbg_msg : %s \n\
     file : %s \n\
     line : %d \n", cond, dbg_msg, file_name, line_num);

}
#endif

#ifdef DEBUG

void display_page_table () {
    extern u64 boot_strap_table_addr;

    u64* pPt = &boot_strap_table_addr;

    while (*pPt & 0x1) {
        printk ("0x%x \n", pPt);
        u64 temp = *pPt;
        temp = temp >> 3 << 3;
        u64* pPud = (u64*)(temp);
        while (*pPud & 0x1) {
            printk ("    0x%x  0x%x\n", pPud, *pPud);
            u64 temp = *pPud;
            temp = temp >> 3 << 3;
            u64* pPmd = (u64*)(temp);
            // while (*pPmd & 0x1) {
            //     printk ("           0x%x \n", pPmd);
            //     pPmd += 1;
            // }
            pPud += 1;
        }

        pPt += 1;
    }

    extern u64 boot_strap_table_addr_el0;

    pPt = &boot_strap_table_addr_el0;

    while (*pPt & 0x1) {
        printk ("0x%x \n", pPt);
        u64 temp = *pPt;
        temp = temp >> 3 << 3;
        u64* pPud = (u64*)(temp);
        while (*pPud & 0x1) {
            printk ("    0x%x  0x%x\n", pPud, *pPud);
            u64 temp = *pPud;
            temp = temp >> 3 << 3;
            u64* pPmd = (u64*)(temp);
            // while (*pPmd & 0x1) {
            //     printk ("           0x%x \n", pPmd);
            //     pPmd += 1;
            // }
            pPud += 1;
        }

        pPt += 1;
    }


}

#endif