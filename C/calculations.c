#include "calculations.h"

extern void getColor(double zx,double zy, double zx2, double zy2, int iter, int prev_iter, rgb_t *p);

void calc_mandel() {
	int i, j, iter, prev_iter;
	rgb_t *px;
	double x, y, zx, zy, zx2, zy2;
	for (i = mVar->height/2; i < mVar->height; i++) {
		px = mVar->tex[i];
		y = (i - 3*mVar->height/4) * mVar->zoomM + mVar->cy/2;
		for (j = 0; j	< mVar->width; j++, px++) {
			x = (j - mVar->width/2) * mVar->zoomM + mVar->cx/2;
			iter = 0;
 
			zx = hypot(x - .25, y);
			if (x < zx - 2 * zx * zx + .25) iter = mVar->max_iter;
			if ((x + 1)*(x + 1) + y * y < 1/16) iter = mVar->max_iter;
 
			zx = mVar->z1x;
			zy = mVar->z1y;
			zx2 = zx*zx;
			zy2 = zy*zy;
			for (; iter < mVar->max_iter && zx2 + zy2 < 4; iter++) {
				zy = G*(6*zx2*zx2*zx*zy - 20*zx2*zx*zy2*zy + 6*zx*zy2*zy2*zy) + F*(5*zx2*zx2*zy - 10*zx2*zy2*zy + zy2*zy2*zy) + E*(4*zx2*zx*zy - 4*zx*zy2*zy) + D*(3*zx2*zy - zy2*zy) + C*(2 * zx * zy) + B*zy + A*y;
				zx = G*(zx2*zx2*zx2 - 15*zx2*zx2*zy2 + 15*zx2*zy2*zy2 - zy2*zy2*zy2) + F*(zx2*zx2*zx - 10*zx2*zx*zy2 + 5*zx*zy2*zy2) + E*(zx2*zx2 - 6*zx2*zy2 + zy2*zy2) + D*(zx*zx2 - 3*zx*zy2) + C*(zx2 - zy2) + B*zx + A*x;
				zx2 = zx * zx;
				zy2 = zy * zy;
			}
			mVar->texIter[i][j] = *(unsigned short *)px = iter;
			if (mVar->color_scheme == 3) {
				if (iter == prev_iter && i > 0)
					iter = mVar->texIter[i-1][j];
			}
			getColor(zx, zy, zx2, zy2, iter, prev_iter, px);
			prev_iter = iter;
		}
	}
}

void calc_julia() {
	int i, j, iter, prev_iter;
	rgb_t *px;
	double x, y, zx, zy, zx2, zy2;
	for (i = 0; i < mVar->height/2; i++) {
		px = mVar->tex[i];
		y = (i - mVar->height/4) * mVar->zoomJ + mVar->z1y;
		for (j = 0; j	< mVar->width; j++, px++) {
			x = (j - mVar->width/2) * mVar->zoomJ + mVar->z1x;
			iter = 0;
 
			zx = x;
			zy = y;
			zx2 = zx*zx;
			zy2 = zy*zy;
			for (; iter < mVar->max_iter && zx2 + zy2 < 4; iter++) {
				zy = G*(6*zx2*zx2*zx*zy - 20*zx2*zx*zy2*zy + 6*zx*zy2*zy2*zy) + F*(5*zx2*zx2*zy - 10*zx2*zy2*zy + zy2*zy2*zy) + E*(4*zx2*zx*zy - 4*zx*zy2*zy) + D*(3*zx2*zy - zy2*zy) + C*(2 * zx * zy) + B*zy + A*mVar->cy/2;
				zx = G*(zx2*zx2*zx2 - 15*zx2*zx2*zy2 + 15*zx2*zy2*zy2 - zy2*zy2*zy2) + F*(zx2*zx2*zx - 10*zx2*zx*zy2 + 5*zx*zy2*zy2) + E*(zx2*zx2 - 6*zx2*zy2 + zy2*zy2) + D*(zx*zx2 - 3*zx*zy2) + C*(zx2 - zy2) + B*zx + A*mVar->cx/2;
				zx2 = zx * zx;
				zy2 = zy * zy;
			}
			mVar->texIter[i][j] = *(unsigned short *)px = iter;
			if (mVar->color_scheme == 3) {		//The iteration contours need to be test for going opposite way so that they're continuous
				if (iter == prev_iter && i > 0)
					iter = mVar->texIter[i-1][j];
			}
			getColor(zx, zy, zx2, zy2, iter, prev_iter, px);
			prev_iter = iter;
		}
	}
}
