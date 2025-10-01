%{
#include <stdio.h>
#include <stdlib.h>

#define YYSTYPE double

int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%right UMINUS

%%

input:
      /* empty */
    | input line
    ;

line:
      '\n'
    | expr '\n'   { printf("= %g\n", $1); }
    | error '\n'  { printf("Error! Try again.\n"); yyerrok; }
    ;

expr:
      NUMBER
    | expr '+' expr   { $$ = $1 + $3; }
    | expr '-' expr   { $$ = $1 - $3; }
    | expr '*' expr   { $$ = $1 * $3; }
    | expr '/' expr   { $$ = ($3 == 0) ? (yyerror("Divide by 0"), 0) : $1 / $3; }
    | '-' expr %prec UMINUS  { $$ = -$2; }
    | '(' expr ')'    { $$ = $2; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
    printf("Simple Desk Calculator\n");
    yyparse();
    return 0;
}
