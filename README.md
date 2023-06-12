# UserAuthenticationFlow-Combine
User Authentication Flow - A challenge to showcase Combine skills

To gain experience using Combine, I asked ChatGPT to generate challenges to complete. This repo is my solution.

## The Challenge

- Present a login screen with username and password fields.
- Validate the username and password inputs.
- Upon successful validation, make a network request to authenticate the user.
- Display loading indicators during the authentication process.
- Handle and display appropriate error messages if authentication fails.
- If authentication is successful, transition to a home screen or display a success message.

## About the Soltion

### Username and password validation:
* I used published properties in an observable object to track the user’s text input for the username and password.
* I used 'combineLatest' to combine the latest values of the username and password.
* I used a map operator for some simple text validation, returning a bool to indicate if both values are valid.
* This value is assigned to a property using the 'assign' subscriber. This property is then used to toggle whether a login button is enabled or not.

### Checking the credentials:
* This project contains mocked data for login details.
* A login service uses this mocked data, returning a 'Future' that indicates if the user details are valid.
* A delay generator is used to simulate a network request. This is also backed by a 'Future'.
* A 'flatMap' is used to convert the 'Future' from the delay generator to the login success 'Future'.

### Other Notes:
* A 'FocusState' is used to allow the user to use the Enter key to move between text fields.
* An 'enabled' custom SwiftUI modifier has been added to improve readability.

## Screenshots
On launch, the user is presented with a login screen. If the login is successful, then they are taken to a home screen.

![Simulator Screenshot - iPhone 14 Pro - 2023-06-10 at 23 26 32](https://github.com/MattHeaney23/UserAuthenticationFlow-Combine/assets/129856192/191762be-e57c-4e50-9416-acbe89761463) ![Simulator Screenshot - iPhone 14 Pro - 2023-06-10 at 23 26 21](https://github.com/MattHeaney23/UserAuthenticationFlow-Combine/assets/129856192/1dabdbda-0800-4ce2-8dc4-b9adf5f51ffc)

