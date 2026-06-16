$TenantId = ""
$DomainSuffix = ""
$UserNames = @(
	"Name 1",
	"Name 2"
)

Connect-AzAccount -TenantId $TenantId

foreach ($UserName in $UserNames)
{
	$PasswordGuid = New-Guid

	$NameParts = $UserName.Split(" ")
	$FirstName = $NameParts[0]
	$LastName = $NameParts[1]

	$DisplayName = $UserName
	$UserPrincipalName = $FirstName.ToLower() + "." + $LastName.ToLower() + "@" + $DomainSuffix

	$SecurePassword = ConvertTo-SecureString -AsPlainText -Force $PasswordGuid

	$NewUserParams = @{
		DisplayName = "$DisplayName"
		UserPrincipalName = "$UserPrincipalName"
		AccountEnabled = $true
		ForceChangePasswordNextLogin = $true
		MailNickname = $FirstName.ToLower() + "." + $LastName.ToLower()
	}
	$NewUser = New-AzADUser @NewUserParams -Password $SecurePassword
}



