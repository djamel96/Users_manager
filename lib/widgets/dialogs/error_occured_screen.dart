import 'package:charlie/them/colors.dart';
import 'package:charlie/widgets/buttons/custom_button.dart';
import 'package:charlie/widgets/buttons/custom_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

class AnErrorOccurred extends StatefulWidget {
  final Function? onRetry;
  final bool showLogout;
  const AnErrorOccurred({
    Key? key,
    this.onRetry,
    this.showLogout = false,
  }) : super(key: key);

  @override
  State<AnErrorOccurred> createState() => _AnErrorOccurredState();
}

class _AnErrorOccurredState extends State<AnErrorOccurred> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // color: MyColors.red235,
              ),
              child: const Icon(
                Icons.error,
                color: AppColors.red201,
                size: 40,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text("Ooops!",
              style: TextStyle(
                color: AppColors.defaultTextColor,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              )),
          const SizedBox(height: 20),
          const Text("An error occured",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff95959a),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
          const SizedBox(height: 10),
          const Text("it is possible that your internet is slow",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff95959a),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
          const Text("Please check it and try again.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff95959a),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
          const SizedBox(height: 40),
          CustomButton(
            width: 248,
            textToShow: 'Retry',
            onTap: widget.onRetry,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
