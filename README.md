# WindowsStuff

## Reqired Steps to get working:

- Run this:

```pwsh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

- Then do these: Do Profile First! then reload pwsh then do the alias and function files

```pwsh
Unblock-File $PROFILE
```

```pwsh
Unblock-File $AlIAS
Unblock-File $FUNCTION
Unblock-File $COMP[0]
Unblock-File $COMP[1]
Unblock-File $COMP[2]
```

## Nice Stuff For The Powershell config:

- Do this for git completions:

```pwsh
Install-Module -Name posh-git -Repository PSGallery -Scope CurrentUser -Force
```

```pwsh
Install-Module PsReadline -Repository PSGallery -Scope CurrentUser -Force
```

- You should Use a [Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/) My Personal Fav is Cascadia Code NF

For A Better Gsudo do this:

```pwsh
gsudo config CacheMode Auto
```

## Proper locations for config file:

```pwsh
mv .\nvim $HOME\AppData\Local\
```

```pwsh
mv.\wezterm .\fastfetch  .\starship.toml $HOME\.config\
```

```pwsh
mv .\.gitconfig $HOME\
```
