%{

#include <stdio.h>

%}

digit [0-9]

%%

(("+"|"-")?({digit}+)(("."{digit}+)?))((e|E)?("+"|"-"))?({digit}+)? { printf("Valid real number"); }
.*                                     { printf("Invalid real number"); }

%%

int yywrap(void) {}

int main() {
	printf("Enter the input : ");

	yylex();
	
	printf("\n\n\n");
	
	return 0;
}
