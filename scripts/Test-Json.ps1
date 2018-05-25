param(
    $Number,
    $Letter,
    $Text,
    $ComputerName,
    $InternetAddress
)

$output = [PSCustomObject]@{
    message = ""
    output = @{}
}

try {
    Start-Sleep -Seconds 5

    $output.message = "success";
    $output.output = Get-Process | Select-Object Name, CPU, WorkingSet;
}
catch [System.Management.Automation.RuntimeException] {
    $output.message = "error";
    $output.output = $_;
}

$output | ConvertTo-Json -Compress