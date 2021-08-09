import 'package:mobx/mobx.dart';

bool isStateLoading(ObservableFuture? futureData) {
  return futureData?.status == FutureStatus.pending;
}

void disposeStore(List<ReactionDisposer>? _disposers) {
  if (_disposers != null) {
    for (final disposer in _disposers) {
      disposer();
    }
  }
}
