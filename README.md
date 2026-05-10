# 🍽️ Recipe App

A beautiful and feature-rich Flutter recipe application that allows users to browse, search, and view detailed recipes from the DummyJSON API.

## 📱 Features

- **User Authentication**: Secure login system with JWT token authentication
- **Recipe Browsing**: Browse through hundreds of recipes with beautiful images
- **Category Filtering**: Filter recipes by meal type (Breakfast, Lunch, Dinner, Snack)
- **Recipe Details**: View comprehensive recipe information including:
  - Ingredients list with checkboxes
  - Step-by-step cooking instructions
  - Cooking and preparation times
  - Difficulty level and cuisine type
  - Ratings and review counts
- **Responsive Design**: Works seamlessly on different screen sizes
- **Modern UI**: Built with Material Design 3 principles

## 🛠️ Tech Stack

- **Framework**: Flutter (SDK ^3.0.0)
- **Language**: Dart
- **State Management**: SetState (simple state management)
- **Networking**: Dio HTTP client
- **Authentication**: JWT tokens
- **UI Components**: Material Design 3
- **API**: DummyJSON REST API

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version ^3.0.0)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)
- [Android SDK](https://developer.android.com/studio#command-line-tools-only) (for Android development)
- [Xcode](https://developer.apple.com/xcode/) (for iOS development - macOS only)
- Git (for version control)

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/Shema-arsene/Flutter-recipe-app.git
cd recipes_app
```

## Install Dependencies

flutter pub get

## Configure Endpoint

Create a const.dart file in the lib directory (if not already present):
const String API_BASE_URL = 'https://dummyjson.com';

## Run the App

### Run on Android/iOS emulator or connected device

flutter run

### # Run on specific platform

flutter run -d android # Android only
flutter run -d ios # iOS only (macOS only)
flutter run -d chrome # Web version
flutter run -d windows # Windows desktop

## Login Credentials (https://dummyjson.com/docs/users)

Username: emilys
Password: emilyspass

## Project Structure

recipes_app/
├── lib/
│ ├── main.dart # App entry point
│ ├── const.dart # API constants
│ ├── models/
│ │ ├── User.dart # User model
│ │ └── Recipe.dart # Recipe model
│ ├── pages/
│ │ ├── loginPage.dart # Login screen
│ │ ├── HomePage.dart # Home screen with recipe list
│ │ └── RecipePage.dart # Recipe details screen
│ └── services/
│ ├── auth_service.dart # Authentication service
│ ├── http_service.dart # HTTP client wrapper
│ └── data_service.dart # Recipe data service
├── test/
│ └── widget_test.dart # Widget tests
├── android/ # Android-specific files
├── ios/ # iOS-specific files
├── pubspec.yaml # Dependencies and assets
└── README.md # Project documentation

## Run Tests

### Run all tests

flutter test

### Run specific test file

flutter test test/widget_test.dart

### Run tests with coverage

flutter test --coverage

## Building for Production

## Android

### Build APK (debug)

flutter build apk --debug

### Install APK on connected device

flutter install

## iOS (macOS only)

### Build iOS app

flutter build ios

### Run on connected iOS device

flutter run -d ios

## Web

### Build web version

flutter build web

### Run web version locally

flutter run -d chrome

## API Endpoints Used

API Endpoints Used
Endpoint Method Purpose
/auth/login POST User authentication
/recipes GET Fetch all recipes
/recipes/meal-type/{type} GET Filter recipes by meal type

## UI Features

Login Screen: Form validation, loading states, error handling

Home Screen: Category filters, scrollable recipe list, image loading

Recipe Details: Expandable sections, ingredient checklist, instructions

Responsive Layout: Adapts to different screen sizes and orientations

## Security Features

Token-based Authentication: JWT tokens stored and used for API requests

Secure HTTP: HTTPS for all API calls

Input Validation: Form validation on login screen

## Future Improvements

Add search functionality

Implement favorite recipes

Add offline support with local database (SQLite/Hive)

User profile management

Recipe sharing feature

Dark mode support

Push notifications for new recipes

Meal planning calendar

Shopping list generator

Recipe video tutorials

Social login (Google, Facebook)

Add to cart ingredients feature

Nutrition information display

## Acknowledgments

DummyJSON for providing free test API

Flutter Team for the amazing framework

Material Design for design guidelines
