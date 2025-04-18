param location string
param dataFactoryName string
param cosmosDbAccountName string
param sqlServerName string
param sqlDbName string
param keyVaultName string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {}
}

module cosmosLinkedService 'linkedServices/cosmosDb.bicep' = {
  name: 'cosmosLinkedService'
  params: {
    factoryName: dataFactory.name
    cosmosDbAccountName: cosmosDbAccountName
  }
}

module sqlLinkedService 'linkedServices/sqlDb.bicep' = {
  name: 'sqlLinkedService'
  params: {
    factoryName: dataFactory.name
    sqlServerName: sqlServerName
    sqlDbName: sqlDbName
  }
}

module cosmosDataset 'datasets/cosmosDataset.bicep' = {
  name: 'cosmosDataset'
  params: {
    factoryName: dataFactory.name
  }
}

module sqlDataset 'datasets/sqlDataset.bicep' = {
  name: 'sqlDataset'
  params: {
    factoryName: dataFactory.name
  }
}

module pipeline 'pipeline/samplePipeline.bicep' = {
  name: 'samplePipeline'
  params: {
    factoryName: dataFactory.name
  }
}

resource kvLinkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' = {
  parent: dataFactory
  name: 'KeyVaultLinkedService'
  properties: {
    type: 'AzureKeyVault'
    typeProperties: {
      baseUrl: 'https://${keyVaultName}.vault.azure.net/'
    }
  }
}

