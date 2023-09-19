Feature: Registration

  Background:

    Given User on "https://dbank-qa.wedevx.co/bank" the home page of Digital Bank
    And  click on Sign Up Here

  Scenario: create a new user
    When user clicks on the title drop down and select title
    And  User enters "Donald" firstname
    And  User enters "Trump" lastname
    And user choose gender
    And user enter the following details in correct format:
      | DOB        | SSN         | email           | password   | confirmedPassword |
      | 03/12/1945 | 333-33-3333 | trump@gmail.com | Password12 | Password12        |
    Then click on NEXT Button
    And user enter the contact information in correct format:
      | ADDRESS     | LOCALITY | REGION | POSTAL-CODE | COUNTRY | HOME-PHONE    | MOBIL-PHONE   | WORK-PHONE    |
      | 123 Main St | Ney York | NY     | 12345       | US      | (123)345-5671 | (123)345-5672 | (123)345-5673 |
    And user choose to agree to the terms and policy
    Then user click on REGISTER button
    Then user should receive "Success" message


  Scenario: user doesn't select a title
    When user doest select title from drop down
    And  User enters "Donald" firstname
    And  User enters "Trump" lastname
    And user choose gender
    And user enter the following details in correct format:
      | DOB        | SSN         | email           | password   | confirmedPassword |
      | 03/12/1945 | 333-33-3333 | trump@gmail.com | Password12 | Password12        |
    Then click on NEXT Button
    Then user should receive alert "Please select an item in the list." message

  Scenario: user doesn't enter First Name
    When user clicks on the title drop down and select title
    And  User doesn't fill up firstname text box
    And  User enters "Trump" lastname
    And user choose gender
    And user enter the following details in correct format:
      | DOB        | SSN         | email           | password   | confirmedPassword |
      | 03/12/1945 | 333-33-3333 | trump@gmail.com | Password12 | Password12        |
    Then click on NEXT Button
    Then user should receive alert "Please fill out this field." message

  Scenario: user doesn't enter Last Name
    When user clicks on the title drop down and select title
    And  User enters "Donald" firstname
    And  User doesn't fill up lastname text box
    And user choose gender
    And user enter the following details in correct format:
      | DOB        | SSN         | email           | password   | confirmedPassword |
      | 03/12/1945 | 333-33-3333 | trump@gmail.com | Password12 | Password12        |
    Then click on NEXT Button
    Then user should receive alert "Please fill out this field." message


  Scenario: user doesn't choose gender
    When user clicks on the title drop down and select title
    And  User enters "Donald" firstname
    And  User enters "Trump" lastname
    And user doesn't choose gender
    And user enter the following details in correct format:
      | DOB        | SSN         | email           | password   | confirmedPassword |
      | 03/12/1945 | 333-33-3333 | trump@gmail.com | Password12 | Password12        |
    Then click on NEXT Button
    Then user should receive alert "Please select one of these options." message

  Scenario Outline: user doesn't enter, or enter un-correct format for DOB, SSN, or email or password/confirmedPassword blank or un-matched
    When user clicks on the title drop down and select title
    And  User enters "Donald" firstname
    And  User enters "Trump" lastname
    And user choose gender
    And user enter the following details with incorrect format or leave it blank:
      | DOB     | SSN     | email     | password     | confirmedPassword     |
      | "<DOB>" | "<SSN>" | "<email>" | "<password>" | "<confirmedPassword>" |

    Then click on NEXT Button
    Then user should receive alert "<alert>" message

    Examples:

      | DOB        | SSN         | email           | password   | confirmedPassword | alert                              |
      | 03.12.1945 | 333-33-3333 | trump@gmail.com | Password12 | Password12        | Please match the requested format. |
      |            | 333-33-3333 | trump@gmail.com | Password12 | Password12        | Please fill out this field.        |
      | 03/12/1945 | 666.77.7777 | trump@gmail.com | Password12 | Password12        |                                    |
      | 03/12/1945 | 66677777    | trump@gmail.com | Password12 | Password12        |                                    |
      | 03/12/1945 |             | trump@gmail.com | Password12 | Password12        |                                    |
      | 03/12/1945 | 333-33-3333 | trumpgmail.com  | Password12 | Password12        |                                    |
      | 03/12/1945 | 333-33-3333 | trump@gmail     | Password12 | Password12        |                                    |
      | 03/12/1945 | 333-33-3333 |                 | Password12 | Password12        |                                    |
      | 03/12/1945 | 333-33-3333 | trump@gmail.com | Password12 | Password11        |                                    |
      | 03/12/1945 | 333-33-3333 | trump@gmail.com | password12 | password12        |                                    |
      | 03/12/1945 | 333-33-3333 | trump@gmail.com | Passwordss | Passwordss        |                                    |
      | 03/12/1945 | 333-33-3333 | trump@gmail.com | Pass12     | Pass12            |                                    |
      | 03/12/1945 | 333-33-3333 | trump@gmail.com |            | Password12        |                                    |
      | 03/12/1945 | 333-33-3333 | trump@gmail.com | Password12 |                   |                                    |


  Scenario Outline: user enter incorrect contact info or leave it blank
    When user clicks on the title drop down and select title
    And  User enters "Donald" firstname
    And  User enters "Trump" lastname
    And user choose gender
    And user enter the following details in correct format:
      | DOB        | SSN         | email           | password   | confirmedPassword |
      | 03/12/1945 | 333-33-3333 | trump@gmail.com | Password12 | Password12        |
    Then click on NEXT Button
    And user enter incorrect contact info or leave it blank:
      | ADDRESS     | LOCALITY     | REGION     | POSTAL-CODE     | COUNTRY     | HOME-PHONE     | MOBIL-PHONE     | WORK-PHONE     | alert     |
      | "<ADDRESS>" | "<LOCALITY>" | "<REGION>" | "<POSTAL-CODE>" | "<COUNTRY>" | "<HOME-PHONE>" | "<MOBIL-PHONE>" | "<WORK-PHONE>" | "<alert>" |

    And user choose to agree to the terms and policy
    Then user click on REGISTER button
    Then user should receive alert "<alert>" message

    Examples:
      | ADDRESS     | LOCALITY | REGION | POSTAL-CODE | COUNTRY | HOME-PHONE    | MOBIL-PHONE   | WORK-PHONE    | alert |
      |             | Ney York | NY     | 12345       | US      | (123)345-5671 | (123)345-5672 | (123)345-5673 | error |
      | 123 Main St |          | NY     | 12345       | US      | (123)345-5671 | (123)345-5672 | (123)345-5673 | error |
      | 123 Main St | Ney York |        | 12345       | US      | (123)345-5671 | (123)345-5672 | (123)345-5673 | error |
      | 123 Main St | Ney York | NY     |             | US      | (123)345-5671 | (123)345-5672 | (123)345-5673 | error |
      | 123 Main St | Ney York | NY     | 12345       |         |               | (123)345-5672 | (123)345-5673 | error |
      | 123 Main St | Ney York | NY     | 12345       | US      | (123)345      | (123)345-5672 | (123)345-5673 | error |
      | 123 Main St | Ney York | NY     | 12345       | US      | (123)345-5671 |               | (123)345-5673 | error |
      | 123 Main St | Ney York | NY     | 12345       | US      | (123)345-5671 | (123)345      | (123)345-5673 | error |
      | 123 Main St | Ney York | NY     | 12345       | US      | (123)345-5671 | (123)345-5672 |               | error |
      | 123 Main St | Ney York | NY     | 12345       | US      | (123)345-5671 | (123)345-5672 | (123)345      | error |

  Scenario: user doesn't select to agree to the terms and policy
    When user clicks on the title drop down and select title
    And  User enters "Donald" firstname
    And  User enters "Trump" lastname
    And user choose gender
    And user enter the following details in correct format:
      | DOB        | SSN         | email           | password   | confirmedPassword |
      | 03/12/1945 | 333-33-3333 | trump@gmail.com | Password12 | Password12        |
    Then click on NEXT Button
    And user enter the contact information in correct format:
      | ADDRESS     | LOCALITY | REGION | POSTAL-CODE | COUNTRY | HOME-PHONE    | MOBIL-PHONE   | WORK-PHONE    |
      | 123 Main St | Ney York | NY     | 12345       | US      | (123)345-5671 | (123)345-5672 | (123)345-5673 |
    And user doesn't select to agree to the terms and policy
    Then user click on REGISTER button
    Then user should receive alert "alert" message



