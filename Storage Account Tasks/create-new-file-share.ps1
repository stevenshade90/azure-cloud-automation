$ResourceGroup = "PRACTICE"
$StorageAccountName = "mypracticestorage1324"
$FileShareName = "mypracticeshare1324"
$Context = (Get-AzStorageAccount -ResourceGroupName $ResourceGroup -AccountName $StorageAccountName).Context;

New-AzStorageShare -Name $FileShareName -Context $Context
