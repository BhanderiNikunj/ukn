import 'package:unk/exports.dart';

class AdminHomeScrren extends StatefulWidget {
  const AdminHomeScrren({super.key});

  @override
  State<AdminHomeScrren> createState() => _AdminHomeScrrenState();
}

class _AdminHomeScrrenState extends State<AdminHomeScrren> {
  @override
  Widget build(BuildContext context) {
    return CommonWidget.commonScreenUI(
      height: ScreenUtil().screenHeight * 0.85,
      titleWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonWidget.commonText(
              text: "Admin HomeScreen",
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ],
      ),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            // height: double.infinity,
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDMDmGxYRWz_lysBfA9HZXa1NUKONcnsPzSAF110FEuhSRAB9IVjBrRiB-xIoO1CTq3fo&usqp=CAU',
              fit: BoxFit.cover,
              height: double.infinity,
              
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 40, top: 12, left: 20, right: 20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                children: [
                   Row(
                    children: [
                      InkWell(
                        onTap: () => CommonRoute.pushNamed(
                          page: RouteList.admin_user_data_screen,
                        ),
                        child: Container(
                          height: 100.h,
                          width: 120.w,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColor.primary1Color,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: CommonWidget.commonText(text: "User Data",color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 100.h,
                        width: 120.w,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColor.primary1Color,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white,
                            )),
                        child: CommonWidget.commonText(text: "Chet Box",color: Colors.white),
                      ),
                    ],
                  ),
                   const Spacer(),
                   Row(
                    children: [
                      InkWell(
                        onTap: () => CommonRoute.pushNamed(
                          page: RouteList.admin_user_data_screen,
                        ),
                        child: Container(
                        height: 100,
                        width: 120,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color:  AppColor.primary1Color,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: CommonWidget.commonText(text: "Youtube",color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 100.h,
                        width: 120.w,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color:  AppColor.primary1Color,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white,
                            )),
                        child: CommonWidget.commonText(text: "Coins",color: Colors.white),
                      ),
                    ],
                  ),
                   const Spacer(),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => CommonRoute.pushNamed(
                          page: RouteList.admin_user_data_screen,
                        ),
                        child: Container(
                          height: 100.h,
                          width: 120.w,
                          alignment: Alignment.center,
                          padding:  EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color:  AppColor.primary1Color,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: CommonWidget.commonText(text: "Notification",color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 100.h,
                        width: 120.w,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color:  AppColor.primary1Color,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white,
                            )),
                        child: CommonWidget.commonText(text: "Category",color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
