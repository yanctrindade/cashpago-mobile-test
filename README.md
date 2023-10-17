# CashPago Test Flutter Project

![Flutter Version](https://img.shields.io/badge/flutter-3.6.10-blue.svg)

This is a Flutter project developed using Flutter version 3.6.10 and Visual Studio Code. It serves as a sample project for [CashPago]([https://cashpago.com/](https://cashpago.com.br)) and includes various features and components that can be useful for building Flutter applications.

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

<img src="https://raw.githubusercontent.com/yanctrindade/cashpago-mobile-test/master/demo/screen1-android.png" style="width: 20%; height: auto;" alt="screen1-android"> <img src="https://raw.githubusercontent.com/yanctrindade/cashpago-mobile-test/master/demo/screen2-android.png" style="width: 20%; height: auto;" alt="screen2-android"> <img src="https://raw.githubusercontent.com/yanctrindade/cashpago-mobile-test/master/demo/screen3-android.png" style="width: 20%; height: auto;" alt="screen3-android"> <img src="https://raw.githubusercontent.com/yanctrindade/cashpago-mobile-test/master/demo/screen4-android.png" style="width: 20%; height: auto;" alt="screen4-android">

# iOS Screenshots

<img src="https://raw.githubusercontent.com/yanctrindade/cashpago-mobile-test/master/demo/screen1-ios.PNG" style="width: 20%; height: auto;" alt="screen1-ios"> <img src="https://raw.githubusercontent.com/yanctrindade/cashpago-mobile-test/master/demo/screen2-ios.PNG" style="width: 20%; height: auto;" alt="screen2-ios"> <img src="https://raw.githubusercontent.com/yanctrindade/cashpago-mobile-test/master/demo/screen3-ios.PNG" style="width: 20%; height: auto;" alt="screen3-ios"> <img src="https://raw.githubusercontent.com/yanctrindade/cashpago-mobile-test/master/demo/screen4-ios.PNG" style="width: 20%; height: auto;" alt="screen4-ios">
 


