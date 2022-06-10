%{
	#include <iostream>
	#include <string>
	#include "simple-expr.tab.h"
	using namespace std;
%}


%option noyywrap


%%
[0-9]+ { yylval.ival = atoi(yytext); return INTCONST_TOKEN; }
"+"  { yylval.cval = strdup(yytext); return SUM_TOKEN; }
"-"  { yylval.cval = strdup(yytext); return MINUS_TOKEN; }
"%"  { yylval.cval = strdup(yytext); return MODE_TOKEN; }
"*" { yylval.cval = strdup(yytext); return TIMES_TOKEN; }
"/" { yylval.cval = strdup(yytext); return DIVIDE_TOKEN; }
"^" { yylval.cval = strdup(yytext); return POWER_TOKEN; }
"\n" { return NEWLINE_TOKEN; }
%%