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
		center = complex(-0.5 * zoom + tempX, -0.5 * zoom + tempY)
	} else {
		center = complex(-0.5 * zoom, -0.5 * zoom)
	}
	zArr := make([][]complex128, pixw, pixw)
	for i:=0; i<pixw; i++ {
		zArr[i] = make([]complex128, pixh, pixh)
	}

	for y:=0; y<pixh; y++ {
		for x:=0; x<pixw; x++ {
			zx := zoom * float64(x)/(float64(pixw))
			zy := zoom * float64(y)/(float64(pixh))
			c := complex(zx, zy) + center
			zArr[x][y] = iterate(c, 12800)
			//fmt.Println(c)
			if cmplx.Abs(zArr[x][y]) > 4 {
				fmt.Print("X")
			} else {
				fmt.Print(".")
			}
		}
		fmt.Println()
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
