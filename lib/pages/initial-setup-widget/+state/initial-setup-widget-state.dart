import 'package:meta/meta.dart';

@immutable
class InitialSetupWidgetState{

  final bool requiresConsent;
  final String playerId;

  InitialSetupWidgetState({
    @required this.requiresConsent,
    @required this.playerId,
  });

  factory InitialSetupWidgetState.initial(){
    return new InitialSetupWidgetState(
      requiresConsent: true,
      playerId: null,

    );
  }

  InitialSetupWidgetState copyWith({
    bool requiresConsent,
    String playerId,

  }){
    return new InitialSetupWidgetState(
      requiresConsent: requiresConsent ?? this.requiresConsent,
      playerId: playerId ?? this.playerId,
    );
  }
}
