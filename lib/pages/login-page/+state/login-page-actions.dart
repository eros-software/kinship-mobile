import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:kinship_mobile/models/usuario.dart';

class LoginAction {
  final FacebookAccessToken facebookAccessToken;
  LoginAction(this.facebookAccessToken);
}


class LoginSuccessAction {
  final Usuario user;
  final bool showIntroductionPage;
  LoginSuccessAction(this.user, this.showIntroductionPage);
}
  

class ErrorAction {
  ErrorAction();
}

class LogoutAction {
  LogoutAction();
}
