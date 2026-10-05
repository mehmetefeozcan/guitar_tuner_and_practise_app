import 'package:guitar_tuner_and_practise_app/features/tuning/model/pitch_reading.dart';

import 'package:injectable/injectable.dart';

import 'dart:async';
import 'dart:math';

/// Perde algılamanın store'a bakan yüzü.
///
/// Store yalnızca bu arayüzü bilir: mikrofon izni, FFT, pencereleme ve
/// yumuşatma implementasyonda kalır. Gerçek algılayıcı geldiğinde store'a
/// dokunmadan `@Injectable(as: PitchDetectorService)` değişir.
abstract class PitchDetectorService {
  /// Algılanan perdeler. `start` çağrılmadan önce boş akar.
  Stream<PitchReading> get readings;

  /// [referenceHz] A4'ün referans frekansı (440, 432, …).
  Future<void> start({required double referenceHz});

  Future<void> stop();

  Future<void> dispose();
}

/// Mikrofon gelmeden önceki yer tutucu: A2 çevresinde pes/tiz arasında
/// gidip gelen sahte bir ölçüm akışı üretir.
@Injectable(as: PitchDetectorService)
class MockPitchDetectorService implements PitchDetectorService {
  static const _tick = Duration(milliseconds: 300);
  static const _centsRange = 30.0;

  final _controller = StreamController<PitchReading>.broadcast();

  Timer? _timer;
  int _step = 0;

  @override
  Stream<PitchReading> get readings => _controller.stream;

  @override
  Future<void> start({required double referenceHz}) async {
    await stop();

    // A4'ten iki oktav aşağısı: 440 → 110 Hz.
    final baseHz = referenceHz / 4;

    _timer = Timer.periodic(_tick, (_) {
      final cents = sin(_step / 8) * _centsRange;
      _step++;

      _controller.add(
        PitchReading(
          note: 'A',
          octave: 2,
          frequency: baseHz * pow(2, cents / 1200),
          cents: cents,
        ),
      );
    });
  }

  @override
  Future<void> stop() async {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Future<void> dispose() async {
    await stop();
    await _controller.close();
  }
}
