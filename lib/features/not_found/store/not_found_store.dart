// not_found_store.dart

import 'package:guitar_tuner_and_practise_app/core/base/base_store.dart';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'not_found_store.g.dart';

@injectable
class NotFoundStore = _NotFoundStore with _$NotFoundStore;

abstract class _NotFoundStore extends BaseStore with Store {
  _NotFoundStore();

  @observable
  bool navigateToHome = false;

  @action
  Future<void> initApp() async {
   // TODO: Add init codes.
  }
}
