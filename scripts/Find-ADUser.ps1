param(
    $username = ""
)

$username = $username + "*";

$output = @{
    message = "error"
    output = @()
}

$adsi = [adsisearcher]"";
$adsi.Filter = "samaccountname=$username";

$users = $adsi.FindAll()
$output.message = "success";

foreach($user in $users) {
    $output.output += @{
        CN = ($user.Properties['CN'])
        DisplayName = ($user.Properties['DisplayName'])
        SamAccountName = ($user.Properties['SamAccountName'])
    }
}

$output | ConvertTo-Json -Compress