#include "calculations.h"

extern void getColor(complex double prevZ, complex double z, int iter, int prev_iter, rgb_t *p);
extern void hsv_to_rgb(double hue, double sat, double var, rgb_t *pixel);

void calcFractalSet(int width, int height, rgb_t **tex, int **texIter, int screenFlags, int fractalType) {
	int i, j, iter, prev_iter, bottom, top;
	//I need to think of less confusing names than 'center' and 'middle'
	int centerX, centerY; //Pixel coordinates of center (only changes based on width, height, and screenFlags)
	double complex middle; //real and imaginary parts of the center point (only changes with clicking and zooming)
	rgb_t *px;
	double x, y, zoom;
	double complex curPoint, z, z2, prevZ;
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
	centerX = (width) / 2; //Figure out where the origin is
	centerY = (top + bottom) / 2;
	switch (fractalType) {
		case MANDELBROT:
			zoom = mVar->zoomM;
			middle = mVar->c;
			break;
		case JULIA:
			zoom = mVar->zoomJ;
			middle = mVar->z1;
			break;
	}	
	for (i = bottom; i < top; i++) {
		px = tex[i];
		y = (i - centerY) * zoom + cimag(middle);
		for (j = 0; j	< width; j++, px++) {
			x = (j - centerX) * zoom + creal(middle);
			curPoint = x + y*I;
			iter = 0;
			
			switch(fractalType) {
				case MANDELBROT:
					z = mVar->z1;
					break;
				case JULIA:
					z = curPoint;
					break;
			}
			z2 = z * z;
			for (; iter < mVar->max_iter && cabs(z2) < 4; iter++) {
				prevZ = z;
				z = G*z2*z2*z2 + F*z2*z2*z + E*z2*z2 + D*z2*z + C*z2 + B*z;
				switch (fractalType) {
					case MANDELBROT:
						z += A*curPoint;
						break;
					case JULIA:
						z += A*mVar->c;
						break;
				}
				z2 = z * z;
			}
			if (texIter != NULL) {
				texIter[i][j] = *(unsigned short *)px = iter;
				if (mVar->color_scheme == 3 && iter == prev_iter && i > 0)
						iter = texIter[i-1][j];
			}
			getColor(prevZ, z, iter, prev_iter, px);
			prev_iter = iter;
		}
	}
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

void calcComplexFunction(int width, int height, rgb_t **tex, int screenFlags, int functionType, int colorScheme) {
 	int i, j, bottom, top, centerX, centerY;
	rgb_t *px;
	double complex a;
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
	centerX = (width) / 2; //Figure out where the origin is
	centerY = (top + bottom) / 2;
	
	for (i = bottom; i < top; i++) {
		px = tex[i];
		for (j = 0; j	< width; j++, px++) {
			a =  ((j - centerX) * mVar->zoomM + creal(mVar->centerC)) + ((i - centerY) * mVar->zoomM + cimag(mVar->centerC)) * I;
      px->r = 0;
      px->g = 0;
      px->b = 0;
			switch (functionType) {	
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
			switch(colorScheme) {
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
		}
	}
}
