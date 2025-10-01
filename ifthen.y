%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}

%token IF THEN SEMICOLON LPAREN RPAREN ID NUMBER RELOP

%%
S : IF LPAREN CONDITION RPAREN THEN STATEMENT { printf("IF-THEN parsed successfully!\n"); }
  ;

CONDITION : ID RELOP NUMBER
          | NUMBER RELOP ID
          ;

STATEMENT : ID SEMICOLON
          ;
%%

void yyerror(const char *s) { printf("Error: %s\n", s); }
int main() { yyparse(); return 0; }
