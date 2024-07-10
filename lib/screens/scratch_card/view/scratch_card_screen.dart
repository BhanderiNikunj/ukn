import 'package:lottie/lottie.dart';
import 'package:unk/exports.dart';
import 'package:unk/packages/scratcher/widgets.dart';

class ScratchCardScreen extends StatefulWidget {
  const ScratchCardScreen({super.key});

  @override
  State<ScratchCardScreen> createState() => _ScratchCardScreenState();
}

class _ScratchCardScreenState extends State<ScratchCardScreen> {
  bool isAnimation = false;
  Duration animationDuration = Duration.zero;

  @override
  Widget build(BuildContext context) {
    return CommonWidget.commonScreenUI(
      color: AppColor.primary1Color,
      title: Strings.scratch_and_win,
      child: Stack(
        children: [
          Center(
            child: Scratcher(
              brushSize: 50,
              threshold: 50,
              color: AppColor.secondery6Color,
              enabled: true,
              rebuildOnResize: true,
              onChange: (value) async {
                if (value == 100) {
                  isAnimation = true;
                  setState(() {});
                  Future.delayed(
                    animationDuration,
                    () {
                      isAnimation = false;
                      setState(() {});
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
                    text: "randomValue!",
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          isAnimation
              ? Lottie.asset(
                  'assets/json/clim_reward.json',
                  onLoaded: (p0) {
                    animationDuration = p0.duration;
                    setState(() {});
                  },
                )
              : CommonWidget.sizedBox(isShrink: true),
        ],
      ),
    );
  }
}
