import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/pages/login-page/+model/login-page-model.dart';

class LoginPage extends StatelessWidget {
  static String tag = 'login-page';

  void _initiateFacebookLogin(dispatchLoginFacebookAction) async {
    final facebookLoginResult = await  FacebookLogin().logInWithReadPermissions(['email', 'user_friends', 'user_gender', 'user_likes', 'user_birthday']);
     if (facebookLoginResult.status == FacebookLoginStatus.loggedIn)
      dispatchLoginFacebookAction(facebookLoginResult.accessToken);
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, LoginPageModel>(
      converter: (store) => LoginPageModel.fromStore(store),
      builder: (context, loginPageModel) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.pink[900], Colors.pink[300]])),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Kinship',
                    style: TextStyle(
                      fontFamily: 'DancingScript',
                      fontSize: 88,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(height: 32),
                  ClipOval(
                    child: Container(
                      color: Colors.blue,
                      padding: EdgeInsets.all(0),
                      height: 64,
                      width: 64,
                      child: InkWell(
                        child: Icon(FontAwesomeIcons.facebook, color: Colors.white, size: 60),
                        onTap: () => _initiateFacebookLogin(loginPageModel.loginAction),
                      ),
                    ),
                  )
                ],
              ) 
            ),
          )
        );
      }
    );
  }

}


