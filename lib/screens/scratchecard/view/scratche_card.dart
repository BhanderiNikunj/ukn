import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_widget.dart';
import 'package:unk/common/global.dart';
import 'package:unk/packages/scratcher/widgets.dart';
import 'package:unk/screens/home/controller/home_controller.dart';
import 'package:unk/screens/scratchecard/view/controller/updatecoincontroller.dart';
import 'package:unk/utils/shared_helper.dart';

class ScratcheCard extends StatefulWidget {
  const ScratcheCard({super.key});

  @override
  State<ScratcheCard> createState() => _ScratcheCardState();
}

class _ScratcheCardState extends State<ScratcheCard> {
  late HomeController controller;
   late UserPointUpdate userPointUpdate;
  String? randomValue;
   int? userId;

  loadData()
  async {
    userPointUpdate.scratchBoolValue = await SharedHelper.getScratchValue();
    userId = await SharedHelper.getLoginData();

     print("kunallll${userId}");
    
    if(userPointUpdate.scratchBoolValue != 1)
    {
      Future.delayed(
      const Duration(hours: 24),() async {
      await SharedHelper.setScratchValue(isScratch: 1);
    },);
    }
    if (kDebugMode) {
      print("radheradhe${userPointUpdate.scratchBoolValue}.scratchBoolValue");
    }
  }

  @override
  void initState() {
   
    controller = Get.put(HomeController());
    userPointUpdate = Get.put(UserPointUpdate());
   loadData();
    super.initState();
    generateRandomValue();
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  void generateRandomValue() {
    final scratchCoins = generalSettingModel?.data.scratchCoins ?? [];
    if (scratchCoins.isNotEmpty) {
      final randomIndex = Random().nextInt(scratchCoins.length);
      randomValue = scratchCoins[randomIndex];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary1Color,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: CommonWidget.commonText(
            text: "Scratch And Win",
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold),
        backgroundColor: AppColor.primary1Color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            userPointUpdate.scratchBoolValue == 2?
            const Text("Plz Show The Add And Agin Scratch"):Scratcher(
              brushSize: 50,
              threshold: 50,
              color: AppColor.secondery6Color,
              enabled: true,
              rebuildOnResize: true,
             // onChange: (value) => print("Scratch progress: $value%"),
             onChange: (value) async {
                await SharedHelper.setScratchValue(isScratch: 2);
               // await userPointUpdate.userPointUpdate(userPointUpdate.userId,value);
             },
              onThreshold: () async {
                  await SharedHelper.setScratchValue(isScratch: 2);
              },
              onScratchUpdate:  () async {
                   await SharedHelper.setScratchValue(isScratch: 2);
              },
              onScratchEnd: () async {
                 await SharedHelper.setScratchValue(isScratch: 2);
                  randomValue == null?0:await userPointUpdate.userPointUpdate(userId,randomValue);
              },
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: AppColor.primary1Color,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/common/Splash Screen.jpg"),
                  ),
                ),
                child: Center(
                  child:randomValue != null
                      ? Text(
                         randomValue!,
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          'No data',
                          style: TextStyle(
                            fontSize: 24,
                            color: AppColor.primary1Color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ),
            CommonWidget.sizedBox(height: 200),
            InkWell(
              onTap: () async {
                controller.loadInterstitialAdMob();
                 await SharedHelper.setScratchValue(isScratch: 1);
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                  ),
                  color: AppColor.secondery1Color,
                ),
                child: CommonWidget.commonText(
                    text: "Agin Screch The Card",
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
