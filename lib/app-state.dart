import 'package:kinship_mobile/pages/home-page/+state/home-page-state.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/+state/posts-list-page-state.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/create-post-page/+state/create-post-page-state.dart';
import 'package:kinship_mobile/pages/initial-setup-widget/+state/initial-setup-widget-state.dart';
import 'package:kinship_mobile/pages/login-page/+state/login-page-state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final LoginPageState loginPageState;
  final HomePageState homePageState;
  final InitialSetupWidgetState initialSetupWidgetState;
  final CreatePostPageState createPostPageState;
  final PostsListPageState postsListPageState;

  AppState({
    @required this.loginPageState,
    @required this.homePageState,
    @required this.initialSetupWidgetState,
    @required this.createPostPageState,
    @required this.postsListPageState,
  });

  factory AppState.initial() {
    return AppState(
      loginPageState: LoginPageState.initial(),
      homePageState: HomePageState.initial(),
      initialSetupWidgetState: InitialSetupWidgetState.initial(),
      createPostPageState: CreatePostPageState.initial(),
      postsListPageState: PostsListPageState.initial(),
    );
  }

  AppState copyWith({
    LoginPageState loginPageState,
    HomePageState homePageState,
    InitialSetupWidgetState initialSetupWidgetState,
    CreatePostPageState createPostPageState,
    PostsListPageState postsListPageState,
  }) {
    return AppState(
      loginPageState: loginPageState ?? this.loginPageState,
      homePageState: homePageState ?? this.homePageState,
      initialSetupWidgetState: initialSetupWidgetState ?? this.initialSetupWidgetState,
      createPostPageState: createPostPageState ?? this.createPostPageState,
      postsListPageState: postsListPageState ?? this.postsListPageState,
    );
  }
}
