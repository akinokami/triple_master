import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../controller/level_four_controller.dart';
import '../../../../models/sport_model.dart';

class BoxFourWidget extends StatelessWidget {
  final List<SportModel> sports;
  final LevelFourController levelFourController;
  final int gameIndex;
  final String sportType;
  const BoxFourWidget(
      {super.key,
      required this.sports,
      required this.levelFourController,
      required this.gameIndex,
      required this.sportType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 60.h,
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/box.webp",
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 4.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          sports[0].isVisible == true
              ? InkWell(
                  onTap: () {
                    levelFourController.merge(
                        sport: sports[0],
                        gameIndex: gameIndex,
                        sportType: sportType,
                        sportIndex: 0);
                  },
                  child: Image.asset(
                    sports[0].image ?? '',
                    width: 25.w,
                    height: 25.w,
                  ),
                )
              : SizedBox(width: 25.w),
          sports[1].isVisible == true
              ? InkWell(
                  onTap: () {
                    levelFourController.merge(
                        sport: sports[1],
                        gameIndex: gameIndex,
                        sportType: sportType,
                        sportIndex: 1);
                  },
                  child: Image.asset(
                    sports[1].image ?? '',
                    width: 25.w,
                    height: 25.w,
                  ),
                )
              : SizedBox(width: 25.w),
          sports[2].isVisible == true
              ? InkWell(
                  onTap: () {
                    levelFourController.merge(
                        sport: sports[2],
                        gameIndex: gameIndex,
                        sportType: sportType,
                        sportIndex: 2);
                  },
                  child: Image.asset(
                    sports[2].image ?? '',
                    width: 25.w,
                    height: 25.w,
                  ),
                )
              : SizedBox(width: 25.w),
        ]),
      ),
    );
  }
}
