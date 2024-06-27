import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:unk/common/common_widget.dart';
import 'package:unk/screens/home/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController controller;

  @override
  void initState() {
    controller = Get.put(HomeController());
    controller.loadBannerAdMob();
    controller.loadBannerAdx();
    super.initState();
  }

  @override
  void dispose() {
    controller.bannerAdMob?.dispose();
    controller.bannerAdX?.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonWidget.commonButton(
                text: "Adx Interstitial",
                width: 150,
                onTap: () {
                  controller.loadInterstitialAdx();
                },
              ),
              CommonWidget.sizedBox(height: 10),
              CommonWidget.commonButton(
                text: "AdMob Interstitial",
                width: 150,
                onTap: () {
                  controller.loadInterstitialAdMob();
                },
              ),
              CommonWidget.sizedBox(height: 10),
              CommonWidget.commonButton(
                text: "Adx Reward",
                width: 150,
                onTap: () {
                  controller.loadRewardAdx();
                },
              ),
              CommonWidget.sizedBox(height: 10),
              CommonWidget.commonButton(
                text: "AdMob Reward",
                width: 150,
                onTap: () {
                  controller.loadRewardAdMob();
                },
              ),
              CommonWidget.sizedBox(height: 10),
              CommonWidget.commonButton(
                text: "Adx Banner",
                width: 150,
                onTap: () {
                  controller.loadBannerAdx();
                },
              ),
              CommonWidget.sizedBox(height: 10),
              CommonWidget.commonButton(
                text: "AdMob Banner",
                width: 150,
                onTap: () {
                  controller.loadBannerAdMob();
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: GetBuilder(
          init: controller,
          builder: (_) {
            return CommonWidget.sizedBox(
              height: 120,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  controller.bannerAdMob != null
                      ? CommonWidget.sizedBox(
                          height: 50,
                          child: AdWidget(ad: controller.bannerAdMob!),
                        )
                      : CommonWidget.sizedBox(isShrink: true),
                  CommonWidget.sizedBox(height: 10),
                  controller.bannerAdX != null
                      ? CommonWidget.sizedBox(
                          height: 50,
                          child: AdWidget(ad: controller.bannerAdX!),
                        )
                      : CommonWidget.sizedBox(isShrink: true),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
