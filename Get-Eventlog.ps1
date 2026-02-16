[cmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateSet(4624,4625,4634)]
    [int]$EventId,

    [ValidateRange(1,30)]
    [int]$Newest = 10,

    [ValidateScript({Test-NetConnection -ComputerName $PSItem -CommonTCPPort WinRm})]
    [string]$Computername = "localhost"
)
Write-Verbose -Message "Ich bin eine optionale Ausgabe"
Write-Debug -Message "Ich bin ein Debug Haltepunkt"
Get-EventLog -LogName Security -ComputerName $Computername | Where-Object -FilterScript {$PSItem.EventID -eq $EventId} | Select-Object -First $Newest

