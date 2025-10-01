%{
#include "y.tab.h"
%}

%%
"if"        { return IF; }
"then"      { return THEN; }
";"         { return SEMICOLON; }
"("         { return LPAREN; }
")"         { return RPAREN; }
[0-9]+      { return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
"<="|">="|"=="|"!="|"<"|">" { return RELOP; }
[ \t\n]     { /* ignore */ }
.           { return yytext[0]; }
%%

int yywrap() { return 1; }
