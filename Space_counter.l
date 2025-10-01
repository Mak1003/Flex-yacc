%{
#include <stdio.h>

int total_chars = 0;
int white_spaces = 0;
int tabs = 0;
%}

%%
[ \t] { /* Matches a space or a tab */
    if (yytext[0] == ' ') {
        white_spaces++;
    } else if (yytext[0] == '\t') {
        tabs++;
    }
    total_chars += yyleng; /* Add length of matched whitespace/tab to total characters */
}
. { /* Matches any other character */
    total_chars++; /* Increment total characters for each non-whitespace/tab character */
}
\n { /* Matches a newline character */
    total_chars++; /* Newline also counts as a character */
}
%%

int yywrap(void) {
    return 1;
}

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

    yylex();

    printf("Total characters: %d\n", total_chars);
    printf("White spaces: %d\n", white_spaces);
    printf("Tabs: %d\n", tabs);

    if (argc > 1) {
        fclose(yyin);
    }

    return 0;
}