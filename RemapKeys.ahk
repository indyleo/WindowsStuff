;;; Varables
USER = UR-USER-HERE

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
!q::
WinClose, A
return

;;; App Opening Keys

; Hotkey to open Floorp
!b:: 
Run, C:\Program Files\Ablaze Floorp\floorp.exe
Return


; Hotkey to open Vesktop (Discord)
!d:: 
Run, C:\Users\%USER%\AppData\Local\vesktop\Vesktop.exe
Return

; Hotkey to open foobar2000
!m:: 
Run, C:\Program Files\foobar2000\foobar2000.exe
Return

; Hotkey to open Terminal
!Enter:: 
Run, C:\Program Files\WezTerm\wezterm-gui.exe
Return

; Hotkey to open Terminal as admin
!^Enter:: 
{
  Run *RunAs "C:\Program Files\WezTerm\wezterm-gui.exe"
}
Return

; Hotkey to open File Explorer
!f:: 
Run, explorer.exe
Return

; Open Neovide (Editor)
!e:: 
Run, C:\Users\%USER%\scoop\apps\neovide\current\neovide.exe
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

;;; A key to different key

; Caps -> Esc & Esc -> Caps (only if neovide/vim is focused)
#IfWinActive ahk_exe Neovide.exe
Capslock::Esc
Esc::Capslock
#IfWinActive

#IfWinActive, ahk_class org.wezfurlong.wezterm
IfWinExist, PowerShell
Capslock::Esc
Esc::Capslock
#If

;;; Debug

; Just Win Title 
F1::
WinGetTitle, Title, A
MsgBox, Window Title: %Title%
Return

; Just Win Class 
F2::
WinGetClass, Class, A
MsgBox, Window Class: %Class%
Return

; Win Class & Title
F3::
WinGetActiveTitle, Title
WinGetClass, Class, A
MsgBox, Active Window Title: %Title%`nActive Window Class: %Class%
return
