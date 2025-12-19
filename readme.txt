1. Create shell.l
%{
#include "shell.h" // Include header for token definitions, etc.
#include "y.tab.h" // Include Yacc's generated token definitions
%}

%%
[ \t]+          /* ignore whitespace */ ;
\n              return NEWLINE;
"|"             return PIPE;
">"             return REDIR_OUT;
"<"             return REDIR_IN;
"&"             return AMPERSAND;
[a-zA-Z0-9_/.-]+  { yylval.str = strdup(yytext); return WORD; } // Commands, arguments, filenames
%%

2. Create shell.y /* yacc/bison */
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

3. Generate Parser
yacc -d shell.y		/* -d option creates y.tab.h with token

4. Compile
gcc -o myshell lex.yy.c y.tab.c -lfl /* -lfl links with flex library

5. Run
./myshell
