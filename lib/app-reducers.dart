


import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/pages/login-page/+state/login-page-reducers.dart';

AppState reducers(AppState state, dynamic action) => new AppState(
  loginState: loginReducer(state.loginState, action),
);
