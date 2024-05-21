# Universities

Universities is an iOS application enabling users to explore universities worldwide, organized by country. Employing the VIPER architecture, it leverages Swift Package Manager for dependency management and relies on Realm database for seamless data persistence.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Swift Packages](#swift package)
- [Architecture](#architecture)
- [Tests](#tests)
- [Contributing](#contributing)
- [License](#license)

## Introduction
Universities is an iOS application enabling users to explore universities worldwide, organized by country. Employing the VIPER architecture, it leverages Swift Package Manager for dependency management and relies on Realm database for seamless data persistence.

## Features
- **Search Universities**: Users can search for universities by country.
- **Browse by Country**: Browse universities grouped by country.
- **Detailed Information**: Access detailed information about each university, including location, programs offered, admission requirements, and more.
- **VIPER Architecture**: Utilizes the VIPER architecture pattern for clean, modularized codebase.
- **Swift Package Manager**: Swift Package Manager is employed for efficient dependency management.
- **Realm Database**: Utilizes Realm database for data persistence, ensuring seamless user experience and offline access to university information.

## Requirements
- iOS 15.0+
- Xcode 14.0+
- Swift 5.0+

## Installation
1. Clone the repository.
2. Open `Universities.xcodeproj` in Xcode.
3. Build and run the project.

## Usage
To use the app, simply launch it on your iOS device. You can then:
- Search for universities by country.
- Browse universities grouped by country.
- View detailed information about each university.

## Swift Packages

This project is organized as a multi-module Swift package. It consists of the following modules:

- **UniversitiesList**: Contains the user interface and logic for browsing a list of universities.
- **UniversityDetails**: Contains the user interface and logic for viewing detailed information about a university.
- **DomainLayer**: Contains the business entities.
- **NetworkLayer**: A Swift package for handling network requests.
- **StorageLayer**: A Swift package for data persistence using Realm database.
- **DomainLayer**: A Swift package containing utility functions and extensions.

These modules are managed using Swift Package Manager and are included in the project.

## Architecture

The app follows the VIPER architecture:

- **View**: User interface components.
- **Interactor**: Business logic and networking.
- **Presenter**: Mediator between View and Interactor.
- **RemoteDataManager**: Handles remote data fetching and model objects.
- **LocalDataManager**: Handles local data storage and retrieval.
- **Wireframe**: Handles navigation between modules.


## Running Unit Tests
To run the unit tests for the Universities module, follow these steps:
1. Open `Universities.xcodeproj` in Xcode.
2. Navigate to the `UniversitiesListInteractorTests` target.
3. Run the tests by selecting Product > Test from the Xcode menu, or by pressing ⌘U.
4. View the test results in the Xcode test navigator and console.

## Contributing
If you'd like to contribute to Universities, please follow these guidelines:
- Fork the repository.
- Create a new branch (`git checkout -b feature/branch-name`).
- Make your changes.
- Test your changes.
- Commit your changes (`git commit -am 'Add new feature'`).
- Push to the branch (`git push origin feature/branch-name`).
- Create a new Pull Request.

## License
[MIT License](link-to-license)
