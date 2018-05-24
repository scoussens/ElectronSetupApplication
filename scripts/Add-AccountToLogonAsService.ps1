param(
    $accountToAdd
)
#written by Ingo Karstein, http://blog.karstein-consulting.com
#  v1.0, 01/03/2014

$sidstr = $null
try {
    $ntprincipal = new-object System.Security.Principal.NTAccount "$accountToAdd"
    $sid = $ntprincipal.Translate([System.Security.Principal.SecurityIdentifier])
    $sidstr = $sid.Value.ToString()
}
catch [Exception] {
    writeError("Account $accountToAdd not found.  Exception: " + $ex)
    return
}


$tmp = [System.IO.Path]::GetTempFileName()

writeToLog "Verifying Local Security Policy for '$accountToAdd'."
secedit.exe /export /cfg "$($tmp)" 

$c = Get-Content -Path $tmp 

$currentSetting = ""

foreach ($s in $c) {
    if ( $s -like "SeServiceLogonRight*") {
        $x = $s.split("=", [System.StringSplitOptions]::RemoveEmptyEntries)
        $currentSetting = $x[1].Trim()
    }
}

if ( $currentSetting -notlike "*$($sidstr)*" ) {
    #writeToLog "Modify Setting ""Logon as a Service"""

    if ( [string]::IsNullOrEmpty($currentSetting) ) {
        $currentSetting = "*$($sidstr)"
    }
    else {
        $currentSetting = "*$($sidstr),$($currentSetting)"
    }

    #writeToLog "$currentSetting"

    $outfile = @"
[Unicode]
Unicode=yes
[Version]
signature="`$CHICAGO`$"
Revision=1
[Privilege Rights]
SeServiceLogonRight = $($currentSetting)
"@

    $tmp2 = [System.IO.Path]::GetTempFileName()

    $outfile | Set-Content -Path $tmp2 -Encoding Unicode -Force | out-null

    #notepad.exe $tmp2
    Push-Location (Split-Path $tmp2)

    try {
        secedit.exe /configure /db "secedit.sdb" /cfg "$($tmp2)" /areas USER_RIGHTS | Out-Null
        #write-host "secedit.exe /configure /db ""secedit.sdb"" /cfg ""$($tmp2)"" /areas USER_RIGHTS "
    }
    finally {	
        Pop-Location
    }
}
else {
    #Account already has access.
}