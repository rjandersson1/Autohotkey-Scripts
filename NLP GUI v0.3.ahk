﻿; Generated by AutoGUI 2.5.8
#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1

Gui Add, Text, x0 y1 w1299 h99 +0x200 +Border +Center , Lightroom Negative Lab Pro Controller v0.1
Gui Add, Text, x650 y100 w2 h913 +0x1 +0x10  
Gui Add, Text, x0 y100 w650 h50 +0x200 +E0x200 +Center , Hotkeys and Functions
Gui Add, Text, x650 y100 w650 h50 +0x200 +E0x200 +Center , Settings
Gui Add, Text, x0 y150 w1298 h2 +0x10  
Gui Add, Text, x0 y151 w100 h50 +0x200 , % " F1"
Gui Add, Text, x0 y200 w100 h50 +0x200 , % " F2"
Gui Add, Text, x0 y250 w100 h50 +0x200 , % " Ctrl + ,"
Gui Add, Text, x0 y300 w100 h50 +0x200 , % " Ctrl + ."
Gui Add, Text, x0 y350 w100 h50 +0x200 , % " Ctrl + /"
Gui Add, Text, x0 y400 w100 h50 +0x200 , % " Ctrl + m"
Gui Add, Text, x0 y450 w100 h50 +0x200 , % "  -"
Gui Add, Text, x0 y500 w100 h50 +0x200 , % "  q"
Gui Add, Text, x150 y151 w500 h50 +0x200 , Open help dialog
Gui Add, Text, x150 y200 w500 h50 +0x200 , Toggle TOGGLE
Gui Add, Text, x150 y250 w500 h50 +0x200 , Open NLP window
Gui Add, Text, x150 y300 w500 h50 +0x200 , Sync NLP settings from photo A to photo B
Gui Add, Text, x150 y350 w500 h50 +0x200 , Open NLP controller
Gui Add, Text, x150 y400 w500 h50 +0x200 , Open capture time metadata
Gui Add, Text, x150 y450 w500 h50 +0x200 , Create virtual copy
Gui Add, Text, x150 y500 w500 h50 +0x200 , Toggle TOGGLE
Gui Add, Text, x0 y550 w650 h30 +0x200 +E0x200 , % " While TOGGLE is ON:"
Gui Add, Text, x0 y580 w500 h50 +0x200 , % " Left Shift"
Gui Add, Text, x0 y630 w500 h50 +0x200 , % " [ or ]"
Gui Add, Text, x0 y680 w500 h50 +0x200 , % " w/a/s/d"
Gui Add, Text, x150 y580 w500 h50 +0x200 , Press to left click
Gui Add, Text, x150 y630 w500 h50 +0x200 , Rotate image left/right
Gui Add, Text, x150 y680 w500 h50 +0x200 , Pan around image (up/down/left/right)
Gui Add, Text, x0 y730 w650 h30 +0x200 +E0x200 , % " While NLP controller window is active:"
Gui Add, Text, x0 y760 w500 h50 +0x200 , % " ="
Gui Add, Text, x0 y810 w500 h50 +0x200 , % " [ or ]"
Gui Add, Text, x0 y860 w500 h50 +0x200 , % " '"
Gui Add, Text, x0 y910 w500 h50 +0x200 , % " \"
Gui Add, Text, x0 y960 w500 h50 +0x200 , % " ENTER"
Gui Add, Text, x150 y760 w500 h50 +0x200 , Change adjustment scaling between 1x and 5x
Gui Add, Text, x150 y810 w500 h50 +0x200 , Increase/decrease value
Gui Add, Text, x150 y860 w500 h50 +0x200 , Move UP through NLP menu
Gui Add, Text, x150 y910 w500 h50 +0x200 , Move DOWN through NLP menu
Gui Add, Text, x150 y960 w500 h50 +0x200 , Apply NLP settings

Gui Show, w1300 h1010, NLP Controller v0.1
Return

GuiEscape:
GuiClose:
    ExitApp
