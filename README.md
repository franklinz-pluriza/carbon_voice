# PhononX Demo App

<div align="center">
  <img src="https://github.com/franklinz-pluriza/carbon_voice/assets/95232306/04cb6b6d-9975-4f8b-84df-c8fc5de64a4e" alt="Carbon Voice Demo" width="300" />
</div>

### Estimated Working Hours Invested: ~4h

## Overview
Carbon Voice Demo is a `Flutter` project that serves as a demo of my coding approach. The project focuses on implementing local database connections, creating an architecture that seamlessly integrates with a Backend API through the `data` layer.

## Local Database Connections with Hive
In the previous interview, I mentioned that `SQflite` is a potential solution for local database connections. However, for this demo, `Hive` was chosen as the local database solution. Hive is a fast and efficient NoSQL database that serves the same purposes as `SQflite` but provides additional advantages for this project's needs. Additionally, `Isar` is another great NoSQL option, but I opted for `Hive`, considering that not everyone might be familiar with `Isar`.

## Authentication
In this demo, none of the `Firebase` features were used to meet the interviewer's request to ___avoid relying on ready-made solutions___. Instead, the authentication strategy is based on the local database. However, in a real-world scenario, the app would interact with a __Backend API__, providing a more secure and scalable authentication mechanism. The recommended approach for a real app would be to have a login endpoint that supports __basic `HTTP` authentication__. Upon successful login, the Backend API will return a session `JWT` token and a refresh token, which will be used for subsequent authenticated API calls.

## Real-time Chat via Web Sockets (Not Implemented in this Demo)
One of the possible ways to implement real-time chat functionality is by integrating the app with a `Web Sockets` server. However, please note that the current demo does not include the implementation of Web Sockets. It's left as a potential option for the future to handle real-time chat events and store them locally. When a user logs out, the chat event listener would be gracefully disposed of. Conversely, the listener would be registered again when a new session starts.

To handle prolonged periods without an active session (e.g., when a user hasn't logged in for a while), the app would request to fetch the latest chat data after logging in. This request is made __once__ after the user successfully logs in to ensure that the chat data is up-to-date.

## Testing
Due to __time constraints__, no `unit`, `widget`, or `integration` testing was implemented in this demo. However, for a production app, testing is __crucial for ensuring reliability and stability__. Implementing comprehensive testing, including unit tests for individual functions, widget tests for UI components, and integration tests for overall app behavior, would be the __next recommended step__.

## User Management and Chat
For simplicity in this demo, all users can chat with everyone (n to n relations). The app generates usernames from user email addresses.

Please note that the current authentication flow only implements basic registration and login features. Advanced features like email ___uniqueness validation or password strength enforcement are not included in this demo___.

## Contact
For any inquiries or questions regarding Carbon Voice Demo, please contact me at __franklin.zabaleta@pluriza.com__.
