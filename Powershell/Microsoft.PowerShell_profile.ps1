# Utility Functions
function Test-CommandExists
{
  param($command)
  $exists = $null -ne (Get-Command $command -ErrorAction SilentlyContinue)
  return $exists
}

# Makes sure fastfetch is there
if (Test-CommandExists fastfetch)
{
  fastfetch
} else
{
  Write-Host "Fastfetch is not installed."
}

# Varables Configs
$VISUAL = if (Test-CommandExists notepad)
{ "notepad" 
} else
{ Write-Host "How is Notepad not installed!" 
}
$EDITOR = if (Test-CommandExists nvim)
{ "nvim" 
} else
{ Write-Host "Neovim is not installed." 
}
$AlIAS = "$HOME\Documents\Powershell\Sources\Aliases.ps1"
$FUNCTION = "$HOME\Documents\Powershell\Sources\Functions.ps1"
$COMP = @("$HOME\Documents\Powershell\Sources\Gh-Completion.ps1", "$HOME\Documents\Powershell\Sources\Winget-Completion.ps1")

# Imports
Import-Module -Name gsudoModule
Import-Module -Name posh-git

# Opt-out of telemetry before doing anything, only if PowerShell is run as admin
if ([bool]([System.Security.Principal.WindowsIdentity]::GetCurrent()).IsSystem)
{
  [System.Environment]::SetEnvironmentVariable("POWERSHELL_TELEMETRY_OPTOUT", "true", [System.EnvironmentVariableTarget]::Machine)
}

# Admin Check and Prompt Customization
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
function prompt
{
  if ($isAdmin)
  { "[" + (Get-Location) + "] # " 
  } else
  { "[" + (Get-Location) + "] $ " 
  }
}
$adminSuffix = if ($isAdmin)
{ " [ADMIN]" 
} else
{ "" 
}
$Host.UI.RawUI.WindowTitle = "PowerShell {0}$adminSuffix" -f $PSVersionTable.PSVersion.ToString()

# Enhanced PowerShell Experience
Set-PSReadLineOption -Colors @{
  Command = "Yellow"
  Parameter = "Green"
  String = "DarkCyan"
}

$scriptblock = {
  param($wordToComplete, $commandAst, $cursorPosition)
  dotnet complete --position $cursorPosition $commandAst.ToString() |
    ForEach-Object {
      [System.Management.Automation.CompletionResult]::new($_, $_, "ParameterValue", $_)
    }
}
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock $scriptblock

# Environment Setting
$env:XDG_CONFIG_HOME = "$env:USERPROFILE\.config"

# Sourcing Files
if (Test-Path $AlIAS)
{
  . $AlIAS
} else
{
  Write-Host "Alias file does not exist."
}

if (Test-Path $FUNCTION)
{
  . $FUNCTION
} else
{
  Write-Host "Functions file does not exist."
}

if (Test-Path $COMP[0] )
{
  if ( Test-CommandExists gh )
  { . $COMP[0] 
  } else
  { Write-Host "Gh not installed" 
  }
} else
{
  Write-Host "Gh file does not exist."
}

# Zoxide Check
if (Test-CommandExists zoxide )
{
  Invoke-Expression (& { (zoxide init powershell --no-cmd | Out-String) })
} else
{
  Write-Host "Zoxide is not installed."
}

# Oh-My-Posh Prompt Setup
if (Test-CommandExists oh-my-posh )
{
  oh-my-posh init pwsh --config "$HOME\.config\ohmyposh\base.toml" | Invoke-Expression
} else
{
  Write-Host "Oh-My-Posh is not installed."
}

# Set-Location
Set-Location -Path $env:USERPROFILE
