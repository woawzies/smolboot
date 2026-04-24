# smolboot
A simple bootloader that loads a x86 16-bit real mode kernel

## Who is this for?
masochists who lwk want to write operating systems in real mode assembly lol

## How do I build and run this?
> [!NOTE]
> Use linux.

### Prerequisites:
NASM (the assembler)  
QEMU (to emulate the machine)  
  
When you are ready, run:
```
nasm -f bin boot.asm -o boot.bin
nasm -f bin kernel.asm -o kernel.bin
cat boot.bin kernel.bin > os.img
```
then to emulate:
```
qemu-system-x86_64 -drive file=os.img,format=raw
```
yay! :D
