import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/models/chat-arguments.dart';
import 'package:kinship_mobile/pages/home-page/chats-list-page/chat-detalhe-page/+model/chat-detalhe-page-model.dart';
import 'package:kinship_mobile/pages/home-page/chats-list-page/chat-detalhe-page/+state/chat-detalhe-page-actions.dart';
import 'package:kinship_mobile/utils/loadmore-custom-widget/loadmore-custom-widget.dart';

class ChatDetalhePage extends StatefulWidget  {
  static String tag = 'chat-detalhe-page';
  @override
  _ChatDetalhePageState createState() => _ChatDetalhePageState();
}

class _ChatDetalhePageState extends State<ChatDetalhePage> {

  TextEditingController sendMensagemController = TextEditingController();
  
  Future<bool> _loadMore(getMoreChatData, chatId) async {
    getMoreChatData(chatId);
    await Future.delayed(Duration(milliseconds: 500));
    return true;
  }


  LoadMoreCustom _chatWidget(List mensagens, int totalMensagens, int userId, Function getMoreChatData, int chatId) => LoadMoreCustom(
    isFinish: mensagens != null ? mensagens.length >= totalMensagens : true,
    onLoadMore: () => _loadMore(getMoreChatData, chatId),
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      reverse: true,
      itemCount: mensagens.length,
      itemBuilder: (BuildContext context, int index) {
        return (mensagens[index]['usuario']['id'] != userId)
         ? ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          leading: Padding(
            padding: EdgeInsets.only(left: 16, right: 4),
            child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
                mensagens[index]['usuario']['foto_perfil'],
              ),
            ),
          ),
          title: Row(
            children: <Widget>[
              Expanded(
                child: AutoSizeText(mensagens[index]['usuario']['nome'], style: TextStyle(fontSize: 14),),
              )
            ],
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                child: AutoSizeText(mensagens[index]['texto'], style: TextStyle(fontSize: 20),),
              )
            ],
          ),
        )
        : ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          title: Row(
            children: <Widget>[
              Expanded(
                child: AutoSizeText(mensagens[index]['usuario']['nome'], style: TextStyle(fontSize: 14), textAlign: TextAlign.right,),
              )
            ],
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                child: AutoSizeText(mensagens[index]['texto'], style: TextStyle(fontSize: 20), textAlign: TextAlign.right,),
              )
            ],
          ),
          trailing: Padding(
            padding: EdgeInsets.only(left: 16, right: 4),
            child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
                mensagens[index]['usuario']['foto_perfil'],
              ),
            ),
          )
        );
      }
    ),
  );

  Container footer(
    Function createMensagem,
    dynamic chatId
  ) => Container(
    color: Colors.white,
    padding: EdgeInsets.all(4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: Container(
            child: TextFormField(
            controller: sendMensagemController,
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              minLines: 1,
              maxLength: 500,
              style: TextStyle(color: Colors.black, fontSize: 18),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: 'Escreva uma mensagem',
                hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                counterText: "",
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send, color: Colors.pink[900]),
          highlightColor: Colors.green,
          splashColor: Colors.green,
          onPressed: () {
            if (sendMensagemController.text != '') {
              createMensagem(sendMensagemController.text, chatId);
              sendMensagemController.clear();
            }
          },
        ),
      ],
    )
  );

  @override
  Widget build(BuildContext context) {
    final ChatArguments chatArguments = ModalRoute.of(context).settings.arguments;
    return StoreConnector<AppState, ChatDetalhePageModel>(
      converter: (store) => ChatDetalhePageModel.fromStore(store),
      onInit: (store) {
        store.dispatch(new GetInitialChatData(chatArguments.chat['id']));
      },
      onDispose: (store) {
        store.dispatch(new DisposeChatDetalhePage());
      },
      builder: (context, chatDetalhePageModel) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.pink[900],
            title: Text(
              'Chat',
              style: TextStyle(
                fontFamily: 'DancingScript',
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
          body: (!chatDetalhePageModel.isLoading)
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: _chatWidget(
                      chatDetalhePageModel.mensagens,
                      chatDetalhePageModel.totalMensagens,
                      chatDetalhePageModel.userId,
                      chatDetalhePageModel.getMoreChatData,
                      chatArguments.chat['id']
                    ),
                  ),
                  footer(chatDetalhePageModel.sendTextData, chatArguments.chat['id'])
                ]
              )
              : Center(child: CircularProgressIndicator())
        );
      }
    );
  }
}
