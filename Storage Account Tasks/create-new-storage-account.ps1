$ResourceGroup = "<RG where the storage account will be stored>"
$Location = "<EastUs, WestUs...>"
$StorageAccountName = "<unique name for storage account"
$SkuName = "Standard_LRS <or other storage tier>"

New-AzStorageAccount -Name $StorageAccountName -ResourceGroupName $ResourceGroup -Location $Location -SkuName $SkuName -AllowBlobPublicAccess $False

