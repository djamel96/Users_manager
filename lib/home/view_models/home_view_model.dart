import 'package:charlie/home/models/user.dart';
import 'package:charlie/home/services/fetch_users_service.dart';
import 'package:flutter/material.dart';

import 'user_view_model.dart';

class HomeViewModel with ChangeNotifier {
  List<UserVM> users = [];

  // Users list view controller
  final ScrollController scrollController = ScrollController();

  // Load parameters
  int maxUsersToLoad = 500;
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
        initLoadMoreListener();
        notifyListeners();
      } else {
        setErrorOccurred(true);
      }
    });
  }

  loadMoreUsersOnScrollDown() {
    setLoadingMore(true);
    fetchUsersService(
      parameters: buildFetchUserParameters(),
    ).then((value) {
      setLoadingMore(false);
      if (value.success) {
        users = users + buildListOfUserVM(value.value['results']);
        page++;
        notifyListeners();
      }
    });
  }

  List<UserVM> buildListOfUserVM(List usersListMap) {
    List<UserVM> resultList = [];
    for (Map<String, dynamic> oneUserMap in usersListMap) {
      // try {
      resultList.add(
        UserVM.fromUserModel(
          User.fromJson(oneUserMap),
        ),
      );
      // } catch (e) {}
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

  initLoadMoreListener() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        if (!loadingMore && users.length < maxUsersToLoad) {
          loadMoreUsersOnScrollDown();
        }
      }
    });
  }
}
