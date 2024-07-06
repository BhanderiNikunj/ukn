import 'package:unk/exports.dart';

class ChatSupportScreen extends StatefulWidget {
  const ChatSupportScreen({super.key});

  @override
  State<ChatSupportScreen> createState() => _ChatSupportScreenState();
}

class _ChatSupportScreenState extends State<ChatSupportScreen> {
  late ChatSupportController controller;

  @override
  void initState() {
    controller = Get.put(ChatSupportController());
    controller.getUserId();
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
      title: Strings.chat_box,
      child: GetBuilder(
        init: controller,
        builder: (_) {
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: StreamBuilder(
                      stream: controller.getChatMessage(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          controller.listOfChat.clear();
                          for (var e in snapshot.data?.docs ?? []) {
                            ChatSupportModel model = ChatSupportModel(
                              dateTime: e["date_time"],
                              isSend: e["is_send"],
                              message: e["message"],
                              messageType: e["message_type"],
                              userName: e["user_name"],
                              id: e.id,
                            );
                            controller.listOfChat.add(model);
                          }
                          return chatView();
                        }
                        return CommonWidget.sizedBox(isShrink: true);
                      },
                    ),
                  ),
                  textFeildView(),
                ],
              ),
              controller.isLoading
                  ? Container(
                      color: AppColor.default1Color.withOpacity(0.5),
                      child: CommonWidget.loadingIos(),
                    )
                  : CommonWidget.sizedBox(isShrink: true),
            ],
          );
        },
      ),
    );
  }

  Widget textFeildView() {
    return Container(
      height: 50.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColor.white1Color,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.r, 0.r),
            blurRadius: 4.r,
            spreadRadius: 0.r,
            color: AppColor.primary1Color.withOpacity(0.5),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: controller.sendMesssageController,
        style: TextStyle(
          color: AppColor.primary1Color,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          hintText: Strings.type_a_message,
          prefixIcon: InkWell(
            onTap: () => controller.pickFile(),
            child: Container(
              width: 24.w,
              height: 24.w,
              alignment: Alignment.center,
              child: CommonWidget.imageBuilder(
                imagePath: Images.attech_svg,
              ),
            ),
          ),
          suffixIcon: InkWell(
            onTap: () => controller.sendMesssageController.text.isEmpty
                ? null
                : controller.sendChatMessage(),
            child: Container(
              width: 24.w,
              height: 24.w,
              alignment: Alignment.center,
              child: CommonWidget.imageBuilder(
                imagePath: Images.send_svg,
              ),
            ),
          ),
          hintStyle: TextStyle(
            color: AppColor.primary1Color,
            fontSize: 10.sp,
          ),
        ),
      ),
    );
  }

  Widget chatView() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      itemCount: controller.listOfChat.length,
      itemBuilder: (context, index) {
        ChatSupportModel model = controller.listOfChat[index];
        if (model.isSend) {
          return rightMessageView(model: model);
        }
        return leftMessageView(model: model);
      },
    );
  }

  Widget rightMessageView({required ChatSupportModel model}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 5.h),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          constraints: model.messageType == "text"
              ? null
              : BoxConstraints(
                  maxWidth: 200.w,
                  maxHeight: 200.h,
                ),
          decoration: BoxDecoration(
            color: model.messageType == "image"
                ? AppColor.white1Color
                : AppColor.primary3Color.withOpacity(0.9),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.r),
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
            ),
            boxShadow: model.messageType == "image"
                ? null
                : [
                    BoxShadow(
                      blurRadius: 5.r,
                      spreadRadius: 0.r,
                      offset: Offset(0, 2.h),
                      color: const Color(0xff000000).withOpacity(0.2),
                    )
                  ],
          ),
          child: model.messageType == "text"
              ? CommonWidget.commonText(
                  text: model.message,
                  color: AppColor.white1Color,
                  fontSize: 13,
                )
              : model.messageType == "image"
                  ? CommonWidget.imageBuilder(
                      imagePath: model.message,
                      fit: BoxFit.fitHeight,
                    )
                  : CommonWidget.sizedBox(isShrink: true),
        ),
        CommonWidget.sizedBox(width: model.messageType == "text" ? 10 : 0),
        CommonWidget.imageBuilder(
          imagePath: generalSettingModel?.data.logoImage ?? "",
          borderRadius: 50.r,
          width: 30.w,
        ),
      ],
    );
  }

  Widget leftMessageView({required ChatSupportModel model}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CommonWidget.imageBuilder(
          imagePath: generalSettingModel?.data.logoImage ?? "",
          borderRadius: 50.r,
          width: 30.w,
        ),
        CommonWidget.sizedBox(width: model.messageType == "text" ? 10 : 0),
        Container(
          constraints: model.messageType == "text"
              ? null
              : BoxConstraints(
                  maxWidth: 200.w,
                  maxHeight: 200.h,
                ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: model.messageType == "text"
                ? AppColor.secondery3Color
                : Colors.transparent,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(8.r),
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
            ),
          ),
          child: model.messageType == "text"
              ? CommonWidget.commonText(
                  text: model.message,
                  color: AppColor.primary1Color,
                  fontSize: 13,
                )
              : model.messageType == "image"
                  ? CommonWidget.imageBuilder(
                      imagePath: model.message,
                    )
                  : CommonWidget.sizedBox(isShrink: true),
        ),
      ],
    );
  }
}
