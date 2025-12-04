.global _main    // _main so that linker can find it, macOS Calling convention, C runtime can find it 
.align 2        // Align memory  adress of the next instruction to a multiple of 4 bytes , ARM 64 instructions are 4 bytes long


_main:

    //  SYS call would be write(stdout, message, length)
    
    mov X0, #1  
    // mov (Move): Puts the value 1 into register X0
    // Why?: X0 holds the first argument for the function. 
    //File Descriptor 1 represents Standard Output (stdout), which is usually your terminal screen.
    
    adr X1, message
    //adr (Address): Calculates the memory address of the label message and stores that address in register X1.
    //Why?: X1 holds the second argument for the function, which is a pointer to the string we want to print.

    mov X2, #14
    // mov (Move): Puts the value 14 into register X2
    // Why?: X2 holds the third argument: the number of bytes to print. "Hello, World!\n" is 13 characters plus the newline character, totaling 14 bytes.

    mov X16, #4
    // Why?: On macOS ARM64, register X16 is reserved for the System Call Number. ID 4 corresponds to the write function. (Note: This is different from Linux, which uses register X8).

    svc #0x80
    //svc (Supervisor Call): This is the interrupt instruction. It pauses your program and hands control to the OS Kernel.
    //What happens: The Kernel looks at X16 (sees it's a "write"), looks at X0, X1, and X2 for details, prints the text, and then hands control back to your program.



    // Exit system call
    // If I don't exit manually, the processor will try to execute whatever random data exists in memory after our code, which causes a crash (Segfault).

    mov X0, #0
    // Argument 1: We put 0 in X0. This is the "Exit Status." 0 "usually" means "Success/No Error."

    mov X16, #1
    // System Call Number for "exit" is 1 on macOS ARM64.

    svc #0x80
    // Make the system call to exit the program.






