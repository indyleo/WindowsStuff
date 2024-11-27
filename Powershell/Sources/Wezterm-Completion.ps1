
using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'wezterm' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'wezterm'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'wezterm' {
            [CompletionResult]::new('--config-file', 'config-file', [CompletionResultType]::ParameterName, 'Specify the configuration file to use, overrides the normal configuration file resolution')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override specific configuration values')
            [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Skip loading wezterm.lua')
            [CompletionResult]::new('--skip-config', 'skip-config', [CompletionResultType]::ParameterName, 'Skip loading wezterm.lua')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('start', 'start', [CompletionResultType]::ParameterValue, 'Start the GUI, optionally running an alternative program [aliases: -e]')
            [CompletionResult]::new('blocking-start', 'blocking-start', [CompletionResultType]::ParameterValue, 'Start the GUI in blocking mode. You shouldn''t see this, but you may see it in shell completions because of this open clap issue: <https://github.com/clap-rs/clap/issues/1335>')
            [CompletionResult]::new('ssh', 'ssh', [CompletionResultType]::ParameterValue, 'Establish an ssh session')
            [CompletionResult]::new('serial', 'serial', [CompletionResultType]::ParameterValue, 'Open a serial port')
            [CompletionResult]::new('connect', 'connect', [CompletionResultType]::ParameterValue, 'Connect to wezterm multiplexer')
            [CompletionResult]::new('ls-fonts', 'ls-fonts', [CompletionResultType]::ParameterValue, 'Display information about fonts')
            [CompletionResult]::new('show-keys', 'show-keys', [CompletionResultType]::ParameterValue, 'Show key assignments')
            [CompletionResult]::new('cli', 'cli', [CompletionResultType]::ParameterValue, 'Interact with experimental mux server')
            [CompletionResult]::new('imgcat', 'imgcat', [CompletionResultType]::ParameterValue, 'Output an image to the terminal')
            [CompletionResult]::new('set-working-directory', 'set-working-directory', [CompletionResultType]::ParameterValue, 'Advise the terminal of the current working directory by emitting an OSC 7 escape sequence')
            [CompletionResult]::new('record', 'record', [CompletionResultType]::ParameterValue, 'Record a terminal session as an asciicast')
            [CompletionResult]::new('replay', 'replay', [CompletionResultType]::ParameterValue, 'Replay an asciicast terminal session')
            [CompletionResult]::new('shell-completion', 'shell-completion', [CompletionResultType]::ParameterValue, 'Generate shell completion information')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'wezterm;start' {
            [CompletionResult]::new('--cwd', 'cwd', [CompletionResultType]::ParameterName, 'Specify the current working directory for the initially spawned program')
            [CompletionResult]::new('--class', 'class', [CompletionResultType]::ParameterName, 'Override the default windowing system class. The default is "org.wezfurlong.wezterm". Under X11 and Windows this changes the window class. Under Wayland this changes the app_id. This changes the class for all windows spawned by this instance of wezterm, including error, update and ssh authentication dialogs')
            [CompletionResult]::new('--workspace', 'workspace', [CompletionResultType]::ParameterName, 'Override the default workspace with the provided name. The default is "default"')
            [CompletionResult]::new('--position', 'position', [CompletionResultType]::ParameterName, 'Override the position for the initial window launched by this process.')
            [CompletionResult]::new('--domain', 'domain', [CompletionResultType]::ParameterName, 'Name of the multiplexer domain section from the configuration to which you''d like to connect. If omitted, the default domain will be used')
            [CompletionResult]::new('--no-auto-connect', 'no-auto-connect', [CompletionResultType]::ParameterName, 'If true, do not connect to domains marked as connect_automatically in your wezterm configuration file')
            [CompletionResult]::new('--always-new-process', 'always-new-process', [CompletionResultType]::ParameterName, 'If enabled, don''t try to ask an existing wezterm GUI instance to start the command.  Instead, always start the GUI in this invocation of wezterm so that you can wait for the command to complete by waiting for this wezterm process to finish')
            [CompletionResult]::new('--new-tab', 'new-tab', [CompletionResultType]::ParameterName, 'When spawning into an existing GUI instance, spawn a new tab into the active window rather than spawn a new window')
            [CompletionResult]::new('-e', 'e', [CompletionResultType]::ParameterName, 'Dummy argument that consumes "-e" and does nothing. This is meant as a compatibility layer for supporting the widely adopted standard of passing the command to execute to the terminal via a "-e" option. This works because we then treat the remaining cmdline as trailing options, that will automatically be parsed via the existing "prog" option. This option exists only as a fallback. It is recommended to pass the command as a normal trailing command instead if possible')
            [CompletionResult]::new('--attach', 'attach', [CompletionResultType]::ParameterName, 'When used with --domain, if the domain already has running panes, wezterm will simply attach and will NOT spawn the specified PROG. If you omit --attach when using --domain, wezterm will attach AND then spawn PROG')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'wezterm;blocking-start' {
            [CompletionResult]::new('--cwd', 'cwd', [CompletionResultType]::ParameterName, 'Specify the current working directory for the initially spawned program')
            [CompletionResult]::new('--class', 'class', [CompletionResultType]::ParameterName, 'Override the default windowing system class. The default is "org.wezfurlong.wezterm". Under X11 and Windows this changes the window class. Under Wayland this changes the app_id. This changes the class for all windows spawned by this instance of wezterm, including error, update and ssh authentication dialogs')
            [CompletionResult]::new('--workspace', 'workspace', [CompletionResultType]::ParameterName, 'Override the default workspace with the provided name. The default is "default"')
            [CompletionResult]::new('--position', 'position', [CompletionResultType]::ParameterName, 'Override the position for the initial window launched by this process.')
            [CompletionResult]::new('--domain', 'domain', [CompletionResultType]::ParameterName, 'Name of the multiplexer domain section from the configuration to which you''d like to connect. If omitted, the default domain will be used')
            [CompletionResult]::new('--no-auto-connect', 'no-auto-connect', [CompletionResultType]::ParameterName, 'If true, do not connect to domains marked as connect_automatically in your wezterm configuration file')
            [CompletionResult]::new('--always-new-process', 'always-new-process', [CompletionResultType]::ParameterName, 'If enabled, don''t try to ask an existing wezterm GUI instance to start the command.  Instead, always start the GUI in this invocation of wezterm so that you can wait for the command to complete by waiting for this wezterm process to finish')
            [CompletionResult]::new('--new-tab', 'new-tab', [CompletionResultType]::ParameterName, 'When spawning into an existing GUI instance, spawn a new tab into the active window rather than spawn a new window')
            [CompletionResult]::new('-e', 'e', [CompletionResultType]::ParameterName, 'Dummy argument that consumes "-e" and does nothing. This is meant as a compatibility layer for supporting the widely adopted standard of passing the command to execute to the terminal via a "-e" option. This works because we then treat the remaining cmdline as trailing options, that will automatically be parsed via the existing "prog" option. This option exists only as a fallback. It is recommended to pass the command as a normal trailing command instead if possible')
            [CompletionResult]::new('--attach', 'attach', [CompletionResultType]::ParameterName, 'When used with --domain, if the domain already has running panes, wezterm will simply attach and will NOT spawn the specified PROG. If you omit --attach when using --domain, wezterm will attach AND then spawn PROG')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'wezterm;ssh' {
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Override specific SSH configuration options. `wezterm ssh` is able to parse some (but not all!) options from your `~/.ssh/config` and `/etc/ssh/ssh_config` files. This command line switch allows you to override or otherwise specify ssh_config style options')
            [CompletionResult]::new('--ssh-option', 'ssh-option', [CompletionResultType]::ParameterName, 'Override specific SSH configuration options. `wezterm ssh` is able to parse some (but not all!) options from your `~/.ssh/config` and `/etc/ssh/ssh_config` files. This command line switch allows you to override or otherwise specify ssh_config style options')
            [CompletionResult]::new('--class', 'class', [CompletionResultType]::ParameterName, 'Override the default windowing system class. The default is "org.wezfurlong.wezterm". Under X11 and Windows this changes the window class. Under Wayland this changes the app_id. This changes the class for all windows spawned by this instance of wezterm, including error, update and ssh authentication dialogs')
            [CompletionResult]::new('--position', 'position', [CompletionResultType]::ParameterName, 'Override the position for the initial window launched by this process.')
            [CompletionResult]::new('-v', 'v', [CompletionResultType]::ParameterName, 'Enable verbose ssh protocol tracing. The trace information is printed to the stderr stream of the process')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'wezterm;serial' {
            [CompletionResult]::new('--baud', 'baud', [CompletionResultType]::ParameterName, 'Set the baud rate.  The default is 9600 baud')
            [CompletionResult]::new('--class', 'class', [CompletionResultType]::ParameterName, 'Override the default windowing system class. The default is "org.wezfurlong.wezterm". Under X11 and Windows this changes the window class. Under Wayland this changes the app_id. This changes the class for all windows spawned by this instance of wezterm, including error, update and ssh authentication dialogs')
            [CompletionResult]::new('--position', 'position', [CompletionResultType]::ParameterName, 'Override the position for the initial window launched by this process.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'wezterm;connect' {
            [CompletionResult]::new('--class', 'class', [CompletionResultType]::ParameterName, 'Override the default windowing system class. The default is "org.wezfurlong.wezterm". Under X11 and Windows this changes the window class. Under Wayland this changes the app_id. This changes the class for all windows spawned by this instance of wezterm, including error, update and ssh authentication dialogs')
            [CompletionResult]::new('--workspace', 'workspace', [CompletionResultType]::ParameterName, 'Override the default workspace with the provided name. The default is "default"')
            [CompletionResult]::new('--position', 'position', [CompletionResultType]::ParameterName, 'Override the position for the initial window launched by this process.')
            [CompletionResult]::new('--new-tab', 'new-tab', [CompletionResultType]::ParameterName, 'When spawning into an existing GUI instance, spawn a new tab into the active window rather than spawn a new window')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'wezterm;ls-fonts' {
            [CompletionResult]::new('--text', 'text', [CompletionResultType]::ParameterName, 'Explain which fonts are used to render the supplied text string')
            [CompletionResult]::new('--codepoints', 'codepoints', [CompletionResultType]::ParameterName, 'Explain which fonts are used to render the specified unicode code point sequence. Code points are comma separated hex values')
            [CompletionResult]::new('--list-system', 'list-system', [CompletionResultType]::ParameterName, 'Whether to list all fonts available to the system')
            [CompletionResult]::new('--rasterize-ascii', 'rasterize-ascii', [CompletionResultType]::ParameterName, 'Show rasterized glyphs for the text in --text or --codepoints using ascii blocks')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;show-keys' {
            [CompletionResult]::new('--key-table', 'key-table', [CompletionResultType]::ParameterName, 'In lua mode, show only the named key table')
            [CompletionResult]::new('--lua', 'lua', [CompletionResultType]::ParameterName, 'Show the keys as lua config statements')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli' {
            [CompletionResult]::new('--class', 'class', [CompletionResultType]::ParameterName, 'When connecting to a gui instance, if you started the gui with `--class SOMETHING`, you should also pass that same value here in order for the client to find the correct gui instance')
            [CompletionResult]::new('--no-auto-start', 'no-auto-start', [CompletionResultType]::ParameterName, 'Don''t automatically start the server')
            [CompletionResult]::new('--prefer-mux', 'prefer-mux', [CompletionResultType]::ParameterName, 'Prefer connecting to a background mux server. The default is to prefer connecting to a running wezterm gui instance')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'list windows, tabs and panes')
            [CompletionResult]::new('list-clients', 'list-clients', [CompletionResultType]::ParameterValue, 'list clients')
            [CompletionResult]::new('proxy', 'proxy', [CompletionResultType]::ParameterValue, 'start rpc proxy pipe')
            [CompletionResult]::new('tlscreds', 'tlscreds', [CompletionResultType]::ParameterValue, 'obtain tls credentials')
            [CompletionResult]::new('move-pane-to-new-tab', 'move-pane-to-new-tab', [CompletionResultType]::ParameterValue, 'Move a pane into a new tab')
            [CompletionResult]::new('split-pane', 'split-pane', [CompletionResultType]::ParameterValue, 'split the current pane.
Outputs the pane-id for the newly created pane on success')
            [CompletionResult]::new('spawn', 'spawn', [CompletionResultType]::ParameterValue, 'Spawn a command into a new window or tab
Outputs the pane-id for the newly created pane on success')
            [CompletionResult]::new('send-text', 'send-text', [CompletionResultType]::ParameterValue, 'Send text to a pane as though it were pasted. If bracketed paste mode is enabled in the pane, then the text will be sent as a bracketed paste')
            [CompletionResult]::new('get-text', 'get-text', [CompletionResultType]::ParameterValue, 'Retrieves the textual content of a pane and output it to stdout')
            [CompletionResult]::new('activate-pane-direction', 'activate-pane-direction', [CompletionResultType]::ParameterValue, 'Activate an adjacent pane in the specified direction')
            [CompletionResult]::new('get-pane-direction', 'get-pane-direction', [CompletionResultType]::ParameterValue, 'Determine the adjacent pane in the specified direction')
            [CompletionResult]::new('kill-pane', 'kill-pane', [CompletionResultType]::ParameterValue, 'Kill a pane')
            [CompletionResult]::new('activate-pane', 'activate-pane', [CompletionResultType]::ParameterValue, 'Activate (focus) a pane')
            [CompletionResult]::new('adjust-pane-size', 'adjust-pane-size', [CompletionResultType]::ParameterValue, 'Adjust the size of a pane directionally')
            [CompletionResult]::new('activate-tab', 'activate-tab', [CompletionResultType]::ParameterValue, 'Activate a tab')
            [CompletionResult]::new('set-tab-title', 'set-tab-title', [CompletionResultType]::ParameterValue, 'Change the title of a tab')
            [CompletionResult]::new('set-window-title', 'set-window-title', [CompletionResultType]::ParameterValue, 'Change the title of a window')
            [CompletionResult]::new('rename-workspace', 'rename-workspace', [CompletionResultType]::ParameterValue, 'Rename a workspace')
            [CompletionResult]::new('zoom-pane', 'zoom-pane', [CompletionResultType]::ParameterValue, 'Zoom, unzoom, or toggle zoom state')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'wezterm;cli;list' {
            [CompletionResult]::new('--format', 'format', [CompletionResultType]::ParameterName, 'Controls the output format. "table" and "json" are possible formats')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;list-clients' {
            [CompletionResult]::new('--format', 'format', [CompletionResultType]::ParameterName, 'Controls the output format. "table" and "json" are possible formats')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;proxy' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;tlscreds' {
            [CompletionResult]::new('--pem', 'pem', [CompletionResultType]::ParameterName, 'Output a PEM file encoded copy of the credentials')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'wezterm;cli;move-pane-to-new-tab' {
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the pane that should be moved. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('--window-id', 'window-id', [CompletionResultType]::ParameterName, 'Specify the window into which the new tab will be created. If omitted, the window associated with the current pane is used')
            [CompletionResult]::new('--workspace', 'workspace', [CompletionResultType]::ParameterName, 'If creating a new window, override the default workspace name with the provided name.  The default name is "default"')
            [CompletionResult]::new('--new-window', 'new-window', [CompletionResultType]::ParameterName, 'Create tab in a new window, rather than the window currently containing the pane')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;split-pane' {
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the pane that should be split. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('--cells', 'cells', [CompletionResultType]::ParameterName, 'The number of cells that the new split should have. If omitted, 50% of the available space is used')
            [CompletionResult]::new('--percent', 'percent', [CompletionResultType]::ParameterName, 'Specify the number of cells that the new split should have, expressed as a percentage of the available space')
            [CompletionResult]::new('--cwd', 'cwd', [CompletionResultType]::ParameterName, 'Specify the current working directory for the initially spawned program')
            [CompletionResult]::new('--move-pane-id', 'move-pane-id', [CompletionResultType]::ParameterName, 'Instead of spawning a new command, move the specified pane into the newly created split')
            [CompletionResult]::new('--horizontal', 'horizontal', [CompletionResultType]::ParameterName, 'Equivalent to `--right`. If neither this nor any other direction is specified, the default is equivalent to `--bottom`')
            [CompletionResult]::new('--left', 'left', [CompletionResultType]::ParameterName, 'Split horizontally, with the new pane on the left')
            [CompletionResult]::new('--right', 'right', [CompletionResultType]::ParameterName, 'Split horizontally, with the new pane on the right')
            [CompletionResult]::new('--top', 'top', [CompletionResultType]::ParameterName, 'Split vertically, with the new pane on the top')
            [CompletionResult]::new('--bottom', 'bottom', [CompletionResultType]::ParameterName, 'Split vertically, with the new pane on the bottom')
            [CompletionResult]::new('--top-level', 'top-level', [CompletionResultType]::ParameterName, 'Rather than splitting the active pane, split the entire window')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;spawn' {
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the current pane. The default is to use the current pane based on the environment variable WEZTERM_PANE. The pane is used to determine the current domain and window')
            [CompletionResult]::new('--domain-name', 'domain-name', [CompletionResultType]::ParameterName, 'domain-name')
            [CompletionResult]::new('--window-id', 'window-id', [CompletionResultType]::ParameterName, 'Specify the window into which to spawn a tab. If omitted, the window associated with the current pane is used. Cannot be used with `--workspace` or `--new-window`')
            [CompletionResult]::new('--cwd', 'cwd', [CompletionResultType]::ParameterName, 'Specify the current working directory for the initially spawned program')
            [CompletionResult]::new('--workspace', 'workspace', [CompletionResultType]::ParameterName, 'When creating a new window, override the default workspace name with the provided name.  The default name is "default". Requires `--new-window`')
            [CompletionResult]::new('--new-window', 'new-window', [CompletionResultType]::ParameterName, 'Spawn into a new window, rather than a new tab')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;send-text' {
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the target pane. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('--no-paste', 'no-paste', [CompletionResultType]::ParameterName, 'Send the text directly, rather than as a bracketed paste')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;get-text' {
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the target pane. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('--start-line', 'start-line', [CompletionResultType]::ParameterName, 'The starting line number. 0 is the first line of terminal screen. Negative numbers proceed backwards into the scrollback. The default value is unspecified is 0, the first line of the terminal screen')
            [CompletionResult]::new('--end-line', 'end-line', [CompletionResultType]::ParameterName, 'The ending line number. 0 is the first line of terminal screen. Negative numbers proceed backwards into the scrollback. The default value if unspecified is the bottom of the the terminal screen')
            [CompletionResult]::new('--escapes', 'escapes', [CompletionResultType]::ParameterName, 'Include escape sequences that color and style the text. If omitted, unattributed text will be returned')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;activate-pane-direction' {
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the current pane. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;get-pane-direction' {
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the current pane. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'wezterm;cli;kill-pane' {
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the target pane. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;activate-pane' {
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the target pane. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;adjust-pane-size' {
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the target pane. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('--amount', 'amount', [CompletionResultType]::ParameterName, 'Specify the number of cells to resize by, defaults to 1')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;activate-tab' {
            [CompletionResult]::new('--tab-id', 'tab-id', [CompletionResultType]::ParameterName, 'Specify the target tab by its id')
            [CompletionResult]::new('--tab-index', 'tab-index', [CompletionResultType]::ParameterName, 'Specify the target tab by its index within the window that holds the current pane. Indices are 0-based, with 0 being the left-most tab. Negative numbers can be used to reference the right-most tab, so -1 is the right-most tab, -2 is the penultimate tab and so on')
            [CompletionResult]::new('--tab-relative', 'tab-relative', [CompletionResultType]::ParameterName, 'Specify the target tab by its relative offset. -1 selects the tab to the left. -2 two tabs to the left. 1 is one tab to the right and so on')
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the current pane. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('--no-wrap', 'no-wrap', [CompletionResultType]::ParameterName, 'When used with tab-relative, prevents wrapping around and will instead clamp to the left-most when moving left or right-most when moving right')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'wezterm;cli;set-tab-title' {
            [CompletionResult]::new('--tab-id', 'tab-id', [CompletionResultType]::ParameterName, 'Specify the target tab by its id')
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the current pane. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'wezterm;cli;set-window-title' {
            [CompletionResult]::new('--window-id', 'window-id', [CompletionResultType]::ParameterName, 'Specify the target window by its id')
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the current pane. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'wezterm;cli;rename-workspace' {
            [CompletionResult]::new('--workspace', 'workspace', [CompletionResultType]::ParameterName, 'Specify the workspace to rename')
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the current pane. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'wezterm;cli;zoom-pane' {
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the target pane. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('--zoom', 'zoom', [CompletionResultType]::ParameterName, 'Zooms the pane if it wasn''t already zoomed')
            [CompletionResult]::new('--unzoom', 'unzoom', [CompletionResultType]::ParameterName, 'Unzooms the pane if it was zoomed')
            [CompletionResult]::new('--toggle', 'toggle', [CompletionResultType]::ParameterName, 'Toggles the zoom state of the pane')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;help' {
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'list windows, tabs and panes')
            [CompletionResult]::new('list-clients', 'list-clients', [CompletionResultType]::ParameterValue, 'list clients')
            [CompletionResult]::new('proxy', 'proxy', [CompletionResultType]::ParameterValue, 'start rpc proxy pipe')
            [CompletionResult]::new('tlscreds', 'tlscreds', [CompletionResultType]::ParameterValue, 'obtain tls credentials')
            [CompletionResult]::new('move-pane-to-new-tab', 'move-pane-to-new-tab', [CompletionResultType]::ParameterValue, 'Move a pane into a new tab')
            [CompletionResult]::new('split-pane', 'split-pane', [CompletionResultType]::ParameterValue, 'split the current pane.
Outputs the pane-id for the newly created pane on success')
            [CompletionResult]::new('spawn', 'spawn', [CompletionResultType]::ParameterValue, 'Spawn a command into a new window or tab
Outputs the pane-id for the newly created pane on success')
            [CompletionResult]::new('send-text', 'send-text', [CompletionResultType]::ParameterValue, 'Send text to a pane as though it were pasted. If bracketed paste mode is enabled in the pane, then the text will be sent as a bracketed paste')
            [CompletionResult]::new('get-text', 'get-text', [CompletionResultType]::ParameterValue, 'Retrieves the textual content of a pane and output it to stdout')
            [CompletionResult]::new('activate-pane-direction', 'activate-pane-direction', [CompletionResultType]::ParameterValue, 'Activate an adjacent pane in the specified direction')
            [CompletionResult]::new('get-pane-direction', 'get-pane-direction', [CompletionResultType]::ParameterValue, 'Determine the adjacent pane in the specified direction')
            [CompletionResult]::new('kill-pane', 'kill-pane', [CompletionResultType]::ParameterValue, 'Kill a pane')
            [CompletionResult]::new('activate-pane', 'activate-pane', [CompletionResultType]::ParameterValue, 'Activate (focus) a pane')
            [CompletionResult]::new('adjust-pane-size', 'adjust-pane-size', [CompletionResultType]::ParameterValue, 'Adjust the size of a pane directionally')
            [CompletionResult]::new('activate-tab', 'activate-tab', [CompletionResultType]::ParameterValue, 'Activate a tab')
            [CompletionResult]::new('set-tab-title', 'set-tab-title', [CompletionResultType]::ParameterValue, 'Change the title of a tab')
            [CompletionResult]::new('set-window-title', 'set-window-title', [CompletionResultType]::ParameterValue, 'Change the title of a window')
            [CompletionResult]::new('rename-workspace', 'rename-workspace', [CompletionResultType]::ParameterValue, 'Rename a workspace')
            [CompletionResult]::new('zoom-pane', 'zoom-pane', [CompletionResultType]::ParameterValue, 'Zoom, unzoom, or toggle zoom state')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'wezterm;cli;help;list' {
            break
        }
        'wezterm;cli;help;list-clients' {
            break
        }
        'wezterm;cli;help;proxy' {
            break
        }
        'wezterm;cli;help;tlscreds' {
            break
        }
        'wezterm;cli;help;move-pane-to-new-tab' {
            break
        }
        'wezterm;cli;help;split-pane' {
            break
        }
        'wezterm;cli;help;spawn' {
            break
        }
        'wezterm;cli;help;send-text' {
            break
        }
        'wezterm;cli;help;get-text' {
            break
        }
        'wezterm;cli;help;activate-pane-direction' {
            break
        }
        'wezterm;cli;help;get-pane-direction' {
            break
        }
        'wezterm;cli;help;kill-pane' {
            break
        }
        'wezterm;cli;help;activate-pane' {
            break
        }
        'wezterm;cli;help;adjust-pane-size' {
            break
        }
        'wezterm;cli;help;activate-tab' {
            break
        }
        'wezterm;cli;help;set-tab-title' {
            break
        }
        'wezterm;cli;help;set-window-title' {
            break
        }
        'wezterm;cli;help;rename-workspace' {
            break
        }
        'wezterm;cli;help;zoom-pane' {
            break
        }
        'wezterm;cli;help;help' {
            break
        }
        'wezterm;imgcat' {
            [CompletionResult]::new('--width', 'width', [CompletionResultType]::ParameterName, 'Specify the display width; defaults to "auto" which automatically selects an appropriate size.  You may also use an integer value `N` to specify the number of cells, or `Npx` to specify the number of pixels, or `N%` to size relative to the terminal width')
            [CompletionResult]::new('--height', 'height', [CompletionResultType]::ParameterName, 'Specify the display height; defaults to "auto" which automatically selects an appropriate size.  You may also use an integer value `N` to specify the number of cells, or `Npx` to specify the number of pixels, or `N%` to size relative to the terminal height')
            [CompletionResult]::new('--position', 'position', [CompletionResultType]::ParameterName, 'Set the cursor position prior to displaying the image. The default is to use the current cursor position. Coordinates are expressed in cells with 0,0 being the top left cell position')
            [CompletionResult]::new('--tmux-passthru', 'tmux-passthru', [CompletionResultType]::ParameterName, 'How to manage passing the escape through to tmux')
            [CompletionResult]::new('--max-pixels', 'max-pixels', [CompletionResultType]::ParameterName, 'Set the maximum number of pixels per image frame. Images will be scaled down so that they do not exceed this size, unless `--no-resample` is also used. The default value matches the limit set by wezterm. Note that resampling the image here will reduce any animated images to a single frame')
            [CompletionResult]::new('--resample-format', 'resample-format', [CompletionResultType]::ParameterName, 'Specify the image format to use to encode resampled/resized images.  The default is to match the input format, but you can choose an alternative format')
            [CompletionResult]::new('--resample-filter', 'resample-filter', [CompletionResultType]::ParameterName, 'Specify the filtering technique used when resizing/resampling images.  The default is a reasonable middle ground of speed and quality')
            [CompletionResult]::new('--resize', 'resize', [CompletionResultType]::ParameterName, 'Pre-process the image to resize it to the specified dimensions, expressed as eg: 800x600 (width x height). The resize is independent of other parameters that control the image placement and dimensions in the terminal; this is provided as a convenience preprocessing step')
            [CompletionResult]::new('--no-preserve-aspect-ratio', 'no-preserve-aspect-ratio', [CompletionResultType]::ParameterName, 'Do not respect the aspect ratio.  The default is to respect the aspect ratio')
            [CompletionResult]::new('--no-move-cursor', 'no-move-cursor', [CompletionResultType]::ParameterName, 'Do not move the cursor after displaying the image. Note that when used like this from the shell, there is a very high chance that shell prompt will overwrite the image; you may wish to also use `--hold` in that case')
            [CompletionResult]::new('--hold', 'hold', [CompletionResultType]::ParameterName, 'Wait for enter to be pressed after displaying the image')
            [CompletionResult]::new('--no-resample', 'no-resample', [CompletionResultType]::ParameterName, 'Do not resample images whose frames are larger than the max-pixels value. Note that this will typically result in the image refusing to display in wezterm')
            [CompletionResult]::new('--show-resample-timing', 'show-resample-timing', [CompletionResultType]::ParameterName, 'When resampling or resizing, display some diagnostics around the timing/performance of that operation')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'wezterm;set-working-directory' {
            [CompletionResult]::new('--tmux-passthru', 'tmux-passthru', [CompletionResultType]::ParameterName, 'How to manage passing the escape through to tmux')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;record' {
            [CompletionResult]::new('--cwd', 'cwd', [CompletionResultType]::ParameterName, 'Start in the specified directory, instead of the default_cwd defined by your wezterm configuration')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;replay' {
            [CompletionResult]::new('--explain', 'explain', [CompletionResultType]::ParameterName, 'Explain what is being sent/received')
            [CompletionResult]::new('--explain-only', 'explain-only', [CompletionResultType]::ParameterName, 'Don''t replay, just show the explanation')
            [CompletionResult]::new('--cat', 'cat', [CompletionResultType]::ParameterName, 'Just emit raw escape sequences all at once, with no timing information')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;shell-completion' {
            [CompletionResult]::new('--shell', 'shell', [CompletionResultType]::ParameterName, 'Which shell to generate for')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;help' {
            [CompletionResult]::new('start', 'start', [CompletionResultType]::ParameterValue, 'Start the GUI, optionally running an alternative program [aliases: -e]')
            [CompletionResult]::new('blocking-start', 'blocking-start', [CompletionResultType]::ParameterValue, 'Start the GUI in blocking mode. You shouldn''t see this, but you may see it in shell completions because of this open clap issue: <https://github.com/clap-rs/clap/issues/1335>')
            [CompletionResult]::new('ssh', 'ssh', [CompletionResultType]::ParameterValue, 'Establish an ssh session')
            [CompletionResult]::new('serial', 'serial', [CompletionResultType]::ParameterValue, 'Open a serial port')
            [CompletionResult]::new('connect', 'connect', [CompletionResultType]::ParameterValue, 'Connect to wezterm multiplexer')
            [CompletionResult]::new('ls-fonts', 'ls-fonts', [CompletionResultType]::ParameterValue, 'Display information about fonts')
            [CompletionResult]::new('show-keys', 'show-keys', [CompletionResultType]::ParameterValue, 'Show key assignments')
            [CompletionResult]::new('cli', 'cli', [CompletionResultType]::ParameterValue, 'Interact with experimental mux server')
            [CompletionResult]::new('imgcat', 'imgcat', [CompletionResultType]::ParameterValue, 'Output an image to the terminal')
            [CompletionResult]::new('set-working-directory', 'set-working-directory', [CompletionResultType]::ParameterValue, 'Advise the terminal of the current working directory by emitting an OSC 7 escape sequence')
            [CompletionResult]::new('record', 'record', [CompletionResultType]::ParameterValue, 'Record a terminal session as an asciicast')
            [CompletionResult]::new('replay', 'replay', [CompletionResultType]::ParameterValue, 'Replay an asciicast terminal session')
            [CompletionResult]::new('shell-completion', 'shell-completion', [CompletionResultType]::ParameterValue, 'Generate shell completion information')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'wezterm;help;start' {
            break
        }
        'wezterm;help;blocking-start' {
            break
        }
        'wezterm;help;ssh' {
            break
        }
        'wezterm;help;serial' {
            break
        }
        'wezterm;help;connect' {
            break
        }
        'wezterm;help;ls-fonts' {
            break
        }
        'wezterm;help;show-keys' {
            break
        }
        'wezterm;help;cli' {
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'list windows, tabs and panes')
            [CompletionResult]::new('list-clients', 'list-clients', [CompletionResultType]::ParameterValue, 'list clients')
            [CompletionResult]::new('proxy', 'proxy', [CompletionResultType]::ParameterValue, 'start rpc proxy pipe')
            [CompletionResult]::new('tlscreds', 'tlscreds', [CompletionResultType]::ParameterValue, 'obtain tls credentials')
            [CompletionResult]::new('move-pane-to-new-tab', 'move-pane-to-new-tab', [CompletionResultType]::ParameterValue, 'Move a pane into a new tab')
            [CompletionResult]::new('split-pane', 'split-pane', [CompletionResultType]::ParameterValue, 'split the current pane.
Outputs the pane-id for the newly created pane on success')
            [CompletionResult]::new('spawn', 'spawn', [CompletionResultType]::ParameterValue, 'Spawn a command into a new window or tab
Outputs the pane-id for the newly created pane on success')
            [CompletionResult]::new('send-text', 'send-text', [CompletionResultType]::ParameterValue, 'Send text to a pane as though it were pasted. If bracketed paste mode is enabled in the pane, then the text will be sent as a bracketed paste')
            [CompletionResult]::new('get-text', 'get-text', [CompletionResultType]::ParameterValue, 'Retrieves the textual content of a pane and output it to stdout')
            [CompletionResult]::new('activate-pane-direction', 'activate-pane-direction', [CompletionResultType]::ParameterValue, 'Activate an adjacent pane in the specified direction')
            [CompletionResult]::new('get-pane-direction', 'get-pane-direction', [CompletionResultType]::ParameterValue, 'Determine the adjacent pane in the specified direction')
            [CompletionResult]::new('kill-pane', 'kill-pane', [CompletionResultType]::ParameterValue, 'Kill a pane')
            [CompletionResult]::new('activate-pane', 'activate-pane', [CompletionResultType]::ParameterValue, 'Activate (focus) a pane')
            [CompletionResult]::new('adjust-pane-size', 'adjust-pane-size', [CompletionResultType]::ParameterValue, 'Adjust the size of a pane directionally')
            [CompletionResult]::new('activate-tab', 'activate-tab', [CompletionResultType]::ParameterValue, 'Activate a tab')
            [CompletionResult]::new('set-tab-title', 'set-tab-title', [CompletionResultType]::ParameterValue, 'Change the title of a tab')
            [CompletionResult]::new('set-window-title', 'set-window-title', [CompletionResultType]::ParameterValue, 'Change the title of a window')
            [CompletionResult]::new('rename-workspace', 'rename-workspace', [CompletionResultType]::ParameterValue, 'Rename a workspace')
            [CompletionResult]::new('zoom-pane', 'zoom-pane', [CompletionResultType]::ParameterValue, 'Zoom, unzoom, or toggle zoom state')
            break
        }
        'wezterm;help;cli;list' {
            break
        }
        'wezterm;help;cli;list-clients' {
            break
        }
        'wezterm;help;cli;proxy' {
            break
        }
        'wezterm;help;cli;tlscreds' {
            break
        }
        'wezterm;help;cli;move-pane-to-new-tab' {
            break
        }
        'wezterm;help;cli;split-pane' {
            break
        }
        'wezterm;help;cli;spawn' {
            break
        }
        'wezterm;help;cli;send-text' {
            break
        }
        'wezterm;help;cli;get-text' {
            break
        }
        'wezterm;help;cli;activate-pane-direction' {
            break
        }
        'wezterm;help;cli;get-pane-direction' {
            break
        }
        'wezterm;help;cli;kill-pane' {
            break
        }
        'wezterm;help;cli;activate-pane' {
            break
        }
        'wezterm;help;cli;adjust-pane-size' {
            break
        }
        'wezterm;help;cli;activate-tab' {
            break
        }
        'wezterm;help;cli;set-tab-title' {
            break
        }
        'wezterm;help;cli;set-window-title' {
            break
        }
        'wezterm;help;cli;rename-workspace' {
            break
        }
        'wezterm;help;cli;zoom-pane' {
            break
        }
        'wezterm;help;imgcat' {
            break
        }
        'wezterm;help;set-working-directory' {
            break
        }
        'wezterm;help;record' {
            break
        }
        'wezterm;help;replay' {
            break
        }
        'wezterm;help;shell-completion' {
            break
        }
        'wezterm;help;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
