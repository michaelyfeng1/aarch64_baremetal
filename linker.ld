ENTRY(_start)

SECTIONS
{
    . = 0xe0;
    _cpu_core_1_mailbox_poll_addr = .;

    . = 0xe8;
    _cpu_core_2_mailbox_poll_addr = .;

    . = 0xf0;
    _cpu_core_3_mailbox_poll_addr = .;


    . = 0x000000080000;

    __kernel_start_addr = .;

    .text : {
        * (.text.init)
        * (.text)
    }

    . = ALIGN (4096);

    .data : {
        * (.data)
    }
    
    . = ALIGN (4096);

    .bss : {
        _bss_start = .;
        * (.bss)
        _bss_end = .;
    }

    __kernel_end_addr = .;
}
