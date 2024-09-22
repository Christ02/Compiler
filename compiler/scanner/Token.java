package scanner;

public class Token {
    private String type;
    private String value;
    private int line;
    private int column;

    // Constructor
    public Token(String type, String value, int line, int column) {
        this.type = type;
        this.value = value;
        this.line = line;
        this.column = column;
    }

    // Métodos getters para acceder a los valores de los atributos
    public String getType() {
        return type;
    }

    public String getValue() {
        return value;
    }

    public int getLine() {
        return line;
    }

    public int getColumn() {
        return column;
    }

    // Método para imprimir el token
    public void printToken() {
        System.out.println("Token: " + type + ", Valor: " + value + ", Línea: " + line + ", Columna: " + column);
    }
}
