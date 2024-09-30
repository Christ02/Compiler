package scanner;
import parser.sym;
import java_cup.runtime.Symbol;
import java.io.*;
%%

%public
%line
%column
%class Scanner
%unicode
%cup

%{
  String string = "";

  public Symbol token(int tokenType, String content) {
      return new Symbol(tokenType, content);
  }
%}

%state STRING

alphabet = [A-Za-z]
digit = [0-9]
underLine = "_"
whiteSpace = {endLine} | [ \t\f]
id = {alphabet}({alphabet} | {digit} | {underLine})*
endLine = \n|\r|\r\n
decimal = ({digit})+
floatingPoint = ({digit}+\.{digit}*)
inputCharacter = [^\r\n]
singleLineComment = \/\/{inputCharacter}*
multiLineComment = \/\*~\*\/
%%

<YYINITIAL> {

  // Palabras reservadas
  "if"            { return token(sym.IF, yytext()); }
  "else"          { return token(sym.ELSE, yytext()); }
  "while"         { return token(sym.WHILE, yytext()); }
  "for"           { return token(sym.FOR, yytext()); }
  "int"           { return token(sym.INT, yytext()); }
  "float"         { return token(sym.FLOAT, yytext()); }
  "boolean"       { return token(sym.BOOLEAN, yytext()); }
  "true"          { return token(sym.TRUE, yytext()); }
  "false"         { return token(sym.FALSE, yytext()); }
  "public"        { return token(sym.PUBLIC, yytext()); }
  "void"          { return token(sym.VOID, yytext()); }
  "return"        { return token(sym.RETURN, yytext()); }

  // Operadores y símbolos
  "=="            { return token(sym.EQUALS_EQUALS, yytext()); }
  "="             { return token(sym.EQUALS, yytext()); }
  "!="            { return token(sym.NOT_EQUALS, yytext()); }
  "<"             { return token(sym.LESS_THAN, yytext()); }
  "<="            { return token(sym.LESS_THAN_EQUALS, yytext()); }
  ">"             { return token(sym.GREATER_THAN, yytext()); }
  ">="            { return token(sym.GREATER_THAN_EQUALS, yytext()); }
  "+"             { return token(sym.PLUS, yytext()); }
  "-"             { return token(sym.MINUS, yytext()); }
  "*"             { return token(sym.MULTIPLY, yytext()); }
  "/"             { return token(sym.DIVIDE, yytext()); }

  // Símbolos de agrupación
  "("             { return token(sym.LPAREN, yytext()); }
  ")"             { return token(sym.RPAREN, yytext()); }
  "{"             { return token(sym.LBRACE, yytext()); }
  "}"             { return token(sym.RBRACE, yytext()); }

  // Otros tokens
  ";"             { return token(sym.SEMICOLON, yytext()); }
  ","             { return token(sym.COMMA, yytext()); }

  // Literales
  {decimal}       { return token(sym.INTLIT, yytext()); }
  {floatingPoint} { return token(sym.FLOATLIT, yytext()); }
  {id}            { return token(sym.IDENTIFIER, yytext()); }
  "\""            { yybegin(STRING); string = ""; }
}

<STRING> {
  "\"" { yybegin(YYINITIAL); return token(sym.STRINGLIT, string); }
  .    { string += yytext(); }
}

// Ignorar espacios en blanco y comentarios
{whiteSpace}       { /* Ignorar */ }
{singleLineComment} { /* Ignorar comentario de línea */ }
{multiLineComment}  { /* Ignorar comentario de bloque */ }
