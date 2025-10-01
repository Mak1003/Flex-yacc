%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern void yyerror(const char *s);

int stack[100];
int top = -1;

void push(int val) {
    stack[++top] = val;
}

int pop() {
    return stack[top--];
}
%}

%token NUMBER ADD SUB MUL DIV

%union {
    int ival;
}

%type <ival> expression

%%
program: expression { printf("Result: %d\n", $1); }
       ;

expression: NUMBER { push($1); $$ = $1; }
          | expression expression ADD { int op2 = pop(); int op1 = pop(); push(op1 + op2); $$ = op1 + op2; }
          | expression expression SUB { int op2 = pop(); int op1 = pop(); push(op1 - op2); $$ = op1 - op2; }
          | expression expression MUL { int op2 = pop(); int op1 = pop(); push(op1 * op2); $$ = op1 * op2; }
          | expression expression DIV { int op2 = pop(); int op1 = pop(); 
                                        if (op2 == 0) { yyerror("Division by zero"); exit(1); }
                                        push(op1 / op2); $$ = op1 / op2; }
          ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}