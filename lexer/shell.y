/* yacc/bison parser */
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// External function from lex.yy.c
extern int yylex();
extern int yyparse();
extern FILE *yyin;

void yyerror(const char *s);
%}

%union {
    char *str;
    // Add other types as needed for more complex parsing (e.g., int for redirection modes)
}

%token <str> WORD
%token NEWLINE PIPE REDIR_IN REDIR_OUT AMPERSAND // Declare tokens from shell.l

%%

program:
    /* empty */
    | program command NEWLINE { /* Execute the command here */ }
;

command:
    simple_command
    | command PIPE simple_command
    | simple_command REDIR_IN WORD
    | simple_command REDIR_OUT WORD
    | simple_command AMPERSAND
;

simple_command:
    WORD { /* Store command name */ }
    | simple_command WORD { /* Store arguments */ }
;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(int argc, char **argv) {
    // For now, read from stdin
    yyin = stdin;
    yyparse();
    return 0;
}

