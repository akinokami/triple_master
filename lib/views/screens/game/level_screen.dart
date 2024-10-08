import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sport_sort/controller/level_controller.dart';
import 'package:sport_sort/utils/color_const.dart';
import 'package:sport_sort/views/screens/game/level_five/level_five_screen.dart';
import 'package:sport_sort/views/screens/game/level_four/level_four_screen.dart';
import 'package:sport_sort/views/screens/game/level_one/level_one_screen.dart';
import 'package:sport_sort/views/screens/game/level_three/level_three_screen.dart';
import 'package:sport_sort/views/screens/game/level_two/level_two_screen.dart';
import 'package:sport_sort/views/screens/settings/game_setting_screen.dart';
import 'package:sport_sort/views/widgets/custom_card.dart';
import 'package:sport_sort/views/widgets/custom_game_button.dart';

import '../../../utils/dimen_const.dart';
import '../../widgets/custom_text.dart';

class LevelScreen extends StatelessWidget {
  const LevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final levelController = Get.put(LevelController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: backgroundColor,
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage(
          //       "assets/bg.webp",
          //     ),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomText(
                          text: 'level'.tr,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    ),
                    kSizedBoxH10,
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
                kSizedBoxH15,
                InkWell(
                  onTap: () {
                    Get.to(() => const LevelOneScreen());
                  },
                  child: CustomCard(
                    color: const Color.fromARGB(255, 176, 158, 140),
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: '${'level'.tr} 1',
                          fontSize: 14.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => InkWell(
                    onTap: levelController.isLvlTwoLock.value == false
                        ? () {
                            Get.to(() => const LevelTwoScreen());
                          }
                        : null,
                    child: CustomCard(
                      color: const Color.fromARGB(255, 176, 158, 140),
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: '${'level'.tr} 2',
                            fontSize: 14.sp,
                          ),
                          Visibility(
                            visible: levelController.isLvlTwoLock.value,
                            child: Icon(
                              Icons.lock,
                              size: 20.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => InkWell(
                    onTap: levelController.isLvlThreeLock.value == false
                        ? () {
                            Get.to(() => const LevelThreeScreen());
                          }
                        : null,
                    child: CustomCard(
                      color: const Color.fromARGB(255, 176, 158, 140),
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: '${'level'.tr} 3',
                            fontSize: 14.sp,
                          ),
                          Visibility(
                            visible: levelController.isLvlThreeLock.value,
                            child: Icon(
                              Icons.lock,
                              size: 20.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => InkWell(
                    onTap: levelController.isLvlFourLock.value == false
                        ? () {
                            Get.to(() => const LevelFourScreen());
                          }
                        : null,
                    child: CustomCard(
                      color: const Color.fromARGB(255, 176, 158, 140),
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: '${'level'.tr} 4',
                            fontSize: 14.sp,
                          ),
                          Visibility(
                            visible: levelController.isLvlFourLock.value,
                            child: Icon(
                              Icons.lock,
                              size: 20.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => InkWell(
                    onTap: levelController.isLvlFiveLock.value == false
                        ? () {
                            Get.to(() => const LevelFiveScreen());
                          }
                        : null,
                    child: CustomCard(
                      color: const Color.fromARGB(255, 176, 158, 140),
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: '${'level'.tr} 5',
                            fontSize: 14.sp,
                          ),
                          Visibility(
                            visible: levelController.isLvlFiveLock.value,
                            child: Icon(
                              Icons.lock,
                              size: 20.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
