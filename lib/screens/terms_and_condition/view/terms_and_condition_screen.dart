import 'package:flutter_ukn_earning_app/exports.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({super.key});

  @override
  State<TermsAndConditionScreen> createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  late TermsAndConditionController controller;

  @override
  void initState() {
    controller = Get.put(TermsAndConditionController());
    controller.readTermsAndConditon();
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
      title: Strings.terms_and_condition,
      child: GetBuilder(
        init: controller,
        builder: (_) {
          if (controller.isLoading) {
            return CommonWidget.loadingIos();
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: CommonWidget.commonText(
              text: controller.termsAndConditionModel?.data ?? "",
            ),
          );
        },
      ),
    );
  }
}
