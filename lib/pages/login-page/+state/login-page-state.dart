import 'package:meta/meta.dart';

@immutable
class LoginState{

  final bool hasError;
  final String errorMessage;

  LoginState({
    @required this.hasError,
    @required this.errorMessage,
  });

  factory LoginState.initial(){
    return new LoginState(
      hasError: false,
      errorMessage: "",
    );
  }

  LoginState copyWith({
    bool hasError,
    String errorMessage,
  }){
    return new LoginState(
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
