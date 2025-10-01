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
int main(int argc, char *argv[]) {
        if (argc > 1) {
            yyin = fopen(argv[1], "r");
            if (yyin == NULL) {
                perror("Error opening file");
                return 1;
            }
        } else {
            printf("Usage: %s <input_file>\n", argv[0]);
            return 1;
        }
        //printf("Enter text with decimal numbers:\n",);
        yylex();
        return 0;
}
