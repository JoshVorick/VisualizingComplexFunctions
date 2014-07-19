LFLAGS = -lglut -lGLU -lGL -lm

all: Mandelbrot DrawComplex

Mandelbrot: C/mandelbrot.c
	gcc C/mandelbrot.c -o $@ $(LFLAGS)

DrawComplex: C/drawComplex.c
	gcc C/drawComplex.c -o $@ $(LFLAGS)
