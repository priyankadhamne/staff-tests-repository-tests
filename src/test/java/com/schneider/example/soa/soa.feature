@ignore
Feature: Soa Example Feature File

  Scenario: Composite Example
    # Initialization
    * def payload = read('soapayload.xml')
    * url soa125Url + '/soa-infra/services/otmshipment/QueryShipmentListProvABCSImpl/QueryShipmentListProvABCSImpl_ep?wsdl'
    * def logText = 'QueryShipmentListProvABCSImpl Start date : '
    * def elasticConfig = { config: '#(elastic)', LogText: '#(logText)', composite_name: 'QueryShipmentListProvABCSImpl', BusinessKey: '', reportEvent: false }
    # Send message
      Given request payload
       When soap action 'process'
       Then status 200
        And match response == '#notnull'
       When def logs = staffUtils.searchLogs(elasticConfig)
       Then assert logs == "success"