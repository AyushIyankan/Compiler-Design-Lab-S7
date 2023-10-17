%{

#include <stdio.h>

%}

letter [a-zA-Z]
digit [0-9]

%%

((_)|{letter})({letter}|{digit}|(_))* { printf("Valid identifier"); }
.*                                    { printf("Invalid identifier"); }

%%

int yywrap(void) {}

int main() {
	printf("\n Enter the input : ");

	yylex();
	
	printf("\n\n");
	
	return 0;
}
