import 'package:meta/meta.dart';

class DC<Error, Data> {
  Error error;
  Data data;

  DC({
    @required this.error,
    @required this.data,
  });

  bool get hasError => error != null;

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
    Function(Data data) onData,
    Function() onNoData,
  }) {
    if (hasError) {
      if (onError != null) {
        onError(error);
      }

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
    }
  }
}
