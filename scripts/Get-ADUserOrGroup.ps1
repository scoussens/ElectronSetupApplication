param(
    $samAccountName = "",
    $objectClass = "user"
)

$samAccountName = $samAccountName + "*";

$output = @{
    message = "error"
    output = @()
}

$adsi = [adsisearcher]"";
$adsi.Filter = "(&(objectClass=$objectClass)(sAMAccountName=$samAccountName))";

$users = $adsi.FindAll()
$output.message = "success";

foreach($user in $users) {
    $output.output += @{
        cn = ($user.Properties['cn'])
        displayName = ($user.Properties['displayname'])
        samAccountName = ($user.Properties['samaccountname'])
        userPrincipalName= ($user.Properties['userprincipalname'])
        searchRoot = ($adsi.SearchRoot.Path)
    }
}

$output | ConvertTo-Json -Compress