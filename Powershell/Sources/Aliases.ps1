### Movement Aliases
function mkcd { param($dir) mkdir $dir -Force; Set-Location $dir }
function home { Set-Location -Path $HOME }
function conf { Set-Location -Path $HOME\.config }
function down { Set-Location -Path $HOME\Downloads }
function docs { Set-Location -Path $HOME\Documents }
function dats { Set-Location -Path $HOME\AppData }
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
function httpserver { python3 -m http.server }
function pg { ping -n 10 @args}
function wq { exit }

### Overwite Aliases

# Ls
if (Test-CommandExists eza) {
  function ezabase { eza --icons --group-directories-first --color=auto @args }
  Set-Alias -Name ls -Value ezabase -Force

  function ezahidden { eza --icons -a --group-directories-first --color=auto @args }
  Set-Alias -Name la -Value ezahidden -Force

  function ezalist { eza --icons -lF --group-directories-first --color=auto @args }
  Set-Alias -Name ll -Value ezalist -Force

  function ezafav { eza --icons -alF --group-directories-first --color=auto @args }
  Set-Alias -Name l -Value ezafav -Force

  function ezatree { eza --icons -a --tree --group-directories-first --color=auto @args }
  Set-Alias -Name lt -Value ezatree -Force

  function ezarecurse { eza --icons -aR --group-directories-first --color=auto @args }
  Set-Alias -Name lr -Value ezarecurse -Force

  function ezaonlyhidden { eza -a @args | rg "^\." }
  Set-Alias -Name l. -Value ezaonlyhidden -Force
} else { 
  Write-Host "Eza is not installed." 
}

# Cat
if (Test-CommandExists bat) {
  function batcat { bat -pp @args }
  Set-Alias -Name cat -Value batcat -Force
} else {
  Write-Host "Bat is not installed."
}

# Find
if (Test-CommandExists fd) {
  function fdfind { fd   @args }
  Set-Alias -Name find -Value fdfind -Force
} else {
  Write-Host "Fd is not installed."
}

# Cd
if (Test-CommandExists zoxide) {
  function zcd { __zoxide_z @args }
  Set-Alias -Name cd -Value zcd -Option AllScope -Scope Global -Force

  function zicd { __zoxide_zi @args }
  Set-Alias -Name ci -Value zicd -Option AllScope -Scope Global -Force
}

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
