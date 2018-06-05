param(
    $samAccountName = "",
    $objectClass = "user"
)

$samAccountName = $samAccountName + "*";

$output = @{
    message = "error"
    output = @()
}

$adsi = [ADSI]"";

$adsiSearcher = [adsisearcher]"";
$adsiSearcher.Filter = "(&(objectClass=$objectClass)(sAMAccountName=$samAccountName))";

$users = $adsiSearcher.FindAll()
$output.message = "success";

foreach($user in $users) {
    $output.output += @{
        cn = ($user.Properties['cn'])
        displayName = ($user.Properties['displayname'])
        samAccountName = ($user.Properties['samaccountname'])
        userPrincipalName = ($user.Properties['userprincipalname'])
        domain = ($adsi.name)
        loginValue = "$($adsi.name)\$($user.Properties['samaccountname'])"
        searchRoot = ($adsiSearcher.SearchRoot.Path)
    }
}

$output | ConvertTo-Json -Compress