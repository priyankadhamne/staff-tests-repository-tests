@parallel=false @ignore
Feature: Verification of Tp Profile tab

  Background:
    * call read ('data.json')
    * call read ('locators.json')
    * call read('classpath:com/schneider/staff/common/oam-login.feature'){ applicationPath: '/bcs/ui/faces/jsps/bcshome.jspx' }

  Scenario: Default search, search with all inputs, verification of reset, save search, run saved search, delete saved search
      # Given url bcsHome
      Given driver.maximize()
        And delay(DELAY_2X)
    # TC01_NoMandatoryFields_Search - Search without mandatory fields, verify Error message
       When waitFor(navigate.tpProfile)
        And click(navigate.tpProfile)
        And delay(DELAY_2X)
       Then waitForText('body','No rows yet.')
        And click(search.btnSearch)
        And print "Default search is successful"