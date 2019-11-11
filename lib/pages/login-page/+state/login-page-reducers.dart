
import 'package:kinship_mobile/pages/login-page/+state/login-page-actions.dart';
import 'package:kinship_mobile/pages/login-page/+state/login-page-state.dart';
import 'package:redux/redux.dart';

final loginPageReducer = combineReducers<LoginPageState>([
  TypedReducer<LoginPageState,LoginAction>(_loginAction),
  TypedReducer<LoginPageState,LoginSuccessAction>(_loginSuccessAction),
  TypedReducer<LoginPageState,LogoutAction>(_logoutAction),

]);

LoginPageState _loginAction(LoginPageState state, LoginAction action) => state.copyWith(hasError: false);

LoginPageState _loginSuccessAction(LoginPageState state, LoginSuccessAction action) => state.copyWith(user: action.user);

LoginPageState _logoutAction(LoginPageState state, LogoutAction action) => state;

