import 'package:kinship_mobile/pages/home-page/+state/home-page-actions.dart';
import 'package:kinship_mobile/pages/home-page/+state/home-page-state.dart';
import 'package:redux/redux.dart';

final homePageReducer = combineReducers<HomePageState>([
  TypedReducer<HomePageState,SelectPage>(_selectPage),
  TypedReducer<HomePageState,InitTabController>(_initTabController),
  TypedReducer<HomePageState,DisposeTabController>(_disposeTabController),
]);


HomePageState _selectPage(HomePageState state, SelectPage action) {
  state.tabController.index = action.index;
  return state.copyWith(tabController: state.tabController);
}

HomePageState _initTabController(HomePageState state, InitTabController action) => state.copyWith(tabController: action.tabController);

HomePageState _disposeTabController(HomePageState state, DisposeTabController action) {
  state.tabController.dispose();
  return state;
}
