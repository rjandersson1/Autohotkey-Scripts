﻿; Generated by AutoGUI 2.5.8
#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1

Gui Font, s18
Gui Add, Text, x0 y0 w1300 h100 +0x200 +Border +Center, Lightroom Negative Lab Pro Controller v0.1
Gui Font
Gui Add, Text, x650 y100 w3 h900 +0x1 +0x10
Gui Font, s14
Gui Add, Text, x0 y100 w650 h50 +0x200 +E0x200 +Center, Hotkeys and Functions
Gui Font
Gui Font, s14
Gui Add, Text, x650 y100 w650 h50 +E0x200 +Center, Settings
Gui Font
Gui Add, Text, x0 y150 w1300 h1 +0x10
Gui Font, s12
Gui Add, Text, x0 y151 w100 h50 +0x200 +Border, % " F1"
Gui Font
Gui Font, s12
Gui Add, Text, x152 y178 w500 h50 +0x200 +Border, Open Help Dialog
Gui Font
Gui Font, s12
Gui Add, Text, x0 y201 w100 h50 +0x200 +Border, % " F1"
Gui Font
Gui Font, s12
Gui Add, Text, x0 y250 w100 h50 +0x200 +Border, % " F1"
Gui Font
Gui Font, s12
Gui Add, Text, x0 y300 w100 h50 +0x200 +Border, % " F1"
Gui Font
Gui Font, s12
Gui Add, Text, x0 y350 w100 h50 +0x200 +Border, % " F1"
Gui Font
Gui Add, Text, x511 y618 w198 h2 +0x10
Gui Font, s12 Bold
Gui Add, Text, x358 y573 w120 h23 +0x200, Text is here
Gui Font

Gui Show, w1300 h1000, NLP Controller v0.1
Return

GuiEscape:
GuiClose:
    ExitApp
