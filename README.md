# Kreyno

**The Future of Parking** - A peer-to-peer parking marketplace mobile application built with Flutter.

## Overview

Kreyno is a mobile platform that connects drivers looking for parking spaces with those who have available spots. Users can seamlessly buy and sell parking spots in real-time, manage their vehicles, and handle payments through an integrated wallet system.

## Features

### Core Functionality

- **Parking Marketplace**: Buy and sell parking spots with real-time map-based discovery
- **Vehicle Management**: Add, edit, and manage multiple vehicles (gas, electric, scooters)
- **Payment Integration**: Secure payment processing via Stripe
- **Wallet System**: Built-in wallet for transactions and cashout functionality
- **Parking History**: Track all past parking transactions
- **EV Charging**: Support for electric vehicle charging stations

### User Experience

- **Multi-language Support**: French and English localization
- **Phone Authentication**: OTP-based secure authentication
- **Real-time Updates**: Live tracking of parking spot availability
- **Map Integration**: Google Maps for spot discovery and navigation
- **Profile Management**: Edit user profiles and payment methods

## Tech Stack

### Core Framework

- **Flutter** (SDK 3.8.0+)
- **Stacked Architecture** - MVVM pattern with dependency injection

### Key Dependencies

- **State Management**: Stacked (3.4.0)
- **Navigation**: Stacked Services
- **Maps**: Google Maps Flutter
- **Networking**: Dio + Retrofit
- **Payment**: Stripe integration
- **Localization**: Easy Localization
- **Functional Programming**: fpdart
- **Media**: Image Picker
- **Storage**: Shared Preferences
- **UI Components**:
  - Pinput (OTP input)
  - Toastification (notifications)
  - Syncfusion Datepicker
  - Flutter SVG

### Development Tools

- **Code Generation**:
  - build_runner
  - stacked_generator
  - retrofit_generator
  - freezed
  - json_serializable
- **Testing**: Golden Toolkit, Mockito
- **Logging**: Logger, Pretty Dio Logger

## Project Structure

```
lib/
├── app/                    # App configuration and dependency injection
├── dtos/                   # Data Transfer Objects
├── enums/                  # Enumerations (vehicle types, etc.)
├── extensions/             # Dart extensions
├── models/                 # Domain models
├── services/              # Business logic and API services
│   ├── api/               # API clients (auth, cars, media, stripe)
│   └── ...                # Core services (auth, user, toast, etc.)
├── ui/                    # User interface
│   ├── bottom_sheets/     # Bottom sheet components
│   ├── dialogs/           # Dialog components
│   ├── views/             # App screens/views
│   └── widgets/           # Reusable widgets
└── main.dart             # Application entry point
```

## Getting Started

### Prerequisites

- Flutter SDK 3.8.0 or higher
- Dart 3.8.0 or higher
- Xcode (for iOS development)
- Android Studio / Android SDK (for Android development)

### Installation

1. Clone the repository

```bash
git clone <repository-url>
cd kreyno
```

2. Install dependencies

```bash
flutter pub get
```

3. Create a `.env` file in the root directory

```bash
touch .env
```

4. Configure environment variables in `.env`

```
# Add your API keys and configuration here
API_BASE_URL=your_api_url
STRIPE_PUBLISHABLE_KEY=your_stripe_key
GOOGLE_MAPS_API_KEY=your_maps_key
```

5. Generate code

```bash
dart run build_runner build --delete-conflicting-outputs
```

6. Run the app

```bash
flutter run
```

## Development

### Code Generation

This project uses code generation for various purposes. Run the following command when you modify:

- Stacked views/services
- Retrofit API services
- Freezed models
- JSON serializable classes

```bash
dart run build_runner watch --delete-conflicting-outputs
```

### Testing

#### Golden Tests

Golden tests are configured for visual regression testing. To run and update golden files:

```bash
flutter test --update-goldens
```

Golden screenshots are stored in `test/golden/`.

#### Unit Tests

```bash
flutter test
```

### Localization

The app supports French (default) and English. Translation files are located in:

- `assets/translations/fr-FR.json`
- `assets/translations/en-US.json`

To add new translations, update these JSON files and the keys will be automatically available via Easy Localization.

## Architecture

The app follows the **Stacked MVVM architecture pattern**:

- **Views**: UI components (Flutter widgets)
- **ViewModels**: Business logic and state management
- **Services**: Shared business logic and API interactions
- **Models/DTOs**: Data structures

### Error Handling

The project uses **fpdart's Either type** for functional error handling:

- All async operations wrap results in `Either<Error, Success>`
- State management uses try-finally blocks
- `.match()` calls are properly awaited for async operations

### Key Services

- **AuthService**: User authentication and session management
- **CarsService**: Vehicle management
- **MediaService**: Image upload/management
- **ToastService**: User notifications
- **UserService**: User profile management
- **DeviceService**: Device-specific operations
- **OnboardingService**: First-time user flow

## Features by Screen

### Authentication

- **Onboarding**: Language selection and intro
- **Sign In**: Phone number authentication with OTP
- **Sign Up**: User registration with profile details

### Setup Flow

- **Set Up Vehicle**: Add vehicle with license plate, brand, model, color, CO₂ emissions
- **Set Up Payment**: Configure payment methods
- **Set Up Permissions**: Request necessary device permissions

### Main Features

- **Home**: Map view with parking spots, buyer/seller flows
- **My Vehicles**: Manage user vehicles
- **Wallet**: View balance and transaction history
- **Cashout**: Withdraw funds
- **Spots History**: View past parking transactions
- **Profile**: Edit user profile and settings
- **Payment Methods**: Manage payment options

## Design System

### Typography

Custom **Satoshi** font family:

- Regular
- Medium
- Bold

### Color Scheme

Defined in `lib/ui/common/app_colors.dart`

### Assets

- **Icons**: SVG icons in `assets/icons/`
- **Images**: PNG/JPG images in `assets/images/`

## API Integration

The app communicates with a backend API using Retrofit/Dio:

- **Authentication endpoints**: Sign in, sign up, OTP verification
- **Car endpoints**: CRUD operations for vehicles
- **Media endpoints**: Image upload/deletion
- **Stripe endpoints**: Payment processing

API configuration and interceptors:

- Auth header injection
- Language header for localization
- Session expiry handling
- Request/response logging

## Contributing

1. Follow the existing architecture patterns
2. Use functional programming with fpdart where applicable
3. Always use Dart MCP tools when working with Dart code
4. Write clear, detailed commit messages
5. Implement complete features without leaving TODOs
6. Fix errors at the cause, not the symptom
7. Avoid unnecessary code comments

## License

[Add your license here]

## Support

[Add support contact information here]
