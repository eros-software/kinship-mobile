import 'package:kinship_mobile/pages/home-page/chats-list-page/+state/chats-list-page-actions.dart';
import 'package:kinship_mobile/pages/home-page/chats-list-page/+state/chats-list-page-state.dart';
import 'package:redux/redux.dart';

final chatsListPageReducers = combineReducers<ChatsListPageState>([
  TypedReducer<ChatsListPageState, LoadChats>(_loadChats),
  TypedReducer<ChatsListPageState, LoadChatsSuccess>(_loadChatsSuccess),

]);

ChatsListPageState _loadChats(ChatsListPageState state, LoadChats action) => state;

ChatsListPageState _loadChatsSuccess(ChatsListPageState state, LoadChatsSuccess action) => state.copyWith(chats: action.chats);
