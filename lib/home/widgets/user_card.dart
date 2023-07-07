import 'package:charlie/home/view_models/home_view_model.dart';
import 'package:charlie/home/view_models/user_view_model.dart';
import 'package:charlie/resources/images.dart';
import 'package:charlie/them/colors.dart';
import 'package:charlie/widgets/buttons/custom_inkwell.dart';
import 'package:charlie/widgets/containers/app_card.dart';
import 'package:charlie/widgets/elements/rounded_pucture.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserCard extends StatelessWidget {
  final UserViewModel userVM;
  final Function? onFavorite;
  const UserCard({
    super.key,
    required this.userVM,
    this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, homeViewModel, child) {
      return AppCard(
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
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              userVM.fullName,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
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
                          )
                        ],
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
                            "${userVM.age} ans",
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
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
