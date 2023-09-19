Feature: This feature file tests Login Page functionality


  Scenario: User should be able to login to Digital Bank successfully using correct credential
    Given user on login page can use "alaainwork@gmail.com" and "Aliali88" to login
    Then user validates Welcome message land on Home Page

  @negative
  Scenario Outline: User should not be able to login to Digital Bank with invalid or empty credentials
    When user enters "<username>" username
    And user enters "<password>" password
    Then user clicks on sign in button
    And user validates "<errorMessage>" error message
    Examples:
      | username             | password    | errorMessage |
      | kshjfkff             | Aliali88    | Error        |
      | alaainwork@gmail.com | fd445ffdb54 | Error        |
      | dfddff               | fd445ffdb54 | Error        |
      |                      | Aliali88    | Error        |
      | alaainwork@gmail.com |             | Error        |


