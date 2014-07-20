#include "calculations.h"

extern void getColor(double zx,double zy, double zx2, double zy2, int iter, int prev_iter, rgb_t *p);

void calcFractalSet(int width, int height, rgb_t **tex, int **texIter, int screenFlags, int fractalType) {
	int i, j, iter, prev_iter, bottom, top, centerX, centerY;
	rgb_t *px;
	double x, y, zx, zy, zx2, zy2;
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
		y = (i - centerY) * mVar->zoomM + mVar->cy/2;
		for (j = 0; j	< width; j++, px++) {
			x = (j - centerX) * mVar->zoomM + mVar->cx/2;
			iter = 0;
			
			if (fractalType == MANDELBROT) { //Saves time by calculating the Set's black center region efficiently
				zx = hypot(x - .25, y);
				if (x < zx - 2 * zx * zx + .25) iter = mVar->max_iter;
				if ((x + 1)*(x + 1) + y * y < 1/16) iter = mVar->max_iter;
 			}
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
