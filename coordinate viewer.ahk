; --- Auto-execute section: Display Hotkey Reminder GUI ---
Gui, Add, Text, x10 y10 w300 h100, Hotkeys and Functions:`n
(
F1: Show coordinates and copy them to the clipboard.
F2: Toggle tooltip display of coordinates.
F3: Copy active window class (and process info) to the clipboard.
F4: Copy current mouse coordinates to clipboard.
)
Gui, Add, Button, x+10 y+10 Default gCloseGUI, OK
Gui, Show, w350 h150, Hotkey Reminder
Return

CloseGUI:
Gui, Destroy
Return

; --- Hotkey Definitions ---
toggle := 0

; Press F1 to show coordinates in a popup window and copy to clipboard
F1::
{
    MouseGetPos, x, y
    MsgBox, X: %x%, Y: %y%
    Clipboard := "x = " x ", y = " y  ; concatenate x and y with a comma
    return
}

; Press F2 to toggle tooltip display of coordinates 
F2::
{
    if (!toggle)
    {
        Sleep 250       ; Delay to prevent loop from breaking too soon
        toggle := 1
        while (toggle)
        {
            WinGetClass, WinClass, A
            MouseGetPos, x, y
            Tooltip % (x "," y "," WinClass)
            if (GetKeyState("F2", "P"))
            {
                toggle := 0
                Tooltip
                break
            }
        }
    }
    return
}

; Press F3 to copy the active window's class to the clipboard
F3::
{
    ; Get the ID of the active window
    WinGet, active_id, ID, A
    
    ; Get the process ID based on the window ID
    WinGet, process_id, PID, %active_id%
    
    ; Get the process name based on the process ID
    Process, Exist, %process_id%
    ProcessName := %ErrorLevel%
    
    ; Get the class of the active window
    WinGetClass, WinClass, A
    
    Clipboard := WinClass

    ; Display the process name and class in a MsgBox
    MsgBox, ahk_class copied to clipboard: %WinClass%
    
    return
}

; Press F4 to copy the current mouse coordinates to the clipboard
F4::
{
    MouseGetPos, x, y
    Clipboard := (x " " y)
    return
}
