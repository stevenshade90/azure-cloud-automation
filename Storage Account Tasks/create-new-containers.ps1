#This script can be used to create any of the Storage Account types (blob, file share, queue, table)
Connect-AzAccount

$ResourceGroup = "<Name of the resource group where the storage account is located>"
$StorageAccountName = "<The name of your storage account>"
$ContainerName = "<Name of your new container>"

#Context is the location of the storage account that will hold the new container
$Context = (Get-AzStorageAccount -ResourceGroupName $ResourceGroup -AccountName $StorageAccountName).Context;

#To create the other container types, modify the script and keep the -Name and -Context definitions
#  File Share: New-AzStorageShare 
#  Queue:      New-AzStorageQueue
#  Table:      New-AzStorageTable
New-AzStorageContainer -Name $ContainerName -Context $Context

