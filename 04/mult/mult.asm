// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)


// R2 is the result of the multiplication.
@R2
M=0

// Count is the nth iteration of the repeated addition.
@count
M=0

// Begin loop.
(LOOP)

  // Get 2nd operand.
  @R1
  D=M

  // Add the 2nd operand to the total.
  @R2
  M=D+M

  // Increment count.
  @count
  M=M+1

  // Get 1st operand.
  @R0
  D=M

  // Deduct count from 1st operand.
  @count
  D=D-M

  // If result is greater than 0, start next iteration.
  @LOOP
  D;JGT

// End program.
(END)
  @END
  0;JMP

