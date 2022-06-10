
%{
	#include <iostream>
	#include <math.h>
	using namespace std;
	
	extern int yylex();
	int yyerror(const char* message);

%}

%union {
	int ival;
	char* cval;
}

%define parse.error verbose

%token <ival> INTCONST_TOKEN
%token <cval> SUM_TOKEN
%token <cval> MINUS_TOKEN
%token <cval> MODE_TOKEN
%token <cval> TIMES_TOKEN
%token <cval> DIVIDE_TOKEN
%token <cval> POWER_TOKEN
%token NEWLINE_TOKEN



%nterm <ival> exp;
%nterm <ival> input;

%left SUM_TOKEN
%left MINUS_TOKEN
%left MODE_TOKEN
%left TIMES_TOKEN
%left DIVIDE_TOKEN
%left POWER_TOKEN


%start program

%%
program:	input NEWLINE_TOKEN input
			| input
			;
			
input:	exp { cout << "Result = " << $1 << endl; }
		|  {}
		;

exp:	exp SUM_TOKEN exp { $$ = $1 + $3; }
		| exp MINUS_TOKEN exp { $$ = $1 - $3; }
		| exp MODE_TOKEN exp { $$ = $1 % $3; }
		| exp TIMES_TOKEN exp { $$ = $1 * $3; }
		| exp DIVIDE_TOKEN exp { $$ = $1 / $3; }
		| exp POWER_TOKEN exp { $$ = pow($1,$3); }
		| INTCONST_TOKEN { $$ = $1; }
		;
%%

int main(int argc , char* argv[]){
	yyparse();
	return 0;
}

int yyerror(const char* message){
	cout << message << endl;
	return 0;
}