#IfWinActive, ahk_class "Afx:0000000180000000:b:0000000000010003:0000000000000000:0000000000292E59"

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#if (getkeystate("capslock", "t"))
{
    !LButton::MButton  ; Change Alt + Left Click to Middle Click
    ;^LButton::MButton  ; Change Ctrl + Left Click to Right Click
    +LButton::MButton  ; Change Shift + Left Click to Middle Click
}
#if

#IfWinActive