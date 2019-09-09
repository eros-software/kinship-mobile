import 'dart:convert';
import 'package:kinship_mobile/keys.dart';
import 'package:kinship_mobile/models/usuario.dart';
import 'package:kinship_mobile/pages/initial-setup-widget/+state/initial-setup-widget-actions.dart';
import 'package:kinship_mobile/pages/login-page/+state/login-page-actions.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialSetupWidgetMiddleware extends MiddlewareClass {

  @override
  void call(Store store, action, NextDispatcher next) async {

    if (action is VerifyPreferences) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final user = prefs.get('user');
      (user != null) 
        ? store.dispatch(new LoginSuccessAction(Usuario.fromJson(json.decode(user)), false))
        : Keys.navKey.currentState.pushReplacementNamed("login-page");
    }

    if (action is DeletePreferences) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('user');
    }
 
    if (action is SavePreferences) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', json.encode(action.user));
    }
    
    next(action);
    
  }
}
