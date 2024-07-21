// ignore_for_file: use_build_context_synchronously

import 'package:lottie/lottie.dart';
import 'package:unk/exports.dart';
import 'package:unk/packages/scratcher/widgets.dart';
import 'package:unk/screens/scratch_card/controller/scratch_card_controller.dart';

class ScratchCardScreen extends StatefulWidget {
  const ScratchCardScreen({super.key});

  @override
  State<ScratchCardScreen> createState() => _ScratchCardScreenState();
}

class _ScratchCardScreenState extends State<ScratchCardScreen> {
  bool isAnimation = false;
  bool isCall = false;
  bool isScratchCard = false;

  late ScratchCardController controller;

  @override
  void initState() {
    controller = Get.put(ScratchCardController());
    controller.generateData();
    getScratch();
    super.initState();
  }

  Future<void> getScratch() async {
    isScratchCard = await SharedHelper.getYourScratchList();
    controller.update();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return CommonWidget.commonScreenUI(
          color: AppColor.primary1Color,
          title: Strings.scratch_and_win,
          child: Stack(
            children: [
              Center(
                child: isScratchCard
                    ? CommonWidget.commonText(
                        text: 'Your Daily Limit Reached',
                        color: AppColor.white1Color,
                        fontSize: 20,
                      )
                    : Scratcher(
                        brushSize: 100,
                        threshold: 100,
                        color: AppColor.secondery6Color,
                        enabled: true,
                        rebuildOnResize: true,
                        onChange: (value) async {
                          if (value == 100) {
                            isAnimation = true;
                            controller.update();
                            await Future.delayed(
                              const Duration(seconds: 3),
                              () async {
                                isAnimation = false;
                                isCall = true;
                                controller.update();
                              },
                            );
                          }
                        },
                        accuracy: ScratchAccuracy.high,
                        child: SizedBox(
                          height: 300,
                          width: 300,
                          child: Center(
                            child: CommonWidget.commonText(
                              text: controller.coin,
                              fontSize: 26,
                              color: AppColor.white1Color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
              ),
              isAnimation
                  ? Lottie.asset(Images.clim_reward_json)
                  : CommonWidget.sizedBox(isShrink: true),
            ],
          ),
          bottomNavigationBar: isCall
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16),
                  child: CommonWidget.commonButton(
                    text: Strings.clim,
                    color: AppColor.primary1Color,
                    buttonColor: AppColor.secondery1Color,
                    onTap: () async {
                      SharedHelper.setYourScratchList(isScratch: true);
                      userData = UserData(
                        id: userData?.id ?? 0,
                        loginId: userData?.loginId ?? 0,
                        firstName: userData?.firstName ?? "",
                        middleName: userData?.middleName ?? "",
                        lastName: userData?.lastName ?? "",
                        dateOfBirth: userData?.dateOfBirth ?? "",
                        gender: userData?.gender ?? "",
                        contectNumber: userData?.contectNumber ?? "",
                        userPoint: (userData?.userPoint ?? 0) + int.parse(controller.coin),
                        profilePhoto: userData?.profilePhoto ?? "",
                        referCode: userData?.referCode ?? "",
                        userDeviceToken: userData?.userDeviceToken ?? "",
                        emailId: userData?.emailId ?? "",
                      );
                      await controller.updateUserPoint(context: context);
                      isCall = false;
                      getScratch();
                    },
                  ),
                )
              : null,
        );
      },
    );
  }
}
