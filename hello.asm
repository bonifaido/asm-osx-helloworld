; hello.asm  a first program for nasm for Mac OS X 10.9, Intel, ld
; Thanks to:
; http://github.com/anderscarling/NasmHelloWorld
; http://alien.dowling.edu/~rohit/nasmdoc3.html
; https://filippo.io/making-system-calls-from-assembly-in-mac-os-x/
; http://www.x86-64.org/documentation/abi.pdf
; http://fxr.watson.org/fxr/source/kern/syscalls.master

global _main           ; make _main label available to linker

_main:
    mov rax, 0x2000004 ; sys_write
    mov rdi, 1         ; stdout
    mov rsi, message   ; message address
    mov rdx, length    ; message string length
    syscall            ; make the system call (this is a direct OS call not C)

    mov rax, 0x2000001 ; sys_exit
    mov rdi, 0         ; exit code
    syscall

message:   db    "Hello World!", 0x0a ; string with a carriage-return
length:    equ   $-message    ; "$" means "here", len is a value, not an address
