#Get Date for file name
$FileName = (Get-Date).tostring("dd-MM-yyyy-hh-mm-ss")

#Create File with date
New-Item -itemType File -Path c:\temp -Name ("Persistence_Achieved "+ $FileName + ".log")

#Set file to write to
$TargetFile = ("c:\temp\Persistence_Achieved "+ $FileName + ".log")

#Get data to write in file
$Date = Get-Date

#Write msg into new file created
"Hello Wolf we got in $Date" | Out-File -FilePath $TargetFile -Append 
