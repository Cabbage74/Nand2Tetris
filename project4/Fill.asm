// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.

(BLACK)
    @8192
    D=A
    @CNT
    M=D
    @SCREEN
    D=A
    @ADDR
    M=D
    (LOOPBLACK)
        @ADDR
        A=M
        M=-1
        @ADDR
        M=M+1
        @CNT
        MD=M-1    
        @AFTERPAINT
        D;JEQ
        @LOOPBLACK
        0;JMP


(LOOP)
    @KBD
    D=M
    @BLACK
    D;JGT

    @8192
    D=A
    @CNT
    M=D
    @SCREEN
    D=A
    @ADDR
    M=D
    (LOOPWHITE)
        @ADDR
        A=M
        M=0
        @ADDR
        M=M+1
        @CNT
        MD=M-1 
        @AFTERPAINT 
        D;JEQ
        @LOOPWHITE
        0;JMP

    (AFTERPAINT)

    @LOOP
    0;JMP