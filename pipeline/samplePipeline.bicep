param factoryName string

resource samplePipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${factoryName}/SampleCopyPipeline'
  properties: {
    activities: [
      {
        name: 'CopyCosmosToSQL'
        type: 'Copy'
        inputs: [
          {
            referenceName: 'CosmosDbDataset'
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: 'SqlDbDataset'
            type: 'DatasetReference'
          }
        ]
        typeProperties: {
          source: {
            type: 'DocumentDbCollectionSource'
          }
          sink: {
            type: 'SqlSink'
          }
        }
      }
    ]
  }
}
