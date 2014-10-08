#include "colors.h"
 
extern void alloc_tex();
extern void render();

double modOne(double a) {
	return a - floor(a);
}

void hsv_to_rgb(double hue, double sat, double var, rgb_t *pixel)
{
	hue = modOne(hue);
	sat = modOne(sat);
	var = modOne(var);
	int h_i = (hue*6);
	double f = hue*6 - h_i;
	double p = var*(1-sat);
	double q = var*(1-f*sat);
	double t = var*(1-(1-f)*sat);

	switch (h_i) {
		case 0:
			pixel->r = (var*256);
			pixel->g = (t*256);
			pixel->b = (p*256);
			break;
		case 1:
			pixel->r = (q*256);
			pixel->g = (var*256);
			pixel->b = (p*256);
			break;
		case 2:
			pixel->r = (p*256);
			pixel->g = (var*256);
			pixel->b = (t*256);
			break;
		case 3:
			pixel->r = (p*256);
			pixel->g = (q*256);
			pixel->b = (var*256);
			break;
		case 4:
			pixel->r = (t*256);
			pixel->g = (p*256);
			pixel->b = (var*256);
			break;
		case 5:
			pixel->r = (var*256);
			pixel->g = (p*256);
			pixel->b = (q*256);
			break;
	}
}

void getSmoothedColor(double zx, double zy, double zx2, double zy2, rgb_t *p) {
	//Solve for point between (zx, zy) and (zx2, zy2) that lies on circle of radius 2
	double x1, x2; //Two solutions to intersection of line between points and circle
	double y1, y2; 
	
	double m = (zy2 - zy) / (zx2 - zx);
	double a = m*m + 1;
	double b = +2*m*zy - 2*m*m*zx;
	double c = -4 + m*m*zx*zx - 2*m*zx*zy + zy*zy;

	x1 = (-b + sqrt(b*b - 4*a*c)) / (2*a);
	x2 = (-b - sqrt(b*b - 4*a*c)) / (2*a);

	y1 = sqrt(4 - x1*x1);
	y2 = sqrt(4 - x2*x2);

	//decide which is between z and z2
	if ((zx2-x1)*(zx2-x1) + (zy2-y1)*(zy2-y1) < (zx2-x2)*(zx2-x2) + (zy2-y2)*(zy2-y2)) {
		hsv_to_rgb(atan2(y1, x1), .99, .99, p);
	}else {
		hsv_to_rgb(atan2(y2, x2), .99, .99, p);
	}
	/*double d1, d2, weight, x, y;
	//arg1 = atan2(zy,zx);
	//arg2 = atan2(zy2,zx2);
	d1 = (zx*zx + zy*zy);
	d2 = (zx2*zx2 + zy2*zy2);
	weight = (4 - d1) / (d2 - d1);
	x = weight*zx2 + (1-weight)*zx;
	y = weight*zy2 + (1-weight)*zy;
	//arg = weight*arg2 + (1 - weight)*arg1;
	
	hsv_to_rgb((PI + atan2(y,x)) / (2*PI), .99, .99, p);*/
}

void getColor(double zx, double zy, double zx2, double zy2, int iter, int prev_iter, rgb_t *p) {	
	switch(mVar->color_scheme) {
	case 0: //Blue and yellow colors (like wikipedia's mandelbrot)
		if(iter >= mVar->max_iter) {
			p->r = 0; p->g = 0; p->b = 0;
		}else {
			iter += mVar->color_rotate;
			switch(iter % 16) {
			case 0: p->r = 66;	p->g = 30;	p->b = 15;break;
			case 1: p->r = 25;	p->g = 7; 	p->b = 26;break;
			case 2: p->r = 9; 	p->g = 1; 	p->b = 47;break;
			case 3: p->r = 4; 	p->g = 4; 	p->b = 73;break;
			case 4: p->r = 0; 	p->g = 7; 	p->b = 100;break;
			case 5: p->r = 12;	p->g = 44;	p->b = 138;break;
			case 6: p->r = 24;	p->g = 82;	p->b = 177;break;
			case 7: p->r = 57;	p->g = 125;	p->b = 209;break;
			case 8: p->r = 134;	p->g = 181;	p->b = 229;break;
			case 9: p->r = 211;	p->g = 236;	p->b = 248;break;
			case 10:p->r = 241;	p->g = 233;	p->b = 191;break;
			case 11:p->r = 248;	p->g = 201;	p->b = 95;break;
			case 12:p->r = 255;	p->g = 170;	p->b = 0;break;
			case 13:p->r = 204;	p->g = 128;	p->b = 0;break;
			case 14:p->r = 153;	p->g = 87;	p->b = 0;break;
			default:p->r = 106;	p->g = 52;	p->b = 3;
			}
		}
		break;
	case 1: //Rainbow colors
		if(iter >= mVar->max_iter) {
			p->r = 0; p->g = 0; p->b = 0;
		}else {
			iter += mVar->color_rotate;
			switch(iter % 12) { 
			case 0: p->r = 255;	p->g = 0; 	p->b = 0;break;
			case 1: p->r = 255;	p->g = 127;	p->b = 0;break;
			case 2: p->r = 255;	p->g = 255;	p->b = 0;break;
			case 3: p->r = 127;	p->g = 255;	p->b = 0;break;
			case 4: p->r = 0; 	p->g = 255;	p->b = 0;break;
			case 5: p->r = 0; 	p->g = 255;	p->b = 127;break;
			case 6: p->r = 0; 	p->g = 255;	p->b = 255;break;
			case 7: p->r = 0; 	p->g = 127;	p->b = 255;break;
			case 8: p->r = 0; 	p->g = 0; 	p->b = 255;break;
			case 9: p->r = 127;	p->g = 0; 	p->b = 255;break;
			case 10:p->r = 255;	p->g = 0; 	p->b = 255;break;
			default:p->r = 255;	p->g = 0; 	p->b = 127;
			}
		}
		break;
	case 2: //Black and white!
		iter += mVar->color_rotate;
		p->r = p->g = p->b = (256.0 / mVar->max_iter) * iter;
		break;
	case 3: //Contour of iterations!
		if (iter != prev_iter) {
			iter += mVar->color_rotate*10;
			hsv_to_rgb(iter/(float)mVar->max_iter, 0.99, 0.99, p);
		} else {
			p->r = 0;
			p->g = 0;
			p->b = 0;
		}
		break;
	case 4: //Crazy hue party
		p->r = p->g = p->b = 0;
		getSmoothedColor(zx, zy, zx2, zy2, p);
		//hsv_to_rgb(atan2(zy, zx) / PI + mVar->color_rotate / 16.0, .99, (zx2 + zy2) / 4.0, p);
		break;
	}
}

void updateColors() {
	if (mVar->color_scheme > 2)
		return;

	alloc_tex(); 
	int i, j;
	rgb_t *px;
	for(i = 0; i < mVar->height; i++){
		for (j = 0, px = mVar->tex[i]; j	< mVar->width; j++, px++){
			getColor(0, 0, 0, 0, mVar->texIter[i][j], 0, px);
		}
	}
	glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, mVar->texture);
	glTexImage2D(GL_TEXTURE_2D, 0, 3, mVar->tex_w, mVar->tex_h,
		0, GL_RGB, GL_UNSIGNED_BYTE, mVar->tex[0]);

	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
	render();
}
