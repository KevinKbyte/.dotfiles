using namespace System.Management.Automation
using namespace System.Management.Automation.Language
 
Import-Module PSReadLine
. "~\OneDrive\Documents\WindowsPowerShell\MyFunctions.ps1"
Set-Alias -Name "gh" -Value "Get-Help"
 
$ENV:EDITOR = "Vim"
 
$PSReadLineOptions = @{
    EditMode = "Emacs"
    HistoryNoDuplicates = $true
    HistorySearchCursorMovesToEnd = $true
    Colors = @{
        "Command" = "#8181f7"
    }
    ShowToolTips = $true
}
 
Set-PSReadLineOption @PSReadLineOptions
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
# Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Key Ctrl+p -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key Ctrl+n -Function HistorySearchForward
 
# Clipboard interaction is bound by default in Windows mode, but not Emacs mode.
Set-PSReadLineKeyHandler -Key Ctrl+C -Function Copy
Set-PSReadLineKeyHandler -Key Ctrl+v -Function Paste
Set-PSReadLineKeyHandler -Key Alt+a -Function SelectAll
Set-PSReadLineKeyHandler -Key Alt+k -Function KillLine
Set-PSReadLineKeyHandler -Key Ctrl+z -Function Undo
 
Set-PSReadLineKeyHandler -Key Alt+l -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert(" ls")
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
 
Set-PSReadLineKeyHandler -Key Ctrl+l -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert(" clear")
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
 
$vimrc = "~\.vimrc"
# function bak { # backups configs into OneDrive
                # iexc "cp '$ps_history' '$od_ps_history' -Force"
                # iexc "cp '$code_rc' '$od_code_rc' -Force -Recurse"      
                # iexc "cp '$vimrc' '$od_vimrc' -Force"   
#}
 
# function ph {
   #  iexc "vim 'PS_HISTORY_PATH’ $args"
# }
 
# function frc {
    # iexc "vim 'PS_FN_PATH' $args"
# }
 
function prc {
   iexc "code $PROFILE"
}
 
function vrc {
    iexc "vim $vimrc $args"
}
 
function v {
    iexc "vim $args"
}

function e {
    if ($args[0] -eq $null) {
        $cmd = "explorer .";
    } else {
        $cmd = "explorer $args";
    }
    iexc "$cmd"
}

function co {
    if ($args[0] -eq $null) {
        $cmd = "code ."
    } else {
        $cmd = "code $args"
    }
    iexc "$cmd"
}


function ph {
    iexc "vim  C:\Users\Kev\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"
}

function wh {
    iexc "(Get-Command $args).Definition"
}
 
# function ph_clean {
   # $ph = "PH_HISTORY_PATH"
   # cat $ph | Sort-Object | Get-Unique
# }