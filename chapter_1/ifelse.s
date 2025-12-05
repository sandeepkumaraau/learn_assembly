.global _main
.align 2

_main:
    mov X9, #6        // X9 will hold the value to check


    // Check if X9 is greater than 5
    cmp X9, #5       // compare X9 with 5
    b.le else_block   // if less than or equal, branch to else_block
