// home_store.dart

import 'package:guitar_tuner_and_practise_app/features/home/model/weekly_progress.dart';
import 'package:guitar_tuner_and_practise_app/features/home/model/practice_entry.dart';
import 'package:guitar_tuner_and_practise_app/features/home/model/homework_item.dart';
import 'package:guitar_tuner_and_practise_app/features/home/model/greeting_kind.dart';
import 'package:guitar_tuner_and_practise_app/core/base/base_store.dart';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

@injectable
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore extends BaseStore with Store {
  _HomeStore();

  @observable
  WeeklyProgress? weeklyProgress;

  @observable
  HomeworkItem? currentHomework;

  @observable
  PracticeEntry? lastPracticed;

  /// Observable değil: saate bakar, build sırasında okunur.
  GreetingKind get greeting => GreetingKind.fromHour(DateTime.now().hour);

  @action
  Future<void> initApp() async {
    // TODO: API bağlandığında bu blok istek sonucuyla değişecek; ekranda
    // sabit veri kalmaması için şimdilik tek yerde toplanıyor.
    weeklyProgress = const WeeklyProgress(
      minutes: 252,
      goalMinutes: 300,
      diffMinutes: 48,
      metronomeHours: 2.5,
    );

    currentHomework = HomeworkItem(
      pieceName: "Carcassi Op. 60 No. 3",
      minBar: 1,
      maxBar: 16,
      bpm: 96,
      lastWorkingBpm: 84,
      delivery: DateTime(2026, 10, 5),
      progress: 70,
    );

    lastPracticed = PracticeEntry(
      pieceName: "Do majör gam · 2 oktav",
      date: DateTime(2026, 10, 1),
      accuracy: 91,
    );
  }
}
