param dataFactoryName string
param keyVaultName string
param secretName string = 'SqlConnectionString'

resource sqlLinkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' = {
  name: '${dataFactoryName}/AzureSqlDbLS'
  properties: {
    type: 'AzureSqlDatabase'
    typeProperties: {
      connectionString: {
        type: 'AzureKeyVaultSecret'
        store: {
          referenceName: keyVaultName
          type: 'LinkedServiceReference'
        }
        secretName: secretName
      }
    }
  }
}
