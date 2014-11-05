module Display (idle, display) where

import Graphics.UI.GLUT
import Graphics.Rendering.OpenGL
import Data.IORef
import Control.Monad
import Foreign.C.Types

--display :: DisplayCallback
display xOffsetIOR yOffsetIOR zoomIOR = do
	xOffset <- get xOffsetIOR
	yOffset <- get yOffsetIOR
	zoom <-  get zoomIOR
	lineSmooth $= Enabled
	pointSmooth $= Enabled
	polygonSmooth $= Enabled
	clear [ColorBuffer]
	matrixMode $= Projection
	loadIdentity
	(_, Size xres yres) <- get viewport
	putStrLn $ show xres
	putStrLn $ show yres
	ortho2D 0 0 (fromIntegral xres) (fromIntegral yres)
	matrixMode $= Modelview 0
	loadIdentity
	preservingMatrix $ do
		forM_ (getMandelbrot (fromIntegral xres) (fromIntegral yres) xOffset yOffset zoom) $ \((zFinal, iter), (x, y)) -> preservingMatrix $ do
			getColorFromZ zFinal iter
			renderPrimitive Points $ vertex $ Vertex2 x y
	flush
	swapBuffers

idle :: IdleCallback
idle = do
	postRedisplay Nothing

color3f :: (GLfloat, GLfloat, GLfloat) -> IO()
color3f (r, g, b) = color $ Color3 r g b

getColorFromZ :: Foreign.C.Types.CFloat -> Int -> IO ()
getColorFromZ z iter = color3f $ hToRGB z iter

modOne :: Foreign.C.Types.CFloat -> Foreign.C.Types.CFloat
modOne x = x - ((fromIntegral . floor) x)

hToRGB :: Foreign.C.Types.CFloat -> Int -> (GLfloat, GLfloat, GLfloat)
hToRGB hVal iter = let
	h = (modOne ((logBase 2 $ log hVal) / 10 + ((CFloat $ fromIntegral iter) / 10))) * 6
	h_i = (fromIntegral . floor) h
	f = (h - h_i)
	p = CFloat 0
	q = (1 - f)
	t = (1 - (1 - f))
	in case h_i of
	(0) -> (1, t, p)
	(1) -> (q, 1, p)
	(2) -> (p, 1, t)
	(3) -> (p, q, 1)
	(4) -> (t, p, 1)
	(5) -> (1, p, q)
	_ -> (0, 0, 0)

getColor iter = case iter `mod` 6 of
	(0) -> color $ Color3 1 0 (0 :: GLfloat)
	(1) -> color $ Color3 1 1 (0 :: GLfloat)
	(2) -> color $ Color3 0 1 (0 :: GLfloat)
	(3) -> color $ Color3 0 1 (1 :: GLfloat)
	(4) -> color $ Color3 0 0 (1 :: GLfloat)
	(5) -> color $ Color3 1 0 (1 :: GLfloat)
	_ -> color $ Color3 1 1 (1 :: GLfloat)

--getMandelbrot :: (Ord a, Num a, Ord b, Fractional b, Enum b) => b -> b -> [((b, a), (b, b))]
getMandelbrot xres yres xOff yOff zoom = [((getIter 0 0 ((x/zoom) + xOff) ((y/zoom) + yOff) 0), ((x+0.5)*2/3, y*2/3)) | x <- [-2, (-2 + (3 / xres))..1], y <- [-1.5, (-1.5 + 3 / yres)..1.5]]

getIter :: (Ord a, Num a, Ord b, Num b) => a -> a -> a -> a -> b -> (a, b)
getIter zx zy cx cy iter
	| iter >= 256 || (zx*zx + 2*zx*zy - zy*zy) > 512 = ((zx*zx + 2*zx*zy - zy*zy), iter)
	| otherwise = getIter (zx*zx - zy*zy + cx) (2*zx*zy + cy) cx cy (iter+1)
