#IfWinActive, ahk_class AgWinMainFrame
;
;_____________________________________________________________________________________________
;.................................. Initialization ...........................................

; Toggle all functions
; TODO


; Toggle shift to click variable
toggle_shift_to_click := false

global val_scaling := 1    ; NLP window setting adjustment scaling amount (1, 2, 3, 4, 5)

global NLP_pos := 1

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

; List:
; --- top ---
; 1 = brightness
; 2 = contrast
; 3 = lights
; 4 = darks
; 5 = whites
; 6 = blacks
; --- skip ---
; 7 = hue
; 8 = strength
; --- skip ---
; 9 = color model
; --- bottom ---



; Cycles through the list of values in NLP (sends tab twice to cycle down, shift+tab twice to cycle back)
list_move(val, pos)
{
    if(val == "down")
    {
        if(pos < 6 || pos == 7)
        {
            list_increase(pos)
            return
        }
        if(pos == 6)
        {
            list_goto_hue(pos)
            return
        }
        if(pos == 8)
        {
            list_goto_color(pos)
            return
        }
        if(pos == 9)
        {
            return
        }
        return
    }
    if(val == "up")
    {
        if(pos == 1)
        {
            return
        }
        if(pos > 1 && pos != 7 && pos != 9)
        {
            list_decrease(pos)
            return
        }
        if(pos == 7)
        {
            list_goto_blacks(pos)
            return
        }
        if(pos == 9)
        {
            list_goto_strength(pos)
            return
        }
        return
    }
    return
}

list_increase(pos)
{
    Send, {tab}
    Send, {tab}
    NLP_pos := pos + 1
    tooltip % (NLP_pos)
    return
}

list_decrease(pos)
{
    Send, +{tab}
    Send, +{tab}
    NLP_pos := pos - 1
    tooltip % (NLP_pos)
    return
}

list_goto_hue(pos)
{
    ;MouseGetPos, x, y
    MouseMove, 275, 460
    Sleep, 10
    Click
    Click
    ;MouseMove, x, y
    NLP_pos := 7
    tooltip % (NLP_pos)
    return
}

list_goto_color(pos)
{
    loop, 4
    {
        Send, +{tab}
    }
    NLP_pos := 9
    tooltip % (NLP_pos)
    return
}

list_goto_strength(pos)
{
    loop, 4
    {
        Send, {tab}
    }
    NLP_pos := 8
    tooltip % (NLP_pos)
    return
}

list_goto_blacks(pos)
{
    loop, 7
    {
        Send, +{tab}
    }
    NLP_pos := 6
    tooltip % (NLP_pos)
    return
}


; Changes currently selected value in NLP by the amount scale in direction (sends up/down arrow key 'x' times)
change_value(direction, scale, pos)
{
    if(direction == "plus" && pos != 9)
    {
        Loop, %scale%
        {
            Send, {up}
        }
        return
    }
    if(direction == "minus" && pos != 9)
    {
        Loop, %scale%
        {
            Send, {down}
        }
        return
    }
    if(pos == 9)    ; Case for when adjusting colour: ensure scaling does not affect selection
    {
        if(direction == "plus")
        {
            Send, {up}
            return
        }
        if(direction == "minus")
        {
            Send, {down}
            return
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


; [Ctrl + /] Opens NLP experimental
^/::
{
    NLP_pos := 1            ; Sets menu position to 1 (brightness)
    open_NLP()              ; Opens NLP window
    Sleep 750
    MouseMove, 290, 154    ; Clicks on brightness value so that pressing tab cycles through menu
    Sleep 100
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

; Adjust NLP value adjustment scale (1x or 5x)
=::
{
    change_value_scaling(val_scaling)
    return
}

; Adjust NLP value (increase)
[::
{
    change_value("minus", val_scaling, NLP_pos)
    return
}

; Adjust NLP value (decrease)
]::
{
    change_value("plus", val_scaling, NLP_pos)
    return
}

; Move through NLP menu (up)
'::
{
    list_move("up", NLP_pos)
    return
}

; Move through NLP menu (down)
\::
{
    list_move("down", NLP_pos)
    return
}

; Apply NLP Settings
Enter::
{
    MouseMove, 190, 637
    Sleep 100
    Click
    return
}
#IfWinActive
#IfWinActive