#Requires AutoHotkey v2.0
#SingleInstance Force

;;; Variables
USER := "UR-USER-HERE"

;;; Media/Audio Keys

; Play/Pause
^!p::Send("{Media_Play_Pause}")

; Next Track
^!n::Send("{Media_Next}")

; Previous Track
^!b::Send("{Media_Prev}")

; Volume Up
^!Up::Send("{Volume_Up}")

; Volume Down
^!Down::Send("{Volume_Down}")

;;; Window Management Keys

; Close Focused Window
^!q::WinClose("A")

;;; App Opening Keys

; Hotkey to open Floorp
!b::Run("C:\Program Files\Ablaze Floorp\floorp.exe")

; Hotkey to open Vesktop (Discord)
!d::Run("C:\Users\" . USER . "\AppData\Local\vesktop\Vesktop.exe")

; Hotkey to open foobar2000
!m::Run("C:\Program Files\foobar2000\foobar2000.exe")

; Hotkey to open Terminal
!Enter::Run("C:\Program Files\WezTerm\wezterm-gui.exe")

; Hotkey to open Terminal as Admin
^!Enter::
{
    Run("*RunAs C:\Program Files\WezTerm\wezterm-gui.exe")
}

; Hotkey to open File Explorer
!f::Run("explorer.exe")

; Open Neovide (Editor)
!e::Run("C:\Users\" . USER . "\scoop\apps\neovide\current\neovide.exe")

;;; A Key to Different Key

; Caps -> Esc & Esc -> Ctrl + V (only if Neovide/Vim is focused)
#HotIf WinActive("ahk_exe Neovide.exe") || WinActive("ahk_class org.wezfurlong.wezterm")
{
    Capslock::Send("{Esc}")
    Esc::Send("^v")

}
#HotIf

;;; Debug

; Display Active Window Title
F1::MsgBox("Window Title: " . WinGetTitle("A"))

; Display Active Window Class
F2::MsgBox("Window Class: " . WinGetClass("A"))

; Display Active Window Class and Title
F3::
{
    Title := WinGetTitle("A")
    Class := WinGetClass("A")
    MsgBox("Active Window Title: " . Title . "`nActive Window Class: " . Class)
}