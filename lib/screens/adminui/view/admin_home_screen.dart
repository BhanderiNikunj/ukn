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
      titleWidget:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonWidget.commonText(
            text: "Admin HomeScreen",
            fontWeight: FontWeight.bold,
            color: Colors.white
            ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              )
            ),
           // height: double.infinity,
            child: Image.network(
              'https://t4.ftcdn.net/jpg/04/93/66/85/360_F_493668569_jnWjXervcMN9X9Ucib2N2B4lbZspeAFX.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
            ),),
            Padding(
              padding: const EdgeInsets.only(bottom: 40,top: 12,left: 20,right: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => CommonRoute.pushNamed(
                    page: RouteList.admin_user_data_screen,
                  ),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black,
                          )
                        ),
                        child: CommonWidget.commonText(text: "User Data"),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.black,
                        )
                      ),
                      child: CommonWidget.commonText(text: "Chet Box"),
                    ),
                  ],
                ),
              ),
            )
        ],
      )
    );
  }
}