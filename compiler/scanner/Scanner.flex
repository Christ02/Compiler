package scanner;

import java.io.IOException;
import java.io.Reader;

%%

%public
%class Scanner
%unicode
%line
%column
%type String

%{
    // Variables para seguimiento de línea y columna
    private int line = 1;
    private int column = 1;

    // Método para actualizar la posición
    private void updatePosition(String text) {
        for (char c : text.toCharArray()) {
            if (c == '\n') {
                line++;
                column = 1;
            } else {
                column++;
            }
        }
    }

    // Métodos para obtener la línea y columna actual
    public int yyline() {
        return line;
    }

    public int yycolumn() {
        return column;
    }

    // Clase para manejar errores
    public class ErrorMsg {
        public static void printError(String message, int line, int column) {
            System.err.println("Error en la línea " + line + ", columna " + column + ": " + message);
        }
    }
%}

%%

// Whitespace (ignoring)
\s+ { updatePosition(yytext()); /* ignore whitespace */ }

// Comments (single-line and multi-line)
// Para comentarios de una sola línea
"//".* { updatePosition(yytext()); return "COMMENT"; }
// Para comentarios de múltiples líneas
"/*"([^*]|\*[^/])*"*/" { updatePosition(yytext()); return "COMMENT"; }

// Reserved keywords
"if" { updatePosition(yytext()); return "IF"; }
"else" { updatePosition(yytext()); return "ELSE"; }
"while" { updatePosition(yytext()); return "WHILE"; }
"for" { updatePosition(yytext()); return "FOR"; }
"int" { updatePosition(yytext()); return "INT"; }
"float" { updatePosition(yytext()); return "FLOAT"; }
"boolean" { updatePosition(yytext()); return "BOOLEAN"; }
"true" { updatePosition(yytext()); return "TRUE"; }
"false" { updatePosition(yytext()); return "FALSE"; }
"public" { updatePosition(yytext()); return "PUBLIC"; }
"private" { updatePosition(yytext()); return "PRIVATE"; }
"protected" { updatePosition(yytext()); return "PROTECTED"; }
"void" { updatePosition(yytext()); return "VOID"; }
"return" { updatePosition(yytext()); return "RETURN"; }

// Operators and Delimiters
"=" { updatePosition(yytext()); return "EQUALS"; }
"==" { updatePosition(yytext()); return "EQUALS_EQUALS"; }
"!=" { updatePosition(yytext()); return "NOT_EQUALS"; }
"<" { updatePosition(yytext()); return "LESS_THAN"; }
"<=" { updatePosition(yytext()); return "LESS_THAN_EQUALS"; }
">" { updatePosition(yytext()); return "GREATER_THAN"; }
">=" { updatePosition(yytext()); return "GREATER_THAN_EQUALS"; }
"(" { updatePosition(yytext()); return "LPAREN"; }
")" { updatePosition(yytext()); return "RPAREN"; }
"{" { updatePosition(yytext()); return "LBRACE"; }
"}" { updatePosition(yytext()); return "RBRACE"; }
";" { updatePosition(yytext()); return "SEMICOLON"; }
"," { updatePosition(yytext()); return "COMMA"; }
"[" { updatePosition(yytext()); return "LBRACKET"; }
"]" { updatePosition(yytext()); return "RBRACKET"; }
"+" { updatePosition(yytext()); return "PLUS"; }
"-" { updatePosition(yytext()); return "MINUS"; }
"*" { updatePosition(yytext()); return "MULTIPLY"; }
"/" { updatePosition(yytext()); return "DIVIDE"; }

// Literals
[0-9]+ { 
    updatePosition(yytext()); 
    return "INTLIT"; 
}
[0-9]*"."[0-9]+ { 
    updatePosition(yytext()); 
    return "FLOATLIT"; 
}

// Handle malformatted float literals (e.g., "123.")
[0-9]+\.[0-9]* { 
    updatePosition(yytext());
    ErrorMsg.printError("Malformatted float literal: " + yytext(), yyline(), yycolumn()); 
}

// Identifiers
[a-zA-Z_][a-zA-Z0-9_]* { updatePosition(yytext()); return "IDENTIFIER"; }

// String literals
\"([^\"]|\\.)*\" { updatePosition(yytext()); return "STRINGLIT"; }

// Error handling for illegal characters
. { 
    updatePosition(yytext());
    ErrorMsg.printError("Illegal character: " + yytext(), yyline(), yycolumn()); 
}
