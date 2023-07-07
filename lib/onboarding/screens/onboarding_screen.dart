import 'package:charlie/helpers/device_info.dart';
import 'package:charlie/onboarding/widgets/custom_scrolle_behavior.dart';
import 'package:charlie/onboarding/widgets/dots_indicator.dart';
import 'package:charlie/onboarding/widgets/onborading_tutorial_w.dart';
import 'package:charlie/resources/animations.dart';
import 'package:charlie/resources/images.dart';
import 'package:charlie/tab_view_main.dart';
import 'package:charlie/them/colors.dart';
import 'package:charlie/widgets/buttons/custom_button.dart';
import 'package:charlie/widgets/buttons/custom_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:charlie/translations/translation_keys.dart' as tran;

class FirstOnboardingScreen extends StatefulWidget {
  const FirstOnboardingScreen({Key? key}) : super(key: key);

  @override
  State createState() => FirstOnboardingScreenState();
}

class FirstOnboardingScreenState extends State<FirstOnboardingScreen> {
  final _controller = PageController();

  static const _kDuration = Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  int pageNum = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.scaffold,
      child: SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
          backgroundColor: AppColors.scaffold,
          body: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height,
                child: ScrollConfiguration(
                  behavior: CustomScrollBehavior(),
                  child: PageView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: _controller,
                    onPageChanged: (val) {
                      if (val == 2) {
                        return;
                      }
                      setState(() {
                        pageNum = val;
                      });
                    },
                    children: const <Widget>[
                      OnboardingTutorial(
                        step: 1,
                        title: tran.onboardingTitle1,
                        message: tran.onboardingText1,
                        imageURL: AppAnimations.firstOnboardingBackground,
                      ),
                      OnboardingTutorial(
                        step: 2,
                        title: tran.onboardingTitle2,
                        message: tran.onboardingText2,
                        imageURL: AppAnimations.secondOnboardingBackground,
                      ),
                      OnboardingTutorial(
                        step: 3,
                        title: tran.onboardingTitle3,
                        message: tran.onboardingText3,
                        imageURL: AppAnimations.thirdOnboardingBackground,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 130,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: DotsIndicator(
                      controller: _controller,
                      itemCount: 3,
                      color: AppColors.appMain100,
                      onPageSelected: (int page) {
                        setState(() {
                          pageNum = page;
                        });
                        _controller.animateToPage(
                          page,
                          duration: _kDuration,
                          curve: _kCurve,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 70,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      width: getScreenWidth(context, .8),
                      height: 44,
                      textToShow: tran.next.tr,
                      onTap: () {
                        if (pageNum < 2) {
                          setState(() {
                            pageNum++;
                          });
                          _controller.animateToPage(
                            pageNum,
                            duration: _kDuration,
                            curve: _kCurve,
                          );
                        } else {
                          Get.offAll(() => const TabViewMain());
                        }
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: AppInKWell(
                  onTap: () {
                    Get.offAll(() => const TabViewMain());
                  },
                  child: Text(tran.skip.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.appMain100,
                        letterSpacing: 0.80,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
