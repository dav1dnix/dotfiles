import XMonad
import XMonad.Hooks.DynamicLog -- Used with xmobar
import XMonad.Layout.NoBorders -- Remove window borders (they ugly af)
import XMonad.Util.EZConfig -- easy configuration of modkeys etc
import XMonad.Layout.Spacing -- window gaps

-- "$": function application operator or "infix" application to avoid parenthesis e.g:
-- "xmonad $ def { .. }" could be "xmonad (def { .. })

-- =<< is the same as >>=, but with args interchanged (exchanging). >>= composes two actions, and any value produced by the first is an argument of the second action. =<< has type Monad.
-- http://hackage.haskell.org/package/base-4.6.0.1/docs/Prelude.html#v%3a-61--60--60-
-- http://hackage.haskell.org/package/base-4.6.0.1/docs/Prelude.html#v:-62--62--61-
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myTerminal = "rxvt-unicode"  -- "WINIT_X11_SCALE_FACTOR=1 alacritty"
myModMask = mod4Mask

mySpacing = spacingRaw 
  False
  (Border 10 10 10 10)
  True
  (Border 10 10 10 10)
  True

myLayoutHook = mySpacing $ noBorders $ layoutHook def

-- The bar
myBar = "xmobar"

-- xmobar config

{-
  Configuration variables for xmobar.
  The settings here control the appearance of xmobar.
  Xmonad sends to xmobar with the DynamicLog hook.
-}
myTitleColour = "#85C1E9"

-- PP determines what is going to be written to bar
myPP = xmobarPP {
  ppCurrent = xmobarColor myTitleColour "" . wrap "" "",
  ppLayout = const "", -- disable layout info
  ppTitle = xmobarColor myTitleColour "",
  ppSep = " - "
}

-- Key binding to toggle gap in bar
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)


-- Key bindings
myKeys = [
 ((myModMask, xK_d), spawn "dmenu_run"), -- dmenu
 ((myModMask, xK_Return), spawn myTerminal), -- I prefer this over mod+Shift+Return because less keys = easier
 ((myModMask, xK_Print), spawn "gnome-screenshot -acf /tmp/tmp.png && cat /tmp/tmp.png | xclip -i -selection clipboard -target image/png"), -- Take a screenshot of an area.
 ((0, 0x1008ff11), spawn "amixer -q sset Master 1%-"),
 ((0, 0x1008ff13), spawn "amixer -q sset Master 1%+"),
 ((0, 0x1008ff12), spawn "amixer set Master toggle")
 ]

-- Config for xmonad
myConfig = def {
  modMask = myModMask,
  terminal = myTerminal,
  layoutHook = myLayoutHook,
  workspaces = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "-", "="]
} `additionalKeys` myKeys
