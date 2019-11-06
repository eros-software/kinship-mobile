
import 'package:flutter/material.dart';
import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/models/usuario.dart';
import 'package:kinship_mobile/pages/home-page/+state/home-page-actions.dart';
import 'package:kinship_mobile/pages/login-page/+state/login-page-actions.dart';
import 'package:redux/redux.dart';

class HomePageModel{

  final Function(int index) selectPage;
  final Function(TabController tabController) initTabController;
  final Function() disposeTabController;
  final TabController tabController;
  final Function() logoutAction;
  final Usuario user;

  HomePageModel({
    this.selectPage,
    this.initTabController,
    this.disposeTabController,
    this.tabController,
    this.logoutAction,
    this.user,
  });

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is HomePageModel &&
          runtimeType == other.runtimeType &&
          tabController == other.tabController &&
          user == other.user;

  @override
  int get hashCode => 
    tabController.hashCode ^
    user.hashCode;

  static HomePageModel fromStore(Store<AppState> store) =>
    new HomePageModel(
      selectPage: (index) => store.dispatch(new SelectPage(index)),
      initTabController: (tabController) => store.dispatch(new InitTabController(tabController)),
      disposeTabController: () => store.dispatch(new DisposeTabController()),
      tabController: store.state.homePageState.tabController,
      logoutAction: () => store.dispatch(new LogoutAction()),
      user: store.state.loginPageState.user,
    );

}
