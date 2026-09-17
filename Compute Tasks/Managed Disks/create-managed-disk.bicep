param diskConfig object = {
  diskName: 'practice-data-disk'
  location: resourceGroup().location
  diskSku: 'Standard_LRS'
  diskSizeGB: 32
}


resource dataDisk 'Microsoft.Compute/disks@2026-03-02' = {
  name: diskConfig.diskName
  location: diskConfig.location
  sku: {
    name: diskConfig.diskSku
  }
  properties: {
    creationData: {
      createOption: 'Empty'
    }
    diskSizeGB: diskConfig.diskSizeGB
  }
}

output diskId string = dataDisk.id
