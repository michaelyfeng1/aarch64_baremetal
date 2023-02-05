#ifndef _DEVICE_H_
#define _DEVICE_H_

#ifdef PAGING
    #define PPL_BASE_ADDR       0x3F000000 + 0xffff000000000000
#else
    #define PPL_BASE_ADDR       0x3F000000
#endif

#define CORE_CLOCK_SPEED    1500000000
#define BUF_SIZE            0x100

enum DeviceType {
    DEV_UART,
    DEV_SPI,
    DEV_GPIO,
    DEV_INTR,
    DEV_TIMER,
    DEV_INVALID
};

typedef struct _CoreInfo {
    u8 coreId;
    u8 coreSpeed;
} __attribute__ ((packed)) CoreInfo_t;


void devices_init (void);

#define pCoreInfo ((CoreInfo_t*)core_info))
//***************************************************
//Uart
enum UartMode {
    UART_FIFO,
    UART_INTERRUPT,

    UART_INVALID
};

typedef struct Uart {
    reg32 u0_dr;
    reg32 reserved[5];
    reg32 u0_fr;
    reg32 reserved1[2];  
    reg32 u0_ibrd;
    reg32 u0_fbrd;
    reg32 u0_lcrh;
    reg32 u0_cr;
    reg32 reserved2;
    reg32 u0_imsc;
    u16   reserved3;
    reg32 u0_icr;
} __attribute__ ((packed)) Uart_t;

#define UART_REGS ((struct Uart*)(PPL_BASE_ADDR + 0x201000))

void uart_register_map_dump (void);
void uart_init (enum UartMode uartMode);
void uart_send_c (u8 c);
void uart_irq_handler (void);

void uart_send_data (u8 c);
void uart_write_string (char* str);
u8 uart_read_data (void);

//***************************************************************

typedef enum _GpioAltFunc {
    GPIO_FUNC_INPUT = 0b000,
    GPIO_FUNC_OUTPUT = 0b001,
    GPIO_FUNC_ALT0 = 0b100,
    GPIO_FUNC_ALT1 = 0b101,
    GPIO_FUNC_ALT2 = 0b110,
    GPIO_FUNC_ALT3 = 0b111,
    GPIO_FUNC_ALT4 = 0b011,
    GPIO_FUNC_ALT5 = 0b010,
}GpioAltFunc;

struct GpioPinData {
    reg32 reserved;
    reg32 data[2];
};

typedef struct Gpio {
    reg32 gp_fselect[6];
    struct GpioPinData gp_output_set;
    struct GpioPinData gp_output_clear;
    struct GpioPinData gp_pin_level;
    struct GpioPinData gp_event_detect;
    struct GpioPinData gp_redge_detect;
    struct GpioPinData gp_fedge_detect;
    struct GpioPinData gp_high_detect;
    struct GpioPinData gp_low_detect;
    struct GpioPinData gp_async_redge_detect;
    struct GpioPinData gp_async_fedge_detect;
    reg32 reserved;
    reg32 pupd_enable;
    reg32 pupd_enable_clocks[2];
} __attribute__ ((packed)) GpioDesc_t;

#define GPIO_REGS ((struct Gpio*)(PPL_BASE_ADDR + 0x200000))

void gpio_pin_func_select (u8 pinNum, GpioAltFunc pinFunc);
void gpio_pin_enable(u8 pinNum);
void gpio_set (u8 pinNum);
void gpio_clear (u8 pinNum);

//***************************************************************

typedef struct Spi {
    reg32 cs;
    reg32 fifo;
    reg32 clock;
    reg32 data_length;
    reg32 ltoh;
    reg32 dc;
} __attribute__ ((packed)) SpiDesc_t;

