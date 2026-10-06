import 'package:studio_accordo_app_mobile/core/storage/hive_service.dart';
import 'package:studio_accordo_app_mobile/core/storage/hive_boxes.dart';

import 'package:injectable/injectable.dart';
import 'package:hive/hive.dart';

@module
abstract class StorageModule {
  @preResolve
  Future<Box> settingsBox() => Hive.openBox(HiveBoxes.settings);

  @lazySingleton
  HiveService settingsStorage(Box settingsBox) => HiveService(settingsBox);
}
