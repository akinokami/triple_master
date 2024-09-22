import 'package:get/get.dart';
import 'package:sport_sort/models/sport_model.dart';

import '../models/game.dart';
import '../utils/constants.dart';

class LevelOneController extends GetxController {
  RxList<GameData> gameData = <GameData>[].obs;
  RxList<SportModel> mergeList = <SportModel>[].obs;
  final isLoading = false.obs;
  // final isContain1 = true.obs;
  // final isContain2 = true.obs;
  // final isContain3 = true.obs;
  // final isContain4 = true.obs;
  // final isContain5 = true.obs;
  final clickCount = 0.obs;

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

    // for (int j = 0; j < gameData.length; j++) {
    //   for (int k = 0; k < (gameData[j].sport1 ?? []).length; k++) {
    //     if (gameData[j].sport1?[k].isVisible == true) {
    //       print("visible contain true");
    //       isContain1.value = true;
    //     } else {
    //       isContain1.value = false;
    //     }
    //   }
    //   for (int k = 0; k < (gameData[j].sport2 ?? []).length; k++) {
    //     if (gameData[j].sport2?[k].isVisible == true) {
    //       print("visible contain true");
    //       isContain2.value = true;
    //     } else {
    //       isContain2.value = false;
    //     }
    //   }
    //   for (int k = 0; k < (gameData[j].sport3 ?? []).length; k++) {
    //     if (gameData[j].sport3?[k].isVisible == true) {
    //       print("visible contain true");
    //       isContain3.value = true;
    //     } else {
    //       isContain3.value = false;
    //     }
    //   }
    //   for (int k = 0; k < (gameData[j].sport4 ?? []).length; k++) {
    //     if (gameData[j].sport4?[k].isVisible == true) {
    //       print("visible contain true");
    //       isContain4.value = true;
    //     } else {
    //       isContain4.value = false;
    //     }
    //   }
    //   for (int k = 0; k < (gameData[j].sport5 ?? []).length; k++) {
    //     if (gameData[j].sport5?[k].isVisible == true) {
    //       print("visible contain true");
    //       isContain5.value = true;
    //     } else {
    //       isContain5.value = false;
    //     }
    //   }
    // }

    if (clickCount.value == 15) {
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
          SportModel(id: 1, name: "soccer", image: "assets/soccer.webp"),
          SportModel(
              id: 7, name: "volleyball", image: "assets/volleyball.webp"),
          SportModel(id: 4, name: "football", image: "assets/football.webp"),
        ],
        sport2: [
          SportModel(id: 2, name: "baseball", image: "assets/baseball.webp"),
          SportModel(
              id: 7, name: "volleyball", image: "assets/volleyball.webp"),
          SportModel(id: 5, name: "snooker", image: "assets/snooker.webp"),
        ],
        sport3: [
          SportModel(id: 1, name: "soccer", image: "assets/soccer.webp"),
          SportModel(id: 4, name: "football", image: "assets/football.webp"),
          SportModel(id: 2, name: "baseball", image: "assets/baseball.webp"),
        ],
        sport4: [
          SportModel(
              id: 7, name: "volleyball", image: "assets/volleyball.webp"),
          SportModel(id: 4, name: "football", image: "assets/football.webp"),
          SportModel(id: 5, name: "snooker", image: "assets/snooker.webp"),
        ],
        sport5: [
          SportModel(id: 1, name: "soccer", image: "assets/soccer.webp"),
          SportModel(id: 5, name: "snooker", image: "assets/snooker.webp"),
          SportModel(id: 2, name: "baseball", image: "assets/baseball.webp"),
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