// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$weeklyProgressAtom = Atom(
    name: '_HomeStore.weeklyProgress',
    context: context,
  );

  @override
  WeeklyProgress? get weeklyProgress {
    _$weeklyProgressAtom.reportRead();
    return super.weeklyProgress;
  }

  @override
  set weeklyProgress(WeeklyProgress? value) {
    _$weeklyProgressAtom.reportWrite(value, super.weeklyProgress, () {
      super.weeklyProgress = value;
    });
  }

  late final _$currentHomeworkAtom = Atom(
    name: '_HomeStore.currentHomework',
    context: context,
  );

  @override
  HomeworkItem? get currentHomework {
    _$currentHomeworkAtom.reportRead();
    return super.currentHomework;
  }

  @override
  set currentHomework(HomeworkItem? value) {
    _$currentHomeworkAtom.reportWrite(value, super.currentHomework, () {
      super.currentHomework = value;
    });
  }

  late final _$lastPracticedAtom = Atom(
    name: '_HomeStore.lastPracticed',
    context: context,
  );

  @override
  PracticeEntry? get lastPracticed {
    _$lastPracticedAtom.reportRead();
    return super.lastPracticed;
  }

  @override
  set lastPracticed(PracticeEntry? value) {
    _$lastPracticedAtom.reportWrite(value, super.lastPracticed, () {
      super.lastPracticed = value;
    });
  }

  late final _$initAppAsyncAction = AsyncAction(
    '_HomeStore.initApp',
    context: context,
  );

  @override
  Future<void> initApp() {
    return _$initAppAsyncAction.run(() => super.initApp());
  }

  @override
  String toString() {
    return '''
weeklyProgress: ${weeklyProgress},
currentHomework: ${currentHomework},
lastPracticed: ${lastPracticed}
    ''';
  }
}
