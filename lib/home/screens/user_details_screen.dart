import 'package:charlie/helpers/device_info.dart';
import 'package:charlie/home/view_models/user_view_model.dart';
import 'package:charlie/resources/images.dart';
import 'package:charlie/them/colors.dart';
import 'package:charlie/widgets/app_bars/custom_app_bar.dart';
import 'package:charlie/widgets/elements/rounded_pucture.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
  final UserViewModel user;
  const UserDetailsScreen({
    super.key,
    required this.user,
  });

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: getScreeHeight(context, .2),
              decoration: BoxDecoration(
                color: AppColors.appMain100.withOpacity(.5),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: getScreeHeight(context, .1),
              child: Column(
                children: [
                  Hero(
                    tag: widget.user.id ?? widget.user.picture,
                    child: CircularImage(
                      url: widget.user.picture,
                      defaultAsset: widget.user.isMale
                          ? AppImages.menPlaceholder
                          : AppImages.womenPlaceholder,
                      height: 200,
                      width: 200,
                      borderColor: widget.user.isMale
                          ? AppColors.appMain100
                          : AppColors.pink,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.user.fullName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
