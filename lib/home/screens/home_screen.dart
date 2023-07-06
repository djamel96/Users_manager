import 'package:charlie/home/widgets/user_card.dart';
import 'package:charlie/them/colors.dart';
import 'package:charlie/widgets/containers/app_safe_area.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            UserCard(),
            UserCard(),
            UserCard(),
          ],
        ),
      ),
    );
  }
}
