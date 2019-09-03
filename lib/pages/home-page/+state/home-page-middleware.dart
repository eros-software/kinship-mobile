import 'package:kinship_mobile/pages/home-page/+state/home-page-actions.dart';
import 'package:redux/redux.dart';

class HomePageMiddleware extends MiddlewareClass {
  @override
  void call(Store store, action, NextDispatcher next) {

    if (action is InitTabController) {

    }

    next(action);

  }
}
