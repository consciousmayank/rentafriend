# Flutter Stacked Template

A production-ready Flutter template using Stacked architecture with built-in features.

## Features

- 🏗️ Built on [Stacked Architecture](https://stacked.filledstacks.com/)
- 🎨 Complete theme system with dark/light mode
- 🌍 Localization ready
- 📱 Responsive UI support
- 🔄 API integration setup with Dio
- 💾 Local storage with Hive
- 🎯 Custom hooks and extensions
- ⚡ Performance optimized

## Getting Started

1. Create a new repository using this template
2. Clone your new repository
3. Rename the project:   ```bash
   # Run this script to rename the project
   dart run rename --appname "Your App Name" --bundleid com.yourdomain.appname   ```
4. Update the following files with your project details:
   - pubspec.yaml
   - android/app/build.gradle
   - ios/Runner.xcodeproj/project.pbxproj


## Dependencies

Main dependencies:
- stacked: State management and architecture
- stacked_services: Navigation, dialog, etc.
- dio: API calls
- hive: Local storage
- google_fonts: Typography
- flutter_animate: Animations
- responsive_builder: Responsive UI

## Configuration

1. Environment configuration
    - Make three files in the root folder: `config.development.json`, `config.staging.json`, `config.production.json`
    - Add the following to each file:
    ```json
    {
        "BASE_URL": "<BASE_URL>",
        "ENVIRONMENT": "<ENVIRONMENT>",
        "APP_PREFERENCE_KEY": "<APP_PREFERENCE_KEY>"
    }
    ```
    - BASE_URL: Base URL for the API
    - ENVIRONMENT: Environment name
    - APP_PREFERENCE_KEY: Key for the app preference. Used to encrypt the hive database.

2. Theme Configuration
   - Theme is configured in `lib/core/theme/app_theme.dart`
   - Edit colors in `AppColors` class.
   - Modify text styles in `AppTextStyles` class.

3. API Configuration
   - Update base URL in `config.development.json`, `config.staging.json`, `config.production.json`

## Commands
- I using fvm then `fvm flutter clean && fvm flutter pub get && fvm flutter pub run build_runner build --delete-conflicting-outputs`
- If not using fvm then `flutter clean && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs`
- Launch configuration in VSCode: `.vscode/launch.json`
```json
    {
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    // flutter run --dart-define-from-file=config.development.json
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Development",
            "request": "launch",
            "type": "dart",
            "args": [
                "--dart-define-from-file=config.development.json"
            ]
        },
        {
            "name": "Development (profile)",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile",
            "args": [
                "--dart-define-from-file=config.development.json"
            ]
        },
        {
            "name": "Development (release)",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release",
            "args": [
                "--dart-define-from-file=config.development.json"
            ]
        },
        {
            "name": "Staging",
            "request": "launch",
            "type": "dart",
            "args": [
                "--dart-define-from-file=config.staging.json"
            ]
        },
        {
            "name": "Staging (profile)",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile",
            "args": [
                "--dart-define-from-file=config.staging.json"
            ]
        },
        {
            "name": "Staging (release)",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release",
            "args": [
                "--dart-define-from-file=config.staging.json"
            ]
        },
        {
            "name": "Production",
            "request": "launch",
            "type": "dart",
            "args": [
                "--dart-define-from-file=config.production.json"
            ]
        },
        {
            "name": "Production (profile)",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile",
            "args": [
                "--dart-define-from-file=config.production.json"
            ]
        },
        {
            "name": "Production (release)",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release",
            "args": [
                "--dart-define-from-file=config.production.json"
            ]
        }
    ]
}
```








To use Rider, 
1. Add the following to your `pubspec.yaml` file:
```yaml
  rider: ^0.0.1
```
2. Upgrade the dart sdk to 3.4.0 or higher `<sdk: '>=3.4.0 <4.0.0'>`
3. Run the following command:
```bash
dart run rider
```
4. [Use Rider to ](https://pub.dev/packages/rider)
   - change the app name
   - change the package name in the android/app/build.gradle file.
   - change the bundle identifier in the ios/Runner.xcodeproj/project.pbxproj file.
   - Change the package name in the pubspec.yaml file.
   - Change app icon in the android/app/src/main/res/ and ios/Runner/Assets.xcassets folder.    