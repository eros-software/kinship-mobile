import 'package:kinship_mobile/pages/home-page/+state/home-page-state.dart';
import 'package:kinship_mobile/pages/initial-setup-widget/+state/initial-setup-widget-state.dart';
import 'package:kinship_mobile/pages/login-page/+state/login-page-state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final LoginPageState loginPageState;
  final HomePageState homePageState;
  final InitialSetupWidgetState initialSetupWidgetState;

  AppState({
    @required this.loginPageState,
    @required this.homePageState,
    @required this.initialSetupWidgetState,
  });

  factory AppState.initial() {
    return AppState(
      loginPageState: LoginPageState.initial(),
      homePageState: HomePageState.initial(),
      initialSetupWidgetState: InitialSetupWidgetState.initial(),
    );
  }

  AppState copyWith({
    LoginPageState loginPageState,
    HomePageState homePageState,
    InitialSetupWidgetState initialSetupWidgetState,
  }) {
    return AppState(
      loginPageState: loginPageState ?? this.loginPageState,
      homePageState: homePageState ?? this.homePageState,
      initialSetupWidgetState: initialSetupWidgetState ?? this.initialSetupWidgetState,
    );
  }
}
