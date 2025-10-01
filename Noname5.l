%{
/** A lex program to convert all lowercase to uppercase & Reverse **/
%}

lvowel [aeiou]
uvowel [AEIOU]
space [\t\n]

%%

{lvowel} {printf("%c",yytext[0] - 32);}
{uvowel} {printf("%c",yytext[0] + 32);}
{space} ECHO;
. ECHO;

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}