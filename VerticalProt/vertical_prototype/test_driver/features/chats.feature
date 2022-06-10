Feature: Chats

    Scenario: All chat rooms are displayed
        When I expect the text "UNICHAT" to be present
        Then I expect the widget "DA" to be present within 1 seconds
        Then I expect the widget "ES" to be present within 1 seconds
        Then I expect the widget "ME" to be present within 1 seconds
        Then I expect the widget "SO" to be present within 1 seconds
        Then I expect the widget "LC" to be present within 1 seconds

    Scenario: The top bar is displayed with a profile picture
        When I expect the text "UNICHAT" to be present
        Then I expect the widget "profilePic" to be present within 1 second

    Scenario: The message field is displayed correctly
        Given I tap the "DA" button
        When I expect the text "Desenho de Algoritmos" to be present
        Then I expect the widget "messageInput" to be present within 2 seconds
        Then I expect the widget "sendButton" to be present within 2 seconds
        Then I expect the widget "addButton" to be present within 2 seconds

    Scenario: The message is displayed correctly
        Given I tap the "DA" button
        When I expect the widget "messageCard" to be present within 2 seconds
        Then I expect the widget "name" to be present within 2 seconds
        Then I expect the widget "timestamp" to be present within 2 seconds

    Scenario: Send and receive messages
        Given I tap the "DA" button
        Given I expect the text "Desenho de Algoritmos" to be present
        When I fill the "messageInput" field with "test_gherkin"
        And I tap the "actionSendButton" button
        Then I expect the widget "test_gherkin" to be present within 2 seconds