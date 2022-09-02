 $slogonevents = Get-Eventlog -LogName Security  | where {$_.eventID -eq 4624 }

#Not grabbing type 5 events (Service)

  foreach ($e in $slogonevents){
    # Logon Successful Events
    # Local (Logon Type 2)
    if (($e.EventID -eq 4624 ) -and ($e.ReplacementStrings[8] -notlike 5)){
      write-host $e.TimeGenerated "`tStatus: Success`tUser: "$e.ReplacementStrings[5] "`tWorkstation: "$e.ReplacementStrings[11] "`tLogonType: "$e.ReplacementStrings[8]
      }
    } 
