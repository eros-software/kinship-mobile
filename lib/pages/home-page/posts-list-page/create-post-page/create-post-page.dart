import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/create-post-page/+model/create-post-page-model.dart';
import 'package:kinship_mobile/utils/list-without-glow/list-without-glow.dart';
import 'package:kinship_mobile/utils/validators/validators.dart';

class CreatePostPage extends StatefulWidget {
  static String tag = 'create-post-page';
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  
  final _formCreatePost = GlobalKey<FormState>();
  final _postTextController = TextEditingController();

  @override
  void dispose() {
    _postTextController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecorationFormCreatePost(String hintText, IconData icon) => InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.grey,
      fontSize: 18,
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(width: 4)
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.pink[900], width: 2)
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2)
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2)
    ),
    icon: icon == null ? null : InkWell(
      child: Icon(icon, color: Colors.pink[900]),
    ),
  );

  TextStyle _inputTextStyle() => TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );


  Widget _createPostForm() => Padding(
    padding: EdgeInsets.only(right: 32, left: 32),
    child: Form(
      key: _formCreatePost,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _postTextController,
            decoration: _inputDecorationFormCreatePost('Post...', Icons.event_note),
            style: _inputTextStyle(),
            keyboardType: TextInputType.multiline,
            maxLines: 20,
            minLines: 1,
            maxLength: 2000,
            validator: (value) => emptyValidator(value, 'texto'),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    ),
  );

  Widget _formButtons(Function createPost, Function refreshPosts) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      ButtonTheme(
        height: 36,
        minWidth: 150,
        child: RaisedButton(
          onPressed: () {
            if(_formCreatePost.currentState.validate())
              createPost(_postTextController.text);
            Navigator.of(context).pop();
          },
          textColor: Colors.white,
          color: Colors.pink[900],
          padding: const EdgeInsets.all(0.0),
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          child: Text(
            'CRIAR POST',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)            
          ),
        ),
      ),
      SizedBox(width: 32),
    ],
  );
  
  

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CreatePostPageModel>(
      converter: (store) => CreatePostPageModel.fromStore(store),
      builder: (context, createPostPageModel) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.pink[900],
            title: Text('Create Post', style: TextStyle(fontSize: 24, color: Colors.white)),
          ),
          body: ScrollConfiguration(
            behavior: ListWithoutGlow(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 32),
                  _createPostForm(),
                  SizedBox(height: 32),
                  _formButtons(createPostPageModel.createPost, createPostPageModel.refreshPosts),
                ],
              ),
            ),
          )
        );
      },
    );
  }

}
