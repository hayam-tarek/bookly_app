# Bookly App

## 📖 Overview
Bookly is a Flutter-based application that allows users to browse a collection of books and preview them. It features an elegant UI, smooth navigation, and engaging animations for a better user experience.

## 🚀 Features
- **Browse a collection of books** 📚
- **View detailed book information** ✍️
- **Preview books** 📝
- **Search for a book** 🔎
- **Smooth navigation with animations** 🎭
- **Modern UI design with aesthetic appeal** 🎨

## 🛠️ Technologies & Packages Used

### 📌 State Management & Architecture
- `bloc: ^9.0.0`
- `flutter_bloc: ^9.1.0`
- `get_it: ^8.0.3`
- **MVVM Architecture** with **Repository Pattern**
- **OOP, SOLID Principles & Clean Code**

### 📌 Networking
- `dio: ^5.8.0+1`
- `pretty_dio_logger: ^1.4.0`

### 📌 UI Enhancements
- `animated_text_kit: ^4.2.2`
- `cached_network_image: ^3.4.1`
- `google_fonts: ^6.2.1`
- `lottie: ^3.3.1`
- `skeletonizer: ^1.4.3`

### 📌 Navigation
- `go_router: ^14.8.1`

### 📌 Utilities
- `dartz: ^0.10.1`
- `meta: ^1.16.0`
- `url_launcher: ^6.3.1`

## 📸 Screenshots


## 🛠 Project Structure
```
lib/
│-- core/                # Core services (network, dependency injection, utilities)
│-- features/
│   ├── home/           # Home feature module
│   │   ├── data/       # Data layer (models, repositories)
│   │   │   ├── models/book_model
│   │   │   ├── repos/
│   │   ├── presentation/ # UI layer (screens, widgets, state management)
│   │   │   ├── view_model/
│   │   │   │   ├── featured_books/
│   │   │   │   ├── newest_books/
│   │   │   │   ├── related_books/
│   │   │   ├── views/
│   ├── search/         # Search feature module
│   │   ├── data/       # Data layer (models, repositories)
│   │   │   ├── model/
│   │   │   ├── repo/
│   │   ├── presentation/ # UI layer
│   │   │   ├── view_model/search_cubit/
│   │   │   ├── views/
│   ├── splash/         # Splash screen feature module
│   │   ├── presentation/
│   │   │   ├── view_model/
│   │   │   ├── views/
│-- main.dart           # Application entry point
```

## 💡 Contributing
Contributions are welcome! Feel free to open **Pull Requests** or **Issues**.

## 📜 License
This project is open-source and licensed under the [MIT License](LICENSE).
