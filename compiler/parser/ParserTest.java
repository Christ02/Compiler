package parser;

import java.io.FileReader;
import java.io.IOException;
import java_cup.runtime.Symbol;
import scanner.Scanner;  // Importa tu clase Scanner

public class ParserTest {
    public static void main(String[] args) {
        try {
            // Cargar el archivo de entrada
            FileReader input = new FileReader("input.txt");

            // Crear el scanner y el parser
            Scanner scanner = new Scanner(input);
            Parser parser = new Parser(scanner);

            // Iniciar el proceso de parsing
            Symbol result = parser.parser();

            System.out.println("Parsing completed successfully.");
            
        } catch (Exception e) {
            System.err.println("Error during parsing: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
