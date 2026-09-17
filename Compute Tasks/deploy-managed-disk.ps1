Connect-AzAccount

New-AzResourceGroup -Name 'rg-sandbox-disks' -Location 'eastus'

New-AzResourceGroupDeployment `
  -ResourceGroupName 'rg-sandbox-disks' `
  -TemplateFile '.\create-managed-disk.bicep'
