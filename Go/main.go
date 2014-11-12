package main

import "fmt"
import "os"
import "strconv"
import "math/cmplx"

func main() {
	var pixh, pixw int
	var zoom float64
	var center complex128
	args := os.Args
	if len(args) > 2 {
		tempw, err := strconv.ParseInt(args[1], 10, 0)
		temph, err := strconv.ParseInt(args[2], 10, 0)
		if err != nil {
			fmt.Println("Please pass valid numbers as cmd arguments")
			return
		}
		pixw = int(tempw)
		pixh = int(temph)
	} else {
		pixh = 50
		pixw = 100
	}
	if len(args) > 3 {
		tempZoom, err := strconv.ParseFloat(args[3], 64)
		if err != nil {
			fmt.Println("Please pass valid numbers as cmd arguments")
			return
		}
		zoom = tempZoom
	} else {
		zoom = 4.0
	}
	if len(args) > 5 {
		tempX, err := strconv.ParseFloat(args[4], 64)
		tempY, err := strconv.ParseFloat(args[5], 64)
		if err != nil {
			fmt.Println("Please pass valid numbers as cmd arguments")
			return
		}
		center = complex(tempX, tempY)
	} else {
		center = complex(0 ,0)
	}
	zArr := make([][]complex128, pixw, pixw)
	for i:=0; i<pixw; i++ {
		zArr[i] = make([]complex128, pixh, pixh)
	}

	var input string
	var err error
	for {
		for y:=0; y<pixh; y++ {
			for x:=0; x<pixw; x++ {
				zx := zoom * float64(x)/(float64(pixw))
				zy := zoom * float64(y)/(float64(pixh))
				c := complex(zx, zy) + center - complex(0.5*zoom, 0.5*zoom)
				zArr[x][y] = iterate(c, 1024)
				//fmt.Println(c)
				if cmplx.Abs(zArr[x][y]) > 4 {
					fmt.Print("X")
				} else {
					fmt.Print(".")
				}
			}
			fmt.Println()
		}

		fmt.Println()
		fmt.Print("Please enter a command: ")
		_, err = fmt.Scanln(&input)
		if err != nil {
			continue
		}
		fmt.Println()

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
