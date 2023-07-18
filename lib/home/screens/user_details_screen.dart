import 'package:charlie/helpers/custom_date_picker.dart';
import 'package:charlie/helpers/device_info.dart';
import 'package:charlie/home/view_models/user_view_model.dart';
import 'package:charlie/home/widgets/user_profile_info_item.dart';
import 'package:charlie/resources/images.dart';
import 'package:charlie/them/colors.dart';
import 'package:charlie/widgets/app_bars/custom_app_bar.dart';
import 'package:charlie/widgets/elements/rounded_pucture.dart';
import 'package:flutter/material.dart';
import 'package:charlie/translations/translation_keys.dart' as tran;
import 'package:get/get.dart';

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
      backgroundColor: AppColors.scaffold,
      appBar: const CustomAppBar(),
      body: ListView(children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: getScreeHeight(context, .2),
              decoration: BoxDecoration(
                color: widget.user.isMale
                    ? AppColors.appMain100.withOpacity(.5)
                    : AppColors.pink.withOpacity(.5),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
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
                  const SizedBox(height: 20),
                  UserProfileInfoItem(
                    text: "${widget.user.age} ${tran.years.tr}",
                    isMale: widget.user.isMale,
                    icon: widget.user.isMale ? Icons.male : Icons.female,
                  ),
                  const SizedBox(height: 10),
                  UserProfileInfoItem(
                    text: widget.user.fullAddress,
                    icon: Icons.location_history,
                    isMale: widget.user.isMale,
                  ),
                  const SizedBox(height: 10),
                  UserProfileInfoItem(
                    text: widget.user.email,
                    isMale: widget.user.isMale,
                    icon: Icons.email,
                  ),
                  const SizedBox(height: 10),
                  UserProfileInfoItem(
                    text: CustomDateTimePicker.getDateWithDayAndYear(
                        widget.user.dateOfBirth),
                    isMale: widget.user.isMale,
                    icon: Icons.cake,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
