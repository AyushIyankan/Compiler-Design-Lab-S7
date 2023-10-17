%{

#include<stdio.h>
#include<string.h>

int characterCount = 0, wordCount = 0, sentenceCount = 0;

%}

%%

[a-zA-Z0-9] {characterCount++;}
" " 	    {wordCount++;}
"."	     {sentenceCount++;}
"\n" {
	printf("\nCharacter count: %d", characterCount);
	printf("\nWord count: %d", wordCount + 1);
	printf("\nSentence count: %d", sentenceCount);
	printf("\n");
	characterCount = 0, wordCount = 0, sentenceCount = 0;
	printf("\nEnter the next input paragraph: ");
}

%%

int yywrap(void) {}

int main() {
	printf("\nEnter the input paragraph: ");
	
	yylex();
	
	printf("\n\n");
	
	return 0;
}
