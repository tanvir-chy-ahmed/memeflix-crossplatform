# Meme Gallery - Flutter API Integration Example

This project demonstrates a clean architecture approach to API integration in Flutter. It fetches and displays memes from the Imgflip API.

## Features

- Display memes in a masonry grid layout
- View detailed information about each meme
- Clean architecture implementation
- Proper error handling
- Loading states with shimmer effects

## Architecture Overview

The app is organized using Clean Architecture principles with three main layers:

### 1. Domain Layer

The core business logic independent of any framework:

- **Entities**: Pure Dart classes representing core data (Meme)
- **Use Cases**: Single-purpose classes for business logic (GetMemesUseCase)
- **Repository Interfaces**: Defines contracts for data operations

### 2. Data Layer

Implements the data access logic:

- **Models**: Data classes that extend entities with additional functionality
- **Repositories**: Implementation of domain repositories
- **Data Sources**: Actual API implementations (remote, local, etc.)

### 3. Presentation Layer

The UI components and state management:

- **Screens**: UI pages (MemeListScreen, MemeDetailScreen)
- **Widgets**: Reusable UI components (MemeCard)
- **Providers**: State management (MemeProvider)

## Dependencies

- **http**: For API requests
- **provider**: State management
- **cached_network_image**: Image caching and loading
- **shimmer**: Loading effect animations
- **get_it**: Dependency injection
- **dartz**: Functional programming concepts (Either type for error handling)
- **flutter_staggered_grid_view**: Masonry grid layout

## API Integration

This app demonstrates integration with the [Imgflip API](https://api.imgflip.com/get_memes), which provides a collection of popular meme templates.

## Key Concepts Demonstrated

1. Proper separation of concerns
2. Dependency injection
3. Repository pattern
4. Error handling with Either type
5. Clean UI with loading states
6. Responsive layouts
