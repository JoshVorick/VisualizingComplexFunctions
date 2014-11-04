module Display (idle, display) where

import Graphics.UI.GLUT
import Data.Complex
import Control.Monad

display :: DisplayCallback
display = do
	clear [ColorBuffer]
	loadIdentity
	scale 0.5 0.5 (0.5::GLfloat)
	preservingMatrix $ do
		forM_ getMandelbrot $ \(iter, (x, y, z)) -> preservingMatrix $ do
			getColor iter
			renderPrimitive Points $ vertex $ Vertex3 x y z
	swapBuffers

idle :: IdleCallback
idle = do
	postRedisplay Nothing

getColor iter = case iter `mod` 6 of
	(0) -> color $ Color3 1 0 (0 :: GLfloat)
	(1) -> color $ Color3 1 1 (0 :: GLfloat)
	(2) -> color $ Color3 0 1 (0 :: GLfloat)
	(3) -> color $ Color3 0 1 (1 :: GLfloat)
	(4) -> color $ Color3 0 0 (1 :: GLfloat)
	(5) -> color $ Color3 1 0 (1 :: GLfloat)
	_ -> color $ Color3 1 1 (1 :: GLfloat)

getMandelbrot :: [(Int, (GLfloat, GLfloat, GLfloat))]
getMandelbrot = [((getIter 0 0 x y 0), (x, y, 0)) | x <- [-2, -1.995..2], y <- [-2, -1.995..2]]

getIter zx zy cx cy iter
	| iter >= 128 || (zx*zx + 2*zx*zy - zy*zy) > 4 = iter
	| otherwise = getIter (zx*zx - zy*zy + cx) (2*zx*zy + cy) cx cy (iter+1)
