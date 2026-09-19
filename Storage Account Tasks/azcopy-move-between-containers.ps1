./azcopy.exe login

$StorageAccount = "<name>"

$SourceContainer = "<source_blob_name>"
$SourceToken = "<SAS_token_for_source_container>" # The SAS token specifically on the container, NOT the storage account SAS

$DestinationContainer = "<destination_blob_name>"
$DestinationToken = "<SAS_token_for_destination_container>" # The SAS token specifically on the container, NOT the storage account SAS

$FullSourceUrl = "https://$StorageAccount.blob.core.windows.net/" + $SourceContainer + "?" + $SourceToken
$FullDestinationUrl = "https://$StorageAccount.blob.core.windows.net/" + $DestinationContainer + "?" + $DestinationToken

./azcopy.exe copy "$FullSourceUrl" "$FullDestinationUrl" --overwrite=ifsourcenewer --recursive
