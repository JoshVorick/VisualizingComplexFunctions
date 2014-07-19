#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <GL/freeglut.h>

#define PI 3.14159265
//bignum library for big numbers
 
/* A,B,... for coefficients of derivatives of Mandelbrot Set and Julia Sets */
#define A 1 //c	 
#define B 0 //z^1 
#define C 1 //z^2 
#define D 0 //z^3 
#define E 0 //z^4 
#define F 0 //z^5 
#define G 0 //z^6 
 
typedef struct {
	unsigned char r, g, b;
} rgb_t;

typedef struct {
	rgb_t **tex;
	int **texIter;
	int gwin;
	GLuint texture;
	int width, height;
	int tex_w, tex_h;
	double zoomM, zoomJ, zoomF; //Scale for Mandelbrot Set, Julia Sets, and the other complex function(s)
	double cx, cy; //Initial value for c in f(x) = z^2 + c 
	double z1x, z1y; //Initial value of z
	int color_rotate;
	int color_scheme;
	int max_iter;
} mainVar;
