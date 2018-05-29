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

# try {
    Start-Sleep -Seconds 5

    throw "I am an error!"
# }
# catch {
#     $output.message = "error";
#     $output.output = $_;
# }

$output | ConvertTo-Json -Compress