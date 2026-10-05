// tuning_store.dart

import 'package:guitar_tuner_and_practise_app/features/tuning/service/pitch_detector_service.dart';
import 'package:guitar_tuner_and_practise_app/features/tuning/model/reference_frequency.dart';
import 'package:guitar_tuner_and_practise_app/features/tuning/model/pitch_reading.dart';
import 'package:guitar_tuner_and_practise_app/features/tuning/model/tuning_type.dart';
import 'package:guitar_tuner_and_practise_app/core/base/base_store.dart';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import 'dart:async';

part 'tuning_store.g.dart';

@injectable
class TuningStore = _TuningStore with _$TuningStore;

abstract class _TuningStore extends BaseStore with Store {
  _TuningStore(this._pitchDetector);

  final PitchDetectorService _pitchDetector;

  StreamSubscription<PitchReading>? _subscription;

  /// Akortta sayılan sapma — renk ve "akortta" etiketi bu eşikten çıkar.
  static const centsTolerance = 5.0;

  @observable
  TuningType selectedTuning = TuningType.standard;

  @observable
  int selectedStringIndex = 0;

  @observable
  double referenceHz = ReferenceFrequency.standard;

  @observable
  PitchReading? reading;

  @computed
  List<String> get strings => selectedTuning.strings;

  @computed
  bool get isInTune => (reading?.cents.abs() ?? double.infinity) <= centsTolerance;

  @action
  void selectTuning(TuningType type) {
    selectedTuning = type;
  }

  @action
  void selectString(int index) {
    selectedStringIndex = index;
  }

  @action
  Future<void> setReferenceHz(double hz) async {
    referenceHz = hz.clamp(ReferenceFrequency.min, ReferenceFrequency.max);

    // Hedef değişti; algılayıcı yeni referansla yeniden başlar.
    await _pitchDetector.start(referenceHz: referenceHz);
  }

  Future<void> nudgeReferenceHz(int delta) =>
      setReferenceHz(referenceHz + delta);

  @action
  Future<void> initApp() async {
    _subscription = _pitchDetector.readings.listen(_onReading);

    await _pitchDetector.start(referenceHz: referenceHz);
  }

  @action
  void _onReading(PitchReading value) {
    reading = value;
  }

  Future<void> disposeStore() async {
    await _subscription?.cancel();
    _subscription = null;

    await _pitchDetector.dispose();
  }
}
