#include "types.h"
#include "device.h"
#include "utility.h"

void i2c_init (void) {
    gpio_pin_func_select (2, GPIO_FUNC_ALT0);
    gpio_pin_func_select (3, GPIO_FUNC_ALT0);

    gpio_pin_enable (2);
    gpio_pin_enable (3);
    
    I2C_REGS->clk_div = CORE_CLOCK_SPEED / I2C_CLOCK_SPEED;
}

//I2C send data
i2c_status i2c_send (u64 addr, u8* pBuf, u64 size) {
    i2c_status ret = I2C_SUCCESS;
    
    I2C_REGS->slave_addr = addr;
    I2C_REGS->status = S_CLKT | S_ERR | S_DONE; // Reset ERR bit, Done  bit, CLKT bit
    I2C_REGS->data_length = size;
    I2C_REGS->control = C_I2CEN | C_ST;  //enable i2c and start new transfer
    u64 size_byte_recv = 0;

    while (!(I2C_REGS->status & S_DONE)) {
        while (I2C_REGS->status & S_RXD) { // FIFO is empty ? 0 : 1 
            *pBuf++ = I2C_REGS->data_fifo & 0xFF;
            size_byte_recv++;
        }
    }

    reg32 status = I2C_REGS->status;

    if (status & S_ERR) ret = I2C_ACK_ERROR;
    else if (status & S_CLKT) ret = I2C_CLOCK_TIMEOUT;
    else if (size_byte_recv < size) ret = I2C_DATA_LOSS;

    return ret;
}

//I2C receive data
i2c_status i2c_recv (u64 addr, u8* pBuf, u64 size) {
    i2c_status ret = I2C_SUCCESS;
    
    I2C_REGS->slave_addr = addr;
    I2C_REGS->status = S_CLKT | S_ERR | S_DONE; // Reset ERR bit, Done  bit, CLKT bit
    I2C_REGS->data_length = size;
    I2C_REGS->control = C_I2CEN | C_ST | C_READ;  //enable i2c and start new transfer
    u64 size_byte_recv = 0;

    while (!(I2C_REGS->status & S_DONE)) {
        while (I2C_REGS->status & S_RXD) { // FIFO is empty ? 0 : 1 
            *pBuf++ = I2C_REGS->data_fifo & 0xFF;
            size_byte_recv++;
        }
    }

     while ((size_byte_recv < size) && (I2C_REGS->status & S_RXD)) { // FIFO is empty ? 0 : 1 
        *pBuf++ = I2C_REGS->data_fifo & 0xFF;
        size_byte_recv++;
    }
    
    reg32 status = I2C_REGS->status;

    if (status & S_ERR) ret = I2C_ACK_ERROR;
    else if (status & S_CLKT) ret = I2C_CLOCK_TIMEOUT;
    else if (size_byte_recv < size) ret = I2C_DATA_LOSS;

    return ret;

}
