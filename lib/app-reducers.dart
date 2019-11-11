import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/pages/home-page/+state/home-page-reducers.dart';
import 'package:kinship_mobile/pages/home-page/chats-list-page/+state/chats-list-page-reducers.dart';
import 'package:kinship_mobile/pages/home-page/chats-list-page/chat-detalhe-page/+state/chat-detalhe-page-reducers.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/+state/posts-list-page-reducers.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/create-post-page/+state/create-post-page-reducers.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/post-detalhe-page/+state/post-detalhe-page-reducers.dart';
import 'package:kinship_mobile/pages/initial-setup-widget/+state/initial-setup-widget-reducers.dart';
import 'package:kinship_mobile/pages/login-page/+state/login-page-reducers.dart';

AppState appReducers(AppState state, dynamic action) => new AppState(
  loginPageState: loginPageReducer(state.loginPageState, action),
  homePageState: homePageReducer(state.homePageState, action),
  initialSetupWidgetState: initialSetupWidgetReducers(state.initialSetupWidgetState, action),
  createPostPageState: createPostPageReducers(state.createPostPageState, action),
  postsListPageState: postsListPageReducers(state.postsListPageState, action),
  postDetalhePageState: postDetalhePageReducers(state.postDetalhePageState, action),
  chatDetalhePageState: chatDetalhePageReducers(state.chatDetalhePageState, action),
  chatsListPageState: chatsListPageReducers(state.chatsListPageState, action),
);
