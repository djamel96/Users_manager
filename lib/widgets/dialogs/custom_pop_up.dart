import 'package:charlie/them/colors.dart';
import 'package:charlie/widgets/buttons/custom_inkwell.dart';
import 'package:charlie/widgets/loading/loading_small.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPopUp extends StatelessWidget {
  final String title;
  final String body;
  final String button1;
  final String button2;
  final Color titleBackColor;
  final Function? onTap1;
  final Function? onTap2;
  final Widget? bodyWidget;
  final bool loading;
  final bool canDismiss;
  const CustomPopUp(
      {Key? key,
      this.title = "",
      this.body = "",
      this.button1 = "No",
      this.button2 = "Yes",
      this.titleBackColor = AppColors.appMain100,
      this.onTap1,
      this.onTap2,
      this.bodyWidget,
      this.loading = false,
      this.canDismiss = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (canDismiss) {
                Get.back();
              }
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(.001),
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 68,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: titleBackColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)),
                    ),
                    child: Text(title,
                        style: const TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 18.0),
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)),
                    ),
                    child: loading
                        ? const Loading()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(),
                              bodyWidget ??
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Text(body,
                                        style: const TextStyle(
                                            color: AppColors.defaultTextColor,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.0),
                                        textAlign: TextAlign.center),
                                  ),
                              const Spacer(),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppInKWell(
                                      onTap: onTap1,
                                      child: Text(button1.tr,
                                          style: const TextStyle(
                                              color: AppColors.defaultTextColor,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18.0),
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                  Container(
                                      width: 1,
                                      height: 48,
                                      decoration: const BoxDecoration(
                                          color: AppColors.grey205)),
                                  Expanded(
                                      child: AppInKWell(
                                    onTap: onTap2,
                                    child: Text(button2.tr,
                                        style: const TextStyle(
                                            color: AppColors.appMain100,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 18.0),
                                        textAlign: TextAlign.center),
                                  ))
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              )
                            ],
                          ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
