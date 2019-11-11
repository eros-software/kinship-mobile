import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kinship_mobile/models/usuario.dart';
class DrawerWidget extends StatelessWidget {
  final dynamic logoutAction; 
  final Usuario user;

  const DrawerWidget({
    Key key,
    this.logoutAction,
    this.user,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 48),
                Row(
                  children: <Widget>[
                    SizedBox(width: 16),
                    Card(
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: CachedNetworkImageProvider(user.fotoPerfil),
                      ),
                      elevation: 18.0,
                      shape: CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          user.nome,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.pink[900],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(),
          ),
          InkWell(
            child: Row(
              children: <Widget>[
                SizedBox(width: 16),
                Icon(Icons.exit_to_app, size: 28, color: Colors.black,),
                SizedBox(width: 16),
                Text('Sair', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            onTap: () => logoutAction(),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}