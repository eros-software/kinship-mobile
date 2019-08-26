import 'package:kinship_mobile/models/usuario.dart';
import 'package:meta/meta.dart';

@immutable
class LoginPageState{

  final bool hasError;
  final String errorMessage;
  final Usuario user;

  LoginPageState({
    @required this.hasError,
    @required this.errorMessage,
    @required this.user,
  });

  factory LoginPageState.initial(){
    return new LoginPageState(
      hasError: false,
      errorMessage: "",
      user: null
    );
  }

  LoginPageState copyWith({
    bool hasError,
    String errorMessage,
    Usuario user,
  }){
    return new LoginPageState(
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
    );
  }
}
