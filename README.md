# WindowsStuff
This Is my ahk and powershell setups

## Reqired Steps to get working:
- Run this: then restart
```pwsh
Set-ExecutionPolicy RemoteSigned 
```

- Then do these: Do Profile First! then reload pwsh then do the alias and function files
```pwsh
Unblock-File $PROFILE
```

```pwsh
Unblock-File $AlIAS
Unblock-File $FUNCTION
Unblock-File $HOME\Documents\PowerShell\Sources\Gh-Completion.ps1
```

## Nice Stuff For The Powershell config:
- Do this for ls to look better: 
```pwsh
Install-Module -Name Terminal-Icons -Repository PSGallery -Scope CurrentUser -Force
```

- Do this for git completions: 
```pwsh
Install-Module -Name posh-git -Repository PSGallery -Scope CurrentUser -Force
```

- You should Use a Nerd Font: https://github.com/ryanoasis/nerd-fonts/releases/

For A Better Gsudo do this:
```pwsh
gsudo config CacheMode Auto
```

## Proper locations for config file:
```pwsh
mv .\nvim $HOME\AppData\Local\
```
```pwsh
mv.\wezterm .\fastfetch  $HOME\.config\
```
```pwsh
mv .\.gitconfig $HOME\
```