//SPI Mask
#define CS_LEN_LONG	(1 << 25)
#define CS_DMA_LEN	(1 << 24)
#define CS_CSPOL2	(1 << 23)
#define CS_CSPOL1	(1 << 22)
#define CS_CSPOL0	(1 << 21)
#define CS_RXF		(1 << 20)
#define CS_RXR		(1 << 19)
#define CS_TXD		(1 << 18)
#define CS_RXD		(1 << 17)
#define CS_DONE		(1 << 16)
#define CS_LEN		(1 << 13)
#define CS_REN		(1 << 12)
#define CS_ADCS		(1 << 11)
#define CS_INTR		(1 << 10)
#define CS_INTD		(1 << 9)
#define CS_DMAEN	(1 << 8)
#define CS_TA		(1 << 7)
#define CS_CSPOL	(1 << 6)
#define CS_CLEAR_RX	(1 << 5)
#define CS_CLEAR_TX	(1 << 4)
#define CS_CPOL__SHIFT	3
#define CS_CPHA__SHIFT	2
#define CS_CS		(1 << 0)
#define CS_CS__SHIFT	0

#define SPI_CHANNEL     0

#define SPI_REGS ((struct Spi *)(PPL_BASE_ADDR + 0x00204000))

void spi_init (void);
void spi_send (u8* buf, u32 size);
void spi_recv (u8* buf, u32 size);

//***************************************************************

//***************************************************************
// BSC0
// BSC1 (used)
// BSC2 (reserved to HDMI)

typedef struct i2c {
    reg32 control;
    reg32 status;
    reg32 data_length;
    reg32 slave_addr;
    reg32 data_fifo;
    reg32 clk_div;
    reg32 data_delay;
    reg32 clk_stretch_timeout;
} __attribute__((packed)) I2cDesc_t;

typedef enum _i2c_status {
    I2C_SUCCESS = 0x0,
    I2C_ACK_ERROR = 0x1,
    I2C_DATA_LOSS = 0x2,
    I2C_CLOCK_TIMEOUT = 0x3
}i2c_status;

#define I2C_CLOCK_SPEED  100000
#define I2C_REGS ((struct i2c*)(PPL_BASE_ADDR + 0x804000))

// Control register
#define C_I2CEN			(1 << 15)
#define C_INTR			(1 << 10)
#define C_INTT			(1 << 9)
#define C_INTD			(1 << 8)
#define C_ST			(1 << 7)
#define C_CLEAR			(1 << 5)
#define C_READ			(1 << 0)

// Status register
#define S_CLKT			(1 << 9)
#define S_ERR			(1 << 8)
#define S_RXF			(1 << 7)
#define S_TXE			(1 << 6)
#define S_RXD			(1 << 5)
#define S_TXD			(1 << 4)
#define S_RXR			(1 << 3)
#define S_TXW			(1 << 2)
#define S_DONE			(1 << 1)
#define S_TA			(1 << 0)

void i2c_init (void);
i2c_status i2c_send (u64 addr, u8* pBuf, u64 size);
i2c_status i2c_recv (u64 addr, u8* pBuf, u64 size);
//***************************************************************

//***************************************************************
// GIC (Generic Interrupt Controller
typedef struct Gic
{
    u32 irq_pending;
    u32 reserved[3];
    u32 irq_enable_reg1;
    u32 irq_enable_reg2;
    u32 irq_enable_basic;
    u32 irq_disable_reg1; //irq 0 - 31
    u32 irq_disable_reg2; //irq 32 - 63
    u32 irq_disable_basic;
}__attribute__ ((packed)) GicDesc_t;

#define GIC_REGS ((struct Gic*)(PPL_BASE_ADDR + 0xB200))


//***************************************************************

///***************************************************************
typedef struct Timer {
    u32 timer_load;
    u32 reserved;
    u32 timer_ctl;
    u32 timer_ack;
    u32 reserved1;
    u32 timer_mskirq;
    u32 reserved2;
    u32 timer_prediv;
}__attribute__ ((packed))Timer_t;

#define TIMER_REGS ((struct Timer*)(PPL_BASE_ADDR + 0xB400))

void timer_init (void);

#ifdef EMU
    void timer_init_emu (void);
#endif

//***************************************************************


//***************************************************************
// Core Management

void user_core_entry (void);
void comm_core_entry (void);
void func_core_entry (void);
void func_core_aux_entry (void);

//***************************************************************

void register_dump (enum DeviceType type);

#endif
