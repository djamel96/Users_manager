import 'package:charlie/them/colors.dart';
import 'package:charlie/widgets/buttons/custom_inkwell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IosBackButton extends StatelessWidget {
  final Color? color;

  const IosBackButton({
    Key? key,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return Container(
      width: 36,
      height: 36,
      margin: const EdgeInsets.all(6),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: AppInKWell(
        child: const Icon(
          Icons.arrow_back,
          color: AppColors.appMain100,
        ),
        onTap: () {
          Navigator.maybePop(context);
        },
      ),
    );
  }
}

class BackButtonWithText extends StatelessWidget {
  const BackButtonWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return AppInKWell(
      onTap: () {
        Navigator.maybePop(context);
      },
      child: Row(
        children: const [
          Icon(CupertinoIcons.back),
          SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }
}
