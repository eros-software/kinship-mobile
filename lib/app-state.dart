import 'package:kinship_mobile/pages/login-page/+state/login-page-state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final LoginState loginState;

  AppState({
    @required this.loginState,
  });

  factory AppState.initial() {
    return AppState(
      loginState: LoginState.initial(),
    );
  }

  AppState copyWith({
    LoginState loginState,
  }) {
    return AppState(
      loginState: loginState ?? this.loginState,
    );
  }
}
