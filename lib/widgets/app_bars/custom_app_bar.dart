import 'package:charlie/them/colors.dart';
import 'package:charlie/widgets/buttons/back_button.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final double elevation;
  final bool showBack;
  final List<Widget>? actions;
  const CustomAppBar({
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
    return AppBar(
      leading: showBack ? const IosBackButton() : null,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      backgroundColor: AppColors.scaffold,
      elevation: elevation,
      actions: actions,
      title: Text(
        title,
        style: const TextStyle(
            color: AppColors.defaultTextColor,
            fontWeight: FontWeight.w700,
            fontSize: 20),
      ),
      centerTitle: centerTitle,
    );
  }
}
