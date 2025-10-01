%{
int token_count = 0;
%}

%%
[a-zA-Z_][a-zA-Z0-9_]*  { token_count++; } /* Identifiers/Keywords */
[0-9]+                 { token_count++; } /* Integer literals */
[0-9]+\.[0-9]+         { token_count++; } /* Floating-point literals */
"=="|"!="|"<="|">="|"="|"+"|"-"|"*"|"/"|"%"|"&&"|"||"|"!"|"&"|"|"|"^"|"<<"|">>" { token_count++; } /* Operators */
"(" | ")" | "{" | "}" | "[" | "]" | ";" | "," | "." | ":" | "?" { token_count++; } /* Special Symbols/Punctuators */
[ \t\n]+               ; /* Ignore whitespace and newlines */
.                      { token_count++; } /* Catch-all for any other single character token */
%%

int yywrap(void) {
    return 1;
}

int main() {
    printf("Enter the code:\n");
    yylex();
    printf("\nTotal number of tokens: %d\n", token_count);
    return 0;
}