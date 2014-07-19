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

void set_texture();
void updateColors();
 
typedef struct {unsigned char r, g, b;} rgb_t;
rgb_t **tex = 0;
int **texIter;
int gwin;
GLuint texture;
int width, height;
int tex_w, tex_h;
int dump = 1;
double scaleM = 1./128, scaleJ = 1./128;
double cx = 0, cy = 0; //Initial calue for c in f(x) = z^2 + c 
double z1x = 0, z1y = 0;
int color_rotate = 0;
int color_scheme = 0;
int max_iter = 128;
 
void render()
{
	double	x = (double)width /tex_w,
		y = (double)height/tex_h;
 
	glClear(GL_COLOR_BUFFER_BIT);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);
 
	glBindTexture(GL_TEXTURE_2D, texture);
 
	glBegin(GL_QUADS);
 
	glTexCoord2f(0, 0); glVertex2i(0, 0);
	glTexCoord2f(x, 0); glVertex2i(width, 0);
	glTexCoord2f(x, y); glVertex2i(width, height);
	glTexCoord2f(0, y); glVertex2i(0, height);
 
	glEnd();
 
	glFlush();
	glFinish();
}

void screen_dump()
{
	char fn[100];
	int i;
	sprintf(fn, "screen%03d.ppm", dump++);
	FILE *fp = fopen(fn, "w");
	fprintf(fp, "P6\n%d %d\n255\n", width, height);
	for (i = height - 1; i >= 0; i--)
		fwrite(tex[i], 1, width * 3, fp);
	fclose(fp);
	printf("%s written\n", fn);
}
 
