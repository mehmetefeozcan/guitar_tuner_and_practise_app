// splash_store.dart

import 'package:studio_accordo_app_mobile/core/base/base_store.dart';

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

  @observable
  double progress = 0;

  @action
  Future<void> initApp() async {
    final steps = <Future<void> Function()>[_loadLocalData, _fetchRemoteData];

    for (var i = 0; i < steps.length; i++) {
      await steps[i]();
      progress = (i + 1) / steps.length * 100;
    }

    await Future.delayed(const Duration(milliseconds: 400));
    navigateToHome = true;
  }

  Future<void> _loadLocalData() async {
    await Future.delayed(const Duration(seconds: 1, milliseconds: 250));
    selectMessage();
  }

  Future<void> _fetchRemoteData() async {
    await Future.delayed(const Duration(seconds: 1, milliseconds: 750));
  }

  @action
  void selectMessage() {
    Random rnd = Random();

    final index = rnd.nextInt(selectableMessageOrders.length);
    selectedMessageOrder = selectableMessageOrders[index];
    selectableMessageOrders.removeAt(index);
  }
}
