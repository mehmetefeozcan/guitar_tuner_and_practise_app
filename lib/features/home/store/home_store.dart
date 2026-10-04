// home_store.dart

import 'package:guitar_tuner_and_practise_app/core/base/base_store.dart';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

@injectable
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore extends BaseStore with Store {
  _HomeStore();

  @observable
  bool navigateToHome = false;

  @action
  Future<void> initApp() async {
   // TODO: Add init codes.
  }
}
