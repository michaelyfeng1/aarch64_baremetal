#ifndef _UTILITY_H_
#define _UTILITY_H_

void memcpy (u8* dst_addr, u8* src_addr, u64 size);
void memclr (u8* dst_addr, u64 size);
void memset (u8* dst_addr, u64 value, u64 size);

void mutex_lock_acquire (u64* addr);
void mutex_lock_release (u64* addr);

void delay(u64 value);
void out_word(u64 addr, u32 value);
u32 in_word(u64 addr);

void __lock_acq_mem (u64 mem_addr);
void __lock_rel_mem (u64 mem_addr);


#endif