%{
#include <stdio.h>
int count=0;
char WORD[100];
%}
DIGIT [0-9]
ALPHA [a-zA-Z]
WORD [a-zA-Z]
%%
({ALPHA}|{DIGIT})*{WORD} {count++;}
%%

int yywrap (){
    return 1;

}

int main()
{
    scanf("%s",WORD);
    yylex();
    
    printf("Count= %d\n",count);
    return 0;
   
}
