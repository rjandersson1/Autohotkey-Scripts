toggle := 0
; Press F1 to show coordinates in a popup window and copy to clipboard
F1::
{
    MouseGetPos, x, y
    MsgBox, X: %x%, Y: %y%
    Clipboard := "x = " x ", y = " y ; concatenate x and y with a comma
    return
}


; Press F2 to toggle tooltip display of coordinates 
F2::
{
    if(!toggle)
    {
        Sleep 250       ; Delay to prevent loop from breaking too soon
        toggle := 1
        while(toggle)
        {
            WinGetClass, WinClass, A
            MouseGetPos, x, y
            Tooltip % (x "," y "," WinClass)
            if(GetKeyState("F2","P"))
            {
                toggle := 0
                Tooltip
                break
            }
        }
    }
    return
}

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
    
    ; Copy the process name to the clipboard if needed
    return
}

F4::
{
    MouseGetPos, x, y
    Clipboard := (x " " y)
    return
}