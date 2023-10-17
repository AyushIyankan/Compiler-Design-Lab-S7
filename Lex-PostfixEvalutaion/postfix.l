%{

#include<stdio.h>
#include<string.h>
#include<stdlib.h>



int stack[100];
int top = -1;

void push(int);

int pop();

int calculate_value(int,int,char);





%}


digit [0-9]
operator ("-"|"+"|"/"|"*"|"%")



%%

{digit}+   {push(atoi(yytext)); }
{operator}   {push(calculate_value(pop(),pop(),yytext[0])); }
.          ;



%%

int yywrap(void){}


int main(){

extern FILE *yyin;

yyin = fopen("input.txt","r");

yylex();

printf("%d",pop());



return 0;
}

int pop(){return stack[top--];}

void push(int a){ stack[++top] = a;}


int calculate_value(int a, int b , char c){

switch(c){
   case '+':return a + b;
   case '-':return a - b;
   case '*':return a * b;
   case '/':return a / b;
   case '%':return a % b;
  


}



}



