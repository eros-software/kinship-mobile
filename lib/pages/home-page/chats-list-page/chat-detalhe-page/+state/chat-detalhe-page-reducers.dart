import 'package:kinship_mobile/pages/home-page/chats-list-page/chat-detalhe-page/+state/chat-detalhe-page-actions.dart';
import 'package:kinship_mobile/pages/home-page/chats-list-page/chat-detalhe-page/+state/chat-detalhe-page-state.dart';
import 'package:redux/redux.dart';


final chatDetalhePageReducers = combineReducers<ChatDetalhePageState>([
  TypedReducer<ChatDetalhePageState,GetInitialChatData>(_getInitialChatData),
  TypedReducer<ChatDetalhePageState,GetInitialChatDataSuccess>(_getInitialChatDataSuccess),
  TypedReducer<ChatDetalhePageState,GetSubscriptionDataSuccess>(_getSubscriptionDataSuccess),
  TypedReducer<ChatDetalhePageState,GetMoreChatData>(_getMoreChat),
  TypedReducer<ChatDetalhePageState,GetMoreChatDataSuccess>(_getMoreChatSuccess),
  TypedReducer<ChatDetalhePageState,SendTextData>(_sendTextData),
  TypedReducer<ChatDetalhePageState,SendTextDataSuccess>(_sendTextDataSuccess),
  TypedReducer<ChatDetalhePageState,DisposeChatDetalhePage>(_disposeChatDetalhePage),
]);

ChatDetalhePageState _getInitialChatData(ChatDetalhePageState state, GetInitialChatData action) => state;

ChatDetalhePageState _getInitialChatDataSuccess(ChatDetalhePageState state, GetInitialChatDataSuccess action) => 
  state.copyWith(mensagens: action.mensagens, isLoading: false, totalMensagens: action.total);

ChatDetalhePageState _sendTextData(ChatDetalhePageState state, SendTextData action) => state;

ChatDetalhePageState _sendTextDataSuccess(ChatDetalhePageState state, SendTextDataSuccess action) => state;

ChatDetalhePageState _getSubscriptionDataSuccess(ChatDetalhePageState state, GetSubscriptionDataSuccess action) {
  List<dynamic> listMensagens = List.from(state.mensagens);
  listMensagens.insert(0, action.mensagem);
  return state.copyWith(mensagens: listMensagens);
}

ChatDetalhePageState _getMoreChat(ChatDetalhePageState state, GetMoreChatData action) => state;

ChatDetalhePageState _disposeChatDetalhePage(ChatDetalhePageState state, DisposeChatDetalhePage action) => ChatDetalhePageState.initial();

ChatDetalhePageState _getMoreChatSuccess(ChatDetalhePageState state, GetMoreChatDataSuccess action) {
  List<dynamic> listMensagens = List.from(state.mensagens);
  listMensagens.addAll(action.mensagens);
  return state.copyWith(mensagens: listMensagens, totalMensagens: action.total);
}