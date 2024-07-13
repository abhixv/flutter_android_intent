# Flutter Android Intent Package

A Flutter package to simplify handling Android intents and actions. This package provides an easy-to-use API to launch URLs, send emails, and open other apps using intents on Android.

## Features

- Launch URLs
- Send emails
- Open apps by class name

## Getting Started

To use this package in your Flutter project, follow these steps:

## 1. Add Dependency

Add the `flutter_android_intent` package to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_android_intent: ^1.0.0  # Check for the latest version on pub.dev

```

#### Then, run `flutter pub get` in your terminal.

### 2. Import the Package
Import the package into your Dart file where you want to use it:

```yaml
import 'package:flutter_android_intent/flutter_android_intent.dart';
```

## 3. Usage
### Launch a URL in a browser:

```yaml
await FlutterAndroidIntent.launchUrl('https://www.example.com');
```

### To send an email:

```yaml
await FlutterAndroidIntent.sendEmail(
  to: 'example@example.com',
  subject: 'Hello',
  body: 'This is a test email.',
);
```

### Open an app by class name:
```yaml
await FlutterAndroidIntent.openAppViaClassName(className: 'com.example.app.MainActivity');
```

### Permissions
Make sure to add the necessary permissions to your AndroidManifest.xml file. For example, if you want to send emails, you need to add the INTERNET and WRITE_EXTERNAL_STORAGE permissions:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.abhixv.flutter_android_intent">

    <application
        android:label="flutter_android_intent"
        android:icon="@mipmap/ic_launcher">
        <!-- Add other necessary configurations -->
    </application>

    <!-- Required permissions -->
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
    <!-- Add more permissions if needed -->
</manifest>
```
Contributing
Contributions are welcome! Please open an issue or submit a pull request on GitHub if you have suggestions or improvements.

License
This package is licensed under the MIT License. See the LICENSE file for more details.

