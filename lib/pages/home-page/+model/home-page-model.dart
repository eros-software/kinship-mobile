
import 'package:flutter/material.dart';
import 'package:kinship_mobile/app-state.dart';
import 'package:redux/redux.dart';

class HomePageModel{

  final TabController tabController;

  HomePageModel({
    this.tabController,
  });

  static HomePageModel fromStore(Store<AppState> store) =>
    new HomePageModel(
      tabController: store.state.homePageState.tabController,
    );

}
