import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/pages/home-page/+state/home-page-reducers.dart';
import 'package:kinship_mobile/pages/initial-setup-widget/+state/initial-setup-widget-reducers.dart';
import 'package:kinship_mobile/pages/login-page/+state/login-page-reducers.dart';

AppState appReducers(AppState state, dynamic action) => new AppState(
  loginPageState: loginPageReducer(state.loginPageState, action),
  homePageState: homePageReducer(state.homePageState, action),
  initialSetupWidgetState: initialSetupWidgetReducers(state.initialSetupWidgetState, action),
);
