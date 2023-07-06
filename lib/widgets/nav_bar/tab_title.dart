import 'package:charlie/resources/app_icons.dart';
import 'package:charlie/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabTitle extends StatelessWidget {
  final String? title;
  final int? icon;
  final bool active;

  const TabTitle({Key? key, this.title, this.icon, this.active = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget iconWidget = const Center();
    switch (icon) {
      case homePageIndex:
        iconWidget = SvgPicture.asset(
          active ? AppIcons.homeActive : AppIcons.homeNonActive,
        );

        break;
      case favoriteIndex:
        iconWidget = SvgPicture.asset(
          active ? AppIcons.homeActive : AppIcons.homeActive,
        );
        break;

      case settingsScreenIndex:
        iconWidget = SvgPicture.asset(
          active ? AppIcons.settingsActive : AppIcons.settingsNonActive,
        );

        break;

      default:
        return const Center();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(child: Container()),
        iconWidget,
        const SizedBox(
          height: 6,
        ),
        Expanded(child: Container()),
        Text(
          title!,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
