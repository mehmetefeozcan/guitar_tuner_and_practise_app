// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tuning_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TuningStore on _TuningStore, Store {
  Computed<List<String>>? _$stringsComputed;

  @override
  List<String> get strings => (_$stringsComputed ??= Computed<List<String>>(
    () => super.strings,
    name: '_TuningStore.strings',
  )).value;
  Computed<bool>? _$isInTuneComputed;

  @override
  bool get isInTune => (_$isInTuneComputed ??= Computed<bool>(
    () => super.isInTune,
    name: '_TuningStore.isInTune',
  )).value;
  late final _$selectedTuningAtom = Atom(
    name: '_TuningStore.selectedTuning',
    context: context,
  );

  @override
  TuningType get selectedTuning {
    _$selectedTuningAtom.reportRead();
    return super.selectedTuning;
  }

  @override
  set selectedTuning(TuningType value) {
    _$selectedTuningAtom.reportWrite(value, super.selectedTuning, () {
      super.selectedTuning = value;
    });
  }

  late final _$selectedStringIndexAtom = Atom(
    name: '_TuningStore.selectedStringIndex',
    context: context,
  );

  @override
  int get selectedStringIndex {
    _$selectedStringIndexAtom.reportRead();
    return super.selectedStringIndex;
  }

  @override
  set selectedStringIndex(int value) {
    _$selectedStringIndexAtom.reportWrite(value, super.selectedStringIndex, () {
      super.selectedStringIndex = value;
    });
  }

  late final _$tunedStringsAtom = Atom(
    name: '_TuningStore.tunedStrings',
    context: context,
  );

  @override
  Set<int> get tunedStrings {
    _$tunedStringsAtom.reportRead();
    return super.tunedStrings;
  }

  @override
  set tunedStrings(Set<int> value) {
    _$tunedStringsAtom.reportWrite(value, super.tunedStrings, () {
      super.tunedStrings = value;
    });
  }

  late final _$referenceHzAtom = Atom(
    name: '_TuningStore.referenceHz',
    context: context,
  );

  @override
  double get referenceHz {
    _$referenceHzAtom.reportRead();
    return super.referenceHz;
  }

  @override
  set referenceHz(double value) {
    _$referenceHzAtom.reportWrite(value, super.referenceHz, () {
      super.referenceHz = value;
    });
  }

  late final _$readingAtom = Atom(
    name: '_TuningStore.reading',
    context: context,
  );

  @override
  PitchReading? get reading {
    _$readingAtom.reportRead();
    return super.reading;
  }

  @override
  set reading(PitchReading? value) {
    _$readingAtom.reportWrite(value, super.reading, () {
      super.reading = value;
    });
  }

  late final _$setReferenceHzAsyncAction = AsyncAction(
    '_TuningStore.setReferenceHz',
    context: context,
  );

  @override
  Future<void> setReferenceHz(double hz) {
    return _$setReferenceHzAsyncAction.run(() => super.setReferenceHz(hz));
  }

  late final _$initAppAsyncAction = AsyncAction(
    '_TuningStore.initApp',
    context: context,
  );

  @override
  Future<void> initApp() {
    return _$initAppAsyncAction.run(() => super.initApp());
  }

  late final _$_TuningStoreActionController = ActionController(
    name: '_TuningStore',
    context: context,
  );

  @override
  void selectTuning(TuningType type) {
    final _$actionInfo = _$_TuningStoreActionController.startAction(
      name: '_TuningStore.selectTuning',
    );
    try {
      return super.selectTuning(type);
    } finally {
      _$_TuningStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectString(int index) {
    final _$actionInfo = _$_TuningStoreActionController.startAction(
      name: '_TuningStore.selectString',
    );
    try {
      return super.selectString(index);
    } finally {
      _$_TuningStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _onReading(PitchReading? raw) {
    final _$actionInfo = _$_TuningStoreActionController.startAction(
      name: '_TuningStore._onReading',
    );
    try {
      return super._onReading(raw);
    } finally {
      _$_TuningStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedTuning: ${selectedTuning},
selectedStringIndex: ${selectedStringIndex},
tunedStrings: ${tunedStrings},
referenceHz: ${referenceHz},
reading: ${reading},
strings: ${strings},
isInTune: ${isInTune}
    ''';
  }
}
