import 'package:meta/meta.dart';

@immutable
class ChatsListPageState{

  final List chats;

  ChatsListPageState({
    @required this.chats,
  });

  factory ChatsListPageState.initial(){
    return new ChatsListPageState(
      chats: null,
    );
  }

  ChatsListPageState copyWith({
    chats,
  }) {
    return new ChatsListPageState(
      chats: chats ?? this.chats,
    );
  }
}