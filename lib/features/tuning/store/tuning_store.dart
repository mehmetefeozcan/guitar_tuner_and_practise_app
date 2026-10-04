// tuning_store.dart

import 'package:guitar_tuner_and_practise_app/core/base/base_store.dart';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'tuning_store.g.dart';

@injectable
class TuningStore = _TuningStore with _$TuningStore;

abstract class _TuningStore extends BaseStore with Store {
  _TuningStore();

  @observable
  bool navigateToHome = false;

  @action
  Future<void> initApp() async {
   // TODO: Add init codes.
  }
}
