# simple_arithmetic_compiler
this is a simple compiler about arithmetic expressions. It pays attention to priority of operators to prevent happen any conflicts.

# Requirements
install flex  (in Linux : sudo apt install flex)
install bison (in Linux : sudo apt install bison)

g++ compiler in Linux / gcc compiler in windows

# Run the program
1- bison -d simple-expr.y
2- flex simple-expr.lex
3- g++ lex.yy.c simple-expr.tab.c
4- ./a.out

# Example
![Screenshot from 2022-06-11 01-55-42](https://user-images.githubusercontent.com/69598570/173153504-6a0e3b5b-eec4-427a-9da4-e6541f9b9943.png)
