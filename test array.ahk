global coords := []            ; Initialize the main array
coords[1] := []         ; Initialize the sub-array for laptop mode
coords[2] := []         ; Initialize the sub-array for PC mode
coords[3] := []

SetMouseDelay, 100

; Define laptop coordinates
coords[1].Push({"x": 290, "y": 154})
coords[1].Push({"x": 725, "y": 460})
coords[1].Push({"x": 190, "y": 637})
coords[1].Push({"x": 100, "y": 550})

; Define PC coordinates
coords[2].Push({"x": 427, "y": 222})
coords[2].Push({"x": 344, "y": 814})
coords[2].Push({"x": 392, "y": 1210})
coords[2].Push({"x": 187, "y": 1050})

; Define PC vetical coordinates
coords[3].Push({"x": 432, "y": 225}) ; open NLP: click on brightness 
coords[3].Push({"x": 412, "y": 691}) ; click on hue
coords[3].Push({"x": 316, "y": 955}) ; click on apply
coords[3].Push({"x": 147, "y": 835}) ; click on sync settings

; Access (x,y) with:
; "X: " coords[2][4]["x"] " Y: " coords[2][4]["y"]

mode := 2
pos := 1


moveMouseTo(position) {
    mode := 3
    position := 1
    x := coords[mode][position]["x"]
    y := coords[mode][position]["y"]
    ; MsgBox, % x y
    MouseMove, x, y
}


F1::
;Tooltip, % "X: " coords[mode][pos]["x"] " Y: " coords[mode][pos]["y"]
moveMouseTo(pos)
return
