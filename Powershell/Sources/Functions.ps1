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
        Start-Process wt -Verb runAs -ArgumentList "pwsh.exe -NoExit -Command $argList"
    } else {
        Start-Process wt -Verb runAs
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

        [Alias("a", "audio")]
        [switch]$Audio,

        [Alias("v", "video")]
        [switch]$Video,

        [Alias("b", "both")]
        [switch]$Both
    )

    # Set the output folder to Downloads
    $outputFolder = [System.IO.Path]::Combine([Environment]::GetFolderPath("UserProfile"), "Downloads")

    # Determine download type based on the switch provided
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
        yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata --audio-quality 0 "$url" -o "$outputFolder/%(title)s_audio.%(ext)s"
        Write-Output "Both audio and video downloads completed. Files saved in $outputFolder."
    }
    else {
        Write-Output "Please specify a download type: -a for audio, -v for video, or -b for both."
    }
}

# Spotify Downloading
function Get-SpotifyContent {
    param (
        [Parameter(Mandatory = $true)]
        [string]$url,

        [Alias("t", "track")]
        [switch]$Track,

        [Alias("a", "album")]
        [switch]$Album,

        [Alias("p", "playlist")]
        [switch]$Playlist
    )

    # Set the output folder to Downloads
    $outputFolder = [System.IO.Path]::Combine([Environment]::GetFolderPath("UserProfile"), "Downloads")

    # Determine download type based on the switch provided
    if ($Track) {
        spotdl "$url" --output "$outputFolder/%(title)s.%(ext)s"
        Write-Output "Track download completed. File saved in $outputFolder."
    }
    elseif ($Album) {
        spotdl "$url" --output "$outputFolder/%(title)s.%(ext)s"
        Write-Output "Album download completed. Files saved in $outputFolder."
    }
    elseif ($Playlist) {
        spotdl "$url" --output "$outputFolder/%(title)s.%(ext)s"
        Write-Output "Playlist download completed. Files saved in $outputFolder."
    }
    else {
        Write-Output "Please specify a download type: -t for track, -a for album, or -p for playlist."
    }
}
