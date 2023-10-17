%{
#include<stdio.h>
#include<string.h>

char keywords[100][100], identifiers[100][100], punctuators[100][100], operators[100][100], numbers[100][100], strings[100][100];
int i = 0, j = 0, k = 0, l = 0, m = 0, n = 0;

%}

letter [a-zA-Z]
digit [0-9]

%%

auto|break|case|char|continue|do|default|const|double|else|enum|extern|for|if|goto|float|int|long|register|return|signed|static|sizeof|short|struct|switch|typedef|union|void|while|volatile|unsigned	{ strcpy(keywords[i++], yytext); }
({letter}|(_))({letter}|{digit}|(_))*				{strcpy(identifiers[j++], yytext);}
"++"|"--"|"+"|"-"|"*"|"/"|"%"|"<"|"<="|">"|">="|"=="|"!="|"&&"|"||"|"!"|"&"|"|"|"<<"|">>"|"~"|"^"|"="|"+="|"-="|"/="|"%="|"?:"							{strcpy(operators[l++], yytext);}
"["|"]"|"("|")"|"{"|"}"|","|";"|":"|"*"|"#"			{strcpy(punctuators[k++], yytext);}
(("+"|"-")?)({digit}+)(("."{digit}+)?)((E("+"|"-")?{digit}+)?)	{strcpy(numbers[m++], yytext);}
\"(.)*\"							{strcpy(strings[n++], yytext);}
" "*|"\t"*|"\n"*|"#"(.*)					{}
.								{}

%%

int yywrap(void) {}

int main() {
	//file method
	extern FILE *yyin;
	yyin = fopen("input.c", "r");
	
	//input method
	printf("\nEnter your input: \n");	
	
	yylex();
	
	printf("\n\nKeywords:\n");
	for(int index = 0; index < i; index++) {
		printf("%s\t", keywords[index]);
	}
	
	printf("\n\nIdentifiers:\n");
	for(int index = 0; index < j; index++) {
		printf("%s\t", identifiers[index]);
	}
	
	printf("\n\nPunctuators:\n");
	for(int index = 0; index < k; index++) {
		printf("%s\t", punctuators[index]);
	}
	
	printf("\n\nOperators:\n");
	for(int index = 0; index < l; index++) {
		printf("%s\t", operators[index]);
	}
	
	printf("\n\nNumbers:\n");
	for(int index = 0; index < m; index++) {
		printf("%s\t", numbers[index]);
	}
	
	printf("\n\nStrings:\n");
	for(int index = 0; index < n; index++) {
		printf("%s\t", strings[index]);
	}
	
	printf("\n\n");

	return 0;	
}
