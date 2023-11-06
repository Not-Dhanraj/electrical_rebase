# Electrical Project

Welcome to the Electrical Project! This cross-platform application is built using Flutter and Dart, following a Feature-first structure.

## Features

### Chat with AI

- This app provides a unique feature where users can chat with an AI to get answers to their electrical questions.
- The AI can identify electrical questions by analyzing a list of electrical-related words, and it uses a engineered prompt when user bypass the list.

### Cross-Platform Compatibility

- This app works on a variety of platforms, including:
  - Linux
  - Android
  - iOS
  - macOS
  - Web

### Resistance Calculations

- The app is equipped to calculate the combination of multiple series resistances and the combination of multiple parallel resistances, simplifying complex electrical calculations.

### Delta to Star Conversion (and vice versa)

- Users can effortlessly convert between delta resistance configuration and star configuration, providing flexibility in solving electrical network problems.

### Beautiful User Interface

- The UI is designed with Material Design principles in mind, making use of themes, responsive layouts and smooth animations.

## Getting Started
 To get started with the Electrical Project, follow these steps:

### Prerequisites

**Flutter**

- [Flutter documentation](https://flutter.dev/docs)
- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

### API Key and EndPoint `For HelpBot`
- Create a file named `auth.dart` in the `lib/constants` folder and add variable name `apiKey` and `endPoint` with your own API key and endpoint and fallback value as null Strings respectively if you don't want to provide one.
eg:
```
String endPoint = 'YOUR CHATBOT ENDPOINT HERE';
String apiKey = 'YOUR API KEY HERE';
String endPoint1 = 'YOUR CHATBOT FALLBACK ENDPOINT HERE';
String apiKey1 = 'YOUR CHATBOT FALLBACK API KEY HERE';
```


### Running the app locally

1. **Clone the Repository:**
   ```shell
   git clone https://github.com/Not-Dhanraj/electrical_rebase
2. **Move to app directory:**
   ```shell
   cd electrical_rebase
3. **Run the app:**
   ```shell
   flutter run
