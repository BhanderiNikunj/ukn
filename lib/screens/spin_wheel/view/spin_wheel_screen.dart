import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
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
    // TODO: implement dispose
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonWidget.commonScreenUI(
      title: "Spin",
      child: Column(
        children: [
          Expanded(
            child: FortuneWheel(
              duration: Duration(seconds: 5),
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
                ),FortuneItem(
                  child: Text('100'),
                ),FortuneItem(
                  child: Text('50'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
