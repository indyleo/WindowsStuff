;;; Media/Audio Keys

; Play/Pause
^!p::Send {Media_Play_Pause}

; Next Track
^!n::Send {Media_Next}

; Previous Track
^!b::Send {Media_Prev}

; Volume Up
^!Up::Send {Volume_Up}

; Volume Down
^!Down::Send {Volume_Down}

;;; Window Managment Keys

; Switch To Previous Desktop
LAlt & Left::
Send, ^#{Left}
return

; Switch To Next Desktop
LAlt & Right::
Send, ^#{Right}
return

; Close Focued Window
!q:: ; Alt + Q
    WinClose, A
return

;;; App Opening Keys

; Hotkey to open Floorp
!b:: 
Run, C:\Program Files\Ablaze Floorp\floorp.exe
Return

; Hotkey to open Discord
!d:: 
Run, C:\Users\Indy\AppData\Local\Discord\app-1.0.9161\Discord.exe
Return

; Hotkey to open foobar2000
!m:: 
Run, C:\Program Files\foobar2000\foobar2000.exe
Return

; Hotkey to open Windows Terminal
!Enter:: 
Run, wt.exe
Return

; Hotkey to open File Explorer
!f:: 
Run, explorer.exe
Return

; Hotkey to open Control Panel, or Setting
!s::
    KeyWait, s, D ; Wait for the S key to be pressed down
    KeyWait, s ; Wait for the S key to be released
    Input, SingleKey, L1 ; Wait for the next key press
    if (SingleKey = "c") {
        Run, control.exe ; Open Control Panel
    }
    else if (SingleKey = "s") {
        Run, ms-settings: ; Open Settings app
    }
    else {
        MsgBox, Invalid Key. Press C for Control Panel or S for Settings.
    }
Return