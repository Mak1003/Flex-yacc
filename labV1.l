/* Lex program for decimal to binary conversion */
%{
#include<stdio.h>
#include<stdlib.h> 
int num;
%}

DIGIT [0-9]

%%
{DIGIT}+ {
    num = atoi(yytext); 
    int binary_num[32]; 
    int i = 0;

    if (num == 0) {
        printf("0\n");
    } else {
        while (num > 0) {
            binary_num[i] = num % 2;
            num /= 2; 
            i++;
        }

       
        for (int j = i - 1; j >= 0; j--) {
            printf("%d", binary_num[j]);
        }
        printf("\n");
    }
}

.|\n ECHO;
%%

// driver code
int main() {
    printf("Enter a decimal number: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}