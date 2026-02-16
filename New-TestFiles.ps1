[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[ValidateScript({Test-Path -Path $PSItem -PathType Container})]
[string]$Path,

[Validatelength(5,20)]
[string]$Name = "TestFiles",

[ValidateRange(1,99)]
[int]$FileCount = 9,

[ValidateRange(0,99)]
[int]$DirCount = 2,

[switch]$force
)
#Funktionsdeklaration
function New-TestFiles
{
[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[ValidateScript({Test-Path -Path $PSItem -PathType Container})]
[string]$Path,

[Validatelength(5,20)]
[string]$Name = "File",

[ValidateRange(1,99)]
[int]$FileCount = 9
)
    for($i = 1; $i -le $FileCount; $i++)
    {
        $FileName = $Name + ("{0:D2}" -f $i) + ".Txt"
        New-Item -Path $Path -Name $FileName -ItemType File    
    } 
}
#Ende

$Targetpath = Join-Path -Path $Path -ChildPath $Name
Write-Verbose -Message $Targetpath
if(Test-Path -Path $Targetpath -PathType Container)
{
    if($force)
    {
        Remove-Item -Path $Targetpath -Recurse -Force
    }
    else
    {
        throw "Der Ordner existiert bereits, ziehen Sie -Force in betracht"
    }
}

$TestFilesDir = New-Item -Path $Path -ItemType Directory -Name $Name

New-TestFiles -Path $TestFilesDir.FullName -FileCount $FileCount
<#
for($i = 1; $i -le $FileCount; $i++)
{
    $FileName = "File" + ("{0:D2}" -f $i) + ".Txt"
    New-Item -Path $TestFilesDir.FullName -Name $FileName -ItemType File    
} #>

for($i = 1; $i -le $DirCount; $i++)
{
    $DirName = "Dir" + ("{0:D2}" -f $i) 
    $subdir = New-Item -Path $TestFilesDir.FullName -Name $DirName -ItemType Directory  
    
    New-TestFiles -Path $subdir.FullName -FileCount $FileCount -Name "Dir$i-File"
    <#
    for($j = 1; $j -le $FileCount; $j++)
    {
        $FileName = "Dir$i-File" + ("{0:D2}" -f $j) + ".txt"
        New-Item -Path $subdir.FullName -Name $FileName -ItemType File
    }  #>
} 