// splash_store.dart

import 'package:guitar_tuner_and_practise_app/core/base/base_store.dart';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import 'dart:math';

part 'splash_store.g.dart';

@injectable
class SplashStore = _SplashStore with _$SplashStore;

abstract class _SplashStore extends BaseStore with Store {
  _SplashStore();

  @observable
  bool navigateToHome = false;

  @observable
  ObservableList selectableMessageOrders = ObservableList.of([1, 2, 3, 4]);

  @observable
  int selectedMessageOrder = 1;

  @action
  Future<void> initApp() async {
    await Future.delayed(Duration(seconds: 1, milliseconds: 250));
    selectMessage();
    await Future.delayed(Duration(seconds: 1, milliseconds: 750));
    navigateToHome = true;
  }

  @action
  void selectMessage() {
    Random rnd = Random();

    final index = rnd.nextInt(selectableMessageOrders.length);
    selectedMessageOrder = selectableMessageOrders[index];
    selectableMessageOrders.removeAt(index);
  }
}
