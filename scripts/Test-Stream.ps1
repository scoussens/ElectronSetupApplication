param(
    $Number,
    $Letter,
    $Text,
    $ComputerName,
    $InternetAddress
)

$output = [PSCustomObject]@{
    message = ""
    object = @{}
}

try {
    Write-Host "Script is starting...";
    Write-Host "Going to sleep for 10 seconds.";

    Start-Sleep -Seconds 10

    Write-Host "Waking up.";
    Write-Host "I received the following parameters:";
    Write-Host "$Number, $Letter, $Text, $ComputerName, $InternetAddress";
    Write-Host "Going to sleep for 5 seconds to finish up.";

    Start-Sleep -Seconds 5

    Write-Host "All done!";

    $output.message = "success";
    $output.object = Get-Process | Select-Object Name, CPU, WorkingSet;
}
catch [System.Management.Automation.RuntimeException] {
    $myError = @{
        Message = $_.Exception.Message
        Type = $_.FullyQualifiedErrorID
    }
    $output.message = "error";
    $output.object = @{ Error = $myError };
}

$output | ConvertTo-Json -Compress