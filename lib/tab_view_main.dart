import 'package:charlie/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'them/colors.dart';
import 'translations/translation_keys.dart' as tran;
import 'utils/constants.dart';
import 'widgets/nav_bar/tab_title.dart';

class TabViewMain extends StatefulWidget {
  final int index;

  const TabViewMain({Key? key, this.index = 0}) : super(key: key);
  @override
  State<TabViewMain> createState() => _TabViewMainState();
}

class _TabViewMainState extends State<TabViewMain>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int _activeTabIndex = 0;
  bool clickedBackAgain = false;
  @override
  void initState() {
    _activeTabIndex = widget.index;

    super.initState();
    tabController =
        TabController(length: 3, vsync: this, initialIndex: widget.index);

    tabController!.addListener(_setActiveTabIndex);

    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  void _setActiveTabIndex() {
    setState(() {
      _activeTabIndex = tabController!.index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Container(
        color: Colors.white,
        child: SafeArea(
          top: false,
          left: false,
          right: false,
          child: Scaffold(
            bottomNavigationBar: Container(
              height: 80,
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                      width: .3, color: Color.fromRGBO(142, 142, 142, 1)),
                ),
              ),
              child: TabBar(
                unselectedLabelColor: AppColors.primaryLightText,
                unselectedLabelStyle: const TextStyle(
                  color: AppColors.primaryLightText,
                  fontSize: 12,
                ),
                labelColor: AppColors.appMain100,
                labelPadding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
                labelStyle: const TextStyle(
                  color: AppColors.appMain100,
                  fontSize: 12,
                ),
                controller: tabController,
                indicatorColor: Colors.transparent,
                tabs: <Widget>[
                  TabTitle(
                    title: tran.mainPage.tr,
                    icon: homePageIndex,
                    active: _activeTabIndex == homePageIndex,
                  ),
                  TabTitle(
                    title: tran.myUsers.tr,
                    icon: newsScreenIndex,
                    active: _activeTabIndex == newsScreenIndex,
                  ),
                  TabTitle(
                    title: tran.favorite.tr,
                    icon: requestTranslatorScreenIndex,
                    active: _activeTabIndex == requestTranslatorScreenIndex,
                  ),
                ],
              ),
            ),
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: <Widget>[
                const HomeScreen(),
                Container(),
                Container(),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async {
        if (clickedBackAgain) {
          SystemNavigator.pop();
        } else {
          Fluttertoast.showToast(
            msg: tran.pressToExit.tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
          );
        }
        clickedBackAgain = true;
        Future.delayed(const Duration(milliseconds: 2000), () {
          clickedBackAgain = false;
        });
        return false;
      },
    );
  }
}