void keypress(unsigned char key, int x, int y)
{
	switch(key) {
	case 'q':	glFinish();
		int i;
		for(i=0; i<height; i++)
			free(texIter[i]);
		free(texIter);
		glutDestroyWindow(gwin);
		return;
	
	case 'a': scaleM /= 2; break;
	case 's': scaleM *= 2; break;
	case 'z': scaleJ /= 2; break;
	case 'x': scaleJ *= 2; break;

	case 27:	scaleM = scaleJ = 1./256; cx = -.6; cy = 0; break;
 
	case 'r':	
		color_rotate += 1;
		switch (color_scheme){
			case 0: color_rotate %= 16; break;
			case 1: color_rotate %= 12; break;
		}
		if (color_scheme < 3) {
			updateColors();
			return;
		}
		break;

	case 'e':
		color_scheme = (color_scheme + 1) % 5;
		if (color_scheme < 3) {
			updateColors();
			return;
		}
		break;

	case '>': case '.':
		max_iter += 128;
		if (max_iter > 1 << 15) 
			max_iter = 1 << 15;
		printf("max iter: %d\n", max_iter);
		break;
 
	case '<': case ',':
		max_iter -= 128;
		if (max_iter < 128) 
			max_iter = 128;
		printf("max iter: %d\n", max_iter);
		break;
 
	case 'd':	
		screen_dump(); 
		return;
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

double modOne(double a) {
	return a - floor(a);
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

void getColor(double zx, double zy, double zx2, double zy2, int iter, int prev_iter, rgb_t *p){
	
	switch(color_scheme){
	case 0: //Blue and yellow colors (like wikipedia's mandelbrot)
		if(iter >= max_iter) {
			p->r = 0; p->g = 0; p->b = 0;
		}else {
			iter += color_rotate;
			switch(iter % 16) {
			case 0: p->r = 66;	p->g = 30;	p->b = 15;break;
			case 1: p->r = 25;	p->g = 7;	 p->b = 26;break;
			case 2: p->r = 9;	 p->g = 1;	 p->b = 47;break;
			case 3: p->r = 4;	 p->g = 4;	 p->b = 73;break;
			case 4: p->r = 0;	 p->g = 7;	 p->b = 100;break;
			case 5: p->r = 12;	p->g = 44;	p->b = 138;break;
			case 6: p->r = 24;	p->g = 82;	p->b = 177;break;
			case 7: p->r = 57;	p->g = 125; p->b = 209;break;
			case 8: p->r = 134; p->g = 181; p->b = 229;break;
			case 9: p->r = 211; p->g = 236; p->b = 248;break;
			case 10:p->r = 241; p->g = 233; p->b = 191;break;
			case 11:p->r = 248; p->g = 201; p->b = 95;break;
			case 12:p->r = 255; p->g = 170; p->b = 0;break;
			case 13:p->r = 204; p->g = 128; p->b = 0;break;
			case 14:p->r = 153; p->g = 87;	p->b = 0;break;
			default:p->r = 106; p->g = 52;	p->b = 3;
			}
		}
		break;
	case 1: //Rainbow colors
		if(iter >= max_iter) {
			p->r = 0; p->g = 0; p->b = 0;
		}else {
			iter += color_rotate;
			switch(iter % 12) { 
			case 0: p->r = 255; p->g = 0;	 p->b = 0;break;
			case 1: p->r = 255; p->g = 127; p->b = 0;break;
			case 2: p->r = 255; p->g = 255; p->b = 0;break;
			case 3: p->r = 127; p->g = 255; p->b = 0;break;
			case 4: p->r = 0;	 p->g = 255; p->b = 0;break;
			case 5: p->r = 0;	 p->g = 255; p->b = 127;break;
			case 6: p->r = 0;	 p->g = 255; p->b = 255;break;
			case 7: p->r = 0;	 p->g = 127; p->b = 255;break;
			case 8: p->r = 0;	 p->g = 0;	 p->b = 255;break;
			case 9: p->r = 127; p->g = 0;	 p->b = 255;break;
			case 10:p->r = 255; p->g = 0;	 p->b = 255;break;
			default:p->r = 255; p->g = 0;	 p->b = 127;
			}
		}
		break;
	case 2: //Black and white!
		iter += color_rotate;
		p->r = p->g = p->b = (256.0 / max_iter) * iter;
		break;
	case 3: //Contour of iterations!
		if (iter != prev_iter) {
			iter += color_rotate*5;
			hsv_to_rgb(modOne(iter/(float)max_iter), 0.99, 0.99, p);
		} else {
			p->r = 0;
			p->g = 0;
			p->b = 0;
		}
		break;
	case 4: //Crazy hue party
		hsv_to_rgb(modOne(atan2(zy, zx) / PI + color_rotate / 16.0), 1, (zx2 + zy2) / 16.0, p);
		break;
	}
}

void calc_mandel()
{
	int i, j, iter, prev_iter;
	rgb_t *px;
	double x, y, zx, zy, zx2, zy2;
	for (i = height/2; i < height; i++) {
		px = tex[i];
		y = (i - 3*height/4) * scaleM + cy/2;
		for (j = 0; j	< width; j++, px++) {
			x = (j - width/2) * scaleM + cx/2;
			iter = 0;
 
			zx = hypot(x - .25, y);
			if (x < zx - 2 * zx * zx + .25) iter = max_iter;
			if ((x + 1)*(x + 1) + y * y < 1/16) iter = max_iter;
 
			zx = z1x;
			zy = z1y;
			zx2 = zx*zx;
			zy2 = zy*zy;
			for (; iter < max_iter && zx2 + zy2 < 4; iter++) {
				zy = G*(6*zx2*zx2*zx*zy - 20*zx2*zx*zy2*zy + 6*zx*zy2*zy2*zy) + F*(5*zx2*zx2*zy - 10*zx2*zy2*zy + zy2*zy2*zy) + E*(4*zx2*zx*zy - 4*zx*zy2*zy) + D*(3*zx2*zy - zy2*zy) + C*(2 * zx * zy) + B*zy + A*y;
				zx = G*(zx2*zx2*zx2 - 15*zx2*zx2*zy2 + 15*zx2*zy2*zy2 - zy2*zy2*zy2) + F*(zx2*zx2*zx - 10*zx2*zx*zy2 + 5*zx*zy2*zy2) + E*(zx2*zx2 - 6*zx2*zy2 + zy2*zy2) + D*(zx*zx2 - 3*zx*zy2) + C*(zx2 - zy2) + B*zx + A*x;
				zx2 = zx * zx;
				zy2 = zy * zy;
			}
			if(color_scheme < 3)
				texIter[i][j] = *(unsigned short *)px = iter;
			getColor(zx, zy, zx2, zy2, iter, prev_iter, px);
			prev_iter = iter;
		}
	}
}

void calc_julia()
{
	int i, j, iter, min, max, prev_iter;
	rgb_t *px;
	double x, y, zx, zy, zx2, zy2;
	min = max_iter; max = 0;
	for (i = 0; i < height/2; i++) {
		px = tex[i];
		y = (i - height/4) * scaleJ + z1y;
		for (j = 0; j	< width; j++, px++) {
			x = (j - width/2) * scaleJ + z1x;
			iter = 0;
 
			zx = x;
			zy = y;
			zx2 = zx*zx;
			zy2 = zy*zy;
			for (; iter < max_iter && zx2 + zy2 < 4; iter++) {
				zy = G*(6*zx2*zx2*zx*zy - 20*zx2*zx*zy2*zy + 6*zx*zy2*zy2*zy) + F*(5*zx2*zx2*zy - 10*zx2*zy2*zy + zy2*zy2*zy) + E*(4*zx2*zx*zy - 4*zx*zy2*zy) + D*(3*zx2*zy - zy2*zy) + C*(2 * zx * zy) + B*zy + A*cy/2;
				zx = G*(zx2*zx2*zx2 - 15*zx2*zx2*zy2 + 15*zx2*zy2*zy2 - zy2*zy2*zy2) + F*(zx2*zx2*zx - 10*zx2*zx*zy2 + 5*zx*zy2*zy2) + E*(zx2*zx2 - 6*zx2*zy2 + zy2*zy2) + D*(zx*zx2 - 3*zx*zy2) + C*(zx2 - zy2) + B*zx + A*cx/2;
				zx2 = zx * zx;
				zy2 = zy * zy;
			}
			if(color_scheme < 3)
				texIter[i][j] = *(unsigned short *)px = iter;
			getColor(zx, zy, zx2, zy2, iter, prev_iter, px);
			
			prev_iter = iter;
		}
	}
}

void alloc_tex()
{
	int i, ow = tex_w, oh = tex_h;
 
	for (tex_w = 1; tex_w < width;	tex_w <<= 1);
	for (tex_h = 1; tex_h < height; tex_h <<= 1);
 
	if (tex_h != oh || tex_w != ow)
		tex = realloc(tex, tex_h * tex_w * 3 + tex_h * sizeof(rgb_t*));
 
	for (tex[0] = (rgb_t *)(tex + tex_h), i = 1; i < tex_h; i++)
		tex[i] = tex[i - 1] + tex_w;
}
 
void set_texture()
{
	alloc_tex();
	calc_julia();
	calc_mandel();
 
	glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, texture);
	glTexImage2D(GL_TEXTURE_2D, 0, 3, tex_w, tex_h,
		0, GL_RGB, GL_UNSIGNED_BYTE, tex[0]);
 
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
	render();
}
 
void updateColors(){
	if (color_scheme > 2)
		return;

	alloc_tex(); 
	int i, j;
	rgb_t *px;
	for(i = 0; i < height; i++){
		for (j = 0, px = tex[i]; j	< width; j++, px++){
			getColor(0, 0, 0, 0, texIter[i][j], 0, px);
		}
	}
	glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, texture);
	glTexImage2D(GL_TEXTURE_2D, 0, 3, tex_w, tex_h,
		0, GL_RGB, GL_UNSIGNED_BYTE, tex[0]);
 
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
	render();
}
 
void mouseclick(int button, int state, int x, int y)
{
	if(state != GLUT_UP)//Only register Mouse up 
		return; 

	if(y < height/2){ //Mandelbrot is clicked
		cx += (x - width/2) * 2 * scaleM;
		cy -= (y - height/4) * 2 * scaleM;
		printf("c = %f + %fi\n", cx, cy);
	}
	else{ // Julia Set was clicked
		z1x += (x - width/2) * scaleJ;
		z1y -= (y - 3*height/4) * scaleJ;
		printf("z1 = %f + %fi\n", z1x, z1y);
	}
	set_texture();
}
 
void resize(int w, int h)
{
	printf("resize %d %d\n", w, h);
	width = w;
	height = h;
 
	glViewport(0, 0, w, h);
	glOrtho(0, w, 0, h, -1, 1);
	
	texIter = (int **)malloc(h * sizeof(int*));
	int i,j;
	for(i=0;i<h;i++){
		texIter[i] = (int *)malloc(w * sizeof(int));
	}

	for(i=0;i<h;i++)	 
		for(j=0;j<w;j++)
			texIter[i][j] = i*j;

	set_texture();
}
 
void init_gfx(int *c, char **v)
{
	glutInit(c, v);
	glutInitDisplayMode(GLUT_RGB);
	glutInitWindowSize(956,1041);
	glutDisplayFunc(render);
 
	gwin = glutCreateWindow("Mandelbrot");
 
	glutKeyboardFunc(keypress);
	glutMouseFunc(mouseclick);
	glutReshapeFunc(resize);
	glGenTextures(1, &texture);
	set_texture();
}
 
int main(int c, char **v)
{
	init_gfx(&c, v);
		
	printf("\nEquation:\n\tf(z) = %.2fz^5 + %.2fz^4 + %.2f*z^3 + %.2f*z^2 + %.2f*z^1 + %.2f*c\n",(float)F,(float)E,(float)D,(float)C,(float)B,(float)A);

	printf("keys:\n\ta,s: zoom Mandelbrot Set\n\tz,x: zoom Julia Set\n\t	r: color rotation\n\t	d: screen dump\n\t"
		"	<, >: decrease/increase max iteration\n\t	q: quit\n\t	mouse to change c and z1\n");
 
	glutMainLoop();
	return 0;
}
