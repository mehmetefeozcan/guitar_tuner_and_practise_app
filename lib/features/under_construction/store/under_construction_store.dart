// under_construction_store.dart

import 'package:guitar_tuner_and_practise_app/core/base/base_store.dart';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'under_construction_store.g.dart';

@injectable
class UnderConstructionStore = _UnderConstructionStore with _$UnderConstructionStore;

abstract class _UnderConstructionStore extends BaseStore with Store {
  _UnderConstructionStore();

  @observable
  bool navigateToHome = false;

  @action
  Future<void> initApp() async {
   // TODO: Add init codes.
  }
}
