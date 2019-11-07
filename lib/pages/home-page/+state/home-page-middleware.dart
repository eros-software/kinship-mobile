import 'package:redux/redux.dart';

class HomePageMiddleware extends MiddlewareClass {
  @override
  void call(Store store, action, NextDispatcher next) {

    next(action);

  }
}
