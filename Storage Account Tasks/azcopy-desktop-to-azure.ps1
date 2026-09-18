# Basic AzCopy script to upload a file from a desktop PC to an Azure storage container
# cd to location of the azcopy executable (C:\AzCopy)
# Files don't need to be in this folder, but the script needs to be run from that directory
# SAS Token taken directly from the blob container, not the storage account SAS
# DestinationUrl formatted to prevent some uploading issues I was encountering with other formats

./azcopy.exe login

$SourcePath = "<From_PC>"
$StorageAccountName = "<storageaccount1>"
$ContainerName = "<destination_of_copy>"
$Token = "<SAS_Token>"  # Used container-specific SAS token rather than account SAS
$DestinationUrl = "https://$StorageAccount.blob.core.windows.net/" + $Container + "?" + $Token

./azcopy.exe copy "$SourcePath" "$DestinationUrl"
