PROJECT_NAME = ArrayInit

ANTLR4 = java -jar /usr/local/lib/antlr-4.10.1-complete.jar
SOURCES := $(wildcard generated/*.java) $(wildcard *.java)
CLASSES := $(patsubst %.java,%.class,$(SOURCES))

build: $(SOURCES) $(CLASSES)

generate: $(PROJECT_NAME).g4
	$(ANTLR4) $^ -o generated

$(CLASSES): $(SOURCES)
	javac -cp ".:generated/:$(CLASSPATH)" $^