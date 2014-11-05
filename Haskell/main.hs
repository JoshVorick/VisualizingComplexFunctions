import Graphics.UI.GLUT
import Data.IORef
import Bindings

main :: IO()
main = do
	(_progName, args) <- getArgsAndInitialize
	initialDisplayMode $= [DoubleBuffered]
	_window <- createWindow "OpenGL"
	reshapeCallback $= Just reshape
	xOffset <- newIORef 0
	yOffset <- newIORef 0
	zoom <- newIORef 1.0
	keyboardMouseCallback $= Just (keyboardMouse xOffset yOffset zoom)
	idleCallback $= Just idle
	displayCallback $= display xOffset yOffset zoom
	mainLoop
