%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}

%token SWITCH CASE DEFAULT BREAK COLON SEMICOLON LBRACE RBRACE LPAREN RPAREN ID NUMBER

%%
S : SWITCH_STMT { printf("SWITCH statement parsed successfully!\n"); }
  ;

SWITCH_STMT : SWITCH LPAREN ID RPAREN LBRACE CASES DEFAULT_CASE RBRACE ;

CASES : CASES CASE_STMT
      | CASE_STMT
      ;

CASE_STMT : CASE NUMBER COLON STATEMENTS BREAK SEMICOLON ;

DEFAULT_CASE : DEFAULT COLON STATEMENTS
             | /* empty */
             ;

STATEMENTS : /* simple form */
           | ID SEMICOLON
           ;
%%

void yyerror(const char *s) { printf("Error: %s\n", s); }

int main() { yyparse(); return 0; }
