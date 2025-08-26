# My Store
My Store is a feature-rich e-commerce application built with Flutter. It demonstrates a clean, scalable architecture and modern development practices for creating a robust mobile shopping experience. The application allows users to browse products, manage their cart and wishlist, and handle authentication.

## ✨ Features

*   **User Authentication**: Secure sign-up and sign-in functionality.
*   **Dynamic Home Screen**: Features carousels for ads, browsable categories, and featured product sections.
*   **Product Catalog**:
    *   View products by category and sub-category.
    *   Detailed product information screen with image sliders, descriptions, ratings, and color/size selection.
    *   Search functionality integrated into the main app bar.
*   **Shopping Cart**: Add, remove, and update quantities of products in the cart.
*   **Wishlist**: Save favorite products for later.
*   **User Profile**: View and manage user information.

## 🏗️ Architecture

This project is built using **Clean Architecture** principles to ensure a separation of concerns, making the codebase maintainable, scalable, and testable. The structure is divided into three main layers:

*   **Presentation Layer**: Contains all UI-related components (Widgets, Screens) and state management logic using **BLoC (Business Logic Component)**.
*   **Domain Layer**: Includes the core business logic, use cases, and repository interfaces. This layer is independent of any data source or UI framework.
*   **Data Layer**: Responsible for data retrieval from remote (API) and local sources. It implements the repository interfaces defined in the domain layer.

**Dependency Injection** is managed using `get_it` and `injectable` to decouple components and manage dependencies efficiently.

## 🛠️ Tech Stack & Key Packages

*   **Framework**: Flutter
*   **State Management**: `flutter_bloc`
*   **Networking**: `dio`, `pretty_dio_logger`
*   **Routing**: Custom Route Generator
*   **Dependency Injection**: `get_it`, `injectable`
*   **Local Storage**: `shared_preferences`
*   **Code Generation**: `freezed` for immutable states, `build_runner`
*   **UI Helpers**:
    *   `flutter_screenutil`: For responsive UI.
    *   `cached_network_image`: For efficient image loading and caching.
    *   `carousel_slider_plus`: For image carousels.
    *   `flutter_svg`: For using SVG assets.
    *   `readmore`: For expandable text widgets.
    *   `smooth_page_indicator`: For carousel page indicators.

## 📂 Project Structure

The `lib` directory is organized to support the Clean Architecture pattern:

```
lib
├── config/             # App-level configurations (routing)
├── core/               # Core utilities (API manager, constants, themes, custom components)
├── di/                 # Dependency injection setup
├── features/           # Main application features (auth, cart, home, products)
│   ├── auth/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── cart/
│   ├── main_layout/    # Main screen with bottom navigation
│   └── ...
└── main.dart           # Application entry point
```

## 🚀 Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

*   Flutter SDK (version 3.5.2 or higher)
*   A code editor like VS Code or Android Studio

### Installation

1.  Clone the repository:
    ```sh
    git clone https://github.com/mohammedashraf16/my_store.git
    ```
2.  Navigate to the project directory:
    ```sh
    cd my_store
    ```
3.  Install dependencies:
    ```sh
    flutter pub get
    ```
4.  Run the code generator:
    ```sh
    flutter pub run build_runner build
    ```
5.  Run the app:
    ```sh
    flutter run
