#include "main.h"

extern void render();
extern void alloc_tex();
extern void set_texture();
extern void resize(int w, int h);

void set_texture();
void updateColors();

void keypress(unsigned char key, int x, int y) {
	switch(key) {
	case 'q':	glFinish();
		int i;
		for(i=0; i<mVar->height; i++)
			free(mVar->texIter[i]);
		free(mVar->texIter);
		glutDestroyWindow(mVar->gwin);
		return;
	
	case 'a': mVar->zoomM /= 2; break;
	case 's': mVar->zoomM *= 2; break;
	
	case 'z': mVar->zoomJ /= 2; break;
	case 'x': mVar->zoomJ *= 2; break;

	case 'r':	
		mVar->color_rotate += 1;
		switch (mVar->color_scheme){
			case 0: mVar->color_rotate %= 16; break;
			case 1: mVar->color_rotate %= 12; break;
		}
		if (mVar->color_scheme < 3) {
			updateColors();
			return;
		}
		break;

	case 'e':
		mVar->color_scheme = (mVar->color_scheme + 1) % 5;
		if (mVar->color_scheme < 3) {
			updateColors();
			return;
		}
		//clear screen
		break;

	case '>': case '.':
		mVar->max_iter += 128;
		if (mVar->max_iter > 1 << 15) 
			mVar->max_iter = 1 << 15;
		printf("max iter: %d\n", mVar->max_iter);
		break;
 
	case '<': case ',':
		mVar->max_iter -= 128;
		if (mVar->max_iter < 128) 
			mVar->max_iter = 128;
		printf("max iter: %d\n", mVar->max_iter);
		break;
	}
	set_texture();
}
 
void hsv_to_rgb(float hue, float sat, float var, rgb_t *pixel)
{
	int h_i = (hue*6);
	float f = hue*6 - h_i;
	float p = var*(1-sat);
	float q = var*(1-f*sat);
	float t = var*(1-(1-f)*sat);

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
	double b = 2*m*zy - 2*m*m*zx;
	double c = -4 + m*m*zx*zx - 2*m*zx*zy + zy*zy;

	x1 = (-1*b + sqrt(b*b - 4*a*c)) / (2*a);
	x2 = (-1*b - sqrt(b*b - 4*a*c)) / (2*a);
	
	y1 = sqrt(4 - x1);
	y2 = sqrt(4 - x2);

	//decide which is between z and z2
 if ((zx2-x1)*(zx2-x1) + (zy2-y1)*(zy2-y1) < (zx2-x2)*(zx2-x2) + (zy2-y2)*(zy2-y2)) {
		hsv_to_rgb((atan2(y1, x1) + PI) / (2*PI) + 0.3, 1, 1, p);
	}else {
		hsv_to_rgb((atan2(y2, x2) + PI) / (2*PI), 1, 1, p);
	}
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
			case 1: p->r = 25;	p->g = 7;		p->b = 26;break;
			case 2: p->r = 9; 	p->g = 1;		p->b = 47;break;
			case 3: p->r = 4; 	p->g = 4;		p->b = 73;break;
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
			case 4: p->r = 0;		p->g = 255;	p->b = 0;break;
			case 5: p->r = 0;		p->g = 255;	p->b = 127;break;
			case 6: p->r = 0;		p->g = 255;	p->b = 255;break;
			case 7: p->r = 0;		p->g = 127;	p->b = 255;break;
			case 8: p->r = 0;		p->g = 0; 	p->b = 255;break;
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
			iter += mVar->color_rotate*5;
			hsv_to_rgb(iter/(float)mVar->max_iter, 0.99, 0.99, p);
		} else {
			p->r = 0;
			p->g = 0;
			p->b = 0;
		}
		break;
	case 4: //Crazy hue party
		hsv_to_rgb(atan2(zy, zx) / PI + mVar->color_rotate / 16.0, 1, (zx2 + zy2) / 16.0, p);
		break;
	}
}

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
 
void mouseclick(int button, int state, int x, int y) {
	if(state != GLUT_UP) 
		return; 

	if(y < mVar->height/2){ //Mandelbrot is clicked
		mVar->cx += (x - mVar->width/2) * 2 * mVar->zoomM;
		mVar->cy -= (y - mVar->height/4) * 2 * mVar->zoomM;
		printf("c = %f + %fi\n", mVar->cx, mVar->cy);
	}
	else{ // Julia Set was clicked
		mVar->z1x += (x - mVar->width/2) * mVar->zoomJ;
		mVar->z1y -= (y - 3*mVar->height/4) * mVar->zoomJ;
		printf("z1 = %f + %fi\n", mVar->z1x, mVar->z1y);
	}
	set_texture();
}

void init(int *c, char **v) {
	mVar = malloc(sizeof(mainVar));
	mVar->zoomM = 1./128;
	mVar->zoomJ = 1./128;
	mVar->zoomF = 1./128;
	mVar->cx = 0;
	mVar->cy = 0;
	mVar->z1x = 0;
	mVar->z1y = 0;
	mVar->color_rotate = 0;
	mVar->color_scheme = 0;
	mVar->max_iter = 128;
	
	glutInit(c, v);
	glutInitDisplayMode(GLUT_RGB);
	glutInitWindowSize(956, 1041);
	glutDisplayFunc(render);
 
	mVar->gwin = glutCreateWindow("Mandelbrot");
 
	glutKeyboardFunc(keypress);
	glutMouseFunc(mouseclick);
	glutReshapeFunc(resize);
	glGenTextures(1, &mVar->texture);
	set_texture();
}

int main(int c, char **v) {
	init(&c, v);
		
printf("a\n");
	printf("\nEquation:\n\tf(z) = %.2fz^5 + %.2fz^4 + %.2f*z^3 + %.2f*z^2 + %.2f*z^1 + %.2f*c\n",(float)F,(float)E,(float)D,(float)C,(float)B,(float)A);

	printf("keys:\n"
		"\ta,s: zoom Mandelbrot Set\n"
		"\tz,x: zoom Julia Set\n"
		"\te: change color theme\n"
		"\tr: rotate colors\n"
		"\t<, >: decrease/increase max iteration\n"
		"\tq: quit\n"
		"\tclick to change intital values of c and z1\n\n");
 
	glutMainLoop();
	return 0;
}
