Feature: Insurance APP Security Test

  Scenario: Happy Path Token Generation
    # url Step to assign Base url for ARI
    Given url "https://dev.insurance-api.tekschool-students.com"
    #Path is to specify with Endpoint
    And path "/api/token"
    # Request step for adding request body
    And request {"username": "supervisor","password": "tek_supervisor"}
    # method step to send request for method type. post, get, put, delete
    When method post
    # status assert response status code
    Then status 200


    ## Steps to remember:
    # #So now if you want to get rid of these yellows, you have to install another plugin.

    #For karate, there is karate plugin for Intellij.

    #But there is a but in there when you using cucumber for UI testing you have to disable that plug so.

    #You are in the in in the race of disabling, enabling, disabling, enabling if you are using cucumber with your framework, disable plugin.
    #
    #If you're using Karate interval plugin, so that's one thing that you might face issue if you install the plugin karate plugin, I'll show you the plugin.

    #I haven't installed it, so it's just time for karate and it's comes here.

    #This is karate plugin.

  # Install Karate plugin, because it give you error on the final project