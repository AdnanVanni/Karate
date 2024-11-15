Feature: Sample API Test

  Background:
    * url 'https://api.restful-api.dev/'

  Scenario: Get single result
    Given path 'objects/7'
    When method get
    Then status 200
   And print response



  Scenario: post
    Given path 'objects'
    And def requestpayload =
      """
      {
        "name": "Apple MacBook Pro 16",
        "data": {
          "year": 2019,
          "price": 1849.99,
          "CPU model": "Intel Core i9",
          "Hard disk size": "1 TB"
        }
      }
      """
    And request requestpayload
    When method post
    Then status 200
    And match response.name == 'Apple MacBook Pro 16'
    And match response.data.year == 2019
    And match response.data.price == 1849.99
    And match response.data["CPU model"] == 'Intel Core i9'
    And match response.data["Hard disk size"] == '1 TB'
    And match response.id == '#notnull'
    And match response != { createdAt: '#ignore' }
    And print response
