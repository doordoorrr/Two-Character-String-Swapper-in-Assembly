# Two-Character-String-Swapper-in-Assembly
Swapping Characters in a User-Input String Using NASM x86 Assembly

A simple x86 NASM assembly program that takes a 2-character string from the user, swaps the characters directly in memory, and prints the modified result. This program demonstrates low-level string manipulation, memory access, and system call usage in Linux.

- Input Handling: Prompts the user for a 2-character string using sys_write, then reads the input via sys_read into a 3-byte buffer (two_char_string) to account for the newline.

- String Manipulation: Swaps the first two characters stored in memory using general-purpose registers (AL, BL) for direct byte-level manipulation.

- Output: Displays an "answer" message followed by the swapped string using system calls.

- Syscalls Used: sys_write (eax = 4), sys_read (eax = 3), and sys_exit (eax = 1) with Linux interrupt int 0x80.

- Assembly Concepts: Introduces the use of .data, .bss, and .text sections, register manipulation, and direct memory access.
