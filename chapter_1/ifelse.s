.global _main
.align 2

_main:
    mov X9, #6        // X9 will hold the value to check


    // Check if X9 is greater than 5
    cmp X9, #5       // compare X9 with 5
    b.le else_block   // if less than or equal, branch to else_block


    // If block: X9 > 5
    // Print "Greater than 5"
    mov X0, #1
    adrp X1, Greater@PAGE
    add X1, X1, Greater@PAGEOFF
    mov X2, #16       // length of "Greater than 5\n"
    mov X16, #4       // syscall number for write
    svc #0x80         // make the syscall


    // Branch to end after if block
    b end_block
    //f you forget it, the computer will run the "Greater" code, and then fall through right into the "Smaller" code, printing both!

else_block:
    // Else block: X9 <= 5
    // Print "Smaller than 5"
    miv X0, #1
    adrp X1, Smaller@PAGE
    add X1, X1, Smaller@PAGEOFF
    mov X2, #15       // length of "Smaller than 5\n"
    mov X16, #4       // syscall number for write
    svc #0x80         // make the syscall



// This is the end of the if-else structure
end_block:
    // Exit system call
    mov X0, #0        // exit status 0
    mov X16, #1       // syscall number for exit
    svc #0x80         // make the syscall


