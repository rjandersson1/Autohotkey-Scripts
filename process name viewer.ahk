F1::
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