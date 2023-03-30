@ignore @parallel=false
Feature: Sample test

  Background:
  * def appUrl = baseUrl + '/execution/gate/resources/v1/gateresources/power/10013/detail'
  * def cookieUrl = baseUrl + '/restws/008/entserv/auth/resources/v1/security/oamcookies'
  * callonce read('classpath:com/schneider/common/get-cookies.feature') { appSuccessUrl: '#(appUrl)' , authCookieUrl: '#(cookieUrl)' , appUsername: '#(appUsername)' , appPassword: '#(appPassword)' }
  * callonce read('classpath:com/schneider/common/set-api-cookies.feature')

  Scenario: Get power details
      Given url baseUrl + '/execution/gate/resources/v1/gateresources/power/10013/detail'
       When method GET
       Then status 200
        And match response.status == 'Success'