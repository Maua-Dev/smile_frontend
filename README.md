[![codecov](https://codecov.io/gh/Maua-Dev/clean_flutter_template/branch/dev/graph/badge.svg?token=ZPKZHXHM9X)](https://codecov.io/gh/Maua-Dev/clean_flutter_template)

# clean_flutter_template 🌡🍽

Template for flutter aplications repositories based in Clean Arch

## The Project 📽

### Introduction and Objectives ⁉

The main objective is to provide a template for repositories that can be used as a starting point for new projects. This
architecture is based on the Clean Architecture, and it was based in many other projects and books, articles that were
mixed by the students of Mauá Institute of Technology, from the academic group Dev. Community Mauá.

### Reasons 1️⃣3️⃣

The project aims to help developers to start new projects with a good architecture, and with a good structure, so that anybody can create good applications.

### Clean Architecture 🧼🏰

The purpose of the project is to learn and create a Clean Architecture for front-end aplications. This architecture is based on the principles of SOLID and books like "Clean Architecture: A Craftsman's Guide to Software Structure and Design" by Robert C. Martin.

We also tried to explain for new programmers in the mos intuitive way and you can see the explanation here: [Clean Architecture Figma](https://www.figma.com/file/CmfQcH2xbZyIszPX0iOxPp/Clean-Arch---HackaBeckas?node-id=0%3A1&t=B38vNfX3VSv6qtU7-1)


### Folder Structure 🎄🌴🌲🌳

Our folder structure was developed specially for our projects. 


```bash
.
├── lib
│   ├── app
│   │   └── modules
│   │       ├── create_user
│   │       │    └── presenter
│   │       │        ├── controller
│   │       │        └── ui
│   │       │            ├──pages
│   │       │            └── states
│   │       ├── delete_user
│   │       │    └── presenter
│   │       │        ├── controller
│   │       │        └── ui
│   │       │            ├──pages
│   │       │            └── states
│   │       ├── get_user
│   │       │    └── presenter
│   │       │        ├── controller
│   │       │        └── ui
│   │       │            ├──pages
│   │       │            └── states
│   │       └── update_user
│   │            └── presenter
│   │                ├── controller
│   │                └── ui
│   │                    ├──pages
│   │                    └── states
│   ├── generated
│   ├── l10n
│   └── shared
│       ├── datasource
│       │    └── external
│       │         └── http
│       ├── domain
│       │   ├── entities
│       │   ├── enums
│       │   ├── repositories
│       │   ├── storage
│       │   └── usecases
│       ├── environment
│       ├── helpers
│       │   ├── enum
│       │   ├── errors
│       │   ├── functions
│       │   └── http
│       ├── environment
│       ├── helpers
│       │   ├── enums
│       │   ├── errors
│       │   ├── functions
│       │   ├── services
│       │   └── utils
│       ├── infra
│       │   ├── external
│       │   ├── models
│       │   ├── repositories
│       │   └── storage
│       ├── themes
│       └── widgets
└── tests
    └── app
        ├── modules
        │   ├── create_user
        │   │   └── presenter
        │   │       ├── controller
        │   │       └── ui
        │   │           └── pages
        │   ├── delete_user
        │   │   └── presenter
        │   │       ├── controller
        │   │       └── ui
        │   │           └── pages
        │   ├── get_user
        │   │   └── presenter
        │   │       ├── controller
        │   │       └── ui
        │   │           └── pages
        │   └── update_user
        │       └── presenter
        │           ├── controller
        │           └── ui
        │               └── pages
        └── shared
            ├── datasource
            │   └── external
            │       └── http
            ├── domain
            │   ├── entities
            │   └── usecases
            └── infra
                ├── models
                ├── repositories
                └── storage

```


## Name Format 📛
### Files and Directories 📁

- Files have the same name as the classes
- Camel Case 🐫🐪 (ex: `./app/create_user_controller.dart` `class CreateUserController{}`)

### Classes 🕴
- #### Pattern 📟

    - CamelCase 🐫🐪

- #### Types 🧭

    - **Interface** starts with "I" --> `IUserRepository`, `ISelfieRepository` 😀
    - **Repository** have the same name as interface, without the "I" and the type in final (ex: `UserRepositoryMock`, `SelfieRepositoryDynamo`) 🥬
    - **Controller** ends with "Controller" --> `CreateUserController`, `GetSelfieController` 🎮
    - **Usecase** ends with "Usecase" --> `CreateUserUsecase`, `GetSelfieUsecase` 🏠

### Methods 👨‍🏫

- Lower Camel Case 🐍
- Try associate with a verb (ex: `createUser`, `getUser`, `updateSelfie`)

### Variables 🅰

- Lower Camel Case 🐍
- Avoid verbs

### Enums

- SNAKE_CASE 🐍
- File name ends with "ENUM" (ex: "STATE_ENUM")
- OBS: in dart we can't use SNAKE_CASE in constant identifier names, to solve this we add this code in the top of the archive:
            `// ignore_for_file: constant_identifier_names`

### Tests 📄

- snake_case 🐍
- Class name follow by "test" (ex: `cadastrar_controller_test.dart`)
    - The files must finish with "test" to flutter_test recognition

### Commit 💢

- Start with verb
- Ends with emoji 😎

## Installation 👩‍💻

Clone the repository using template

### Install the requirements

    flutter pub get

### Run the tests

    flutter test --coverage

## Packages 📦

### flutter_modular and modular_test

- Navigation
- Dependency Injection
- Unit test

### flutter_mobx and mobx_codegen

- Pages state controller

### hive_flutter

- Key-value database written in pure Dart
- Used for data storage like user attributes and to decrease the "get" request for data

### flutter_intl and Flutter Intl (VS Code extension)

- App internationalization for multiple languages

### build_runner

- Provides a concrete way of generating files using Dart code
- Used for create mock files and Mobx code gen

### dio

- Used for http requests

### mockito

- Mock for unit testing

## Contributors 💰🤝💰

- Gabriel Godoy - [GabrielGodoy01](https://github.com/GabrielGodoy01) 👷‍♂️

## Especial Thanks 🙏

- [Dev. Community Mauá](https://www.instagram.com/devcommunitymaua/)
- [Clean Architecture: A Craftsman's Guide to Software Structure and Design](https://www.amazon.com.br/Clean-Architecture-Craftsmans-Software-Structure/dp/0134494164)
- [Institute Mauá of Technology](https://www.maua.br/)
- [Flutterando/Clean-Dart](https://github.com/Flutterando/Clean-Dart)
