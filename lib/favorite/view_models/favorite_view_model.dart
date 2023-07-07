import 'package:charlie/db/sqlite_helper.dart';
import 'package:charlie/home/models/user_from_db.dart';
import 'package:charlie/home/view_models/user_view_model.dart';
import 'package:flutter/material.dart';

class FavoriteViewModel with ChangeNotifier {
  List<UserViewModel> users = [];
  bool loading = true;
  final dbHelper = SqliteHelper();

  loadFavoriteUsers() async {
    try {
      users = [];
      await dbHelper.getFavoriteUsers().then((value) {
        if (value.isNotEmpty) {
          for (UserFromDb oneUserMap in value) {
            users.add(UserViewModel.fromUserFromDBModel(oneUserMap));
          }
        }
        loading = false;
        notifyListeners();
      });
    } catch (e) {}
  }

  unfavoriteUser(UserViewModel user) {
    dbHelper.unfavoriteUser(user.id!);
    user.setFavorite(0);
    dbHelper.updateUser(user);
    users.removeWhere((element) => element.id == user.id);
    notifyListeners();
  }

  deleteUser(UserViewModel user) {
    dbHelper.unfavoriteUser(user.id!);
    dbHelper.deleteUser(user.id!).then((value) {
      if (value != -1) {
        users.removeWhere((element) => element.id == user.id);
        notifyListeners();
      }
    });
  }
}
