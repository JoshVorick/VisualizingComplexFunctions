#include "main.h"

extern void render();
extern void alloc_tex();
extern void set_texture();
extern void resize(int w, int h);
extern void calcComplexFunction(int width, int height, rgb_t **tex, int** texIter, int screenFlags, int functionType);
//extern void getColor(complex double prevZ, complex double z, int iter, int prev_iter, rgb_t *p);
extern void updateColors();
extern void saveImage(int width, int height, rgb_t **tex, char *filename, int fileTpye);

void set_texture();
 
void saveAs(int fileType) {
	if (fileType == PNG) 
		printf("Saving as .png (Rendering %d pixels)\n", mVar->png_h * mVar->png_w);
	else
		printf("Saving as .ppm (Rendering %d pixels)\n", mVar->png_h * mVar->png_w);
	//Create arrays to load pixels into
	int i;
	rgb_t **tex;
	int **texIter;
	char filename[20] = {0};

	tex = (rgb_t**)malloc(sizeof(rgb_t*) * mVar->png_h);
	texIter = (int**)malloc(sizeof(int*) * mVar->png_h);
	for(i=0; i < mVar->png_h; i++) {
		tex[i] = (rgb_t*)malloc(sizeof(rgb_t) * mVar->png_w);
		texIter[i] = (int*)malloc(sizeof(int) * mVar->png_w);
	}

	switch (mVar->function) {
		case MANDEL_AND_JULIA:
			i = 0; // This statement does nothing but prevents a silly error
			// Adjust zoom so that the saved image will be approximately the
			// same as the displayed image, but of the corrext resolution.
			double tempZoomM = mVar->zoomM;
			double tempZoomJ = mVar->zoomJ;
			mVar->zoomM *= mVar->width / (double)mVar->png_w;
			mVar->zoomJ *= mVar->width / (double)mVar->png_w;
			calcComplexFunction(mVar->png_w, mVar->png_h, tex, texIter, WHOLE_SCREEN, MANDELBROT);
			sprintf(filename, "mandelbrot%i", mVar->imgCount);
			saveImage(mVar->png_w, mVar->png_h, tex, filename, fileType);
			printf("Image Saved as %s\n", filename);
			calcComplexFunction(mVar->png_w, mVar->png_h, tex, texIter, WHOLE_SCREEN, JULIA);
			sprintf(filename, "julia%i", mVar->imgCount);
			saveImage(mVar->png_w, mVar->png_h, tex, filename, fileType);
			mVar->zoomM = tempZoomM;
			mVar->zoomJ = tempZoomJ;
			printf("Image Saved as %s\n", filename);
			mVar->imgCount++;
			break;
		default:
			calcComplexFunction(mVar->png_w, mVar->png_h, tex, texIter, WHOLE_SCREEN, mVar->function);
			sprintf(filename, "complexfunction%i", mVar->imgCount);
			saveImage(mVar->png_w, mVar->png_h, tex, filename, fileType);
			printf("Image Saved as %s\n", filename);
			mVar->imgCount++;
	}

	for(i=0; i < mVar->png_h; i++) {
		free(tex[i]);
		free(texIter[i]);
	}
	free(tex);
	free(texIter);
}

void keypress(unsigned char key, int x, int y) {
	switch(key) {
	case 'q':	glFinish();
		free(mVar->texIter);
		free(mVar->tex);
		glutDestroyWindow(mVar->gwin);
		return;

	case 'a':
		if (mVar->function == MANDEL_AND_JULIA)
			mVar->zoomM /= 2;
		else
			mVar->zoomF /= 2;
		break;
	case 's':
		if (mVar->function == MANDEL_AND_JULIA)
			mVar->zoomM *= 2;
		else
			mVar->zoomF *= 2;
		break;

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

	case 'd':
		saveAs(PNG);
		return;
	case 'f':
		saveAs(PPM);
		return;
	}
	set_texture();
}

void mouseclick(int button, int state, int x, int y) {
	if(state != GLUT_UP) 
		return; 

	if (mVar->function == MANDEL_AND_JULIA) {
		if(y < mVar->height/2){ //Mandelbrot is clicked
			mVar->c += (x - mVar->width/2.) * mVar->zoomM - I*(y - mVar->height/4.) * mVar->zoomM;
			printf("c = %f + %fi\n", creal(mVar->c), cimag(mVar->c));
		}
		else{ // Julia Set was clicked
			mVar->z1 += (x - mVar->width/2.) * mVar->zoomJ - I*(y - 3*mVar->height/4.) * mVar->zoomJ;
			printf("z1 = %f + %fi\n", creal(mVar->z1), cimag(mVar->z1));
		}
	} else {
		mVar->centerC += (x - mVar->width/2.) * mVar->zoomM - I*(y - mVar->height/2.) * mVar->zoomM;
		printf("c = %f + %fi\n", creal(mVar->centerC), cimag(mVar->centerC));
	}

	set_texture();
}

void init(int c, char **v) {
	mVar = malloc(sizeof(mainVar));
	mVar->zoomM = 1./128;
	mVar->zoomJ = 1./128;
	mVar->zoomF = 1./128;
	mVar->c = 0 + 0*I;
	mVar->z1 = 0 + 0*I;
	mVar->centerC = 0 + 0*I;
	mVar->function = MANDEL_AND_JULIA;
	mVar->color_rotate = 0;
	mVar->color_scheme = 0;
	mVar->max_iter = 128;

	mVar->tex = NULL;
	mVar->texIter = NULL;

	mVar->oldHeight = 0;
	mVar->oldWidth = 0;
	mVar->height = 400;
	mVar->width = 200;
	mVar->tex_h = 1;
	mVar->tex_w = 1;

	mVar->png_w = 1920;
	mVar->png_h = 1080;
	mVar->imgCount = 0;

	switch (c) {
		case 4: mVar->imgCount = atoi(v[3]);
		case 3: mVar->png_h = atoi(v[2]);
		case 2:	mVar->png_w = atoi(v[1]);
	}

	glutInit(&c, v);
	glutInitDisplayMode(GLUT_RGB);
	glutInitWindowSize(mVar->width, mVar->height);
	glutDisplayFunc(render);
 
	mVar->gwin = glutCreateWindow("Mandelbrot");
 
	glutKeyboardFunc(keypress);
	glutMouseFunc(mouseclick);
	glutReshapeFunc(resize);
	glGenTextures(1, &mVar->texture);

	set_texture();
}

int main(int c, char **v) {
	printf("\nEquation:\n\tf(z) = %.2fz^5 + %.2fz^4 + %.2f*z^3 + %.2f*z^2 + %.2f*z^1 + %.2f*c\n",(float)F,(float)E,(float)D,(float)C,(float)B,(float)A);

	printf("keys:\n"
		"\ta,s: zoom Mandelbrot Set\n"
		"\tz,x: zoom Julia Set\n"
		"\tw: change generating function\n"
		"\te: change color theme\n"
		"\tr: rotate colors\n"
		"\td: save image as .png\n"
		"\tf: save image as .ppm\n"
		"\t<, >: decrease/increase max iteration\n"
		"\tq: quit\n"
		"\tclick to change intital values of c and z1\n\n");
 
	init(c, v);
	printf("\nImages will be dumped at %i x %i resolution\n\n",mVar->png_w, mVar->png_h);

	glutMainLoop();
	return 0;
}
