%{
#include "y.tab.h"
%}

%%
"switch"    { return SWITCH; }
"case"      { return CASE; }
"default"   { return DEFAULT; }
"break"     { return BREAK; }
":"         { return COLON; }
";"         { return SEMICOLON; }
"{"         { return LBRACE; }
"}"         { return RBRACE; }
"("         { return LPAREN; }
")"         { return RPAREN; }
[0-9]+      { return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
[ \t\n]     { /* ignore */ }
.           { return yytext[0]; }
%%

int yywrap() { return 1; }
