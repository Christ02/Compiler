package scanner;
import parser.sym;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java_cup.runtime.Symbol;  // Importa la clase Symbol

public class ScannerTest {
    public static void main(String[] args) {
        try {
            // Crear el PrintWriter para escribir los resultados en el archivo output.txt
            PrintWriter output = new PrintWriter("scanner/output.txt");

            // Crear el scanner generado por JFlex
            Scanner scanner = new Scanner(new FileReader("scanner/input.txt"));
            Symbol token;

            // Leer y mostrar los tokens hasta llegar al final del archivo
            while ((token = scanner.next_token()) != null) {
                // Verificar que el token no sea nulo y sea un token válido
                if (token.sym != sym.EOF) {
                    String tokenOutput = "Token: " + getTokenName(token.sym) + ", Value: " + token.value;
                    
                    // Escribir en el archivo
                    output.println(tokenOutput);
                } else {
                    break; // Salir cuando se encuentra el EOF
                }
            }

            // Cerrar el PrintWriter
            output.close();
            System.out.println("Output written to output.txt");

        } catch (IOException e) {
            System.err.println("Error al abrir el archivo de entrada: " + e.getMessage());
        }
    }

    // Función auxiliar para obtener el nombre del token a partir de su valor en sym.java
    public static String getTokenName(int symValue) {
        switch (symValue) {
            case sym.IF: return "IF";
            case sym.ELSE: return "ELSE";
            case sym.WHILE: return "WHILE";
            case sym.FOR: return "FOR";
            case sym.INT: return "INT";
            case sym.FLOAT: return "FLOAT";
            case sym.BOOLEAN: return "BOOLEAN";
            case sym.TRUE: return "TRUE";
            case sym.FALSE: return "FALSE";
            case sym.PUBLIC: return "PUBLIC";
            case sym.VOID: return "VOID";
            case sym.RETURN: return "RETURN";
            case sym.EQUALS: return "EQUALS";
            case sym.EQUALS_EQUALS: return "EQUALS_EQUALS";
            case sym.NOT_EQUALS: return "NOT_EQUALS";
            case sym.LESS_THAN: return "LESS_THAN";
            case sym.LESS_THAN_EQUALS: return "LESS_THAN_EQUALS";
            case sym.GREATER_THAN: return "GREATER_THAN";
            case sym.GREATER_THAN_EQUALS: return "GREATER_THAN_EQUALS";
            case sym.LPAREN: return "LPAREN";
            case sym.RPAREN: return "RPAREN";
            case sym.LBRACE: return "LBRACE";
            case sym.RBRACE: return "RBRACE";
            case sym.SEMICOLON: return "SEMICOLON";
            case sym.COMMA: return "COMMA";
            case sym.PLUS: return "PLUS";
            case sym.MINUS: return "MINUS";
            case sym.MULTIPLY: return "MULTIPLY";
            case sym.DIVIDE: return "DIVIDE";
            case sym.INTLIT: return "INTLIT";
            case sym.FLOATLIT: return "FLOATLIT";
            case sym.IDENTIFIER: return "IDENTIFIER";
            case sym.STRINGLIT: return "STRINGLIT";
            case sym.error: return "ERROR";
            default: return "UNKNOWN";
        }
    }
}
