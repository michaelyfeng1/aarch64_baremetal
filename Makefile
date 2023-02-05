C_SRC := $(shell find . -name "*.c") 
ASM_SRC := $(shell find . -name "*.S")

C_OBJ := $(patsubst %.c, %.o, $(C_SRC))
ASM_OBJ := $(patsubst %.S, %.o, $(ASM_SRC))

RPI_VERSION ?= 3

INCLUDES := -I ./inc

CC := aarch64-linux-gnu-gcc
CASM := aarch64-none-elf-as

CFLAG := -c -Wall -g -O0 -Wall -std=c99 -DRPI_VERSION=$(RPI_VERSION)\
			-nostdlib -nostartfiles\
			-ffreestanding -mgeneral-regs-only

SFLAG := -Wall -c -g2 -O0

ifeq ($(DEBUG),1)
	CFLAG += -DDEBUG
endif

ifeq ($(QEMU),1)
	CFLAG += -DEMU
endif

ifeq ($(VM),1)
	SFLAG += -DPAGING
	CFLAG += -DPAGING
endif

OUTPUT_DIR = ./obj
BIN_DIR = ./bin
ELF_FILE = kernel8.elf
BIN_FILE = kernel8.img

DEF_FILES = $(C_OBJ:%.o=%.d)
DEF_FILES += $(ASM_OBJ:%.o=%.d)

-include $(DEF_FILES)

.PHONY: build link run clean

%.o:%.c
	$(CC) $(CFLAG) $(INCLUDES) -MMD $< -o $@

%.o:%.S
	$(CC) $(SFLAG) $(INCLUDES) -MMD $< -o $@

build: $(ASM_OBJ) $(C_OBJ)

copy:
	aarch64-linux-gnu-ld -nostdlib  -T linker.ld $(ASM_OBJ) $(C_OBJ) -o $(ELF_FILE)
	aarch64-linux-gnu-objcopy $(ELF_FILE) --strip-all -O binary  $(BIN_FILE)

qemu:
	qemu-system-aarch64 \
		-M raspi3b	\
		-nographic \
		-m 1024M	\
		-kernel kernel8.img		\

all: build copy

dump:
	aarch64-linux-gnu-objdump -D $(ELF_FILE) > a.asm

clean:
	rm ./device/*.o
	rm ./utility/*.o
	rm ./interrupt/*.o
	rm ./mm/*.o


	rm ./device/*.d
	rm ./utility/*.d
	rm ./interrupt/*.d
	rm ./mm/*.d

	rm *.o
	rm *.d
	rm *img
	rm *elf
