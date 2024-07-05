import 'package:flutter/material.dart';
import 'package:unk/common/common_widget.dart';
import 'package:unk/screens/home/view/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends HomeWidget {
  @override
  Widget build(BuildContext context) {
    return CommonWidget.commonScreenUI(
      titleWidget: const Row(children: []),
      child: screenView(),
    );
  }
}
