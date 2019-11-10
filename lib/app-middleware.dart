import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/pages/home-page/+state/home-page-middleware.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/+state/posts-list-page-middleware.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/create-post-page/+state/create-post-page-middleware.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/post-detalhe-page/+state/post-detalhe-page-middleware.dart';
import 'package:kinship_mobile/pages/initial-setup-widget/+state/initial-setup-widget-middleware.dart';
import 'package:kinship_mobile/pages/login-page/+state/login-page-middleware.dart';
import 'package:redux/redux.dart';

final List<Middleware<AppState>> appMiddleware = [
  LoginPageMiddleware(),
  HomePageMiddleware(),
  InitialSetupWidgetMiddleware(),
  CreatePostPageMiddleware(),
  PostsListPageMiddleware(),
  PostDetalhePageMiddleware(),
];
