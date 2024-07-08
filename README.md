# Movie Info Lookup Mobile App

![logo_cinex](https://github.com/iaohtdev/cinex/assets/95197224/dc504631-a657-43cb-a017-869ff07c0a9d)


## Introduction
The **Movie Info Lookup Mobile App** is a mobile application designed to help users search for and access detailed information about their favorite movies. The app provides movie details, trailers, cast information, and user reviews.

## Features
- Search movies by title
- View detailed movie information (synopsis, release date, genre, etc.)
- Watch movie trailers
- View cast and crew information
- Read and write user reviews
- Save favorite movies for quick access

## Screenshots
![Home Screen](path/to/home_screen.png)
![image](https://github.com/iaohtdev/cinex/assets/95197224/350ce27e-f96e-4277-8451-43e48f4520df)

![Search Screen](path/to/search_screen.png)
![Movie Detail Screen](path/to/movie_detail_screen.png)

## Installation

### Prerequisites
- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)

### Steps
1. Clone the repository
    ```bash
    git clone https://github.com/your-username/movie-info-lookup.git
    ```
2. Navigate to the project directory
    ```bash
    cd movie-info-lookup
    ```
3. Get the dependencies
    ```bash
    flutter pub get
    ```
4. Run the app
    ```bash
    flutter run
    ```

## Usage
1. Open the app.
2. Use the search bar to find movies by title.
3. Tap on a movie from the search results to view detailed information.
4. Browse trailers, cast information, and user reviews.
5. Save your favorite movies by tapping the save icon.

## Project Structure
```plaintext
movie-info-lookup/
├── android/            # Android specific files
├── ios/                # iOS specific files
├── lib/                # Dart files
│   ├── models/         # Data models
│   ├── screens/        # UI screens
│   ├── widgets/        # Reusable widgets
│   ├── cubit/          # State management
│   └── main.dart       # Entry point
├── assets/             # Images, fonts, etc.
├── test/               # Unit tests
└── pubspec.yaml        # Project configuration
