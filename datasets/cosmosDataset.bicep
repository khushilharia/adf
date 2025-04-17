param factoryName string

resource cosmosDataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  name: '${factoryName}/CosmosDbDataset'
  properties: {
    linkedServiceName: {
      referenceName: 'AzureCosmosDbLS'
      type: 'LinkedServiceReference'
    }
    type: 'DocumentDbCollection'
    typeProperties: {
      collectionName: 'YourCollection' // Replace with actual collection
    }
  }
}
