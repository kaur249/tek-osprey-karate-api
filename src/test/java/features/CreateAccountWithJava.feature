@Regression
Feature: Create Account with Java Data Generator

  @CreateAccount_2
  Scenario: Create An Account with Random Email address
    Given url BASE_URL
    And path "/api/accounts/add-primary-account"
    * def dataGenerator = Java.type('data.DataGenerator')
    * def randomEmail = dataGenerator.getEmail()
    And request
      """
      {
        "email": "#(randomEmail)",
        "firstName": "Kulvinder",
        "lastName": "Kaur",
        "title": "Miss.",
        "gender": "FEMALE",
        "maritalStatus": "SINGLE",
        "employmentStatus": "Student",
        "dateOfBirth": "1956-02-10"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.email == randomEmail