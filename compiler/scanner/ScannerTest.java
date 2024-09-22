package scanner;

import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

public class ScannerTest {
    public static void main(String[] args) {
        try {
            PrintWriter output = new PrintWriter("scanner/output.txt");

            Scanner scanner = new Scanner(new FileReader("scanner/input.txt"));
            String token;

            // Leer y mostrar los tokens hasta llegar al final del archivo
            while ((token = scanner.yylex()) != null) {
                output.println("Token: " + token);
            }

            // Cerrar el PrintWriter
            output.close();
            System.out.println("Output written to output.txt");

        } catch (IOException e) {
            System.err.println("Error al abrir el archivo de entrada: " + e.getMessage());
        }
    }
}
