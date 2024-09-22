import 'package:get/get.dart';
import 'package:sport_sort/services/local_storage.dart';

import '../utils/enum.dart';

class LevelController extends GetxController {
  final isLvlTwoLock = true.obs;
  final isLvlThreeLock = true.obs;
  final isLvlFourLock = true.obs;
  final isLvlFiveLock = true.obs;

  @override
  void onInit() {
    getLevelData();
    super.onInit();
  }

  void getLevelData() {
    if (LocalStorage.instance.read(StorageKey.isLvlTwoLock.name) == null) {
      LocalStorage.instance
          .write(StorageKey.isLvlTwoLock.name, isLvlTwoLock.value);
    } else {
      isLvlTwoLock.value =
          (LocalStorage.instance.read(StorageKey.isLvlTwoLock.name));
    }
    if (LocalStorage.instance.read(StorageKey.isLvlThreeLock.name) == null) {
      LocalStorage.instance
          .write(StorageKey.isLvlThreeLock.name, isLvlThreeLock.value);
    } else {
      isLvlThreeLock.value =
          (LocalStorage.instance.read(StorageKey.isLvlThreeLock.name));
    }
    if (LocalStorage.instance.read(StorageKey.isLvlFourLock.name) == null) {
      LocalStorage.instance
          .write(StorageKey.isLvlFourLock.name, isLvlFourLock.value);
    } else {
      isLvlFourLock.value =
          (LocalStorage.instance.read(StorageKey.isLvlFourLock.name));
    }
    if (LocalStorage.instance.read(StorageKey.isLvlFiveLock.name) == null) {
      LocalStorage.instance
          .write(StorageKey.isLvlFiveLock.name, isLvlFiveLock.value);
    } else {
      isLvlFiveLock.value =
          (LocalStorage.instance.read(StorageKey.isLvlFiveLock.name));
    }
  }
}
