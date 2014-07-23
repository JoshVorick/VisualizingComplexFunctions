#include "calculations.h"

extern void getColor(double zx,double zy, double zx2, double zy2, int iter, int prev_iter, rgb_t *p);
extern void hsv_to_rgb(double hue, double sat, double var, rgb_t *pixel);

void calcFractalSet(int width, int height, rgb_t **tex, int **texIter, int screenFlags, int fractalType) {
	int i, j, iter, prev_iter, bottom, top;
	//I need to think of less confusing names than 'center' and 'middle'
	int centerX, centerY; //Pixel coordinates of center (only changes based on width, height, and screenFlags)
	double middleX, middleY; //real and imaginary parts of the center point (only changes with clicking and zooming)
	rgb_t *px;
	double x, y, zx, zy, zx2, zy2, zoom;
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
			middleX = mVar->cx;
			middleY = mVar->cy; break;
		case JULIA:
			zoom = mVar->zoomJ;
			middleX = mVar->z1x;
			middleY = mVar->z1y; break;
	}	
	for (i = bottom; i < top; i++) {
		px = tex[i];
		y = (i - centerY) * zoom + middleY;
		for (j = 0; j	< width; j++, px++) {
			x = (j - centerX) * zoom + middleX;
			iter = 0;
			
			switch(fractalType) {
				case MANDELBROT:
					zx = mVar->z1x;
					zy = mVar->z1y; break;
				case JULIA:
					zx = x;
					zy = y; break;
			}
			zx2 = zx*zx;
			zy2 = zy*zy;
			for (; iter < mVar->max_iter && zx2 + zy2 < 4; iter++) {
				zy = G*(6*zx2*zx2*zx*zy - 20*zx2*zx*zy2*zy + 6*zx*zy2*zy2*zy) + F*(5*zx2*zx2*zy - 10*zx2*zy2*zy + zy2*zy2*zy) + E*(4*zx2*zx*zy - 4*zx*zy2*zy) + D*(3*zx2*zy - zy2*zy) + C*(2 * zx * zy) + B*zy;
				zx = G*(zx2*zx2*zx2 - 15*zx2*zx2*zy2 + 15*zx2*zy2*zy2 - zy2*zy2*zy2) + F*(zx2*zx2*zx - 10*zx2*zx*zy2 + 5*zx*zy2*zy2) + E*(zx2*zx2 - 6*zx2*zy2 + zy2*zy2) + D*(zx*zx2 - 3*zx*zy2) + C*(zx2 - zy2) + B*zx;
				switch (fractalType) {
					case MANDELBROT:
						zx += A*x;
						zy += A*y; break;
					case JULIA:
						zx += mVar->cx;
						zy += mVar->cy; break;
				}
				zx2 = zx * zx;
				zy2 = zy * zy;
			}
			if (texIter != NULL) {
				texIter[i][j] = *(unsigned short *)px = iter;
				if (mVar->color_scheme == 3 && iter == prev_iter && i > 0)
						iter = texIter[i-1][j];
			}
			getColor(zx, zy, zx2, zy2, iter, prev_iter, px);
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
    x = cool_function(x, a);
  }
	return x;
}

void calcComplexFunction(int width, int height, rgb_t **tex, int screenFlags, int functionType) {
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
			a =  ((j - centerX) * mVar->zoomM + mVar->cx) + ((i - centerY) * mVar->zoomM + mVar->cy) * I;
      px->r = 0;
      px->g = 0;
      px->b = 0;
			switch (functionType) {	
				case SINE: 
					hsv_to_rgb((PI + carg(csin(a)))/(2*PI), 0.99, 0.99, px); break;
				case TANGENT: 
					hsv_to_rgb((PI + carg(ctan(a)))/(2*PI), 0.99, 0.99, px); break;
				case COOL_FUNCTION: 
					hsv_to_rgb((PI + carg(coolFunction1(a, 10))/(2*PI)), 0.99, 0.99, px); break;
			}
		}
	}
}
