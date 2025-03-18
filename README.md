# UniChat

## Vision Statement

**UniChat** - The next generation of chats for student cooperation. 
Simplicity makes efficiency. Efficiency makes perfection. 
For students, by students.

## Main Features

- **Automatic creation of class groups**: When a user enrolls in a course, they are automatically added to the corresponding class chat.
- **Chat notifications**: Users receive automatic notifications when there are new messages.
- **File sharing**: The app allows users to share files seamlessly.

## Assumptions and Dependencies

### Assumptions
- The application requires access to information regarding the classes in which a student is enrolled (retrieved from **Sigarra**).

### Dependencies
- **Firebase**: Used for real-time chat functionality, storage, and ensuring privacy.
- **Flutter SDK**: Used for app development.
- **Android SDK**: Required for frontend implementation.

## Architecture and Design

### Overview

The UniChat app leverages **Flutter SDK** for backend communication and, in conjunction with the **Android SDK**, constructs the frontend. The backend plays a crucial role in ensuring seamless chat synchronization between local storage and the Firebase database, as well as retrieving student enrollment information from Sigarra. The frontend is designed to provide an intuitive and functional user experience.

### Logical Architecture

UniChat consists of the following core components:

- **UniChat UI**: The user interface responsible for displaying chat functionalities.
- **Notification System**: Manages and delivers notifications to users when new messages arrive.
- **Chat Room Authorization System**: Ensures secure access to chat rooms, integrating with both **Sigarra** (for student information) and **Firebase** (for chat storage and management).

#### Logical Architecture Diagram
![Logical Architecture](../img/LogicDiagramUML.png)

### Physical Architecture

The UniChat system is structured as follows:

- **Client-side**: Users interact with the application through a Flutter-based mobile app.
- **Server-side**: The backend, consisting of the **UNI backend** and **Firebase configuration**, manages authentication, chat synchronization, and student enrollment data.
- **External Services**:
  - **Firebase**: Provides real-time database and cloud storage capabilities.
  - **SIGARRA**: Supplies student enrollment data for automatic group assignments.

#### Physical Architecture Diagram
![Physical Architecture](../img/PhysicalArchitectureUML.png)

## Vertical Prototype

A vertical prototype of the application is available for preview:
[Download APK](../VerticalProt/vertical_prototype/build/app/outputs/flutter-apk/app-release.apk)
