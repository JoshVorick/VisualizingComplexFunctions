#include "calculations.h"

extern void getColor(complex double prevZ, complex double z, int iter, int prev_iter, rgb_t *p);
extern void hsv_to_rgb(double hue, double sat, double var, rgb_t *pixel);

struct FractalThread {
	double startX;
	double startY;
	double stepX;
	double stepY;
	int texXstart;
	int texYstart;
	int texXstop;
	int texYstop;
	int functionType;
	rgb_t **tex;
	int **texIter;
};

void* calcFractalSetPiece(void *threadData);
void* calcComplexFunctionPiece(void *threadData);

void calcComplexFunction(int width, int height, rgb_t **tex, int **texIter, int screenFlags, int functionType) {
	// Split into NUM_THREADS pieces
	pthread_t threads[NUM_THREADS];
	struct FractalThread data[NUM_THREADS];
	int i, bottom, top;
	double zoom;
	complex double middle;

	switch (screenFlags) {
		case WHOLE_SCREEN:
			bottom = 0;
			top = height;
			break;
		case TOP_HALF:
			bottom = height/2;
			top = height;
			break;
		case BOTTOM_HALF:
			bottom = 0;
			top = height/2;
			break;
	}
	if (mVar->function == MANDEL_AND_JULIA) {
		switch (functionType) {
			case MANDELBROT:
				zoom = mVar->zoomM;
				middle = mVar->c;
				break;
			case JULIA:
				zoom = mVar->zoomJ;
				middle = mVar->z1;
				break;
		}
	} else {
		zoom = mVar->zoomF;
		middle = mVar->centerC;
		functionType = mVar->function;
	}

	// Divide the work between the threads
	for(i = 0; i < NUM_THREADS; i++) {
		data[i].texYstart = bottom + i;
		data[i].texYstop = top;
		data[i].texXstart = 0;
		data[i].texXstop = width;
		data[i].stepX = zoom;
		data[i].startX = zoom * -(width/2) + creal(middle);
		data[i].stepY = zoom * NUM_THREADS;
		data[i].startY = zoom * -(top-bottom)/2 + cimag(middle) + i * zoom;
		data[i].functionType = functionType;
		data[i].tex = tex;
		data[i].texIter = texIter;
	}

	// Start threads
	for(i = 0; i < NUM_THREADS; i++) {
		if (mVar->function == MANDEL_AND_JULIA)
			pthread_create(&threads[i], NULL, calcFractalSetPiece, &data[i]);
		else
			pthread_create(&threads[i], NULL, calcComplexFunctionPiece, &data[i]);
	}

	// Wait for thread to finish
	for(i = 0; i < NUM_THREADS; i++) {
		pthread_join(threads[i], NULL);
	}
}

// Calculates a section of the function given the starting point, width and height
void* calcFractalSetPiece(void *threadData) {
	struct FractalThread *data = threadData;
	int i, j, iter, prev_iter;
	rgb_t *px;
	double x = data->startX;
	double y = data->startY;
	double complex curPoint, z, z2, prevZ;

	for (i = data->texYstart; i < data->texYstop; i+= NUM_THREADS) {
		px = data->tex[i];
		for (j = data->texXstart; j	< data->texXstop; j++, px++) {
			curPoint = x + y*I;
	
			switch(data->functionType) {
				case MANDELBROT:
					z = mVar->z1;
					break;
				case JULIA:
					z = curPoint;
					break;
			}
			z2 = z * z;
			for (iter = 0; iter < mVar->max_iter && cabs(z2) < 16; iter++) {
				prevZ = z;
				z = G*z2*z2*z2 + F*z2*z2*z + E*z2*z2 + D*z2*z + C*z2 + B*z;
				switch (data->functionType) {
					case MANDELBROT:
						z += A*curPoint;
						break;
					case JULIA:
						z += A*mVar->c;
						break;
				}
				z2 = z * z;
			}
			if (data->texIter != NULL) {
				data->texIter[i][j] = *(unsigned short *)px = iter;
				if (mVar->color_scheme == 3 && iter == prev_iter && i > 0)
						iter = data->texIter[i-1][j];
			}
			getColor(prevZ, z, iter, prev_iter, px);
			prev_iter = iter;
			x += data->stepX;
		}
		y += data->stepY;
		x = data->startX;
	}
	return NULL;
}

double complex cool_function(double complex a, double complex b) {
  //f(a,b) = a^2 + e^(a + b + sin(b) - tan(a))
  return a*a + cexp(a + b + csin(b) - ctan(a));
}

double complex coolFunction1(double complex a, int iter) {
  double complex x = a;
  int i;
  for (i=0; i<iter; i++) {
    a = a*a + cexp(a + x + csin(x) - ctan(a));
  }
	return a;
}

void* calcComplexFunctionPiece(void *threadData) {
	struct FractalThread *data = threadData;
 	int i, j;
	rgb_t *px;
	double x = data->startX;
	double y = data->startY;
	double complex a;
	
	for (i = data->texYstart; i < data->texYstop; i += NUM_THREADS) {
		px = data->tex[i];
		for (j = data->texXstart; j	< data->texXstop; j++, px++) {
			a = x + y*I;
      px->r = 0;
      px->g = 0;
      px->b = 0;
			switch (data->functionType) {	
				case SINE: 
					a = csin(a); break;
				case TANGENT: 
					a = ctan(a); break;
				case COOL_FUNCTION1: 
					a = coolFunction1(a, 10); break;
				case COOL_FUNCTION2: 
					a = coolFunction1(a, 5); break;
				case COOL_WIKI_FUNCTION:
					a = (a*a - 1)*(a - 2 - 1*I)*(a - 2 - 1*I) / (a*a + 2 + 2*I); break;
				case LINEAR: 
					a = 3*a + 1; break;
			}
			double mag = cabs(a);
			switch(mVar->color_scheme) {
				case 0:
					hsv_to_rgb((PI + carg(a))/(2*PI), .99, (PI + sin(1.5*PI*mag)) / (2*PI), px); break;
				case 1:
					hsv_to_rgb((PI + carg(a))/(2*PI), 0.99, 0.99, px); break;
				case 2:
					hsv_to_rgb(0, 0, (PI + sin(carg(a)))/(2*PI), px); break;
				case 3:
					hsv_to_rgb(0, 0.99, (PI + sin(1.5*PI*mag)) / (2*PI), px); break;
				case 4:
					hsv_to_rgb((PI + carg(a))/(2*PI), 0.99, mag, px); break;
			}
			x += data->stepX;
		}
		y += data->stepY;
		x = data->startX;
	}
	return NULL;
}
