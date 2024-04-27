@Regression
Feature: Create new Account

  #Send request to /api/accounts/add-primary-account
  #Response status should be 201
  #Assertion email address

  @CreateAccount
  Scenario: Create Account happy path
    Given url "https://dev.insurance-api.tekschool-students.com"
    And path "/api/accounts/add-primary-account"
    And request
      """
      {
        "email": "smith222331@gmail.com",
        "firstName": "Smith",
        "lastName": "Saunders",
        "title": "Mr.",
        "gender": "MALE",
        "maritalStatus": "SINGLE",
        "employmentStatus": "Student",
        "dateOfBirth": "1964-02-13"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.email == "smith222331@gmail.com"
    * def accountId = response.id
    * def result = callonce read('GenerateValidToken.feature')
    * def token = "Bearer " + result.response.token
    Given path "/api/accounts/delete-account"
    And header Authorization = token
    And param primaryPersonId = accountId
    When method delete
    Then status 200
