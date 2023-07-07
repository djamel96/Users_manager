import 'dart:developer';
import 'package:charlie/db/sqlite_helper.dart';
import 'package:charlie/home/models/user.dart';
import 'package:charlie/home/models/user_from_db.dart';
import 'package:charlie/home/services/fetch_users_service.dart';
import 'package:flutter/material.dart';
import 'user_view_model.dart';

class HomeViewModel with ChangeNotifier {
  List<UserViewModel> users = [];

  final dbHelper = SqliteHelper();

  final ScrollController scrollController = ScrollController();

  // Load parameters
  int maxUsersToLoad = 100;
  bool loadingMore = false;
  bool loading = true;
  bool errorOccurred = false;
  int resultsPerLoad = 10;
  String seed = "charlie";
  int page = 1;

  setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  setErrorOccurred(bool value) {
    errorOccurred = value;
    notifyListeners();
  }

  setLoadingMore(bool value) {
    loadingMore = value;
    notifyListeners();
  }

  loadUsersList() async {
    // First load the users from the database
    // if there is no users, load from server
    loadUsersFromDB().then((value) {
      if (users.isEmpty) {
        fetchUsersFromServer();
      }
    });
  }

  fetchUsersFromServer() {
    setLoading(true);
    if (errorOccurred) {
      setErrorOccurred(false);
    }
    fetchUsersService(
      parameters: buildFetchUserParameters(),
    ).then((value) {
      setLoading(false);
      if (value.success) {
        saveUsersToLocalDataBase(
          buildListOfUserVM(value.value['results']),
        ).then((value) {
          // reload the users from db to get the id
          // created on insert
          loadUsersFromDB();
        });
      } else {
        setErrorOccurred(true);
      }
    });
  }

  Future loadUsersFromDB() async {
    try {
      users = [];
      await dbHelper.getUsers().then((value) {
        log(value.toString());
        if (value.isNotEmpty) {
          for (UserFromDb oneUserMap in value) {
            users.add(UserViewModel.fromUserFromDBModel(oneUserMap));
          }
          loading = false;
          users = users.reversed.toList();
          notifyListeners();
        }
      });
    } catch (e) {}
  }

  List<UserViewModel> buildListOfUserVM(List usersListMap) {
    List<UserViewModel> resultList = [];

    for (Map<String, dynamic> oneUserMap in usersListMap) {
      // try {
      resultList.add(
        UserViewModel.fromUserModel(
          User.fromJson(oneUserMap),
        ),
      );
      // } catch (e) {}
    }

    return resultList;
  }

  Future saveUsersToLocalDataBase(List<UserViewModel> usersList) async {
    for (UserViewModel user in usersList) {
      log("email = ${user.toMap()}");
      await dbHelper.insertUser(user);
    }
  }

  Map<String, dynamic> buildFetchUserParameters() {
    return {
      "results": maxUsersToLoad,
      "seed": seed,
      "page": page,
    };
  }

  switchFavorite(UserViewModel user) {
    if (user.isFavorite) {
      unfavoriteUser(user);
    } else {
      favoriteUser(user);
    }
  }

  favoriteUser(UserViewModel user) {
    dbHelper.favoriteUser(user.id!);
    user.setFavorite(1);
    dbHelper.updateUser(user);
    notifyListeners();
  }

  unfavoriteUser(UserViewModel user) {
    dbHelper.unfavoriteUser(user.id!);
    user.setFavorite(0);
    dbHelper.updateUser(user);
    notifyListeners();
  }

  deleteUser(UserViewModel user) {
    if (user.isFavorite) {
      dbHelper.unfavoriteUser(user.id!);
    }
    dbHelper.deleteUser(user.id!).then((value) {
      if (value != -1) {
        users.removeWhere((element) => element.id == user.id);
        notifyListeners();
      }
    });
  }
}
