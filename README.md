# Assembly Language 

Assembly language is low level programming or other programmable device specific to a particular computer archeticture in contrast to most high level programming languages, which are generally portable across multiple systems.

## Compiling

This code can be compiled using ```nasm``` or ```netwide assembler``` so you should be using specific commands to compile and make an executable file. Firstly both the main code and the code given in  functions directory should be stored locally in the same directory. Now run the following commands one at a time:

```
nasm -f elf64 filename.asm -o filename.o
ld filename.o -o filename
./filename
```

Here change ```filename.asm and filename.o``` to the corresponnding file name which you want to execute. 

## Sections

1. ### .data
     All the pre defined values ,like strings, are stored with a label so that this perticular value or string can be called at any part of the code.Also to call these strings the proper length is required
     which can also be written here

     syntax:
     ```
     section .data:
        label1 size "your string here",  any operator like '\n' or '\t'
        label2 equ $- label1 
    ```
2. ### .bss

    All the variables of any datatype that you want to use in the code is assigned here with a fixed storage space.

    syntax:
    ```
    section .bss
        label resb value
    ```

3. ### .text

    The place where all the instructions are written or the heart of our assembly code.

## Basic instructions

  To write inctructions in assembly you should be knowing some basic commands and syscall values for the registers.

  |Instructions | Operands |Description      |
  |-------------|----------|-----------------|
  |**cmp**      |cmp s1, s2 | Compares and stores the values in a flag register |
  |**mov**      |mov s1, s2 | Moves the value in s2 to s1|
  |**call**     |call label | Call the function or block of code labelled so|
  |**dec**      |dec s1     | Basically s1=s1-1|
  |**inc**      |inc s1     | Basically s1=s1+1|
  |**add**      |add s1, s2 | s1=s1+s2         |
  |**sub**      |sub s1, s2 | s1=s1-s2         |


## Registers

  Registers are used to store data in any of the low level language like assembly language. They can store both vales and the address where thee value is actually stored i.e. they act as variables and pointers at the same time. They can be of different size according to the values stored in it.There are different types of registers

1. ### General puspose registers
    These registers are used as variables inside the code to move around values and strings. 

2. ### Special purppose registers
    These registers,apart from storing values, are used foe certain specific functions. For example rax register has certain values  for each type of kernal syscall such as to read a value or write in the terminal etc.

3. ### Flag registers
    These are 1 bit registers which are used to store either true or false (1 or 0) according to the instructions like cmp etc.

### TO DO list
- [ ] Add more info about x86-64 assembly language
- [ ] Different syscall values for the registers


