import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_sort/models/sport_model.dart';

import '../../../../controller/level_one_controller.dart';

class BoxWidget extends StatelessWidget {
  final List<SportModel> sports;
  final LevelOneController levelOneController;
  final int gameIndex;
  final String sportType;
  const BoxWidget(
      {super.key,
      required this.sports,
      required this.levelOneController,
      required this.gameIndex,
      required this.sportType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.h,
      height: 60.h,
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/box.webp",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 4.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          sports[0].isVisible == true
              ? InkWell(
                  onTap: () {
                    levelOneController.merge(
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
                    levelOneController.merge(
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
                    levelOneController.merge(
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
