import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kinship_mobile/app-middleware.dart';
import 'package:kinship_mobile/app-routes.dart';
import 'package:redux/redux.dart';
import 'package:kinship_mobile/app-reducers.dart';
import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/keys.dart';
import 'package:kinship_mobile/pages/login-page/login-page.dart';

class MyApp extends StatelessWidget {

  final store = new Store<AppState>(
    appReducers,
    initialState: AppState.initial(),
    middleware: appMiddleware,
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
        routes: appRoutes,
      ),
    );
  }
}
