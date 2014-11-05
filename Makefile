FLAGS = -Wall -g
LFLAGS = -lglut -lGLU -lGL -lm -lpng -lpthread
COBJS = C/graphics.o C/colors.o C/calculations.o C/saveImage.o C/main.o
HOBJS = Haskell/main.o Haskell/Bindings.o Haskell/Display.o
CXX = gcc

%.o: %.c %.h C/defs.h
	$(CXX) $(FLAGS) -c -s $< -o $@

Cfractal: $(COBJS)
	$(CXX) $(COBJS) -o $@ $(LFLAGS)

clean:
	rm $(COBJS) $(HOBJS) Cfractal Haskellfractal Haskell/fractal
