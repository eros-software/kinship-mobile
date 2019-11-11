
import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/pages/home-page/chats-list-page/chat-detalhe-page/+state/chat-detalhe-page-actions.dart';
import 'package:redux/redux.dart';

class ChatDetalhePageModel{

  final userId;
  final isLoading;
  final Function(int idChat) getInitialChatData;
  final List<dynamic> mensagens;
  final totalMensagens;
  final Function(String text, int idChat) sendTextData;
  final Function(int idChat) getMoreChatData;

  ChatDetalhePageModel({
    this.userId,
    this.isLoading,
    this.getInitialChatData,
    this.mensagens,
    this.totalMensagens,
    this.sendTextData,
    this.getMoreChatData,
  });

  static ChatDetalhePageModel fromStore(Store<AppState> store) =>
    new ChatDetalhePageModel(
      userId: store.state.loginPageState.user.id,
      isLoading: store.state.chatDetalhePageState.isLoading,
      getInitialChatData: (int idChat) => store.dispatch(new GetInitialChatData(idChat)),
      mensagens: store.state.chatDetalhePageState.mensagens,
      totalMensagens: store.state.chatDetalhePageState.totalMensagens,
      sendTextData: (text, idChat) => store.dispatch(new SendTextData(text, idChat)),
      getMoreChatData: (int idChat) => store.dispatch(new GetMoreChatData(idChat)),
    );

}