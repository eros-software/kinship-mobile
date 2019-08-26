import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/pages/login-page/+state/login-page-actions.dart';
import 'package:redux/redux.dart';

class LoginPageModel{

  final Function(FacebookAccessToken facebookAccessToken) loginAction;
  final Function() errorAction;
  final hasError;

  LoginPageModel({
    this.loginAction,
    this.errorAction,
    this.hasError,
  });

  static LoginPageModel fromStore(Store<AppState> store) =>
    new LoginPageModel(
      loginAction: (FacebookAccessToken facebookAccessToken) => store.dispatch(new LoginAction(facebookAccessToken)),
      errorAction: () => store.dispatch(new ErrorAction()),
      hasError: store.state.loginPageState.hasError,
    );

}
