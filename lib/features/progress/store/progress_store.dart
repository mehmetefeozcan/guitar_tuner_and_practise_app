// progress_store.dart

import 'package:studio_accordo_app_mobile/core/base/base_store.dart';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'progress_store.g.dart';

@injectable
class ProgressStore = _ProgressStore with _$ProgressStore;

abstract class _ProgressStore extends BaseStore with Store {
  _ProgressStore();

  @observable
  bool navigateToHome = false;

  @action
  Future<void> initApp() async {
   // TODO: Add init codes.
  }
}
