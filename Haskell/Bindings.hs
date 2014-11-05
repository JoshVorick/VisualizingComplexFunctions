module Bindings (idle, display, reshape, keyboardMouse) where

import Graphics.UI.GLUT
import Data.IORef
import Display

reshape :: ReshapeCallback
reshape size = do
	viewport $= (Position 0 0, size)

keyboardMouse :: IORef GLfloat -> IORef GLfloat -> IORef GLfloat -> KeyboardMouseCallback
keyboardMouse xOffset yOffset zoom key Down _ _ =
	case key of
	(Char 'a') -> zoom $~! (* 2)
	(Char 'd') -> zoom $~! (/ 2)
	(SpecialKey KeyLeft ) -> xOffset $~! (+ (-0.2))
	(SpecialKey KeyRight ) -> xOffset $~! (+ 0.2)
	(SpecialKey KeyDown ) -> yOffset $~! (+ (-0.2))
	(SpecialKey KeyUp ) -> yOffset $~! (+ 0.2)
	_ -> return ()
keyboardMouse _ _ _ _ _ _ _ = return ()
