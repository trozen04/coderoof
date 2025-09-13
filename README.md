# Coderoof Flutter App

## Overview

Coderoof is a Flutter-based mobile application developed as part of a coding assignment. The app demonstrates a customized bottom navigation bar with image assets, shadow effects, and responsive UI design.

## Features

* Custom Bottom Navigation Bar with images
* Shadow effect above the navigation bar
* Responsive UI using MediaQuery
* Simple state management with setState()

## Project Structure

```
lib/
 ├─ main.dart         # Entry point
 ├─ Utils/           # Colors, image paths, styles
 ├─ Widgets/         # Reusable widgets like CommonBottomNavbar
 └─ Screens/         # App screens (if any)
assets/
 ├─ images/          # App images used in navbar and UI
 └─ fonts/           # Custom fonts
```

## Libraries & Tools

* Flutter SDK
* Dart
* Android Studio
* Git

## Setup Instructions

1. Clone the repository:

```bash
git clone https://github.com/trozen04/coderoof.git
```

2. Navigate to the project directory:

```bash
cd coderoof
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

## Screenshots

<img width="1080" height="2400" alt="Screenshot_20250913-125823" src="https://github.com/user-attachments/assets/b08be2e1-31cb-43fe-9bef-86359e47e0f6" />
<img width="1080" height="2400" alt="Screenshot_20250913-125809" src="https://github.com/user-attachments/assets/4fbbaa7f-1083-4ac4-a250-1c341b7123d4" />
<img width="1080" height="2400" alt="Screenshot_20250913-125820" src="https://github.com/user-attachments/assets/3db5b185-fe34-4fd3-8fb6-e093bbdba39e" />
<img width="1080" height="2400" alt="Screenshot_20250913-125816" src="https://github.com/user-attachments/assets/9dc4087f-de96-48b1-ad4d-5887a07f7f4e" />


## Challenges Faced

* Customizing BottomNavigationBar with images
* Managing state across tabs

## Solutions

* Used Image.asset() for custom icons
* Implemented setState() to track current tab

* Add animations to navbar
* Implement unit and widget tests
