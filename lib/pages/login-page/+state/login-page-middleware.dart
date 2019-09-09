import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kinship_mobile/graphql/graphql.dart';
import 'package:kinship_mobile/keys.dart';
import 'package:kinship_mobile/models/usuario.dart';
import 'package:kinship_mobile/pages/initial-setup-widget/+state/initial-setup-widget-actions.dart';
import 'package:kinship_mobile/pages/login-page/+state/login-page-actions.dart';
import 'package:redux/redux.dart';

class LoginPageMiddleware extends MiddlewareClass {

  String loginFacebookMutation =
  """
    mutation loginFacebook(\$loginFacebookInput: LoginFacebookInput!) {
      loginFacebook(loginFacebookInput: \$loginFacebookInput) {
        token
        show_introduction_page
        usuario {
          id
          nome
          genero
          data_nascimento
          foto_perfil
        }
      }
    }
  """.replaceAll('\n', ' ');

  final dio = new Dio();
  
  @override
  void call(Store store, action, NextDispatcher next) async {
    if (action is LoginAction) {
      final facebookData = await dio.get('https://graph.facebook.com/v4.0/me?fields=name,email,gender,birthday,picture.height(200),likes{name}&access_token=${action.facebookAccessToken.token}');
      final facebookProfileData = json.decode(facebookData.data);
      final response = await mutation(
        loginFacebookMutation,
        variables: {
          'loginFacebookInput': {
            'id_facebook': action.facebookAccessToken.userId,
            'nome': facebookProfileData['name'],
            'email': facebookProfileData['email'],
            'foto_perfil': facebookProfileData['picture']['data']['url'],
            'genero': facebookProfileData['gender'],
            'data_nascimento': facebookProfileData['birthday'],
          }
        }
      );
      final Usuario user = Usuario.fromJson(response['loginFacebook']['usuario']);
      store.dispatch(new SavePreferences(user));
      store.dispatch(new LoginSuccessAction(user, response['loginFacebook']['show_introduction_page']));
    }

    if(action is LoginSuccessAction) {
      (action.showIntroductionPage) ? Keys.navKey.currentState.pushReplacementNamed('introduction-page') : Keys.navKey.currentState.pushReplacementNamed('home-page');
    }

    next(action);
  }

}
