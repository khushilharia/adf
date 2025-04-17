param factoryName string
param sqlServerName string
param sqlDbName string

resource sqlLinkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' = {
  name: '${factoryName}/AzureSqlDbLS'
  properties: {
    type: 'AzureSqlDatabase'
    typeProperties: {
      connectionString: 'Server=tcp:${sqlServerName}.database.windows.net,1433;Initial Catalog=${sqlDbName};Integrated Security=False;Encrypt=True;Connection Timeout=30;'
    }
    connectVia: null
  }
}
