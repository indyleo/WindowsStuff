# Utility Functions
function Test-CommandExists {
    param($command)
    $exists = $null -ne (Get-Command $command -ErrorAction SilentlyContinue)
    return $exists
}

# FastFetch
if (Test-CommandExists fastfetch) { fastfetch } else { Write-Host "Fastfetch is not installed." } 

# Varables Configs
$EDITOR = if (Test-CommandExists codium) { 'codium' } else { Write-Host "VSCodium is not installed." }
$AlIAS = "$HOME\Documents\Powershell\Sources\Aliases.ps1"
$FUNCTION = "$HOME\Documents\Powershell\Sources\Functions.ps1"

# Imports
Import-Module -Name Terminal-Icons
Import-Module -Name gsudoModule

# Opt-out of telemetry before doing anything, only if PowerShell is run as admin
if ([bool]([System.Security.Principal.WindowsIdentity]::GetCurrent()).IsSystem) {
    [System.Environment]::SetEnvironmentVariable('POWERSHELL_TELEMETRY_OPTOUT', 'true', [System.EnvironmentVariableTarget]::Machine)
}

# Admin Check and Prompt Customization
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
function prompt {
    if ($isAdmin) { "[" + (Get-Location) + "] # " } else { "[" + (Get-Location) + "] $ " }
}
$adminSuffix = if ($isAdmin) { " [ADMIN]" } else { "" }
$Host.UI.RawUI.WindowTitle = "PowerShell {0}$adminSuffix" -f $PSVersionTable.PSVersion.ToString()

# Enhanced PowerShell Experience
Set-PSReadLineOption -Colors @{
    Command = 'Yellow'
    Parameter = 'Green'
    String = 'DarkCyan'
}

$scriptblock = {
    param($wordToComplete, $commandAst, $cursorPosition)
    dotnet complete --position $cursorPosition $commandAst.ToString() |
        ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock $scriptblock

# Sourcing Files
if (Test-Path $AlIAS) {
    . $AlIAS
} else {
    Write-Host "Alias file does not exist."
}

if (Test-Path $FUNCTION) {
    . $FUNCTION
} else {
    Write-Host "Functions file does not exist."
}

# Zoxide Check
if (Test-CommandExists zoxide ) {
    Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })
} else {
    Write-Host "Zoxide is not installed."
}

### Oh My Posh Setup
if (Test-CommandExists oh-my-posh) { oh-my-posh init pwsh --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/cobalt2.omp.json | Invoke-Expression }
else { Write-Host "Oh My Posh is not installed." }
