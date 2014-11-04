import Graphics.UI.GLUT
import Bindings

main :: IO()
main = do
	(_progName, args) <- getArgsAndInitialize
	initialDisplayMode $= [DoubleBuffered]
	_window <- createWindow "OpenGL"
	reshapeCallback $= Just reshape
	keyboardMouseCallback $= Just keyboardMouse
	idleCallback $= Just idle
	displayCallback $= display
	mainLoop
