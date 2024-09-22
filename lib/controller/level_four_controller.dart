import 'package:get/get.dart';
import 'package:sport_sort/controller/level_controller.dart';
import 'package:sport_sort/models/sport_model.dart';
import 'package:sport_sort/services/local_storage.dart';

import '../models/game.dart';
import '../utils/constants.dart';
import '../utils/enum.dart';

class LevelFourController extends GetxController {
  RxList<GameData> gameData = <GameData>[].obs;
  RxList<SportModel> mergeList = <SportModel>[].obs;
  final isLoading = false.obs;
  final clickCount = 0.obs;
  final levelController = Get.put(LevelController());

  @override
  void onInit() {
    startGame();
    super.onInit();
  }

  void merge(
      {SportModel? sport,
      required int gameIndex,
      required String sportType,
      required sportIndex}) {
    isLoading.value = true;

    if (mergeList.length < 7) {
      mergeList.add(sport ?? SportModel());
      if (sportType == "sport1") {
        gameData[gameIndex].sport1?[sportIndex].isVisible = false;
      } else if (sportType == "sport2") {
        gameData[gameIndex].sport2?[sportIndex].isVisible = false;
      } else if (sportType == "sport3") {
        gameData[gameIndex].sport3?[sportIndex].isVisible = false;
      } else if (sportType == "sport4") {
        gameData[gameIndex].sport4?[sportIndex].isVisible = false;
      } else if (sportType == "sport5") {
        gameData[gameIndex].sport5?[sportIndex].isVisible = false;
      } else if (sportType == "sport6") {
        gameData[gameIndex].sport6?[sportIndex].isVisible = false;
      } else if (sportType == "sport7") {
        gameData[gameIndex].sport7?[sportIndex].isVisible = false;
      } else if (sportType == "sport8") {
        gameData[gameIndex].sport8?[sportIndex].isVisible = false;
      } else if (sportType == "sport9") {
        gameData[gameIndex].sport9?[sportIndex].isVisible = false;
      } else if (sportType == "sport10") {
        gameData[gameIndex].sport10?[sportIndex].isVisible = false;
      } else if (sportType == "sport11") {
        gameData[gameIndex].sport11?[sportIndex].isVisible = false;
      } else if (sportType == "sport12") {
        gameData[gameIndex].sport12?[sportIndex].isVisible = false;
      }
      checkAndRemoveSports(sport ?? SportModel());
    }

    isLoading.value = false;
  }

  void checkAndRemoveSports(SportModel sport) {
    clickCount.value += 1;
    int count = 0;
    for (int i = 0; i < mergeList.length; i++) {
      if (sport.id == mergeList[i].id) {
        count += 1;
      }
    }
    if (count > 2) {
      Future.delayed(const Duration(seconds: 1), () {
        mergeList.removeWhere((item) => item.id == sport.id);
        if (mergeList.length == 7) {
          constants.showDialog(
              title: 'game_over'.tr,
              desc: 'are_you_want_to_replay'.tr,
              onConfirmTap: () {
                startGame();

                Get.back();
              },
              onCancelTap: () {
                Get.back();
                Get.back();
              });
        }
      });
    } else {
      if (mergeList.length == 7) {
        constants.showDialog(
            title: 'game_over'.tr,
            desc: 'are_you_want_to_replay'.tr,
            onConfirmTap: () {
              startGame();

              Get.back();
            },
            onCancelTap: () {
              Get.back();
            });
      }
    }

    if (clickCount.value == 36) {
      levelController.isLvlFiveLock.value = false;
      LocalStorage.instance.write(StorageKey.isLvlFiveLock.name, false);
      constants.showConglaturationDialog(
        title: 'conglaturation'.tr,
        desc: 'level_complete'.tr,
        onConfirmTap: () {
          Get.back();
          Get.back();
        },
      );
    }
    isLoading.value = false;
  }

  void startGame() {
    clickCount.value = 0;
    mergeList.clear();
    gameData.value = [
      GameData(
        sport1: [
          SportModel(id: 8, name: "golf", image: "assets/golf.webp"),
          SportModel(
              id: 7, name: "volleyball", image: "assets/volleyball.webp"),
          SportModel(
              id: 11, name: "football one", image: "assets/football_one.webp"),
        ],
        sport2: [
          SportModel(
              id: 3, name: "basketball", image: "assets/basketball.webp"),
          SportModel(id: 2, name: "baseball", image: "assets/baseball.webp"),
          SportModel(id: 9, name: "hockey", image: "assets/hockey.webp"),
        ],
        sport3: [
          SportModel(id: 10, name: "batminton", image: "assets/batminton.webp"),
          SportModel(id: 1, name: "soccer", image: "assets/soccer.webp"),
          SportModel(id: 2, name: "baseball", image: "assets/baseball.webp"),
        ],
        sport4: [
          SportModel(
              id: 7, name: "volleyball", image: "assets/volleyball.webp"),
          SportModel(id: 8, name: "golf", image: "assets/golf.webp"),
          SportModel(id: 5, name: "snooker", image: "assets/snooker.webp"),
        ],
        sport5: [
          SportModel(id: 2, name: "baseball", image: "assets/baseball.webp"),
          SportModel(
              id: 12, name: "snooker one", image: "assets/snooker_one.webp"),
          SportModel(
              id: 3, name: "basketball", image: "assets/basketball.webp"),
        ],
        sport6: [
          SportModel(id: 10, name: "batminton", image: "assets/batminton.webp"),
          SportModel(id: 6, name: "tennis", image: "assets/tennis.webp"),
          SportModel(id: 9, name: "hockey", image: "assets/hockey.webp"),
        ],
        sport7: [
          SportModel(id: 1, name: "soccer", image: "assets/soccer.webp"),
          SportModel(id: 6, name: "tennis", image: "assets/tennis.webp"),
          SportModel(
              id: 11, name: "football one", image: "assets/football_one.webp"),
        ],
        sport8: [
          SportModel(id: 8, name: "golf", image: "assets/golf.webp"),
          SportModel(id: 1, name: "soccer", image: "assets/soccer.webp"),
          SportModel(id: 4, name: "football", image: "assets/football.webp"),
        ],
        sport9: [
          SportModel(
              id: 12, name: "snooker one", image: "assets/snooker_one.webp"),
          SportModel(
              id: 7, name: "volleyball", image: "assets/volleyball.webp"),
          SportModel(id: 9, name: "hockey", image: "assets/hockey.webp"),
        ],
        sport10: [
          SportModel(id: 6, name: "tennis", image: "assets/tennis.webp"),
          SportModel(id: 10, name: "batminton", image: "assets/batminton.webp"),
          SportModel(id: 4, name: "football", image: "assets/football.webp"),
        ],
        sport11: [
          SportModel(id: 4, name: "football", image: "assets/football.webp"),
          SportModel(
              id: 11, name: "football one", image: "assets/football_one.webp"),
          SportModel(id: 5, name: "snooker", image: "assets/snooker.webp"),
        ],
        sport12: [
          SportModel(
              id: 3, name: "basketball", image: "assets/basketball.webp"),
          SportModel(id: 5, name: "snooker", image: "assets/snooker.webp"),
          SportModel(
              id: 12, name: "snooker one", image: "assets/snooker_one.webp"),
        ],
      ),
    ];
  }
}

//soccer 1
//baseball 2
//basketball 3
//football 4
//snooker 5
//tennis 6
//volleyball 7
//golf 8
//hockey 9
//batminton 10
//football_one 11
//snooker_one 12
