import 'package:charlie/home/view_models/home_view_model.dart';
import 'package:charlie/home/widgets/user_card.dart';
import 'package:charlie/them/colors.dart';
import 'package:charlie/widgets/containers/app_safe_area.dart';
import 'package:charlie/widgets/dialogs/error_occured_screen.dart';
import 'package:charlie/widgets/loading/users_cards_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
      homeViewModel.fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, homeViewModel, child) {
      return AppSafeArea(
        top: true,
        child: Scaffold(
            backgroundColor: AppColors.scaffold,
            body: !homeViewModel.loading
                ? const UsersCardsLoading()
                : Container(
                    child: homeViewModel.errorOccurred
                        ? AnErrorOccurred(
                            onRetry: () => homeViewModel.fetchUsers(),
                          )
                        : ListView.builder(
                            itemCount: homeViewModel.users.length,
                            padding: const EdgeInsets.all(20),
                            itemBuilder: (context, index) {
                              return UserCard(
                                userVM: homeViewModel.users[index],
                              );
                            },
                          ),
                  )),
      );
    });
  }
}
