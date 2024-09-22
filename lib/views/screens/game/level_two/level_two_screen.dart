import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sport_sort/utils/dimen_const.dart';
import 'package:sport_sort/views/screens/game/level_two/box_two_widget.dart';
import 'package:sport_sort/views/widgets/custom_loading.dart';

import '../../../../controller/level_two_controller.dart';
import '../../../widgets/custom_game_button.dart';
import '../../../widgets/custom_text.dart';
import '../../settings/game_setting_screen.dart';

class LevelTwoScreen extends StatelessWidget {
  const LevelTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final levelTwoController = Get.put(LevelTwoController());
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/home_new.webp",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomGameButton(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      height: 35.w,
                      width: 35.w,
                      icon: Icons.arrow_back,
                      iconColor: Colors.white,
                    ),
                    CustomText(
                      text: '${'level'.tr} 2',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    CustomGameButton(
                      onTap: () {
                        Get.to(() => const GameSettingScreen());
                      },
                      height: 35.w,
                      width: 35.w,
                      icon: Icons.settings,
                      iconColor: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.sh * 0.25,
                ),
                Expanded(
                  child: Obx(
                    () => levelTwoController.isLoading.value == true
                        ? const Center(
                            child: CustomLoading(),
                          )
                        : ListView.builder(
                            itemCount: levelTwoController.gameData.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 3.h),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        BoxTwoWidget(
                                          levelTwoController:
                                              levelTwoController,
                                          sports: levelTwoController
                                                  .gameData[index].sport1 ??
                                              [],
                                          gameIndex: index,
                                          sportType: 'sport1',
                                        ),
                                        kSizedBoxW3,
                                        BoxTwoWidget(
                                          levelTwoController:
                                              levelTwoController,
                                          sports: levelTwoController
                                                  .gameData[index].sport2 ??
                                              [],
                                          gameIndex: index,
                                          sportType: 'sport2',
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        BoxTwoWidget(
                                          levelTwoController:
                                              levelTwoController,
                                          sports: levelTwoController
                                                  .gameData[index].sport3 ??
                                              [],
                                          gameIndex: index,
                                          sportType: 'sport3',
                                        ),
                                        kSizedBoxW3,
                                        BoxTwoWidget(
                                          levelTwoController:
                                              levelTwoController,
                                          sports: levelTwoController
                                                  .gameData[index].sport4 ??
                                              [],
                                          gameIndex: index,
                                          sportType: 'sport4',
                                        ),
                                        kSizedBoxW3,
                                        BoxTwoWidget(
                                          levelTwoController:
                                              levelTwoController,
                                          sports: levelTwoController
                                                  .gameData[index].sport5 ??
                                              [],
                                          gameIndex: index,
                                          sportType: 'sport5',
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        BoxTwoWidget(
                                          levelTwoController:
                                              levelTwoController,
                                          sports: levelTwoController
                                                  .gameData[index].sport6 ??
                                              [],
                                          gameIndex: index,
                                          sportType: 'sport6',
                                        ),
                                        kSizedBoxW3,
                                        BoxTwoWidget(
                                          levelTwoController:
                                              levelTwoController,
                                          sports: levelTwoController
                                                  .gameData[index].sport7 ??
                                              [],
                                          gameIndex: index,
                                          sportType: 'sport7',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                  ),
                ),
                Obx(
                  () => Container(
                    height: 47.h,
                    width: 1.sw * 0.80,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10.r)),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 1.sw * 0.75,
                      child: ListView.builder(
                          itemCount: levelTwoController.mergeList.length,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: Image.asset(
                                levelTwoController.mergeList[index].image ?? '',
                                width: 30.w,
                                height: 30.w,
                              ),
                            );
                          }),
                    ),
                  ),
                ),
                kSizedBoxH20
              ],
            )),
      ),
    ));
  }
}
