import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PostCardWidget extends StatelessWidget {
  final Map<String, dynamic> post;
  const PostCardWidget({
    Key key,
    @required this.post,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: AutoSizeText(
                  post['usuario']['nome'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  minFontSize: 20,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: <Widget>[
              Expanded(
                child: AutoSizeText(
                  post['texto'],
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  minFontSize: 16,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}