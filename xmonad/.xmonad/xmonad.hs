import XMonad
import XMonad.Hooks.DynamicLog

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch status bar:
myBar = "xmobar"
-- Same as set in .xmobarrc
barHeight = "25"

-- Custom PP (determines what is written to the bar):
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

-- Key binding to toggle gap for the bar:
toggleStrutsKey XConfig { XMonad.modMask = modMask } = (modMask, xK_b)

-- Main Config:
myConfig = defaultConfig { terminal = myTerminal, modMask = myMod, borderWidth = 3 }

-- Terminal:
myTerminal = "urxvt"

-- Mod Key:
myMod = mod4Mask --Super
