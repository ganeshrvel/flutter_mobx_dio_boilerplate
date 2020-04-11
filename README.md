# Flutter Mobx Dio Boilerplate

- Author: [Ganesh Rathinavel](https://www.linkedin.com/in/ganeshrvel "Ganesh Rathinavel")
- License: [MIT](https://github.com/ganeshrvel/flutter_mobx_dio_boilerplate/blob/master/LICENSE "MIT")
- Repo URL: [https://github.com/ganeshrvel/flutter_mobx_dio_boilerplate](https://github.com/ganeshrvel/flutter_mobx_dio_boilerplate "https://github.com/ganeshrvel/flutter_mobx_dio_boilerplate")
- Contacts: ganeshrvel@outlook.com
- Requirements: Flutter and Dart

##### Advanced and highly scalable boilerplate for building Flutter App - Mobx, Dio, GetIt and AutoRoutes.

###### Flutter is an excellent framework for building cross-platform native applications. But there are only a handful of frameworks available online to get going and I found most of them lack advanced features.

### Features
- Mobx for state management (https://pub.dev/packages/mobx)
- Dio for fetching APIs (https://pub.dev/packages/dio)
- GetIt/Injectable for Dependecy Injection (DI) (https://pub.dev/packages/get_It and https://pub.dev/packages/injectable)
- auto_route for routing (https://pub.dev/packages/auto_route)
- Multi theme support
- Multilingual support (l10n)
- Logging

### Installation
```shell
$ git clone --depth 1 --single-branch --branch master https://github.com/ganeshrvel/flutter_mobx_dio_boilerplate.git

$ cd flutter_mobx_dio_boilerplate
```

```shell

$ flutter create .
$ flutter pub get
$ flutter pub upgrade
```

This boilerplate uses code generation tools to automatically generate code during the hot reload workflow, and while building an Application. 

```shell
# clean conflicting codes
./scripts/build-runner-clean.sh
```

```shell
# keep your code automatically synced
./scripts/build-runner-watch.sh
```

### Hide Generated Files

In-order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and past the below lines under `ignore files and folders` section:

```
*.inject.summary;*.inject.dart;*.g.dart;
```

In Visual Studio Code, navigate to `Preferences` -> `Settings` and search for `Files:Exclude`. Add the following patterns:
```
**/*.inject.summary
**/*.inject.dart
**/*.g.dart
```

### APIS

Clone the repo https://github.com/ganeshrvel/auth-apis and follow the instructions in the [README.md](https://github.com/ganeshrvel/auth-apis/blob/master/README.md "README.md") for the running the API server.

### Directory structure
```shell
.
├── common
│   ├── api_client
│   │   ├── api_client.dart
│   │   ├── api_errors
│   │   └── interceptors
│   ├── di
│   ├── enums
│   ├── exceptions
│   ├── helpers
│   ├── l10n
│   ├── mixins
│   ├── models
│   ├── network
│   ├── router
│   └── themes
├── constants
├── features
│   ├── app
│   │   ├── data
│   │   │   ├── controllers
│   │   │   ├── data_sources
│   │   │   └── repositories
│   │   └── ui
│   │       ├── l10n
│   │       ├── pages
│   │       └── store
│   ├── home
│   │   └── ui
│   ├── login
│   │   ├── data
│   │   │   ├── controllers
│   │   │   │   └── login_controller.dart
│   │   │   ├── data_sources
│   │   │   │   ├── login_local_data_source.dart
│   │   │   │   └── login_remote_data_source.dart
│   │   │   ├── mappers
│   │   │   ├── models
│   │   │   │   ├── authentication_model.dart
│   │   │   │   ├── post_login_request_model.dart
│   │   │   │   ├── post_login_response_model.dart
│   │   │   │   ├── user_model.dart
│   │   │   └── repositories
│   │   │       └── login_repository.dart
│   │   └── ui
│   │       ├── l10n
│   │       │   ├── en.dart
│   │       │   └── hi.dart
│   │       ├── pages
│   │       │   └── login.dart
│   │       └── store
│   │           ├── login_store.dart
│   ├── page_not_found
│   │   └── ui
│   ├── profile
│   │   └── ui
│   └── splash
│       └── ui
├── main.dart
├── services
├── utils
│   ├── alerts
│   └── log
├── widget_extends
└── widgets
```

**Detailed view**
```shell
.
├── common # all common files are kept here.
│   ├── api_client
│   │   ├── api_client.dart # api client (dio) logics
│   │   ├── api_errors # api client error
│   │   └── interceptors # dio logics
│   ├── di # dependency injection (DI); 3rd party classes are included here for DI
│   ├── enums # common enums
│   ├── exceptions # common exceptions
│   ├── helpers # common helpers
│   ├── l10n # common l10n (localization) files. add a new locale file for a new language addition
│   ├── mixins # common mixins
│   ├── models # common models
│   ├── network # network helpers
│   ├── router # routing logic
│   └── themes # theme data files
├── constants # constants such as strings, errors message names, dimensions etc.
├── features # contains the logic for all features
│   ├── app
│   │   ├── data # contains the models, controllers, data_sources, repositories
│   │   │   ├── controllers
│   │   │   ├── data_sources
│   │   │   └── repositories
│   │   │   ├── models
│   │   └── ui # any ui related stuffs are added here
│   │       ├── l10n # localization files and data are added here for the particular page. Make sure that every new locale file is added in lib/common/l10n/en.dart
│   │       ├── pages # every screen related stuffs
│   │       └── store # mobx store for state management
│   ├── home
│   │   └── ui
│   ├── login
│   │   ├── data
│   │   │   ├── controllers
│   │   │   │   └── login_controller.dart
│   │   │   ├── data_sources
│   │   │   │   ├── login_local_data_source.dart
│   │   │   │   └── login_remote_data_source.dart
│   │   │   ├── mappers
│   │   │   ├── models
│   │   │   │   ├── authentication_model.dart
│   │   │   │   ├── post_login_request_model.dart
│   │   │   │   ├── post_login_response_model.dart
│   │   │   │   ├── user_model.dart
│   │   │   └── repositories
│   │   │       └── login_repository.dart
│   │   └── ui
│   │       ├── l10n
│   │       │   ├── en.dart
│   │       │   └── hi.dart
│   │       ├── pages
│   │       │   └── login.dart
│   │       └── store
│   │           ├── login_store.dart
│   ├── page_not_found
│   │   └── ui
│   ├── profile
│   │   └── ui
│   └── splash
│       └── ui
├── main.dart # main file
├── services # common services
├── utils # utils
│   ├── alerts
│   └── log
├── widget_extends # widget extend files
└── widgets # common widgets
```

### Architecture
The boilerplate follows a fusion of Clean architecture and MVVM pattern. It is highly customizable and feature-rich.

![architecture diagram](https://github.com/ganeshrvel/flutter_mobx_dio_boilerplate/blob/master/blobs/architecture-diagram.png "architecture diagram")

### DC (Data Channel)
The data flow is controlled using DC (lib/utils/data_channel/data_channel.dart). These are commonly used in repository codes.

It is not a very ideal situation to handle exceptions using try and catch at every function call.
Use `DC<Exception, LoginDataModel>(error: Exception, data: LoginDataModel(id: 1))` instead.

```dart
// example usage:
Future<DC<Exception, LoginModel>> getSomeLoginData() async {
 try {
   return DC.data(
     LoginModel(userId:1),
   );
 } on Exception {
   return DC.error(
     CacheException(),
   );
 }
}
```

```dart
// check for errors
void doSomething(){
  final value = await getSomeLoginData();

  if(value.hasError){
    // do something
  }
  else(value.hasData){
    // do something
  }
}
```

```dart
// DC forward
// Easily convert and forward back an incoming data model to another one
// This will help us in getting rid of the reduntant error checks
// In case an error is encountered then DC.forward will send back just the error else the data will be sent to the callee.

Future<DC<Exception, UserModel>> checkSomethingAndReturn(){
  final loginData = await getSomeLoginData();

  return DC.forward(
     loginData,
     UserModel(id: loginData.data?.tokenId),
   );
}
```

```dart
// DC pick
final appData = await getSomeLoginData();
appData.pick(
  onError: (error) {
    if (error is CacheException) {
      alerts.setException(context, error);
    }
  },
  onData: (data) {
    value1 = data;
  },
  onNoData: () {
    value1 = getDefaultValue();
  },
);

// or

appData.pick(
  onError: (error) {
    if (error is CacheException) {
      alerts.setException(context, error);
    }
  },
  onNoError: (data) {
    if(data != null){
      value1 = data;
    
      return;
    }
    
    value1 = getDefaultValue(); 
  },
);
```

 ### Contribute
- Fork the repo and create your branch from master.
- Ensure that the changes pass linting.
- Update the documentation if needed.
- Make sure your code lints.
- Issue a pull request!

When you submit code changes, your submissions are understood to be under the same [MIT License](https://github.com/ganeshrvel/flutter_mobx_dio_boilerplate/blob/master/LICENSE "MIT License") that covers the project. Feel free to contact the maintainers if that's a concern.


### Buy me a coffee
Help me keep the app FREE and open for all.
Paypal me: [paypal.me/ganeshrvel](https://paypal.me/ganeshrvel "paypal.me/ganeshrvel")

### Contacts
Please feel free to contact me at ganeshrvel@outlook.com


### License
flutter_mobx_dio_boilerplate | Flutter Mobx Dio Boilerplate is released under [MIT License](https://github.com/ganeshrvel/flutter_mobx_dio_boilerplate/blob/master/LICENSE "MIT License").

Copyright © 2018-Present Ganesh Rathinavel
