# Variables de compilación
JAVAC=javac
CUPJAR="C:\Users\Mayco\desktop\semestre 8\Compiladores\scanner\Compiladores\lib\java-cup-11b.jar"
CUPRUNTIME="C:\Users\Mayco\desktop\semestre 8\Compiladores\scanner\Compiladores\lib\java-cup-11b-runtime.jar"
CLASSPATH=.;$(CUPJAR);$(CUPRUNTIME)

# Directorios de origen y destino
SRC_DIR=.
BIN_DIR=.

# Archivos fuente y clases objetivo
SRC=$(wildcard $(SRC_DIR)/**/*.java)
CLASSES=$(SRC:$(SRC_DIR)/%.java=$(BIN_DIR)/%.class)

# Reglas de compilación
all: Compiler.class

Compiler.class: Compiler.java
	$(JAVAC) -cp $(CLASSPATH) -d $(BIN_DIR) $(SRC_DIR)/Compiler.java

# Compilación de todas las clases
all: $(CLASSES)

# Limpiar los archivos .class
clean:
	del /S /Q $(BIN_DIR)\*.class

