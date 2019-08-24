import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:kinship_mobile/app-reducers.dart';
import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/keys.dart';
import 'package:kinship_mobile/pages/login-page/+state/login-page-epics.dart';
import 'package:kinship_mobile/pages/login-page/login-page.dart';
import 'package:redux_epics/redux_epics.dart';

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
  };
  
  static final epics = combineEpics<AppState>([
    loginPageEpics,
  ]);

  final store = new Store<AppState>(
    reducers,
    initialState: AppState.initial(),
    middleware: [
      EpicMiddleware(
          epics,      
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        title: 'Kinship',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Roboto',
          primaryColor: Colors.pink,
        ),
        navigatorKey: Keys.navKey,
        home: LoginPage(),
        routes: routes,
      ),
    );
  }
}
