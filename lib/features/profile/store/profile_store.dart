// profile_store.dart

import 'package:guitar_tuner_and_practise_app/core/base/base_store.dart';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

@injectable
class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore extends BaseStore with Store {
  _ProfileStore();

  @observable
  bool navigateToHome = false;

  @action
  Future<void> initApp() async {
   // TODO: Add init codes.
  }
}
