%{
#include "y.tab.h"
%}

%%
"while"         { return WHILE; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
";"             { return SEMICOLON; }
[a-zA-Z_][a-zA-Z0-9_]*  { return ID; }
[0-9]+          { return NUMBER; }
"<="|">="|"=="|"!="|"<"|">" { return RELOP; }
"="             { return ASSIGN; }
"+"|"-"|"*"|"/" { return OP; }
[ \t\n]         { /* ignore spaces */ }
.               { return yytext[0]; }
%%

int yywrap() { return 1; }
