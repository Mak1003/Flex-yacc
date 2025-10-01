%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}

%token WHILE LPAREN RPAREN LBRACE RBRACE SEMICOLON ID NUMBER RELOP ASSIGN OP

%%
S : WHILE_LOOP { printf("WHILE loop parsed successfully!\n"); }
  ;

WHILE_LOOP : WHILE LPAREN CONDITION RPAREN LBRACE BODY RBRACE
           ;

CONDITION : ID RELOP NUMBER
          | NUMBER RELOP ID
          | ID RELOP ID
          ;

BODY : STATEMENTS
     | /* empty */
     ;

STATEMENTS : STATEMENTS STATEMENT
           | STATEMENT
           ;

STATEMENT : ID ASSIGN EXPR SEMICOLON
          ;

EXPR : ID
     | NUMBER
     | EXPR OP EXPR
     ;
%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
