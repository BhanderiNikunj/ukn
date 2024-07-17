import 'package:unk/exports.dart';
import 'package:unk/screens/admin_home/controller/admin_home_controller.dart';

class AdminHomeScrren extends StatefulWidget {
  const AdminHomeScrren({super.key});

  @override
  State<AdminHomeScrren> createState() => _AdminHomeScrrenState();
}

class _AdminHomeScrrenState extends State<AdminHomeScrren> {
  late AdminHomeController controller;

  @override
  void initState() {
    controller = Get.put(AdminHomeController());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonWidget.commonScreenUI(
      height: ScreenUtil().screenHeight * 0.86,
      titleWidget: Align(
        alignment: Alignment.topCenter,
        child: CommonWidget.commonText(
          text: "Dashboard",
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: AppColor.white1Color,
        ),
      ),
      // child: Stack(
      //   children: [
      //     // Padding(
      //     //   padding:
      //     //       const EdgeInsets.only(bottom: 40, top: 12, left: 20, right: 20),
      //     //   child: Align(
      //     //     alignment: Alignment.bottomLeft,
      //     //     child: Column(
      //     //       children: [
      //     //         Row(
      //     //           children: [
      //     //             InkWell(
      //     //               onTap: () => CommonRoute.pushNamed(
      //     //                 page: RouteList.admin_user_data_screen,
      //     //               ),
      //     //               child: Container(
      //     //                 height: 100.h,
      //     //                 width: 120.w,
      //     //                 alignment: Alignment.center,
      //     //                 padding: const EdgeInsets.all(10),
      //     //                 decoration: BoxDecoration(
      //     //                   color: AppColor.primary1Color,
      //     //                   borderRadius: BorderRadius.circular(12),
      //     //                   border: Border.all(
      //     //                     color: Colors.white,
      //     //                   ),
      //     //                 ),
      //     //                 child: CommonWidget.commonText(
      //     //                     text: "User Data", color: Colors.white),
      //     //               ),
      //     //             ),
      //     //             const Spacer(),
      //     //             Container(
      //     //               height: 100.h,
      //     //               width: 120.w,
      //     //               alignment: Alignment.center,
      //     //               padding: const EdgeInsets.all(10),
      //     //               decoration: BoxDecoration(
      //     //                   color: AppColor.primary1Color,
      //     //                   borderRadius: BorderRadius.circular(12),
      //     //                   border: Border.all(
      //     //                     color: Colors.white,
      //     //                   )),
      //     //               child: CommonWidget.commonText(
      //     //                   text: "Chet Box", color: Colors.white),
      //     //             ),
      //     //           ],
      //     //         ),
      //     //         const Spacer(),
      //     //         Row(
      //     //           children: [
      //     //             InkWell(
      //     //               onTap: () => CommonRoute.pushNamed(
      //     //                 page: RouteList.admin_user_data_screen,
      //     //               ),
      //     //               child: Container(
      //     //                 height: 100,
      //     //                 width: 120,
      //     //                 alignment: Alignment.center,
      //     //                 padding: const EdgeInsets.all(10),
      //     //                 decoration: BoxDecoration(
      //     //                   color: AppColor.primary1Color,
      //     //                   borderRadius: BorderRadius.circular(12),
      //     //                   border: Border.all(
      //     //                     color: Colors.white,
      //     //                   ),
      //     //                 ),
      //     //                 child: CommonWidget.commonText(
      //     //                     text: "Youtube", color: Colors.white),
      //     //               ),
      //     //             ),
      //     //             const Spacer(),
      //     //             Container(
      //     //               height: 100.h,
      //     //               width: 120.w,
      //     //               alignment: Alignment.center,
      //     //               padding: const EdgeInsets.all(10),
      //     //               decoration: BoxDecoration(
      //     //                   color: AppColor.primary1Color,
      //     //                   borderRadius: BorderRadius.circular(12),
      //     //                   border: Border.all(
      //     //                     color: Colors.white,
      //     //                   )),
      //     //               child: CommonWidget.commonText(
      //     //                   text: "Coins", color: Colors.white),
      //     //             ),
      //     //           ],
      //     //         ),
      //     //         const Spacer(),
      //     //         Row(
      //     //           children: [
      //     //             InkWell(
      //     //               onTap: () => CommonRoute.pushNamed(
      //     //                 page: RouteList.admin_user_data_screen,
      //     //               ),
      //     //               child: Container(
      //     //                 height: 100.h,
      //     //                 width: 120.w,
      //     //                 alignment: Alignment.center,
      //     //                 padding: EdgeInsets.all(10.r),
      //     //                 decoration: BoxDecoration(
      //     //                   color: AppColor.primary1Color,
      //     //                   borderRadius: BorderRadius.circular(12),
      //     //                   border: Border.all(
      //     //                     color: Colors.white,
      //     //                   ),
      //     //                 ),
      //     //                 child: CommonWidget.commonText(
      //     //                     text: "Notification", color: Colors.white),
      //     //               ),
      //     //             ),
      //     //             const Spacer(),
      //     //             Container(
      //     //               height: 100.h,
      //     //               width: 120.w,
      //     //               alignment: Alignment.center,
      //     //               padding: const EdgeInsets.all(10),
      //     //               decoration: BoxDecoration(
      //     //                   color: AppColor.primary1Color,
      //     //                   borderRadius: BorderRadius.circular(12),
      //     //                   border: Border.all(
      //     //                     color: Colors.white,
      //     //                   )),
      //     //               child: CommonWidget.commonText(
      //     //                   text: "Category", color: Colors.white),
      //     //             ),
      //     //           ],
      //     //         ),
      //     //       ],
      //     //     ),
      //     //   ),
      //     // ),
      //   ],
      // ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: controller.listOfAdminOption.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (controller.listOfAdminOption[index].route.isEmpty) {
                return;
              }
              CommonRoute.pushNamed(
                page: controller.listOfAdminOption[index].route,
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColor.primary1Color,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Stack(
                children: [
                  CommonWidget.commonText(
                    text: controller.listOfAdminOption[index].title,
                    color: AppColor.white1Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 80,
                      width: 80,
                      alignment: Alignment.center,
                      child: CommonWidget.imageBuilder(
                        height: 50,
                        width: 50,
                        imagePath: controller.listOfAdminOption[index].image,
                        color: AppColor.white1Color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
