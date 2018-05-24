param(
    $AccountToAdd
)

try {
    #Add login as a local administrator
    $group = [ADSI]"WinNT://$env:COMPUTERNAME/Administrators,group"
    $members = @($group.psbase.Invoke("Members"))
    $split = $AccountToAdd.Split("{\}")
    $user = $split[1]
    $domain = $split[0]
    $isMemberOf = ($members | foreach {$_.GetType().InvokeMember("Name", 'GetProperty', $null, $_, $null)}) -contains "$user"
    if ($isMemberOf -eq $false) {
        writeToLog("Adding '$domain\$user' to the local Administrators group.")
        $group.psbase.Invoke("Add", ([ADSI]"WinNT://$domain/$user").path)
    }
    else {
        writeToLog("'$domain\$user' is already a member of the local Administrators group.")
    }
}
catch [Exception] {
    writeWarning("Unable to update service Logon information.  This may not be an issue.  Exception: " + $_.Exception.Message)
}