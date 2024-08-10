
---

# Google Maps Integration in Flutter

This repository demonstrates how to integrate Google Maps into a Flutter app, providing step-by-step instructions and code examples to help you get started quickly.

## Features

- Display Google Maps in your Flutter app.
- Add custom markers and info windows.
- Handle map interactions such as tapping and dragging.
- Customize map styles and settings.

## Getting Started

### Prerequisites

Before you begin, ensure you have the following:

- Flutter SDK installed
- A Google Maps API key ([Get your API key here](https://developers.google.com/maps/gmp-get-started))

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/flutter-google-maps.git
   cd flutter-google-maps
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Add your Google Maps API key:**

   - Open the `android/app/src/main/AndroidManifest.xml` file.
   - Add your API key within the `<meta-data>` tag:

   ```xml
   <meta-data
       android:name="com.google.android.geo.API_KEY"
       android:value="YOUR_API_KEY_HERE"/>
   ```

### Running the App

To run the app on your device or emulator:

```bash
flutter run
```

---

This version is streamlined and focused on the essentials.
