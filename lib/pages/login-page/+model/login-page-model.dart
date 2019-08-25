import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/pages/login-page/+state/login-page-actions.dart';
import 'package:redux/redux.dart';

class LoginPageModel{

  final Function() loginAction;
  final Function() errorAction;
  final hasError;

  LoginPageModel({
    this.loginAction,
    this.errorAction,
    this.hasError,
  });

  static LoginPageModel fromStore(Store<AppState> store) =>
    new LoginPageModel(
      loginAction: () => store.dispatch(new LoginAction()),
      errorAction: () => store.dispatch(new ErrorAction()),
      hasError: store.state.loginState.hasError,
    );

}