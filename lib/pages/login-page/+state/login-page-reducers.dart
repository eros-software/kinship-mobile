
import 'package:kinship_mobile/pages/login-page/+state/login-page-actions.dart';
import 'package:kinship_mobile/pages/login-page/+state/login-page-state.dart';
import 'package:redux/redux.dart';

final loginReducer = combineReducers<LoginState>([
  TypedReducer<LoginState,LoginAction>(_loginAction),

]);

LoginState _loginAction(LoginState state, LoginAction action){
  return state.copyWith(hasError: false);
}
