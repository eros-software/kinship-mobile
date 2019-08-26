import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/pages/home-page/+state/home-page-middleware.dart';
import 'package:kinship_mobile/pages/login-page/+state/login-page-middleware.dart';
import 'package:redux/redux.dart';

final List<Middleware<AppState>> appMiddleware = [
  LoginPageMiddleware(),
  HomePageMiddleware(),
];
