import 'package:charlie/helpers/ui_helper.dart';
import 'package:charlie/home/view_models/home_view_model.dart';
import 'package:charlie/them/colors.dart';
import 'package:charlie/translations/translation_keys.dart' as tran;
import 'package:charlie/widgets/buttons/custom_inkwell.dart';
import 'package:charlie/widgets/input/rich_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final double elevation;
  final bool showBack;
  final List<Widget>? actions;
  const HomeAppBar({
    super.key,
    this.centerTitle = true,
    this.title = "",
    this.elevation = 1,
    this.showBack = true,
    this.actions,
  });
  @override
  final Size preferredSize = const Size(double.infinity, 60);

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 20,
      backgroundColor: AppColors.scaffold,
      elevation: elevation,
      actions: actions,
      title: RichTextField(
        controller: homeViewModel.searchController,
        hintText: tran.searchUser.tr,
        onChanged: (val) {
          homeViewModel.searchUsers(val);
        },
        suffixIcon: AppInKWell(
          onTap: () {
            if (homeViewModel.searchController.text.isNotEmpty) {
              homeViewModel.searchController.clear();
              homeViewModel.loadUsersList();
              keyBoardDispose(context);
            }
          },
          child: Icon(
            homeViewModel.searchController.text.isEmpty
                ? Icons.search
                : Icons.clear,
            color: AppColors.grey172,
          ),
        ),
      ),
    );
  }
}
