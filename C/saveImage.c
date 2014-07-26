#include "saveImage.h"

void saveAsPNG(int width, int height, rgb_t **tex, char *filename) {
	FILE *fp;
	png_structp png_ptr;
	png_infop info_ptr;
	png_bytep row;
	
	// Open file for writing (binary mode)
	fp = fopen(filename, "wb");
	if (fp == NULL) {
		fprintf(stderr, "Could not open file %s for writing\n", filename);
		goto finalise;
	}

	// Initialize write structure
	png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
	if (png_ptr == NULL) {
		fprintf(stderr, "Could not allocate write struct\n");
		goto finalise;
	}

	// Initialize info structure
	info_ptr = png_create_info_struct(png_ptr);
	if (info_ptr == NULL) {
		fprintf(stderr, "Could not allocate info struct\n");
		goto finalise;
	}

	// Setup Exception handling
	if (setjmp(png_jmpbuf(png_ptr))) {
		fprintf(stderr, "Error during png creation\n");
		goto finalise;
	}

	png_init_io(png_ptr, fp);

	// Write header (8 bit colour depth)
	png_set_IHDR(png_ptr, info_ptr, width, height,
			8, PNG_COLOR_TYPE_RGB, PNG_INTERLACE_NONE,
			PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);

	// Set title
	//png_text title_text;
	//title_text.compression = PNG_TEXT_COMPRESSION_NONE;
	//title_text.key = "Title";
	//title_text.text = "Colorful image";
	//png_set_text(png_ptr, info_ptr, &title_text, 1);
	
	png_write_info(png_ptr, info_ptr);

	// Allocate memory for one row (3 bytes per pixel - RGB)
	row = (png_bytep) malloc(3 * width * sizeof(png_byte));

	// Write image data
	int x, y;
	for (y=height-1 ; y>=0 ; y--) {
		for (x=0 ; x<width-1 ; x++) {
			row[x*3 + 0] = tex[y][x].r;
			row[x*3 + 1] = tex[y][x].g;
			row[x*3 + 2] = tex[y][x].b;
		}
		png_write_row(png_ptr, row);
	}

	// End write
	png_write_end(png_ptr, NULL);

	finalise:
	if (fp != NULL) fclose(fp);
	if (info_ptr != NULL) png_free_data(png_ptr, info_ptr, PNG_FREE_ALL, -1);
	if (png_ptr != NULL) png_destroy_write_struct(&png_ptr, (png_infopp)NULL);
	if (row != NULL) free(row);
}

void saveAsPPM(int width, int height, rgb_t **tex, char *filename) {
	int i;
	FILE *fp = fopen(filename, "wb");
	fprintf(fp, "P6\n%d %d\n255\n", width, height);
	for (i = height - 1; i >= 0; i--)
		fwrite(tex[i], 1, width * 3, fp);
	fclose(fp);
}

void saveImage(int w, int h, rgb_t **tex, char *filename, int fileType) {
	if (fileType == PNG) {
		saveAsPNG(w, h, tex, strcat(filename, ".png"));
	} else {
		saveAsPPM(w, h, tex, strcat(filename, ".ppm"));
	}
}
