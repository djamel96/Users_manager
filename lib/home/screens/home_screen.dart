import 'package:charlie/home/view_models/home_view_model.dart';
import 'package:charlie/home/widgets/user_card.dart';
import 'package:charlie/them/colors.dart';
import 'package:charlie/widgets/app_bars/custom_app_bar.dart';
import 'package:charlie/widgets/containers/app_safe_area.dart';
import 'package:charlie/widgets/dialogs/error_occured_screen.dart';
import 'package:charlie/widgets/elements/empty_result_search.dart';
import 'package:charlie/widgets/loading/users_cards_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../widgets/home_app_bar.dart';
import 'add_edit_user_screen.dart';

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
      homeViewModel.loadUsersList();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, homeViewModel, child) {
      return AppSafeArea(
        top: true,
        child: Scaffold(
          appBar: const HomeAppBar(),
          backgroundColor: AppColors.scaffold,
          body: homeViewModel.loading
              ? const UsersCardsLoading()
              : Container(
                  child: homeViewModel.errorOccurred
                      ? AnErrorOccurred(
                          onRetry: () => homeViewModel.loadUsersList(),
                        )
                      : Container(
                          child: homeViewModel.users.isEmpty
                              ? const EmptyResultSearch()
                              : ListView.builder(
                                  controller: homeViewModel.scrollController,
                                  itemCount: homeViewModel.users.length,
                                  padding: const EdgeInsets.all(20),
                                  itemBuilder: (context, index) {
                                    return UserCard(
                                      userVM: homeViewModel.users[index],
                                      onFavorite: () =>
                                          homeViewModel.switchFavorite(
                                        homeViewModel.users[index],
                                      ),
                                      onDelete: () => homeViewModel.deleteUser(
                                          homeViewModel.users[index]),
                                    );
                                  },
                                ),
                        ),
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Get.to(() => const AddEditUserScreen()),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }
}
