import 'package:charlie/helpers/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnboardingTutorial extends StatelessWidget {
  final String title;
  final String message;
  final String imageURL;

  final int step;

  const OnboardingTutorial({
    Key? key,
    required this.title,
    required this.message,
    required this.imageURL,
    required this.step,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Lottie.asset(
            imageURL,
            repeat: true,
            width: double.infinity,
            height: getScreenWidth(context, .7),
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          title.tr,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.90,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            message.tr,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        const SizedBox(
          height: 23,
        ),
        Expanded(
          flex: 3,
          child: Container(),
        ),
      ],
    );
  }
}
