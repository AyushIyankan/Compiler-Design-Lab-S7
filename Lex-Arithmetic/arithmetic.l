%{

#include<stdio.h>
#include<string.h>

int values[2], i = 0;
char op;

%}

digit [0-9]
operator ("+"|"-"|"/"|"*")

%%

{digit}+ 	{ values[i++] = atoi(yytext); }
{operator} 	{ op = yytext[0]; }
. 		;

%%

int yywrap(void) {}

int main() {
	extern FILE *yyin, *yyout;
	yyin = fopen("input.txt","r");
	yyout = fopen("output.txt","w");
	
	yylex();
	
	int result = 0;
	
	switch(op) {
		case '+': result = values[0] + values[1];
			  break;
		case '-': result = values[0] - values[1];
			  break;
		case '*': result = values[0] * values[1];
			  break;
		case '/': result = values[0] / values[1];
			  break;
	}
	
	printf("\nResult: %d", result);
	
	printf("\n\n");
	
	return 0;
}


