import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/pages/home-page/+model/home-page-model.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, HomePageModel>(
      converter: (store) => HomePageModel.fromStore(store),
      builder: (context, homePageModel) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Text('home-page'),
          ),
        );
      }
    );
  }

}
