FLAGS = -Wall -Werror
LFLAGS = -lglut -lGLU -lGL -lm
OBJS = C/graphics.o C/main.o
CXX = gcc

%.o: %.c %.h C/defs.h
	$(CXX) $(FLAGS) -c -s $< -o $@

Mandelbrot: $(OBJS)
	$(CXX) $(OBJS) -o $@ $(LFLAGS)

clean:
	rm $(OBJS) Mandelbrot
