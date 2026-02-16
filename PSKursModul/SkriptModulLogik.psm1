<#
.SYNOPSIS
    Testet die Pipeline
.DESCRIPTION
    Diese Funktion dient zum Testen der Pipeline in PowerShell. Sie nimmt Eingaben aus der Pipeline entgegen und gibt die Werte für Name und IntInput aus. Sie zeigt auch, wann die Begin-, Process- und End-Blöcke durchlaufen werden.
.PARAMETER Name
    Ein String-Parameter, der den Namen repräsentiert. Er kann über die Pipeline oder durch direkte Zuweisung übergeben werden.
.PARAMETER IntInput
    Ein Integer-Parameter, der eine Ganzzahl repräsentiert. Er kann über die Pipeline oder durch direkte Zuweisung übergeben werden.
.LINK
    https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-5.1#syntax-for-comment-based-help-in-scripts
#>
function Test-PipeLine {
    [cmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [string]$Name ="",

        [Parameter(ValueFromPipeline = $true)]
        [int]$IntInput = 0
    )
    Begin
    {
        Write-Verbose "Wird einmal am Start durchlaufen zb zum initizialisieren von Variablen oder so"
    }
    Process
    {
        Write-Verbose "Wird für jedes Objekt in der Pipeline durchlaufen"
        Write-Host "Name: $Name, IntInput: $IntInput"
    }
    End
    {
        Write-Verbose "Wird einmal am Ende durchlaufen zb zum Aufräumen von Variablen oder so"
    }
}
