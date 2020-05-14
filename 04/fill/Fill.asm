// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.


// Set map_width to 8192.
@8192
D=A
@map_width
M=D


(MAIN)
  // Set pointer to the 0th address of the screen map.
  @SCREEN
  D=A
  @pointer
  M=D

  // Set count to 0.
  @count
  M=0

  // If the value at keyboard map > 0, jump to BLACK.
  // Else if the value at keyboard map == 0, jump to WHITE.
  @KBD
  D=M
  @BLACK
  D;JGT
  @WHITE
  D;JEQ


(BLACK)
  // Set the value of the pointer to 0xF.
  @pointer
  D=0
  A=M
  M=!D

  // Increment pointer.
  @pointer
  M=M+1

  // Increment count.
  @count
  M=M+1

  // If map_width - count == 0, jump to MAIN.
  @map_width
  D=M
  @count
  D=D-M
  @MAIN
  D;JEQ

  // Jump to BLACK.
  @BLACK
  0;JMP


(WHITE)
  // Set the value of the pointer to 0x00.
  @pointer
  A=M
  M=0

  // Increment pointer.
  @pointer
  M=M+1

  // Increment count.
  @count
  M=M+1

  // If map_width - count == 0, jump to MAIN.
  @map_width
  D=M
  @count
  D=D-M
  @MAIN
  D;JEQ

  // Jump to WHITE.
  @WHITE
  0;JMP

