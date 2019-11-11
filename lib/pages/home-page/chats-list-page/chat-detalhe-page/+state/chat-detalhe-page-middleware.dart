import 'package:kinship_mobile/graphql/graphql.dart';
import 'package:kinship_mobile/pages/home-page/chats-list-page/chat-detalhe-page/+state/chat-detalhe-page-actions.dart';
import 'package:redux/redux.dart';
import 'package:soma_graphql_flutter/subscription.dart';


class ChatDetalhePageMiddleware extends MiddlewareClass {
  String getChat =
  """
  query getChat(\$id_chat: Int!) {
    getChat(id_chat: \$id_chat) {
      code
      message
      data {
        page_total
        total
        list {
          id
          usuario {
            id
            nome
            foto_perfil
          }
          texto
          created_at
        }
      }
    }
  }
  """.replaceAll('\n', ' ');

  String getMoreChat =
  """
  query getMoreChat(\$id_chat: Int!) {
    getMoreChat(id_chat: \$id_chat) {
      code
      message
      data {
        page_total
        total
        list {
          id
          usuario {
            id
            nome
            foto_perfil
          }
          texto
          created_at
        }
      }
    }
  }
  """.replaceAll('\n', ' ');

  String createMensagem =
  """
  mutation createMensagem(\$id_chat: Int!, \$texto: String!) {
    createMensagem(id_chat: \$id_chat, texto: \$texto) {
      code
      message
      data {
        id
        usuario {
          id
          nome
          foto_perfil
        }
        texto
        created_at
      }
    }
  }
  """.replaceAll('\n', ' ');

  String receiveMensagem =
  """
  subscription receiveMensagem(\$id_chat: Int!) {
    receiveMensagem(id_chat: \$id_chat) {
      id
      usuario {
        id
        nome
        foto_perfil
      }
      texto
      created_at
    }
  }
  """.replaceAll('\n', ' ');

  @override
  Future call(Store store, action, NextDispatcher next) async {
    if (action is SubscriptionAction) {
      final String operationName = "";
      final dynamic variables = {'id_chat': action.idChat};     
      final payload = {
        'operationName': operationName,
        'query': receiveMensagem,
        'variables': variables,
      };
      store.state.chatDetalhePageState.subscription
        .send(payload)
        .onData((dynamic data) {
          if (Subscription.hasData(data)) {
            store.dispatch(new GetSubscriptionDataSuccess(data['payload']['data']['receiveMensagem']));
          } 
        });
    }

    if (action is GetInitialChatData) {
      final chatData = await query(
        getChat,
        variables: {
          'id_chat': action.idChat,
        }
      );
      store.dispatch(new GetInitialChatDataSuccess(chatData['getChat']['data']['list'], chatData['getChat']['data']['total']));
      store.dispatch(new SubscriptionAction(action.idChat));
    }

    if (action is GetMoreChatData) {
      final chatData = await query(
        getMoreChat,
        variables: {
          'id_chat': action.idChat,
        }
      );
      store.dispatch(new GetMoreChatDataSuccess(chatData['getMoreChat']['data']['list'], chatData['getMoreChat']['data']['total']));
    }

    if (action is SendTextData) {
      await mutation(
        createMensagem,
        variables: {
          'id_chat': action.idChat,
          'texto': action.text
        }
      );
      store.dispatch(new SendTextDataSuccess());
    }

    next(action);
  }
}
