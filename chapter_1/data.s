.global message  // make "message " visible to other files (like the linker)

.data           // Section of memory for initialized data (like strings)

.align 2       // Align memory address to a multiple of 4 bytes

message:
    .ascii "Hello, World!\n"  // Define a string with a newline character at the end