#ifndef _DEBUG_H_
#define _DEBUG_H_

#ifdef DEBUG
    void stack_access_self_test (u8 core_id);
    
    void __assert (const char* cond, const char* dbg_msg, const char*  file_name, u32 line_num);
    #define assert(expr, fmt) if (!(expr)) \
                __assert (#expr, fmt,  __FILE__, __LINE__) 

    void display_page_table (void);

#else 
    #define assert (expr) ((void)0) 
#endif

#endif

