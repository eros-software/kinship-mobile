
import 'package:kinship_mobile/app-state.dart';
import 'package:redux/redux.dart';

class ChatsListPageModel{

  final List chats;
  

  ChatsListPageModel({
    this.chats,

  });

  static ChatsListPageModel fromStore(Store<AppState> store) =>
    new ChatsListPageModel(
      chats: store.state.chatsListPageState.chats,
    );

}
