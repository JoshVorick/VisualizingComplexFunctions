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

complex_num multiply(complex_num a, complex_num b) {
  complex_num x = {0,0};
  x.x = a.x*b.x - a.y*b.y;
  x.y = a.x*b.y + a.y*b.x;
  return x;
}

complex_num divide(complex_num a, complex_num b) {
  complex_num conjugate = {b.x, -1*b.y};
  conjugate.x = b.x;
  conjugate.y = -1 * b.y;
  a = multiply(a, conjugate);
  b = multiply(b, conjugate);
  complex_num answer = {a.x / b.x, a.y / b.x};
  return answer;
}

complex_num square(complex_num a) {
  complex_num x = {0.0, 0.0};
  x.x = a.x*a.x - a.y*a.y;
  x.y = 2*a.x*a.y;
  return x;
}

complex_num sine(complex_num a) {
  complex_num x = {0,0};
  x.x = sin(a.x) * cosh(a.y);
  x.y = cos(a.x) * sinh(a.y);
  return x;
}

complex_num cosine(complex_num a) {
  complex_num x = {0,0};
  x.x = cos(a.x) * cosh(a.y);
  x.y = -1 * sin(a.x) * sinh(a.y);
  return x;
}

complex_num tangent(complex_num a) {
  complex_num x = divide(sine(a), cosine(a));
  return x;
}

complex_num exponential(complex_num a) {
  complex_num x = {0,0};
  x.x = exp(a.x) * cos(a.y);
  x.y = exp(a.x) * sin(a.y);
  return x;
}

complex_num cool_function(complex_num a, complex_num b) {
  //f(a,b) = a^2 + e^(a + b + sin(b) - tan(a))
  complex_num x = {0.0, 0.0};
  complex_num x1 = {0.0, 0.0};
  x = sine(b);
  x1 = tangent(a);
  x.x = a.x + b.x + x.x - x1.x;
  x.y = a.y + b.y + x.y - x1.y;
  x = exponential(x);
  x1 = square(a);
  x.x = x.x + x1.x;
  x.y = x.y + x1.y;
  return x;
}

void calc_sine(complex_num a, rgb_t *p) {
  complex_num x = sine(a);
  //double value = (a.x*a.x + a.y*a.y);
  hsv_to_rgb((atan2(x.y, x.x) + PI) / (2*PI), 0.99, 0.99, p);
}

void calc_tangent(complex_num a, rgb_t *p) {
  complex_num x = tangent(a);
  //double value = (a.x*a.x + a.y*a.y);
  hsv_to_rgb((atan2(x.y, x.x) + PI) / (2*PI), 0.99, 0.99, p);
}

void calc_cool_function(complex_num a, rgb_t *p) {
  complex_num x = a;
  int i;
  for (i=0; i<9; i++) {
    x = cool_function(x, a);
  }
  //double value = (x.x*x.x + x.y*x.y);
  hsv_to_rgb(atan2(x.y, x.x)/(2*PI), 0.99, 0.99, p);
}

void calcComplexFunction(int width, int height, rgb_t **tex, int screenFlags, int functionType) {
 	int i, j, bottom, top, centerX, centerY;
	rgb_t *px;
  complex_num x = {0.0, 0.0};
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
		x.y = (i - centerY) * mVar->zoomM + mVar->cy;
		for (j = 0; j	< width; j++, px++) {
			x.x = (j - centerX) * mVar->zoomM + mVar->cx;
      px->r = 0;
      px->g = 0;
      px->b = 0;
			switch (functionType) {	
				case SINE: calc_sine(x, px); break;
				case TANGENT: calc_tangent(x, px); break;
				case COOL_FUNCTION: calc_cool_function(x, px); break;
			}
		}
	}
}
