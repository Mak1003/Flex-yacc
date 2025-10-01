%{
#include "y.tab.h"
%}

DIGIT   [0-9]+
ID      [a-zA-Z][a-zA-Z0-9]*

%%

"for"           { return FOR; }
{DIGIT}         { yylval = atoi(yytext); return NUM; }
{ID}            { return ID; }
"<="            { return LE; }
">="            { return GE; }
"=="            { return EQ; }
"!="            { return NE; }
"&&"            { return AND; }
"||"            { return OR; }

"("             { return '('; }
")"             { return ')'; }
";"             { return ';'; }
"="             { return '='; }
"{"             { return '{'; }
"}"             { return '}'; }

[ \t\n]+        ;     /* skip spaces */

.               { return yytext[0]; }

%%

int yywrap() { return 1; }
