%option noyywrap
%{
	#include<stdio.h>
	int count = 0;
%}
alpha [a-zA-Z]
digit [0-9]
spaces [\t\n]
start ^A
%%
{start}  {count++;}
{space}(a|A)({aplha}|{digit})* {count++;}
%%
int main()
{
        yylex();
	printf("count = %d\n",count);

	return 0;
}