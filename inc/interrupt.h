#ifndef _INTERRUPT_H_
#define _INTERRUPT_H_

typedef enum _INT_TYPE {
    INT_SW_SYSCALL = 0x0,
    INT_IRQ_ASYNC_EXCEPTION = 0x1,
    INT_SW_SYNC_EXCEPTION = 0x2,
    INT_INVALID = 0x3
}INT_TYPE;

typedef struct TrapFrame {
    u64 x0;
    u64 x1;
    u64 x2;
    u64 x3;
    u64 x4;
    u64 x5;
    u64 x6;
    u64 x7;
    u64 x8;
    u64 x9;
    u64 x10;
    u64 x11;
    u64 x12;
    u64 x13;
    u64 x14;
    u64 x15;
    u64 x16;
    u64 x17;
    u64 x18;
    u64 x19;
    u64 x20;
    u64 x21;
    u64 x22;
    u64 x23;
    u64 x24;
    u64 x25;
    u64 x26;
    u64 x27;
    u64 x28;
    u64 x29;
    u64 x30;
    u64 sp0;
    u64 trap_no;
    u64 esr;
    u64 elr;
    u64 spsr;
} __attribute__ ((packed)) TrapFrameDesc_t;

void isr_dispatcher (TrapFrameDesc_t* pTf);
void program_gic (void);
void interrupt_init (void);

void timer_irq_handler (void); 

#endif
