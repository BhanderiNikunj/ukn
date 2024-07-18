import '../../../exports.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({super.key});

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonWidget.commonScreenUI(
      title: Strings.terms_condition,
    );
  }
}
