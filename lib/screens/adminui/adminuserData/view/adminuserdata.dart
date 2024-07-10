import 'package:cached_network_image/cached_network_image.dart';
import 'package:unk/exports.dart';
import 'package:unk/screens/adminui/controller/adminuseralldata.dart';

class AdminUserData extends StatefulWidget {
  const AdminUserData({super.key});

  @override
  State<AdminUserData> createState() => _AdminUserDataState();
}

class _AdminUserDataState extends State<AdminUserData> {
  AllUSerDataController allUSerDataController =
      Get.put(AllUSerDataController());

  @override
  void initState() {
    allUSerDataController.getAllUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonWidget.commonScreenUI(
      titleWidget: Row(
        children: [
          InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          CommonWidget.sizedBox(width: 10),
          CommonWidget.commonText(
              text: "All User Data",
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: allUSerDataController.getAllUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(height: 10.h),
                  const Center(
                    child: Text(
                      'Please wait for data...',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ),
                ],
              );
            } else {
              return Obx(
                () => allUSerDataController.userList.isEmpty
                    ? Center(
                        child: Column(
                          children: [
                            CommonWidget.sizedBox(
                              height: 100,
                            ),
                            Text(
                              "No Data Available...",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18.sp),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: allUSerDataController.userList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColor.primary1Color,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                  border: const Border(
                                    top: BorderSide(color: Colors.black),
                                    left: BorderSide(color: Colors.black),
                                    right: BorderSide(color: Colors.black),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 4,
                                          top: 4,
                                          left: 10,
                                          right: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 1,
                                            blurStyle: BlurStyle.outer,
                                            color: AppColor.white1Color,
                                            offset: const Offset(0, 1),
                                            spreadRadius: 1,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CommonWidget.commonText(
                                              text: "ID :- ",
                                              fontWeight: FontWeight.bold),
                                          CommonWidget.commonText(
                                              text: "${allUSerDataController.userList[index].id}",
                                              fontWeight: FontWeight.w400),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 4,
                                          top: 4,
                                          left: 10,
                                          right: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 1,
                                            blurStyle: BlurStyle.outer,
                                            color: AppColor.white1Color,
                                            offset: const Offset(0, 1),
                                            spreadRadius: 1,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CommonWidget.commonText(
                                              text: "Login ID :- ",
                                              fontWeight: FontWeight.bold),
                                          CommonWidget.commonText(
                                              text: "${allUSerDataController.userList[index].loginId}",
                                              fontWeight: FontWeight.w400),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                //  width: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider( "https://t4.ftcdn.net/jpg/04/93/66/85/360_F_493668569_jnWjXervcMN9X9Ucib2N2B4lbZspeAFX.jpg"),
                                      fit: BoxFit.cover),
                                  border: Border(
                                    top: BorderSide(color: Colors.black),
                                    bottom: BorderSide(color: Colors.black),
                                    left: BorderSide(color: Colors.black),
                                    right: BorderSide(color: Colors.black),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 75,
                                      width: 75,
                                      margin: const EdgeInsets.all(8),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColor.primary1Color),
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        image: const DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                "https://images.sftcdn.net/images/t_app-cover-l,f_auto/p/e76d4296-43f3-493b-9d50-f8e5c142d06c/2117667014/boys-profile-picture-screenshot.png"),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(8),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColor.primary1Color),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          CommonWidget.commonText(
                                              text: "Full Name :- ",
                                              fontWeight: FontWeight.bold),
                                          Expanded(
                                            child: CommonWidget.commonText(
                                                text: "${allUSerDataController.userList[index].firstName} ${allUSerDataController.userList[index].middleName} ${allUSerDataController.userList[index].lastName}",
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(8),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColor.primary1Color),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          CommonWidget.commonText(
                                              text: "Email Id :- ",
                                              fontWeight: FontWeight.bold),
                                          Expanded(
                                            child: CommonWidget.commonText(
                                                text: "${allUSerDataController.userList[index].emailId}",
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(8),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColor.primary1Color),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          CommonWidget.commonText(
                                              text: "User Point :- ",
                                              fontWeight: FontWeight.bold),
                                          Expanded(
                                            child: CommonWidget.commonText(
                                                text: "${allUSerDataController.userList[index].userPoint}",
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(8),
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColor.primary1Color),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            children: [
                                              CommonWidget.commonText(
                                                  text: "Contect No :- ",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13),
                                              CommonWidget.commonText(
                                                  text: "${allUSerDataController.userList[index].contectNumber}",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                            margin: const EdgeInsets.all(8),
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColor.primary1Color),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                CommonWidget.commonText(
                                                    text: "Refer Code :- ",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13),
                                                CommonWidget.commonText(
                                                    text: "${allUSerDataController.userList[index].referCode}",
                                                    maxLines: 5,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 11),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(8),
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColor.primary1Color),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            children: [
                                              CommonWidget.commonText(
                                                  text: "Date Of Birth :- ",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13),
                                              CommonWidget.commonText(
                                                  text: "${allUSerDataController.userList[index].dateOfBirth}",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          margin: const EdgeInsets.all(8),
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColor.primary1Color),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            children: [
                                              CommonWidget.commonText(
                                                  text: "Gender :- ",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13),
                                              CommonWidget.commonText(
                                                  text: "${allUSerDataController.userList[index].gender}",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              CommonWidget.sizedBox(height: 10,),
                            ],
                          );
                        },
                      ),
              );
            }
          },
        ),
      ),
    );
  }
}
