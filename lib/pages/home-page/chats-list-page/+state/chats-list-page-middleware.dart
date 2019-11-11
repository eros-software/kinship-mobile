import 'package:kinship_mobile/graphql/graphql.dart';
import 'package:kinship_mobile/pages/home-page/chats-list-page/+state/chats-list-page-actions.dart';
import 'package:redux/redux.dart';

class ChatsListPageMiddleware extends MiddlewareClass {

  String getChats =
  """
  query getChats(\$id_criador: Int!) {
    getChats(id_criador: \$id_criador) {
      code
    	message
      data {
        id
      }
    }
  }
  """.replaceAll('\n', ' ');


  @override
  Future call(Store store, action, NextDispatcher next) async {

    if (action is LoadChats) {
      try {
        final response = await query(
          getChats,
          variables: {
            'id_criador': store.state.loginPageState.user.id,
          }
        );
        store.dispatch(new LoadChatsSuccess(response['getChats']['data']));
      } catch (e) {
        print(e);
      }
    }

    if (action is LoadChatsSuccess) {

    }

    next(action);

  }
}