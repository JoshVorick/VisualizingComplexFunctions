package main

import "fmt"
import "math/cmplx"

func main() {
	width := 100
	height := 50
	zArr := make([][]complex128, height, height)
	for i:=0; i<height; i++ {
		zArr[i] = make([]complex128, width, width)
	}

	for i:=0; i<height; i++ {
		for j:=0; j<width; j++ {
			zArr[i][j] = iterate(4 * float64(i)/float64(height) - 2, 3 * float64(j)/float64(width) - 2, 1280)
			if cmplx.Abs(zArr[i][j]) > 4 {
				fmt.Print("+")
			} else {
				fmt.Print(" ")
			}
		}
		fmt.Println()
	}
}

func iterate(zy, zx float64, maxIter int) (z complex128) {
	c := complex(zx, zy)
	iter := 0
	for cmplx.Abs(z) < 4 && iter < maxIter {
		z = z*z + c
		iter++
	}
	return
}
