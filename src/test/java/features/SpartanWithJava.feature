Feature: Karate Java Integration

  Background:
   # Given url 'https://api.exchangeratesapi.io'

    * def spartanUrl = 'http://54.197.122.229:8000'

  Scenario: Get a spartan with request header
    Given url spartanUrl
    And path "api/spartans"
    And header Accept = 'application/json'
    When method get
    Then status 200



  Scenario: Create a new spartan
    Given url spartanUrl
    And path "api/spartans"
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request
    """
     {
        "gender": "Female",
         "name": "Lorenza",
         "phone": 3123781237
    }
    """
    When method post
    Then status 201
    And print response


    Scenario: reading java methods
      #point the class that we want to run
      #Java.type--> used to connect to java class
      * def SDG = Java.type('utilities.SpartanDataGenerator')
      * def newSpartan1 = SDG.createSpartan()
    #run the static method in that class and capture the result
      * print newSpartan1


    Scenario: Create a new spartan with random data (JAVA)
      * def SDG = Java.type('utilities.SpartanDataGenerator')
      * def newSpartan1 = SDG.createSpartan()
      Given url spartanUrl
      And path "api/spartans"
      And header Accept = 'application/json'
      And header Content-Type = 'application/json'
      And request newSpartan1
      When method post
      Then status 201
      And print response
      And match response.success == 'A Spartan is Born!'
    #verify names
      And match response.data.name == newSpartan1.name
