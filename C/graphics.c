#include "graphics.h"

extern void calcFractalSet(int w, int h, rgb_t **tex, int **texIter, int screenFlags, int fractalType);
extern void calcComplexFunction(int width, int height, rgb_t **tex, int screenFlags, int functionType);

void render()
{
	double	x = (double)mVar->width /mVar->tex_w,
		y = (double)mVar->height/mVar->tex_h;
 
	glClear(GL_COLOR_BUFFER_BIT);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);
 
	glBindTexture(GL_TEXTURE_2D, mVar->texture);
 
	glBegin(GL_QUADS);
 
	glTexCoord2f(0, 0); glVertex2i(0, 0);
	glTexCoord2f(x, 0); glVertex2i(mVar->width, 0);
	glTexCoord2f(x, y); glVertex2i(mVar->width, mVar->height);
	glTexCoord2f(0, y); glVertex2i(0, mVar->height);
 
	glEnd();
 
	glFlush();
	glFinish();
}

void alloc_tex()
{
	int i, ow = mVar->tex_w, oh = mVar->tex_h;
 
	for (mVar->tex_w = 1; mVar->tex_w < mVar->width;	mVar->tex_w <<= 1);
	for (mVar->tex_h = 1; mVar->tex_h < mVar->height; mVar->tex_h <<= 1);
 
	if (mVar->tex_h != oh || mVar->tex_w != ow)
		mVar->tex = (rgb_t**)realloc(mVar->tex, mVar->tex_h * mVar->tex_w * 3 + mVar->tex_h * sizeof(rgb_t*));
 
	for (mVar->tex[0] = (rgb_t *)(mVar->tex + mVar->tex_h), i = 1; i < mVar->tex_h; i++)
		mVar->tex[i] = mVar->tex[i - 1] + mVar->tex_w;
}

void set_texture() {
	printf("Rendering...\n");
	alloc_tex();
	switch (mVar->function) {
		case MANDEL_AND_JULIA:
			calcFractalSet(mVar->width, mVar->height, mVar->tex, mVar->texIter, TOP_HALF, MANDELBROT);
			calcFractalSet(mVar->width, mVar->height, mVar->tex, mVar->texIter, BOTTOM_HALF, JULIA);
			break;
		default:
			calcComplexFunction(mVar->width, mVar->height, mVar->tex, WHOLE_SCREEN, mVar->function);
	}

	glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, mVar->texture);
	glTexImage2D(GL_TEXTURE_2D, 0, 3, mVar->tex_w, mVar->tex_h,
		0, GL_RGB, GL_UNSIGNED_BYTE, mVar->tex[0]);
 
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
	render();
	printf("Done!\n");
}
 
void resize(int w, int h)
{
	printf("resize %d %d\n", w, h);
	mVar->width = w;
	mVar->height = h;
 
	glViewport(0, 0, w, h);
	glOrtho(0, w, 0, h, -1, 1);
	
	mVar->texIter = (int **)malloc(h * sizeof(int*));
	mVar->texIter = (int **)malloc(h * sizeof(int*));
	int i,j;
	for(i=0;i<h;i++){
		mVar->texIter[i] = (int *)malloc(w * sizeof(int));
	}

	for(i=0;i<h;i++)	 
		for(j=0;j<w;j++)
			mVar->texIter[i][j] = 0;

	set_texture();
}
