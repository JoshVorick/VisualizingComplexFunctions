VisualizingComplexFunctions
===========================

You can view the Mandelbrot Set, Julia Sets, and other complex functions interactively and save the images to an arbitrarily large resolution png file (biggest I've tried was 10,000 x 10,000). I'll post some screenshots later.

This program uses OpenGL and libpng, so make sure you have them installed if you want it to work.

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
- Do something similar in Go, Mathematica, and Haskell!

Screenshots / sample output:
============================

| Mandelbrot Set | Julia Set |
| -------------- | --------- |
| ![screen3](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/mandelbrot0.png) | ![screen4](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/julia0.png) |
| ![screen3](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/mandelbrot1.png) | ![screen4](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/julia1.png) |
| ![screen3](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/mandelbrot2.png) | ![screen4](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/julia2.png) |
| ![screen3](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/mandelbrot3.png) | ![screen4](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/julia3.png) |
| ![screen3](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/mandelbrot4.png) | ![screen4](https://raw.githubusercontent.com/JoshVorick/VisualizingComplexFunctions/master/C/imgs/julia4.png) |
