import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders

-- "$": function application operator or "infix" application to avoid parenthesis e.g:
-- "xmonad $ def { .. }" could be "xmonad (def { .. })

-- =<< is the same as >>=, but with args interchanged (exchanging). >>= composes two actions, and any value produced by the first is an argument of the second action. =<< has type Monad.
-- http://hackage.haskell.org/package/base-4.6.0.1/docs/Prelude.html#v%3a-61--60--60-
-- http://hackage.haskell.org/package/base-4.6.0.1/docs/Prelude.html#v:-62--62--61-
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myTerminal = "alacritty"
myModMask = mod4Mask

-- The bar
myBar = "xmobar"

-- xmobar config

{-
  Configuration variables for xmobar.
  The settings here control the appearance of xmobar.
  Xmonad sends to xmobar with the DynamicLog hook.
-}
myCurrentWSLeft = "[" -- active workspace is wrapped
myCurrentWSRight = "]"

-- PP determines what is going to be written to bar
myPP = xmobarPP {
  ppCurrent = xmobarColor "#85C1E9" "" . wrap myCurrentWSLeft myCurrentWSRight
}

-- Key binding to toggle gap in bar
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Config for xmonad
myConfig = def {
  modMask = myModMask,
  terminal = myTerminal,
  borderWidth = 10,
  layoutHook = noBorders Full
}
