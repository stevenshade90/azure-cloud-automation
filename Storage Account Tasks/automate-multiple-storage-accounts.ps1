#This will generate multiple storage accounts by looping through the values in $Departments
#"Department" and "ResourceGroup" should be modified to your specific environment
#The "Department" value should be in lowercase to meet Storage Account naming requirements
$Departments = @(
	[PSCustomObject]@{Department = "engineering"; ResourceGroup = "Engineering-Resources"},
	[PSCustomObject]@{Department = "finance"; ResourceGroup = "Finance-Resources"},
	[PSCustomObject]@{Department = "hr"; ResourceGroup = "HR-Resources"},
	[PSCustomObject]@{Department = "it"; ResourceGroup = "IT-Resources"}
)

Connect-AzAccount 

foreach ($Dept in $Departments)
{
	$StorageAccountParams = @{
		StorageAccountName = "$($Dept.Department)sa001pc"
		ResourceGroupName = $Dept.ResourceGroup
		Location = "EastUs"
		SkuName = "Standard_LRS"
	}
	New-AzStorageAccount @StorageAccountParams -AllowBlobPublicAccess $False
}

