import 'package:meta/meta.dart';

///
///
/// It is not a very ideal situation to handle exceptions using try and catch at every function call
/// Use DC<Exception, LoginDataModel>(error: Exception, data: LoginDataModel(id: 1)) instead
///
/// // example usage:
///
/// Future<DC<Exception, LoginModel>> getSomeLoginData() async {
///  try {
///    return DC.data(
///      someData,
///    );
///  } on Exception {
///    return DC.error(
///      CacheException(),
///    );
///  }
/// }
///
///
/// // check for errors
///
/// void doSomething(){
///   final value = await getSomeLoginData();
///
///   if(value.hasError){
///     // do something
///   }
///   else(value.hasData){
///     // do something
///   }
/// }
///
/// // DC forward
/// // Easily convert and forward back an incoming data model to another one
/// // This will help us in getting rid of the reduntant error checks
/// // In case an error is encountered then DC.forward will send back just the error else the data will be sent to the callee.
///
/// Future<DC<Exception, UserModel>> checkSomethingAndReturn(){
///   final loginData = await getSomeLoginData();
///
///   return DC.forward(
///      loginData,
///      UserModel(id: loginData.data?.tokenId),
///    );
/// }
///
/// // DC pick
///
/// final appData = await getSomeLoginData();
///  appData.pick(
///  onError: (error) {
///   if (error is CacheException) {
///      alerts.setException(context, error);
///    }
///  },
///  onData: (data) {
///    value1 = data;
///  },
///  onNoData: () {
///    value1 = getDefaultValue();
///  },
/// );
///
/// or
///
/// appData.pick(
///    onError: (error) {
///      if (error is CacheException) {
///      alerts.setException(context, error);
///      }
///    },
///    onNoError: (data) {
///      if(data != null){
///        value1 = data;
///
///        return;
///      }
///
///      value1 = getDefaultValue();
///    },
///  );
///

class DC<Error, Data> {
  Error error;
  Data data;

  DC({
    @required this.error,
    @required this.data,
  });

  // checks whether an error is present
  bool get hasError => error != null;

  // checks whether data is available
  bool get hasData => data != null;

  factory DC.error(Error error) {
    return DC(
      error: error,
      data: null,
    );
  }

  factory DC.data(Data data) {
    return DC(
      error: null,
      data: data,
    );
  }

  factory DC.forward(DC _dc, Data data) {
    if (_dc.hasError) {
      return DC.error(_dc.error as Error);
    }

    return DC.data(data);
  }

  void pick({
    Function(Error error) onError,
    Function(Data data) onNoError,
    Function(Data data) onData,
    Function() onNoData,
  }) {
    if (hasError) {
      if (onError != null) {
        onError(error);
      }

      return;
    }

    if (onNoError != null) {
      onNoError(data);

      return;
    }

    if (hasData) {
      if (onData != null) {
        onData(data);
      }

      return;
    }

    if (onNoData != null) {
      onNoData();

      return;
    }
  }
}
