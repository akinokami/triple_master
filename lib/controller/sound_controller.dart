import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:sport_sort/services/local_storage.dart';
import 'package:sport_sort/utils/enum.dart';

class SoundController extends GetxController {
  final player = AudioPlayer();
  final isMuted = false.obs;
  final isVibrate = false.obs;

  @override
  void onInit() {
    getMute();
    super.onInit();
  }

  void getMute() {
    isMuted.value = LocalStorage.instance.read(StorageKey.mute.name) ?? false;
    muteUnmute();
  }

  void playSound() async {
    player.play(AssetSource('theme_sound.mp3'));
  }

  void muteUnmute() {
    if (isMuted.value) {
      player.setVolume(1.0); // Unmute the audio
    } else {
      player.setVolume(0.0); // Mute the audio
    }
    LocalStorage.instance.write(StorageKey.mute.name, isMuted.value);
  }

  @override
  void onClose() {
    //
    super.onClose();
  }
}
