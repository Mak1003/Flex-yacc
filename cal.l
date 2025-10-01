%{
#include "y.tab.h"
#include <stdio.h>
%}

digit   [0-9]
number  {digit}+("."{digit}*)?

%%

{number}    { yylval = atof(yytext); return NUMBER; }
\n          return '\n';
[ \t]       ;              /* ignore spaces */
.           return yytext[0];

%%

int yywrap() { return 1; }
