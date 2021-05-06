//fill screen black if keyboard pressed
//R1 will store black or white value

//default keyboard input value to 0
@value
M=0

//loop for checking keyboard input
(KBDCHK)
//set current address to the first register of the screen
@SCREEN
D=A
@curradd
M=D
//get the value from the keyboard and store in @value
@KBD
D=M
@value
M=-1
@SETPIXELS
D;JGT
@value
M=0
@SETPIXELS
0;JMP

//loop for iterating of screen registers and setting to stored value
(SETPIXELS)
@value
D=M
@curradd
A=M
M=D
@curradd
M=M+1
D=M
@KBD
D=D-A
@KBDCHK
D;JEQ
@SETPIXELS
0;JMP
