VisualizingComplexFunctions
===========================

### Types of functions:
- **Mandelbrot Set** (z's starting value is determined by the center point of the Julia Set's plot. Moving around the Julia Set will therefore distort the Mandelbrot)
- **Julia Sets** (c is determined by the center point of the Mandelbrot's graph, so clicking around the Mandelbrot Set will change which Julia Set you are seeing)
- **Complex Sine**
- **Complex Tangent**
- **Other crazy complex functions** (Look at calculations.c to see what they are specifically)

### Manipulating the graphs
- **Zoom:** press '**a**' to zoom in, '**s**' to zoom out. For the Julia Set, use '**z**' and '**x**'
- **Recenter:** whenever you click, the image gets recentered to the point you clicked
- **Change Color Scheme:** press '**e**' to change the color scheme
- **Change Color Rotation:** press '**r**' to rotate the current colors
- **Change function:** press '**w**' to display a different function

### Saving images
- **As .png:** press '**d**'
- **As .ppm:** press '**f**'
- When starting the program you can specify the dimensions you want images to be save as. As far as I know, the dimensions can be arbitrarily big. Note, though, that bigger images take longer to render.

Setup
=====

First, make sure you have OpenGL and libpng installed.

To set the size you want your images to be saved as just put them as parameters when you run.

    ./Mandelbrot 1920 1080

If you don't want the program to overwrite images you already saved, tack on another parameter that's higher than the number of images you saved so far (This is the starting value for a counter that increments every time an image is saved).

    ./Mandelbrot 1920 1080 5

All the controls are printed in the terminal you run the program from.

Right now, it crashes if the 'correct' size isn't hard coded in correctly. To get around this run it once and write down the dimensions it prints when it crashes, then go into the code and edit line 432 to be the dimensions you wrote down and then recompile and run!

Feedback and pull requests are very welcome!

To be added:
============
- Draw non-iterative complex functions with multiple, cool color schemes (not just boring rainbows)
- Do something similar in Go, Java, Python, and Haskell!

Screenshots / sample output:
============================

| Mandelbrot Set | Julia Set |
| -------------- | --------- |
| ![screen0](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/mandelbrot0.png) | ![screen00](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/julia0.png) |
| ![screen1](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/mandelbrot1.png) | ![screen11](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/julia1.png) |
| ![screen2](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/mandelbrot2.png) | ![screen22](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/julia2.png) |
| ![screen3](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/mandelbrot3.png) | ![screen33](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/julia3.png) |
| ![screen4](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/mandelbrot4.png) | ![screen44](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/julia4.png) |
| ![screenGif](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/MandelbrotFast.gif) | ![screenGif2](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/JuliaFast.gif) |

Different color schemes:
========================

![screenCS](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/ColorSchemes.png)

Complex Functions:
==================

![screenA](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/complexfunction1.png)
![screenA](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/complexfunction3.png)
![screenA](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/complexfunction4.png)
![screenA](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/complexfunction5.png)
