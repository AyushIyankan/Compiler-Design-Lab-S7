%{

#include <stdio.h>
#include <stdlib.h>

%}

%token A B C NL

%%

S : X Y NL { printf("Valid string\n"); exit(0); };
X : A X B | ;
Y : B Y C | ;


%%

int yyerror(char *msg) {
	printf("Invalid string\n");
	exit(0);
}

int main() {
	printf("Enter the string: ");
	yyparse();
}
