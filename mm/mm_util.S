.equ MAIR_ATTR, (0x44 << 8) //Normal Memeory and Device Memory 0x44 and 0x0

.equ TCR_T0SZ,  (16)        //upper 16 bits
.equ TCR_T1SZ,  (16 << 16)
.equ TCR_TG0,   (0 << 14) //4K page granu
.equ TCR_TG1,   (0 << 30) //4K page granu
.equ TCR_VALUE, (TCR_TG0 | TCR_TG1 | TCR_T0SZ | TCR_T1SZ)

.section .text
.global set_up_mmu
set_up_mmu:
    //sub sp, sp, #8
    //str x0, [sp], #0    
    
    //bl set_up_bootstrap_page_table
    adr x0, boot_strap_table_addr_el0
    msr ttbr0_el1, x0
    
    adr x0, boot_strap_table_addr
    msr ttbr1_el1, x0

    ldr x0, =MAIR_ATTR
    msr mair_el1, x0

    ldr x0, =TCR_VALUE
    msr tcr_el1, x0
  
    //Enable MMU 
    mrs x0, sctlr_el1
    orr x0, x0, #1
    msr sctlr_el1, x0

    //ldr x0, [sp]
    //add sp, sp, #8

    ret

.section .text
.global flush_tlb_el1
flush_tlb_el1:
    tlbi vmalle1is
    dsb ish
    isb
    
    ret

.section .text 
.global set_up_bootstrap_page_table
set_up_bootstrap_page_table:
    //set pud
    //PGD has 512 entries (1 Page size)
    //To support 1G ram (Pi3), it needs 1 entry in PGD and 1 entry in PUD
    //2M *512 entries in PMD = 1G
 
    adr x0, boot_strap_pgd
    adr x1, boot_strap_pud

    orr x1, x1, #3
    str x1, [x0]
    
    //set pud    
    adr x0, boot_strap_pud
    adr x1, boot_strap_pmd
    
    orr x1, x1, #3
    str x1, [x0]

    //set pmd
    //map kernel segment
build_pmd:
    mov x2, #0x30000000
    mov x0, xzr //start from entry 0
    adr x1, boot_strap_pmd 
    mov x0, #(1 << 10 | 1 << 2 | 1 << 0)

map_kernel:
    str x0, [x1], #8 
    add x0, x0, #(2 * 1024 * 1024)
    cmp x0, x2
    blo map_kernel

    //map periphral segment
    mov x1, #0x40000000
    mov x0, #0x3f000000

    adr x2, boot_strap_pmd
    //Get page table index
    lsr x3, x0, #21
    lsl x3, x3, #3 //8 bytes entries
    add x2, x2, x3
    
    orr x0, x0, #(1 << 0) 
    orr x0, x0, #(1 << 10)

map_periphral:
    str x0, [x2], #8   
    add x0, x0, #(2 * 1024 * 1024)

    cmp x0, x1
    blo map_periphral


    //map periphral segment
    adr x0, boot_strap_pud
    add x0, x0, #8
    adr x1, boot_strap_pmd_above_1G
    orr x1, x1, #3
    str x1, [x0]


    mov x0, #0x40000000

    adr x2, boot_strap_pmd_above_1G
    orr x0, x0, #(1 << 0) 
    orr x0, x0, #(1 << 10)

    str x0, [x2]
    //add x0, x0, #(2 * 1024 * 1024)



    ret
    
.global set_up_bootstrap_page_table_el0
set_up_bootstrap_page_table_el0:
    adr x0, boot_strap_pgd_el0
    adr x1, boot_strap_pud_el0

    orr x1, x1, #3
    str x1, [x0]

    adr x0, boot_strap_pud_el0
    adr x1, boot_strap_pmd_el0
    
    orr x1, x1, #3
    str x1, [x0]

    adr x1, boot_strap_pmd_el0
    mov x0, #(1 << 10 | 1 << 2 | 1)
    str x0, [x1]

     //map periphral segment
    adr x0, boot_strap_pud_el0
    add x0, x0, #8
    adr x1, boot_strap_pmd_el0_above_1G
    orr x1, x1, #3
    str x1, [x0]

    mov x0, #0x40000000

    adr x2, boot_strap_pmd_el0_above_1G
    orr x0, x0, #(1 << 0) 
    orr x0, x0, #(1 << 10)

    str x0, [x2]


    ret 


// 3 Level Page Table
.balign 4096
.section .data
.global boot_strap_table_addr 
boot_strap_table_addr:
boot_strap_pgd:
    .space 4096, 0

boot_strap_pud:
    .space 4096, 0

boot_strap_pmd:
    .space 4096, 0

boot_strap_pmd_above_1G:
    .space 4096, 0

boot_strap_pmd_usr:
    .space 4096, 0 


// 3 Level Page Table
.balign 4096
.section .data
.global boot_strap_table_addr_el0 
boot_strap_table_addr_el0:
boot_strap_pgd_el0:
    .space 4096, 0

boot_strap_pud_el0:
    .space 4096, 0

boot_strap_pmd_el0:
    .space 4096, 0

boot_strap_pmd_el0_above_1G:
    .space 4096, 0
