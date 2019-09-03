import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class HomePageState{
  final TabController tabController;

  HomePageState({
    @required this.tabController,
  });

  factory HomePageState.initial(){
    return new HomePageState(
      tabController: null,
    );
  }

  HomePageState copyWith({
    tabController,
  }) {
    return new HomePageState(
      tabController:  tabController ?? this.tabController,
    );
  }
}
