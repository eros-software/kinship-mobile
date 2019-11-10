import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/models/post-arguments.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/post-detalhe-page/+model/post-detalhe-page-model.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/post-detalhe-page/+state/post-detalhe-page-actions.dart';
import 'package:kinship_mobile/utils/post-card-widget/post-card-widget.dart';

class PostDetalhePage extends StatefulWidget  {
  static String tag = 'post-detalhe-page';
  @override
  _PostDetalhePageState createState() => _PostDetalhePageState();
}

class _PostDetalhePageState extends State<PostDetalhePage> {

  TextEditingController sendComentarioController = TextEditingController();

  List<Widget> _postWidget(
    dynamic post,
    int comentariosLength,
    int userId,
    Function likePost,
    Function dislikePost
  ) => [
    PostCardWidget(post: post),
      SizedBox(height: 4),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.message, color: Colors.pink[900]),
              Text(' $comentariosLength'),
            ],
          ),
          (post['likes'].map((likes) => likes['id_usuario']).contains(userId))
          ? InkWell(
            onTap: () => dislikePost(post),
            child: Row(
              children: <Widget>[
                Icon(Icons.favorite, color: Colors.pink[900]),
                Text(' ${post['likes'].length}')
              ],
            ),
          )
          : InkWell(
            onTap: () => likePost(post),
            child: Row(
              children: <Widget>[
                Icon(Icons.favorite_border, color: Colors.pink[900]),
                Text(' ${post['likes'].length}')
              ],
            ),
          )
          
        ],
      ),
      SizedBox(height: 4),
      Row(
        children: <Widget>[
          Expanded(
            child: Divider(thickness: 2),
          )
        ],
      ),
  ];

  ListView _comentarioWidget(List comentarios) => ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: comentarios.length,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        leading: Padding(
          padding: EdgeInsets.only(left: 16, right: 4),
          child: CircleAvatar(
          child: CachedNetworkImage(
            imageUrl: comentarios[index]['usuario']['foto_perfil'],
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ), 
          
          
          /* CachedNetworkImageProvider(
              comentarios[index]['usuario']['foto_perfil'],
            ), */
          ),
        ),
        title: Row(
          children: <Widget>[
            Expanded(
              child: AutoSizeText(comentarios[index]['usuario']['nome'], style: TextStyle(fontSize: 14),),
            )
          ],
        ),
        subtitle: Row(
          children: <Widget>[
            Expanded(
              child: AutoSizeText(comentarios[index]['texto'], style: TextStyle(fontSize: 20),),
            )
          ],
        ),
        trailing: InkWell(
          child: Text('Start Chat', style: TextStyle(color: Colors.pink[900]),),
        )
      );
    }
  );

  Container footer(
    Function createComentario,
    dynamic post
  ) => Container(
    color: Colors.white,
    padding: EdgeInsets.all(4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: Container(
            child: TextFormField(
            controller: sendComentarioController,
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              minLines: 1,
              maxLength: 500,
              style: TextStyle(color: Colors.black, fontSize: 18),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: 'Escreva um comentário',
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
            if (sendComentarioController.text != '') {
              createComentario(post, sendComentarioController.text);
              sendComentarioController.clear();
            }
          },
        ),
      ],
    )
  );

  @override
  Widget build(BuildContext context) {
    final PostArguments postArguments = ModalRoute.of(context).settings.arguments;
    return StoreConnector<AppState, PostDetalhePageModel>(
      distinct: true,
      converter: (store) => PostDetalhePageModel.fromStore(store),
      onInit: (store) {
        store.dispatch(new LoadPost(postArguments.post['id']));
      },
      onDispose: (store) {
        store.dispatch(new DisposePostDetalhePage());
      },
      builder: (context, postDetalhePageModel) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.pink[900],
            title: Text(
              'Post',
              style: TextStyle(
                fontFamily: 'DancingScript',
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
          body: (postDetalhePageModel.isLoading) 
            ? Center(child: CircularProgressIndicator())
            : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ..._postWidget(
                  postDetalhePageModel.post,
                  postDetalhePageModel.comentarios.length,
                  postDetalhePageModel.userId,
                  postDetalhePageModel.likePost,
                  postDetalhePageModel.dislikePost,
                ),
                Expanded(
                  child: _comentarioWidget(postDetalhePageModel.comentarios),
                ),
                footer(postDetalhePageModel.createComentario, postDetalhePageModel.post)
              ],
            ),
        );
      }
    );
  }
}
