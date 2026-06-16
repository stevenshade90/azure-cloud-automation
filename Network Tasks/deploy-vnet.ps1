$ResourceGroup = ""
$Location = ""
$VNetName = ""
$AddressPrefix = "10.0.0.0/16"

Connect-AzAccount

$SubscriptionId = ""
Select-AzSubscription -SubscriptionId $SubscriptionId

#Use if needed to create resource group for the vnet
#New-AzResourceGroup -Name "$ResourceGroup" -Location "$Location"

$VNetParams = @{
	Name = $VNetName
	ResourceGroupName = $ResourceGroup
	Location = $Location
	AddressPrefix = $AddressPrefix
}

$virtualNetwork = New-AzVirtualNetwork @VNetParams

$subnet = @{
    Name = "My_Demo_Subnet"
    VirtualNetwork = $virtualNetwork
    AddressPrefix = "10.0.0.0/24"
}
$subnetConfig = Add-AzVirtualNetworkSubnetConfig @subnet

Set-AzVirtualNetwork -VirtualNetwork $virtualNetwork
