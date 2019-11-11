class SubscriptionAction {
  final idChat;
  SubscriptionAction(this.idChat);
}

class GetInitialChatData {
  final int idChat;
  GetInitialChatData(this.idChat);
}

class GetInitialChatDataSuccess {
  final List<dynamic> mensagens;
  final int total;
  GetInitialChatDataSuccess(this.mensagens, this.total);
}
class GetSubscriptionDataSuccess {
  final dynamic mensagem;
  GetSubscriptionDataSuccess(this.mensagem);
}

class GetMoreChatData {
  final int idChat;
  GetMoreChatData(this.idChat);
}

class GetMoreChatDataSuccess {
  final List<dynamic> mensagens;
  final int total;
  GetMoreChatDataSuccess(this.mensagens, this.total);
}

class SendTextData {
  final text;
  final idChat;
  SendTextData(this.text, this.idChat);
}

class SendTextDataSuccess {
  SendTextDataSuccess();
}

class DisposeChatDetalhePage {
  DisposeChatDetalhePage();
}