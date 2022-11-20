Feature: To test the get end point of the application
  To test different get end point with different data formate supported by the application

  Background: Setup the Base path
    Given url 'http://localhost:9897'
    And print '========== This is Background Keyword ================='
  
  Scenario: To get all the data from application in JSON format
    #Given url 'http://localhost:9897/normal/webapi/all'
    #Base Path + Context path
    And path '/normal/webapi/all'
    When method get # Send the get request
    #Then status 201 # The status code response should de 200
    Then status 200 # The status code response should de 200
    
  Scenario: To get all the data from application in JSON format using path variable
    #Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    #Base Path + Context path
    When method get # Send the get request
    #Then status 201 # The status code response should de 200
    Then status 200 # The status code response should de 200
    
  Scenario: To get all the data from application in XML format using path variable
    And path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get # Send the get request
    Then status 200 # The status code response should de 200
