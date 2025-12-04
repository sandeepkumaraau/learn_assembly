.global _main
.align 2

_main:
    
    // Initialize counter to 5
    mov X9, #5         // X9 will hold the loop counter

loop_start:
    // Loop body: Here we can add any operations we want to perform in the loop
    // I will just print Hello World 5 times 

    // same write system call as in hello_world.s
    mov X0, #1         // file descriptor 1 is stdout
    adrp X1, message@PAGE
    add X1, X1, message@PAGEOFF

    mov X2, #14        // length of the message
    mov X16, #4        // syscall number for write
    svc #0x80          // make the syscall

    // there is no loop instruction in assembly
    // we will decrement the counter and check if it is zero

    sub X9, X9, #1    // decrement the counter X9 = X9 - 1, so we initializes X9 with 5 in the beginning and now we decrement it by 1

    // Check if counter is zero

    cmp X9, #0  // compare X9 with 0
    // When you run cmp, the CPU internally does a subtraction (X9 - 0) and throws away the result. It only keeps the status of that math in a special register called the Status Register (CPSR/PSTATE).
    // If the result was zero, it turns on the Z (Zero) flag.
    //If the result was negative, it turns on the N (Negative) flag.

    b.ne loop_start  // if not equal (X9 != 0), branch to loop_start
    // The Branch instruction does not look at your registers. It doesn't care about X9. It only looks at the Z flag from the previous step.
    // b.eq (Branch Equal): "Jump if the Z flag is ON."
   // b.ne (Branch Not Equal): "Jump if the Z flag is OFF."


    // Exit system call
    mov X0, #0         // exit status 0
    mov X16, #1        // syscall number for exit
    svc #0x80          // make the syscall