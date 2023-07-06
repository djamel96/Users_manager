import 'package:charlie/home/models/user.dart';
import 'package:charlie/home/services/fetch_users_service.dart';
import 'package:flutter/material.dart';

import 'user_view_model.dart';

class HomeViewModel with ChangeNotifier {
  List<UserVM> users = [];

  // Load parameters
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

  fetchUsers() {
    setLoading(true);
    if (errorOccurred) {
      setErrorOccurred(false);
    }
    fetchUsersService(
      parameters: buildFetchUserParameters(),
    ).then((value) {
      setLoading(false);
      if (value.success) {
        users = buildListOfUserVM(value.value['results']);
        page++;
        notifyListeners();
      } else {
        setErrorOccurred(true);
      }
    });
  }

  List<UserVM> buildListOfUserVM(List usersListMap) {
    List<UserVM> resultList = [];
    for (Map<String, dynamic> oneUserMap in usersListMap) {
      try {
        resultList.add(
          UserVM.fromUserModel(
            User.fromJson(oneUserMap),
          ),
        );
      } catch (e) {}
    }

    return resultList;
  }

  Map<String, dynamic> buildFetchUserParameters() {
    return {
      "results": resultsPerLoad,
      "seed": seed,
      "page": page,
    };
  }
}
