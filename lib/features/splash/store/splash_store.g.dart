// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashStore on _SplashStore, Store {
  late final _$navigateToHomeAtom = Atom(
    name: '_SplashStore.navigateToHome',
    context: context,
  );

  @override
  bool get navigateToHome {
    _$navigateToHomeAtom.reportRead();
    return super.navigateToHome;
  }

  @override
  set navigateToHome(bool value) {
    _$navigateToHomeAtom.reportWrite(value, super.navigateToHome, () {
      super.navigateToHome = value;
    });
  }

  late final _$selectableMessageOrdersAtom = Atom(
    name: '_SplashStore.selectableMessageOrders',
    context: context,
  );

  @override
  ObservableList<dynamic> get selectableMessageOrders {
    _$selectableMessageOrdersAtom.reportRead();
    return super.selectableMessageOrders;
  }

  @override
  set selectableMessageOrders(ObservableList<dynamic> value) {
    _$selectableMessageOrdersAtom.reportWrite(
      value,
      super.selectableMessageOrders,
      () {
        super.selectableMessageOrders = value;
      },
    );
  }

  late final _$selectedMessageOrderAtom = Atom(
    name: '_SplashStore.selectedMessageOrder',
    context: context,
  );

  @override
  int get selectedMessageOrder {
    _$selectedMessageOrderAtom.reportRead();
    return super.selectedMessageOrder;
  }

  @override
  set selectedMessageOrder(int value) {
    _$selectedMessageOrderAtom.reportWrite(
      value,
      super.selectedMessageOrder,
      () {
        super.selectedMessageOrder = value;
      },
    );
  }

  late final _$progressAtom = Atom(
    name: '_SplashStore.progress',
    context: context,
  );

  @override
  double get progress {
    _$progressAtom.reportRead();
    return super.progress;
  }

  @override
  set progress(double value) {
    _$progressAtom.reportWrite(value, super.progress, () {
      super.progress = value;
    });
  }

  late final _$initAppAsyncAction = AsyncAction(
    '_SplashStore.initApp',
    context: context,
  );

  @override
  Future<void> initApp() {
    return _$initAppAsyncAction.run(() => super.initApp());
  }

  late final _$_SplashStoreActionController = ActionController(
    name: '_SplashStore',
    context: context,
  );

  @override
  void selectMessage() {
    final _$actionInfo = _$_SplashStoreActionController.startAction(
      name: '_SplashStore.selectMessage',
    );
    try {
      return super.selectMessage();
    } finally {
      _$_SplashStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
navigateToHome: ${navigateToHome},
selectableMessageOrders: ${selectableMessageOrders},
selectedMessageOrder: ${selectedMessageOrder},
progress: ${progress}
    ''';
  }
}
