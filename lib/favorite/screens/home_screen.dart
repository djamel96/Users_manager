import 'package:charlie/favorite/view_models/favorite_view_model.dart';
import 'package:charlie/home/view_models/home_view_model.dart';
import 'package:charlie/home/widgets/user_card.dart';
import 'package:charlie/them/colors.dart';
import 'package:charlie/widgets/app_bars/custom_app_bar.dart';
import 'package:charlie/widgets/containers/app_safe_area.dart';
import 'package:charlie/widgets/dialogs/error_occured_screen.dart';
import 'package:charlie/widgets/loading/loading_small.dart';
import 'package:charlie/widgets/loading/users_cards_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final favoriteViewModel =
          Provider.of<FavoriteViewModel>(context, listen: false);
      if (favoriteViewModel.users.isEmpty) {
        favoriteViewModel.loadFavoriteUsers();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteViewModel>(
        builder: (context, favoriteViewModel, child) {
      return AppSafeArea(
        top: true,
        child: Scaffold(
            appBar: const CustomAppBar(
              title: "Charlie",
              showBack: false,
            ),
            backgroundColor: AppColors.scaffold,
            body: favoriteViewModel.loading
                ? const UsersCardsLoading()
                : ListView.builder(
                    itemCount: favoriteViewModel.users.length,
                    padding: const EdgeInsets.all(20),
                    itemBuilder: (context, index) {
                      return UserCard(
                        userVM: favoriteViewModel.users[index],
                      );
                    },
                  )),
      );
    });
  }
}
