; Create GUI
Gui, New, +AlwaysOnTop, Hotkey Readme
Gui, Add, Text,, Here are the hotkeys and their functions:

; List hotkeys and descriptions
Gui, Add, Text,, F1: Opens Help
Gui, Add, Text,, Ctrl+R: Refresh the page
Gui, Add, Text,, Alt+S: Save the current document

; Add buttons to set A
Gui, Add, Button, gSetAOne, Set A to 1
Gui, Add, Button, gSetATwo, Set A to 2

; Add a close button
Gui, Add, Button, Default gCloseGui, Close

; Show the GUI
Gui, Show, w300 h250, Hotkey Readme  ; Adjusted height to accommodate new buttons
Return  ; End of auto-execute section

; Event handler for Set A to 1 button
SetAOne:
    A := 1
    MsgBox, A is set to %A%.
Return

; Event handler for Set A to 2 button
SetATwo:
    A := 2
    MsgBox, A is set to %A%.
Return

; Event handler for Close button
CloseGui:
    Gui, Destroy
    ExitApp
Return

; The script will stay active waiting for GUI events.