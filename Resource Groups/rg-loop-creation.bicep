targetScope = 'subscription'

@description('Region for the two RGs')
param location string = 'eastus'

@description('Names of the resource groups to create, utilized in a loop later')
var resourceGroups = [
    {
        name: 'rg-hub-network'
        role: 'Hub Networking'
    }
    {
        name: 'rg-spoke-app'
        role: 'Spoke Application'
    }
]

@description('Loop to create both resource groups')
resource rgs 'Microsoft.Resources/resourceGroups@2023-07-01' = [for rg in resourceGroups: {
  name: rg.name
  location: location
  tags: {
    Role: rg.role
  }
}]

output resourceGroupIds array = [for (rg, i) in resourceGroups: rgs[i].id]
