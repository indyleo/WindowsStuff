### Linux Commands But As Functions

# File Stuff
function unzip ($file) {
  Write-Output("Extracting", $file, "to", $pwd)
  $fullFile = Get-ChildItem -Path $pwd -Filter $file | ForEach-Object { $_.FullName }
  Expand-Archive -Path $fullFile -DestinationPath $pwd
}
function touch($file) { "" | Out-File $file -Encoding ASCII }
function ff($name) {
  Get-ChildItem -recurse -filter "*${name}*" -ErrorAction SilentlyContinue | ForEach-Object {
    Write-Output "$($_.FullName)"
  }
}
function nf { param($name) New-Item -ItemType "file" -Path . -Name $name }

function New-SymbolicLink {
param (
    [Parameter(Mandatory)]
    [string]$Path,

    [Parameter(Mandatory)]
    [string]$Target
  )
  try {
    New-Item -Path $Path -ItemType SymbolicLink -Target $Target -Force
    Write-Host "Symbolic link created: $Path -> $Target" -ForegroundColor Green
  } catch {
    Write-Host "Failed to create symbolic link: $_" -ForegroundColor Red
  }
}

function Remove-SymbolicLink {
param (
    [Parameter(Mandatory)]
    [string]$Path
  )
  try {
    if (Test-Path $Path) {
      Remove-Item -Path $Path -Force
      Write-Host "Symbolic link removed: $Path" -ForegroundColor Green
    } else {
      Write-Host "Path does not exist: $Path" -ForegroundColor Yellow
    }
  } catch {
    Write-Host "Failed to remove symbolic link: $_" -ForegroundColor Red
  }
}

# Text Stuff
function grep($regex, $dir) {
  if ( $dir ) {
    Get-ChildItem $dir | select-string $regex
    return
  }
  $input | select-string $regex
}

function head {
param($Path, $n = 10)
  Get-Content $Path -Head $n
}

function tail {
param($Path, $n = 10, [switch]$f = $false)
  Get-Content $Path -Tail $n -Wait:$f
}

function sed($file, $find, $replace) {
  (Get-Content $file).replace("$find", $replace) | Set-Content $file
}

# Ststem Stuff
function df {
  get-volume
}

function uptime {
  if ($PSVersionTable.PSVersion.Major -eq 5) {
    Get-WmiObject win32_operatingsystem | Select-Object @{Name='LastBootUpTime'; Expression={$_.ConverttoDateTime($_.lastbootuptime)}} | Format-Table -HideTableHeaders
  } else {
    net statistics workstation | Select-String "since" | ForEach-Object { $_.ToString().Replace('Statistics since ', '') }
  }
}

# Program Stuff
function which($name) {
  Get-Command $name | Select-Object -ExpandProperty Definition
}

function export($name, $value) {
  set-item -force -path "env:$name" -value $value;
}

function pkill($name) {
  Get-Process $name -ErrorAction SilentlyContinue | Stop-Process
}

function pgrep($name) {
  Get-Process $name
}

### Elevated Terminal
function admin {
  if ($args.Count -gt 0) {
    $argList = "& '$args'"
    Start-Process wezterm-gui -Verb runAs -ArgumentList "pwsh.exe -NoExit -Command  $argList"
  } else {
    Start-Process wezterm-gui -Verb runAs
  }
}

### Git Functions
function lazygup {
  git add -u
  git commit -m "$args"
  git push
}
function lazygall {
  git add .
  git commit -m "$args"
  git push
}

### Network Functions
function flushdns {
  Clear-DnsClientCache
  Write-Host "DNS has been flushed"
}
function Get-PubIP { (Invoke-WebRequest http://ifconfig.me/ip).Content }

### Downloading Functions

# YT Downloading
function Get-YoutubeContent {
param (
    [Parameter(Mandatory = $true)]
    [string]$url,

    # Updated aliases to avoid conflicts
    [Alias("aud")]
    [switch]$Audio,

    [Alias("vid")]
    [switch]$Video,

    [Alias("bth")]
    [switch]$Both
  )

  # Validate that only one download type is specified
  if (($Audio, $Video, $Both | Where-Object { $_ }).Count -ne 1) {
    Write-Output "Please specify only one download type: -aud for audio, -vid for video, or -bth for both."
    return
  }

  # Set the output folder to Downloads
  $outputFolder = [System.IO.Path]::Combine([Environment]::GetFolderPath("UserProfile"), "Downloads")

  # Check if yt-dlp is installed
  if (-not (Get-Command "yt-dlp" -ErrorAction SilentlyContinue)) {
    Write-Output "yt-dlp is not installed. Please install yt-dlp and try again."
    return
  }

  # Try downloading content
  try {
    if ($Audio) {
      yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata --audio-quality 0 "$url" -o "$outputFolder/%(title)s.%(ext)s"
      Write-Output "Audio download completed. File saved in $outputFolder."
    }
    elseif ($Video) {
      yt-dlp -f "bestvideo+bestaudio" --merge-output-format mp4 --embed-thumbnail --add-metadata "$url" -o "$outputFolder/%(title)s.%(ext)s"
      Write-Output "Video download completed. File saved in $outputFolder."
    }
    elseif ($Both) {
      yt-dlp -f "bestvideo+bestaudio" --merge-output-format mp4 --embed-thumbnail --add-metadata "$url" -o "$outputFolder/%(title)s.%(ext)s"
      Write-Output "Combined audio and video download completed as an MP4. File saved in $outputFolder."
    }
  }
  catch {
    Write-Output "An error occurred while downloading: $_"
  }
}

# Spotify Downloading
function Get-SpotifyContent {
param (
    [Parameter(Mandatory = $true)]
    [string]$url,

    # Updated aliases to avoid conflicts
    [Alias("trk")]
    [switch]$Track,

    [Alias("alb")]
    [switch]$Album,

    [Alias("pl")]
    [switch]$Playlist
  )

  # Validate that only one download type is specified
  if (($Track, $Album, $Playlist | Where-Object { $_ }).Count -ne 1) {
    Write-Output "Please specify only one download type: -trk for track, -alb for album, or -pl for playlist."
    return
  }

  # Set the output folder to Downloads
  $outputFolder = [System.IO.Path]::Combine([Environment]::GetFolderPath("UserProfile"), "Downloads")

  # Check if spotdl is installed
  if (-not (Get-Command "spotdl" -ErrorAction SilentlyContinue)) {
    Write-Output "spotdl is not installed. Please install spotdl and try again."
    return
  }

  # Try downloading content
  try {
    if ($Track) {
      spotdl "$url" --output "$outputFolder"
      Write-Output "Track download completed. File saved in $outputFolder."
    }
    elseif ($Album) {
      spotdl "$url" --output "$outputFolder"
      Write-Output "Album download completed. Files saved in $outputFolder."
    }
    elseif ($Playlist) {
      spotdl "$url" --output "$outputFolder"
      Write-Output "Playlist download completed. Files saved in $outputFolder."
    }
  }
  catch {
    Write-Output "An error occurred while downloading: $_"
  }
}
