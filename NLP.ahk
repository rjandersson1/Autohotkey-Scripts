#IfWinActive, ahk_class AgWinMainFrame
;
;_____________________________________________________________________________________________
;.................................. Initialization ...........................................

; Toggle all functions
; TODO


; Toggle shift to click variable
toggle_shift_to_click := false

global val_scaling := 1    ; NLP window setting adjustment scaling amount (1, 2, 3, 4, 5)

;_____________________________________________________________________________________________
;................................ Function Definition ........................................

; Opens Negative Lab Pro (NLP) window
open_NLP()
{
    Send !f             ; [Alt + F] Opens file dropdown
    Send u              ; Select 'plug in extras...'
    Send {Right}        ; Open dropdown
    Send n              ; Select NLP
    return              ; End of function
}

open_metadata_time()
{
    Send !m
    Send t
    return
}

; Syncs two selected photos (photo a --> photo b) in NLP
sync_photos()
{
    MouseGetPos, x, y   ; Save original mouse position to return to later
    delay := 300        ; Delay amount [ms]
    open_NLP()          ; Open NLP windo
    Sleep, 100        ; Wait for window to open
    MouseMove, 100, 550
    Sleep 200
    Click     ; Click on Sync Photos button
    Sleep, 250        ; Delay to wait for mouse to move
    Loop, 4             ; Press tab 4x to select 'apply'
    {
        Send, {tab}
    }
    Send, {enter}       ; Close NLP
    ;deselect_reselect(x,y)
    Sleep 100
    MouseMove, x, y     ; Return mouse to original position
    return              ; End of function
}

; Deselects all and then reselects the photo over where the mouse was placed
deselect_reselect(x,y)
{
    delay := 50
    Sleep delay2
    Send, {Ctrl down}
    Sleep delay2*0.2
    Send, {d}
    Sleep delay2*0.2
    Send, {Ctrl up}
    Sleep delay2
    MouseMove, x, y
    Sleep delay2
    Click
    Sleep delay2            ; Delay so mouse move functions
}

; Function that left clicks upon pressing shift, if toggle is on. Else, sends shift as normal
dust_removal_click(on, down)
{
    if (on && down)
    {
        Click
        return
    }
    if (!on && down)
    {
        Send, {LShift down}
        return
    }
    if (!down)
    {
        Send, {Lshift up}
        return
    }
}

; Cycles through the list of values in NLP (sends tab twice to cycle down, shift+tab twice to cycle back)
list_move(val)
{
    if(val == "down")
    {
        Send, {tab}
        Send, {tab}
        return
    }
    if(val == "up")
    {
        Send, +{tab}
        Send, +{tab}
        return
    }
}

; Changes currently selected value in NLP by the amount scale in direction (sends up/down arrow key 'x' times)
change_value(direction, scale)
{
    if(direction == "plus")
    {
        Loop, %scale%
        {
            Send, {up}
        }
        return
    }
    if(direction == "minus")
    {
        Loop, %scale%
        {
            Send, {down}
        }
        return
    }
}

rotate_image(direction)
{
    if(direction == "left")
    {
        Send, ^{]}
        return
    }
    if(direction == "right")
    {
        Send, ^{[}
        return
    }
}

; Changes scaling factor for adjusting values in NLP. Toggles between fine adjustments (1) and large adjustments (5)
change_value_scaling(val)
{
    ;max_scaling := 5
    if(val == 5)
    {
        val_scaling := 1
        return
    }
    if(val == 1)
    {
        val_scaling := 5
        return
    }
}


;_____________________________________________________________________________________________
;................................ Hotkey Definition ..........................................

; Press [Ctrl + ,] to open NLP
^,::
{
    open_NLP()
}

; Press F1 to toggle shift to click
F1::
    toggle_shift_to_click := !toggle_shift_to_click
    Tooltip % (toggle_shift_to_click ? "ON" : "OFF")
    Sleep, 1000 ; Display tooltip for 1 second
    Tooltip
    return

; Press F2 to sync photo a to photo b
^.:: 
{
    sync_photos()
    Sleep, 10           ; Short delay for bugfix
    Send, {Lshift up}   ; I need this here because some {Lshift down} is stuck somewhere (TODO)
    return
}

; Press F3 to edit capture capture time
F3::
{
    open_metadata_time()
    return
}

; Press Left Shift to click mouse (for toggle shift to click = 1)
LShift::
{
    dust_removal_click(toggle_shift_to_click, true)     ; true: shift key pressed
    return
}

LShift Up::
{
    dust_removal_click(toggle_shift_to_click, false)    ; false: shift key released
    return
}


; [Ctrl + .] Opens NLP experimental
^/::
{
    open_NLP()
    MouseMove, 1875, 637
    Sleep 750
    Click
    Sleep 100
    return
}

; Rotates image left
]::
{
    rotate_image("left")
    return
}

; Rotates image right
[::
{
    rotate_image("right")
    return
}


; NLP window active functions (only compiles if window is active)
#IfWinActive ahk_class Afx:0000000140000000:0

;_____________________________________________________________________________________________
;.......................... Hotkey Definition in NLP Window....................................

=::
{
    change_value_scaling(val_scaling)
    return
}

[::
{
    change_value("minus", val_scaling)
    return
}

]::
{
    change_value("plus", val_scaling)
    return
}

'::
{
    list_move("up")
    return
}

\::
{
    list_move("down")
    return
}
#IfWinActive
#IfWinActive

