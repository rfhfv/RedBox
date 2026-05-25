# RedBox App

An iOS online shopping app built with Swift and UIKit.  
The app features a product catalog with recommendations, detailed product view, and a shopping cart with quantity adjustment. It follows the VIPER architecture and includes unit tests for presenters with mocked dependencies.

## Screenshots

<img width="2627" height="1500" alt="Image" src="https://github.com/user-attachments/assets/bd3cfd30-28b0-4f77-b914-24841faa2d73" />

## Features

- **Product Catalog:** Browse a list of products with personalized recommendations.
- **Product Details:** View detailed information about any product.
- **Shopping Cart:** Add products, adjust quantities, and remove items from the cart.

## Tech Stack

- **UIKit** with programmatic Auto Layout
- **VIPER** architectural pattern
- **Unit Tests** for Presenter layer
- **Mocks** for all dependencies

## Architecture

The project follows the **VIPER (View-Interactor-Presenter-Entity-Router)** pattern:

- **View:** UIKit ViewControllers. Displays data and forwards user actions to the Presenter.
- **Interactor:** Contains business logic and data management.
- **Presenter:** Prepares data for the View and handles user interactions.
- **Entity:** Simple data models.
- **Router:** Handles navigation between screens.

## Tests

- Unit tests covering Presenter logic.
- All dependencies are mocked to ensure isolated and reliable tests.

## Roadmap

- Add network layer with URLSession.
- Implement cart persistence between launches using Core Data.
- Add Favorites and Settings screens.

## Installation

**Via terminal:**

- git clone https://github.com/rfhfv/RedBox.git
- cd RedBox
- open RedBox.xcodeproj
