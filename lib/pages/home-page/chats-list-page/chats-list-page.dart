import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/keys.dart';
import 'package:kinship_mobile/models/chat-arguments.dart';
import 'package:kinship_mobile/pages/home-page/chats-list-page/+model/chats-list-page-model.dart';
import 'package:kinship_mobile/pages/home-page/chats-list-page/+state/chats-list-page-actions.dart';

class ChatsListPage extends StatelessWidget {

  ListView _listChats(
    List chats,
  ) => ListView.builder(
    padding: EdgeInsets.only(top: 10),
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    physics: ClampingScrollPhysics(),
    itemCount: chats.length,
    itemBuilder: (BuildContext context, int index) {
      return InkWell(
        onTap: () => Keys.navKey.currentState.pushNamed(
          'chat-detalhe-page',
          arguments: ChatArguments(chats[index]),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 8),
            Text('Chat ${index+1}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              children: <Widget>[
                Expanded(
                  child: Divider(thickness: 2),
                )
              ],
            ),
          ],
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ChatsListPageModel>(
      converter: (store) => ChatsListPageModel.fromStore(store),
      onInit: (store) {
        store.dispatch(new LoadChats());
      },
      builder: (context, chatsListPageModel) {
        return (chatsListPageModel.chats == null)
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: Center(child: Text('Não há chats'))),
          ],
        )
        : Container(
          child:SingleChildScrollView(
            child: _listChats(
              chatsListPageModel.chats,
            ),
          )
        );
      },
    );
  }
}


