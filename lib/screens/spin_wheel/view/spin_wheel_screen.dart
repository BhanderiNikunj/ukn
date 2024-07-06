import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_widget.dart';

class SpinWheelScreen extends StatefulWidget {
  const SpinWheelScreen({super.key});

  @override
  State<SpinWheelScreen> createState() => _SpinWheelScreenState();
}

class _SpinWheelScreenState extends State<SpinWheelScreen> {
  StreamController<int> controller = StreamController<int>();

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonWidget.commonScreenUI(
      title: "Spin",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: FortuneWheel(
                animateFirst: false,
                hapticImpact: HapticImpact.medium,
                indicators: [
                  FortuneIndicator(
                    child: Transform.rotate(
                      angle: 361.3,
                      alignment: Alignment.topCenter,
                      child: TriangleIndicator(
                        elevation: 10,
                        color: Color(0xffFFCA4F),
                      ),
                    ),
                  ),
                  FortuneIndicator(
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.primary1Color,
                        border: Border.all(
                          width: 2,
                          color: Color(0xffFFCA4F),
                        ),
                      ),
                      child: Text(
                        "SPIN",
                        style: TextStyle(
                          color: AppColor.white1Color,
                        ),
                      ),
                    ),
                  ),
                ],
                selected: controller.stream,
                items: [
                  FortuneItem(
                    child: Text('Han Solo'),
                  ),
                  FortuneItem(
                    child: Text('10000'),
                  ),
                  FortuneItem(
                    child: Text('500'),
                  ),
                  fortuneItemView(
                      title: "9000",
                      color: AppColor.secondery1Color,
                      borderColor: AppColor.primary1Color)
                  // FortuneItem(
                  //   child: Text('100'),
                  // ),
                  // FortuneItem(
                  //   child: Text('50'),
                  // ),
                  // FortuneItem(
                  //   child: Text('50'),
                  // ),
                  // FortuneItem(
                  //   child: Text('50'),
                  // ),
                  // FortuneItem(
                  //   child: Text('50'),
                  // ),
                  // FortuneItem(
                  //   child: Text('50'),
                  // ),
                  // FortuneItem(
                  //   child: Text('50'),
                  // ),
                  // FortuneItem(
                  //   child: Text('50'),
                  // ),
                  // FortuneItem(
                  //   child: Text('50'),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  FortuneItem fortuneItemView(
      {required title, required Color color, required Color borderColor}) {
    return FortuneItem(
      child: Text(
        title,
      ),
      style: FortuneItemStyle(
        color: color,
        borderColor: borderColor,
        borderWidth: 2,
      ),
    );
  }
}
