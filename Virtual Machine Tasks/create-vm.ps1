#Parameters -- fill these in prior to execution
$ResourceGroup = ""
$Location = ""
$VnetName = ""
$AddressPrefix = "10.0.0.0/16"
$SubnetName = ""
$VMName = ""
$publicIpAddressName = ""


$adminUsername = ""
$adminPassword = ("" | ConvertTo-SecureString -AsPlainText -Force)
$adminCreds = New-Object PSCredential $adminUsername, $adminPassword


#Establish connection to account with appropriate credentials
Connect-AzAccount
$SubscriptionId = ""
Select-AzSubscription -SubscriptionId $SubscriptionId


$VMParams = @{
	VirtualNetworkName = $VnetName
	SubnetName = $SubnetName
	ResourceGroupName = $ResourceGroup
	Location = $Location
	Name = $VMName
	Credential = $adminCreds
	PublicIpAddressName = $publicIpAddressName
}


#Create the VM
New-AzVM @VMParams
