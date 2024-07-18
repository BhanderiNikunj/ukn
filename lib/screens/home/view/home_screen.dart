import 'package:unk/exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends HomeWidget {
  @override
  Widget build(BuildContext context) {
    return CommonWidget.commonScreenUI(
      height: ScreenUtil().screenHeight * 0.85,
      titleWidget: Row(
        children: [
          CommonWidget.commonText(
            text:
                '${Strings.hello}${userData?.firstName} ${userData?.lastName}',
            maxLines: 2,
            color: AppColor.white1Color,
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              CommonRoute.pushNamed(page: RouteList.profile_screen);
            },
            child: Container(
              height: 40.h,
              width: 40.h,
              decoration: BoxDecoration(
                color: AppColor.white1Color,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: CommonWidget.commonText(
                text: userData?.firstName.substring(0, 1) ?? "",
                fontWeight: FontWeight.w900,
                fontSize: 18,
              ),
            ),
          ),
          CommonWidget.sizedBox(width: 10),
        ],
      ),
      child: screenView(),
    );
  }
}
