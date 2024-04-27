@Smoke @Security @Regression
Feature: Insurance APP Security Test
    # url Step to assign Base url for ARI
    #Path is to specify with Endpoint
    # Request step for adding request body
    # method step to send request for method type. post, get, put, delete
    # status assert response status code
    # Print is the step and Response is the object (in the background)

  Background: Setup security test
    Given url "https://dev.insurance-api.tekschool-students.com"
    And path "/api/token"

  @US1_1
  Scenario Outline: Happy Path Token Generation
    And request
      """
      {
        "username": "<username>",
        "password": "<password>"
      }
      """
    When method post
    Then status <statusCode>
    And print response

    Examples:
      |username           | password       | statusCode |
      | supervisor        |tek_supervisor  | 200        |
      | operator_readonly | Tek4u2024      | 200        |


  #Send request to /api/token
  #With invalid username valid password
  #Expected status 404
  #  Response contains message user not found
  @US2_1
  Scenario Outline: Validate invalid credentials
    And request
      """
      {
        "username": "<username>",
        "password": "<password>"
      }
      """
    When method post
    Then status <statusCode>
    Then print response
    Then assert response.errorMessage == "<errorMessage>"
    Then assert response.httpStatus == "<httpStatus>"

    Examples:
      | username   | password       | statusCode | httpStatus  | errorMessage             |
      | wrongUser  | supervisor     | 404        | NOT_FOUND   | User wrongUser not found |
      | supervisor | wrong password | 400        | BAD_REQUEST | Password not matched     |
      | wronguser  | wrongpassword  | 404        | NOT_FOUND   | User wronguser not found |


    #Steps to remember:
    # So now if you want to get rid of these yellows, you have to install another plugin.
    #For karate, there is karate plugin for Intellij.
    #But there is a but in there when you using cucumber for UI testing you have to disable that plug so.
    #You are in the in in the race of disabling, enabling, disabling, enabling if you are using cucumber with your framework, disable plugin.
    #If you're using Karate interval plugin, so that's one thing that you might face issue if you install the plugin karate plugin, I'll show you the plugin.
    #This is karate plugin.
    # Install Karate plugin, because it give you error on the final project
    # if you want to run in different line run in " " "  and end '" " " codes
    # if you have steps, can be added on a background
    # Tag our runner and only run that user story
    #Activity- Send request to /api/token, with invalid username valid password, expected status 404

