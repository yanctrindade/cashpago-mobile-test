# CashPago Test Flutter Project

![Flutter Version](https://img.shields.io/badge/flutter-3.6.10-blue.svg)

This is a Flutter project developed using Flutter version 2.5.2 and Visual Studio Code. It serves as a sample project for [CashPago]([https://cashpago.com/](https://cashpago.com.br)) and includes various features and components that can be useful for building Flutter applications.

## Getting Started

Follow these steps to get started with the project:

1. **Clone the Repository:**

```bash
   git clone https://github.com/your-username/cashpago_test.git
```

2. **Navigate to the Project Directory and Install Dependencies** 
```
cd cashpago_test && flutter pub get
```

3. Run the Application
```
flutter run
```

## Directory Structure   
```md   
lib/  
  ├── models/            | # Data models and classes   
  ├── network/           | # Network API layer implementation and interface   
  ├── resources/         | # App resources such as fonts, images, colors, formatters, strings, config   
  ├── states/            | # App Redux Class and Reducers Folders   
  ├── ui/                | # All user interface files   
  ├──── screens/         | # Individual screens or pages   
  ├──── widgets/         | # Reusable UI widgets   
  ├──── forms/           | # Reusable Forms reusing widgets   
  ├── main.dart          | # Entry point of the app   
```

## Unit Testing
TO-DO: Not implemendted but possible due to use of Interface for network layer and state manager class with logic

## Use-Cases

Covered Use case #1:   
1. On First Step select a date, select time and a service   
2. On Second Step, type a valid CPF and click on "Done" button non keyboard   
3. Wait for user info automatically fill name and date of birth   
4. Type phone number and email address   
5. Type on "Adicionar Button", you should be taken to Payment Method Step #3   
6. Click on Bottom Bar "Ver Resumo"
7. You can navigate many times back and foward

# Android Screenshots

<img src="https://github.com/yanctrindade/cashpago-mobile-test/assets/11860540/109d3c5a-1576-42b7-886e-1549cf148cac" style="width: 25%; height: auto;" alt="screen2-android">

<img src="https://github.com/yanctrindade/cashpago-mobile-test/assets/11860540/bc2d745d-9a86-4c5e-9828-1c73b688012c" style="width: 25%; height: auto;" alt="screen2-android">

<img src="https://github.com/yanctrindade/cashpago-mobile-test/assets/11860540/3194ec4f-2b60-464e-9a91-f10a09734523" style="width: 25%; height: auto;" alt="screen3-android">

<img src="https://github.com/yanctrindade/cashpago-mobile-test/assets/11860540/e8f0a54f-9b3f-4620-85cf-a21daffb7425" style="width: 25%; height: auto;" alt="screen4-android">

# iOS Screenshots

<img src="https://github.com/yanctrindade/cashpago-mobile-test/assets/11860540/4e169286-cf99-4627-9c86-b0627be24aab" style="width: 25%; height: auto;" alt="screen1-ios">

<img src="https://github.com/yanctrindade/cashpago-mobile-test/assets/11860540/6e03d652-5def-495f-9878-e321ba9a101d" style="width: 25%; height: auto;" alt="screen2-ios">

<img src="https://github.com/yanctrindade/cashpago-mobile-test/assets/11860540/1e918ddc-3d10-4612-8bbd-a699df1439a8" style="width: 25%; height: auto;" alt="screen3-ios">

<img src="https://github.com/yanctrindade/cashpago-mobile-test/assets/11860540/74d77c90-c18d-4e32-82df-882d9574756a" style="width: 25%; height: auto;" alt="screen4-ios">
