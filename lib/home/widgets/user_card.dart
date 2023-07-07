import 'package:charlie/home/screens/add_edit_user_screen.dart';
import 'package:charlie/home/view_models/home_view_model.dart';
import 'package:charlie/home/view_models/user_view_model.dart';
import 'package:charlie/resources/images.dart';
import 'package:charlie/them/colors.dart';
import 'package:charlie/translations/translation_keys.dart' as tran;
import 'package:charlie/utils/constants.dart' as constant;
import 'package:charlie/widgets/buttons/custom_inkwell.dart';
import 'package:charlie/widgets/containers/app_card.dart';
import 'package:charlie/widgets/dialogs/custom_pop_up.dart';
import 'package:charlie/widgets/elements/rounded_pucture.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class UserCard extends StatelessWidget {
  final UserViewModel userVM;
  final Function? onFavorite;
  final Function onDelete;
  const UserCard({
    super.key,
    required this.userVM,
    this.onFavorite,
    required this.onDelete,
  });

  void deleteUser() {
    Get.dialog(CustomPopUp(
      title: "Delete user",
      body: "Are you sure to delete this user ?",
      titleBackColor: AppColors.red201,
      onTap1: () => Get.back(),
      onTap2: () {
        onDelete();
        Get.back();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, homeViewModel, child) {
      return AppCard(
        height: constant.userCardHeight,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircularImage(
                  url: userVM.thumbnail,
                  defaultAsset: userVM.isMale
                      ? AppImages.menPlaceholder
                      : AppImages.womenPlaceholder,
                  width: 75.0,
                  borderColor:
                      userVM.isMale ? AppColors.appMain100 : AppColors.pink,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userVM.fullName,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          userVM.isMale
                              ? const Icon(
                                  Icons.male,
                                  color: AppColors.appMain100,
                                )
                              : const Icon(
                                  Icons.female,
                                  color: AppColors.pink,
                                ),
                          const SizedBox(width: 4),
                          Text(
                            "${userVM.age} ${tran.years.tr}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_history,
                            color: userVM.isMale
                                ? AppColors.appMain100
                                : AppColors.pink,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              userVM.fullAddress,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                )
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppInKWell(
                  onTap: onFavorite,
                  child: userVM.isFavorite
                      ? const Icon(
                          Icons.favorite,
                          color: AppColors.red201,
                        )
                      : const Icon(
                          Icons.favorite_border,
                          color: AppColors.grey172,
                        ),
                ),
                const SizedBox(width: 16),
                AppInKWell(
                    onTap: () => deleteUser(),
                    child: const Icon(
                      Icons.delete,
                      color: AppColors.delete,
                    )),
                const SizedBox(width: 16),
                AppInKWell(
                    onTap: () {
                      Get.to(() => AddEditUserScreen(
                            userViewModel: userVM,
                          ));
                    },
                    child: const Icon(
                      Icons.edit,
                      color: AppColors.appMain100,
                    )),
              ],
            )
          ],
        ),
      );
    });
  }
}
