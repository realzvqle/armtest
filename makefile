TARGET := kernel.elf

AS := aarch64-none-elf-as     
LD := aarch64-none-elf-ld     
ASFLAGS := -g                 
LDFLAGS := -T linker.ld       

SRCS := $(wildcard src/*.S)        
OBJS := $(SRCS:.S=.o)          

all: $(TARGET)

$(TARGET): $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^

%.o: %.S
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f $(OBJS) $(TARGET)
.PHONY: all clean

run:
	qemu-system-aarch64 -machine virt -cpu cortex-a57 -kernel kernel.elf -nographic

run-debug:
	qemu-system-aarch64 -machine virt -cpu cortex-a57 -kernel kernel.elf -nographic -s -S