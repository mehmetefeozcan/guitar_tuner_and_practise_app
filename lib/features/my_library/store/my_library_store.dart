// my_library_store.dart

import 'package:guitar_tuner_and_practise_app/core/base/base_store.dart';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'my_library_store.g.dart';

@injectable
class MyLibraryStore = _MyLibraryStore with _$MyLibraryStore;

abstract class _MyLibraryStore extends BaseStore with Store {
  _MyLibraryStore();

  @observable
  bool navigateToHome = false;

  @action
  Future<void> initApp() async {
   // TODO: Add init codes.
  }
}
