%option noyywrap
%{
	    #include <stdio.h>
	    #include <stdlib.h>
	    char hex_dec[20];
    
%}

%%
[0-9]+ {
        int decimal_value = atoi(yytext);
        sprintf(hex_dec, "%X", decimal_value); 
        printf("%s", hex_dec); 
}
.|\n {
        printf("%s", yytext);
}
        
%%
int main() {
        printf("Enter text with decimal numbers:\n",);
        yylex();
        return 0;
}
