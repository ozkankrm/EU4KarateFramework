

Feature: Parameters examples

  Background:
   # Given url 'https://api.exchangeratesapi.io'
    * def baseUrl = 'https://api.exchangeratesapi.io'
    * def spartanUrl = 'http://54.197.122.229:8000'
    * def hrUrl = 'http://54.197.122.229:1000/ords/hr'

    
  Scenario: path parameters
    Given url baseUrl
    And path "latest"
    When method get
    Then status 200

  Scenario: path parameters
    Given url baseUrl
    And path "2010-01-12"
    When method get
    Then status 200


  Scenario: get one spartan only
    Given url spartanUrl
    And path "api/spartans"
    And path "19"
    When method get
    Then status 200
    And print response
    And match response == {"gender": "Female","phone": 7662992732,"name": "Bunnie","id": 19}


  Scenario: get one spartan only
    * def expectedSpartan =
    """
    {
      "gender": "Female",
      "phone": 7662992732,
      "name": "Bunnie",
      "id": 19
    }
    """
    Given url spartanUrl
    And path "api/spartans"
    And path "19"
    When method get
    Then status 200
    And print response
    And match response == expectedSpartan

    Scenario: query parameters
      Given url spartanUrl
      And path "api/spartans/search"
      And param nameContains = 'j'
      And param gender = 'Female'
      When method get
      Then status 200
      And match header Content-Type == 'application/json'
      And print response
      And match response.pageable.pageNumber == 0
      #verify each content has gender = Female
      And match each response.content contains {"gender":"Female"}
      #each keyword like loop
      #second way of iteration
      And match each response.content[*].gender == 'Female'
      And match response.content[0].name == 'Jaimie'
      #verify each content phone is number
      And match response.content[*].phone == '#number'


  @wip
  Scenario: hr regions example
    Given url hrUrl
    And path 'regions'
    When method get
    Then status 200
    And print response
    And match response.limit == 25
    And print each response.items[*].region_id == '#number'
