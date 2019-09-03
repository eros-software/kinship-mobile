import 'package:kinship_mobile/pages/home-page/+state/home-page-actions.dart';
import 'package:kinship_mobile/pages/home-page/+state/home-page-state.dart';
import 'package:redux/redux.dart';

final homePageReducer = combineReducers<HomePageState>([
  TypedReducer<HomePageState,InitTabController>(_initTabController),
]);

HomePageState _initTabController(HomePageState state, InitTabController action) => state.copyWith(tabController: action.tabController);
