%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(char *s) { printf("Error: %s\n", s); }
%}

%token ID NUM FOR LE GE EQ NE OR AND

%%

start   : FOR '(' init ';' cond ';' update ')' body
        { printf("FOR loop parsed successfully!\n"); }
        ;

init    : ID '=' NUM
        ;

cond    : ID '<' NUM
        | ID LE NUM
        | ID GE NUM
        | ID EQ NUM
        | ID NE NUM
        ;

update  : ID '=' ID '+' NUM
        ;

body    : '{' '}'
        ;

%%

int main() {
    return yyparse();
}
