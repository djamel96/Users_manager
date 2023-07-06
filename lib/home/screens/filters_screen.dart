import 'package:charlie/them/colors.dart';
import 'package:charlie/widgets/app_bars/custom_app_bar.dart';
import 'package:flutter/material.dart';

class UserFiltersScreen extends StatefulWidget {
  const UserFiltersScreen({super.key});

  @override
  State<UserFiltersScreen> createState() => _UserFiltersScreenState();
}

class _UserFiltersScreenState extends State<UserFiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: const CustomAppBar(title: "Filters"),
      body: Column(
        children: [],
      ),
    );
  }
}
