; hello.asm  a first program for nasm for Mac OS X 10.9, Intel, ld
; Thanks to:
; https://github.com/anderscarling/NasmHelloWorld
; http://alien.dowling.edu/~rohit/nasmdoc3.html
; http://michaux.ca/articles/assembly-hello-world-for-os-x
; http://www.x86-64.org/documentation/abi.pdf

    SECTION .data      ; data section
msg:    db    "Hello World!", 0x0a ; string with a carriage-return
len:    equ   $-msg    ; "$" means "here", len is a value, not an address


    SECTION .text      ; code section
kernel:
    int 0x80           ; interrupt 0x80, call kernel
    ret

    global _main       ; make label available to linker 

_main:
    mov eax, 4         ; SYS_write instruction
    push dword len     ; push len onto stack
    push dword msg     ; push len onto stack
    push dword 1       ; push stdout onto stack
    call kernel        ; make the system call (this is a direct OS call not C)
    add esp, 12        ; clean up the stack

    push dword 0       ; push exit code onto stack
    mov eax, 1         ; SYS_exit
    call kernel
