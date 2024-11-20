### Movement Aliases
function mkcd { param($dir) mkdir $dir -Force; Set-Location $dir }
function down { Set-Location -Path $HOME\Downloads }
function docs { Set-Location -Path $HOME\Documents }
function dats { Set-Location -Path $HOME\AppData\ }
function .. { Set-Location -Path .. }

### Permision Aliases
Set-Alias -Name su -Value admin
Set-Alias -Name sudo -Value gsudo

### Code Aliases
Set-Alias -Name v -Value $EDITOR
Set-Alias -Name vv -Value $VISUAL
function Edit-Profile { nvim $PROFILE }
function Edit-Alias { nvim $ALIAS }
function Edit-Function { nvim $FUNCTION }

### Shell Aliases
function Reload-Profile { & $profile }
function k9 { Stop-Process -Name $args[0] }
function la { Get-ChildItem -Path . -Force | Format-Table -AutoSize }
function ll { Get-ChildItem -Path . -Force -Hidden | Format-Table -AutoSize }
function httpserver { python3 -m http.server }
function wq { exit }

### Git Aliases
function stat { git status }
function addup { git add -u }
function addall { git add . }
function commit { param($m) git commit -m "$m" }
function push { git push }
function pull { git pull }
function clone { git clone "$args" }
Set-Alias -Name lg -Value lazygit

### System Aliases
function sysinfo { Get-ComputerInfo }
Set-Alias -Name neofetch -Value fastfetch
