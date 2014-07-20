#include "main.h"

extern void render();
extern void alloc_tex();
extern void set_texture();
extern void resize(int w, int h);
extern void getColor(double zx, double zy, double zx2, double zy2, int iter, int prev_iter, rgb_t *p);
extern void updateColors();

void set_texture();

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
		if (mVar->function == MANDEL_AND_JULIA && mVar->color_scheme < 3) {
			updateColors();
			return;
		}
		break;

	case 'e':
		mVar->color_scheme = (mVar->color_scheme + 1) % 5;
		if (mVar->function == MANDEL_AND_JULIA && mVar->color_scheme < 3) {
			updateColors();
			return;
		}
		break;

	case 'w':
		mVar->function = (mVar->function + 1) % NUM_FUNCTIONS;
		mVar->cx = mVar->cy = 0;
		mVar->zoomM = 1./128;
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

void mouseclick(int button, int state, int x, int y) {
	if(state != GLUT_UP) 
		return; 

	if (mVar->function == MANDEL_AND_JULIA) {
		if(y < mVar->height/2){ //Mandelbrot is clicked
			mVar->cx += (x - mVar->width/2.) * mVar->zoomM;
			mVar->cy -= (y - mVar->height/4.) * mVar->zoomM;
			printf("c = %f + %fi\n", mVar->cx, mVar->cy);
		}
		else{ // Julia Set was clicked
			mVar->z1x += (x - mVar->width/2.) * mVar->zoomJ;
			mVar->z1y -= (y - 3*mVar->height/4.) * mVar->zoomJ;
			printf("z1 = %f + %fi\n", mVar->z1x, mVar->z1y);
		}
	} else {
		mVar->cx += (x - mVar->width/2.) * mVar->zoomM;
		mVar->cy -= (y - mVar->height/2.) * mVar->zoomM;
		printf("c = %f + %fi\n", mVar->cx, mVar->cy);
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
	mVar->function = MANDEL_AND_JULIA;
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
