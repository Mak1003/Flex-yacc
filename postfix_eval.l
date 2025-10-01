%{
#include "parser.tab.h"
#include <stdlib.h>
#include <stdio.h>
%}

%%
[0-9]+      { yylval.ival = atoi(yytext); return NUMBER; }
"+"         { return ADD; }
"-"         { return SUB; }
"*"         { return MUL; }
"/"         { return DIV; }
[ \t\n]     ;
.           { fprintf(stderr, "Invalid character: %s\n", yytext); return -1; }
%%