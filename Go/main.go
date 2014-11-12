package main

import "fmt"
import "os"
import "strconv"
import "math/cmplx"
import "golang.org/x/crypto/ssh/terminal"

func main() {
	var pixh, pixw int
	var zoom float64
	var center complex128
	var err error

	// Get cmd line arguments
	// format: ./main zoom centerx centery
	args := os.Args
	// Parse arugments for zoom
	if len(args) > 1 {
		zoom, err = strconv.ParseFloat(args[1], 64)
		if err != nil {
			fmt.Println("Please pass valid numbers as cmd arguments")
			return
		}
	} else {
		zoom = 4.0
	}
	// Parse arguments for center
	if len(args) > 3 {
		var tempX, tempY float64
		tempX, err = strconv.ParseFloat(args[2], 64)
		tempY, err = strconv.ParseFloat(args[3], 64)
		if err != nil {
			fmt.Println("Please pass valid numbers as cmd arguments")
			return
		}
		center = complex(tempX, tempY)
	} else {
		center = complex(0 ,0)
	}

	// main loop
	var input string
	for {

		// Get terminal size, set pixw and pixh accordingly
		pixw, pixh, err = terminal.GetSize(0)
		if err != nil {
			panic(err)
		}

		// Create zArr to be the size of the terminal
		zArr := make([][]complex128, pixw, pixw)
		for i:=0; i<pixw; i++ {
			zArr[i] = make([]complex128, pixh, pixh)
		}

		// Calculate mandelbrot for all point
		for y:=0; y<pixh; y++ {
			for x:=0; x<pixw; x++ {
				cx := zoom * float64(x)/(float64(pixw))
				cy := zoom * float64(y)/(float64(pixh))
				c := complex(cx, cy) + center - complex(0.5*zoom, 0.5*zoom) // '- complex(0.5*zoom, 0.5*zoom) offsets center to be the bottom left pixel
				// figure out behavior of z at this value of c and print it
				zArr[x][y] = iterate(c, 1024)
				if cmplx.Abs(zArr[x][y]) > 4 {
					fmt.Print("X")
				} else {
					fmt.Print(".")
				}
			}
			fmt.Println()
		}

		// Get user input
		fmt.Println()
		fmt.Print("Please enter a command: ")
		_, err = fmt.Scanln(&input)
		if err != nil {
			continue
		}
		fmt.Println()

		// Process input
		switch input {
		default:
			fmt.Println("unrecognized command. Please enter 'zoom in', 'zoom out', 'up', 'down', 'left', or 'right'")
		case "zoom in", "zoom", "+", "a", "z":
			zoom /= 2
		case "zoom out", "-", "s", "x":
			zoom *= 2
		case "left", "l", "<":
			center -= complex(zoom/3, 0)
		case "right", "r", ">":
			center += complex(zoom/3, 0)
		case "up", "u", "8", "^":
			center -= complex(0, zoom/3)
		case "down", "d", "2":
			center += complex(0, zoom/3)
		}
	}
}

func iterate(c complex128, maxIter int) (z complex128) {
	iter := 0
	for cmplx.Abs(z) < 4 && iter < maxIter {
		z = z*z + c
		iter++
	}
	return
}
