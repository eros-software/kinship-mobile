import 'package:kinship_mobile/pages/home-page/+state/home-page-state.dart';
import 'package:kinship_mobile/pages/login-page/+state/login-page-state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final LoginPageState loginPageState;
  final HomePageState homePageState;

  AppState({
    @required this.loginPageState,
    @required this.homePageState,
  });

  factory AppState.initial() {
    return AppState(
      loginPageState: LoginPageState.initial(),
      homePageState: HomePageState.initial(),
    );
  }

  AppState copyWith({
    LoginPageState loginPageState,
    HomePageState homePageState,
  }) {
    return AppState(
      loginPageState: loginPageState ?? this.loginPageState,
      homePageState: homePageState ?? this.homePageState,
    );
  }
}
