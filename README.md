
# 🚀 Flutter Project Template  

A production-ready **Flutter project template** that follows **Clean Architecture** with a **Feature-Oriented MVVM (Model-View-ViewModel)** pattern.  
This template is designed to help developers quickly set up new projects with scalable architecture, pre-configured dependencies, and best practices.

---

## 📂 Project Architecture  

The project follows **Clean Architecture** and **MVVM** principles with **feature-oriented structure**.  
Each feature is self-contained with its **View, Cubit, Repository, States, and Models**, making the project scalable and easy to maintain.  

---

## 📁 Folder Structure

```
lib/
 ├── core/
 ├── datasource/
 ├── l10n/
 ├── presentation/
 ├── routes/
 └── main.dart
```

### 🔹 `core/`  

This folder contains **global core functionalities** that are used throughout the application:  

- **Theme** (light/dark mode, typography)  
- **Localizations setup**  
- **Utilities & extensions**  
- **Dependency injection (GetIt)**  
- **Custom exceptions & log helpers**  
- **Resources** (colors, styles, fonts)  
- **Global widgets** (buttons, loaders, etc.)

---

### 🔹 `datasource/`  

This is the **data/network layer** of the project.  

- Handles **API calls** (using `http`)  
- Implements **BLoC for state management**  
- Manages **local DB (Floor + Sqflite + Secure Storage)**  

---

### 🔹 `l10n/`  

This folder manages **localization & internationalization**.  

- Uses Flutter’s **`flutter_localizations`** and `intl` package  
- Stores **localization files (`arb`)** for multi-language support  
- Helps scale apps for **global users**

---

### 🔹 `presentation/`  

This is the **application layer** (UI + business logic).  
Each feature has its own folder with:  

- `view/` → Flutter screens & widgets  
- `cubit/` → State management (BLoC Cubit)  
- `repo/` → Repository for data handling  
- `states/` → State classes for Cubit  
- `model/` → Data models (domain + API response)  

👉 **Feature-Oriented Approach**: Each feature is modular and independent.  

---

### 🔹 `routes/`  

This is the **navigation layer** using `go_router`.  

- Manages **named routes**  
- Handles **deep linking**  
- Provides **navigation guards**  

---

## 📦 Dependencies  

Here’s a breakdown of all dependencies used in this template:

| Dependency | Usage |
|------------|-------|
| **flutter_localizations** | Official Flutter support for internationalization. |
| **cupertino_icons** | Default iOS-style icons. |
| **colorize** | Console log color formatting. |
| **connectivity_plus** | Network connectivity status. |
| **fimber** | Lightweight logging library. |
| **fluttertoast** | Toast message notifications. |
| **get_it** | Dependency injection (service locator). |
| **flutter_svg** | SVG image rendering. |
| **google_fonts** | Custom Google Fonts. |
| **flutter_bloc** | State management with BLoC/Cubit. |
| **flutter_screenutil** | Responsive design helper. |
| **http** | API calls & networking. |
| **equatable** | Value comparison for BLoC states & models. |
| **sqflite** | SQLite database. |
| **path_provider** | File system access. |
| **path** | Path manipulation helpers. |
| **floor** | ORM for SQLite database. |
| **flutter_secure_storage** | Secure storage for sensitive data. |
| **go_router** | Navigation & routing. |
| **intl** | Internationalization support. |
| **device_preview** | Device preview for different screen sizes. |

### 🔧 Dev Dependencies  

| Dependency | Usage |
|------------|-------|
| **flutter_test** | Unit & widget testing. |
| **flutter_lints** | Lint rules for clean code. |
| **floor_generator** | Code generator for Floor ORM. |
| **build_runner** | Runs code generation for Floor, localization, etc. |
| **flutter_launcher_icons** | Auto-generate app icons. |
| **flutter_native_splash** | Auto-generate native splash screen. |

---

## ⚙️ Setup Instructions  

### 1️⃣ Install Dependencies  

```sh
flutter pub get
```

### 2️⃣ Generate Localization Files  

```sh
flutter gen-l10n
```

### 3️⃣ Setup App Icon  

Update `pubspec.yaml` under `flutter_launcher_icons`:  

```yaml
flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/images/app_icon.png"
```

Run:  

```sh
flutter pub run flutter_launcher_icons
```

### 4️⃣ Setup Splash Screen  

Update `pubspec.yaml` under `flutter_native_splash`:  

```yaml
flutter_native_splash:
  color: "#51B848"
  image: assets/images/logo_large.png
  android: true
  ios: true
  fullscreen: true
```

Run:  

```sh
flutter pub run flutter_native_splash:create
```

---

## 🚀 Getting Started  

1] Clone this repo:

```sh
git clone https://github.com/your-username/task_app.git
```

2] Open in VS Code or Android Studio.

3] Run the app:

```sh
flutter run
```
