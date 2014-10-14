#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <complex.h>
#include <GL/freeglut.h>

#define PI 3.14159265

enum fileTypes {
	PNG,
	PPM
};

enum calculationsFlags {
	WHOLE_SCREEN,
	TOP_HALF,
	BOTTOM_HALF
};

enum fractalSets {
	MANDELBROT,
	JULIA
};

#define NUM_FUNCTIONS 7

enum functionTypes {
	MANDEL_AND_JULIA,
	SINE,
	TANGENT,
	COOL_FUNCTION1,
	COOL_FUNCTION2,
	COOL_WIKI_FUNCTION,
	LINEAR
};
//bignum library for big numbers??
 
/* A,B,... for coefficients of derivatives of Mandelbrot Set and Julia Sets */
#define A 1 //c	 
#define B 0 //z^1 
#define C 0 //z^2 
#define D 0 //z^3 
#define E 0 //z^4 
#define F 0 //z^5 
#define G 1 //z^6 
 
typedef struct {
	unsigned char r, g, b;
} rgb_t;

typedef struct {
	rgb_t **tex;
	int **texIter;
	int gwin;
	GLuint texture;
	int width, height;
	int oldHeight, oldWidth;
	int tex_w, tex_h;
	int png_w, png_h;
	int imgCount;
	double zoomM, zoomJ, zoomF; //Scale for Mandelbrot Set, Julia Sets, and the other complex function(s)
	double complex c; //Initial value for c in f(x) = z^2 + c 
	double complex z1; //Initial value of z
	double complex centerC; // Center point of complex functions
	int function;
	int color_rotate;
	int color_scheme;
	int max_iter;
} mainVar;
