If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))

{   
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}

$client = new-object System.Net.WebClient
$client.DownloadFile("https://cdn.discordapp.com/attachments/515001301633859613/540435693374013491/LGPO.exe","$env:USERPROFILE\Desktop\PowershellServer\LGPO.exe")
New-Item -ItemType directory -Path 'C:\Users\Cyber\Desktop\PowershellServer\{81080456-38E6-45D4-BE11-F4B07F8CAD7F}'
Copy-Item -Path "$env:USERPROFILE\Desktop\PowershellServer\LGPO.exe" -Destination "C:\Windows\System32"
lgpo /g "$env:USERPROFILE\Desktop\PowershellServer\{81080456-38E6-45D4-BE11-F4B07F8CAD7F}"
Get-WmiObject win32_useraccount | Foreach-Object {
([adsi](“WinNT://”+$_.caption).replace(“\”,”/”)).SetPassword(“Cyb3rPatriot1!”)
}