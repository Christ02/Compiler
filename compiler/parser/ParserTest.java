package parser;

import java.io.FileReader;
import java.io.IOException;
import java_cup.runtime.Symbol;
import scanner.Scanner;  // Asegúrate de que el paquete y clase de tu scanner estén correctos

public class ParserTest {
    public static void main(String[] args) {
        // Ruta al archivo de entrada
        String inputFile = "input.txt";  // Asegúrate de tener este archivo en el directorio actual o proporciona una ruta completa

        try (FileReader input = new FileReader(inputFile)) {
            // Crear el scanner
            Scanner scanner = new Scanner(input);

            // Crear el parser con el scanner
            Parser parser = new Parser(scanner);

            // Iniciar el proceso de parsing
            Symbol result = parser.parse();

            // Verificar si el resultado es correcto
            if (result != null) {
                System.out.println("Parsing completed successfully.");
                System.out.println("Parsed result: " + result.value);
            } else {
                System.out.println("Parsing completed, but no result returned.");
            }

        } catch (IOException e) {
            System.err.println("Error reading the input file: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Error during parsing: " + e.getMessage());
            e.printStackTrace();  // Mostrar la traza del error
        }
    }
}
