param factoryName string

resource sqlDataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  name: '${factoryName}/SqlDbDataset'
  properties: {
    linkedServiceName: {
      referenceName: 'AzureSqlDbLS'
      type: 'LinkedServiceReference'
    }
    type: 'AzureSqlTable'
    typeProperties: {
      tableName: 'YourTable' // Replace with actual table
    }
  }
}
