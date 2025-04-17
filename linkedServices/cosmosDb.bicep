param factoryName string
param cosmosDbAccountName string

resource cosmosLinkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' = {
  name: '${factoryName}/AzureCosmosDbLS'
  properties: {
    type: 'CosmosDb'
    typeProperties: {
      accountEndpoint: 'https://${cosmosDbAccountName}.documents.azure.com:443/'
      database: 'YourDatabaseName' // Replace with actual DB
    }
    connectVia: null
  }
}
