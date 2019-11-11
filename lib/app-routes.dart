import 'package:flutter/widgets.dart';
import 'package:kinship_mobile/pages/home-page/chats-list-page/chat-detalhe-page/chat-detalhe-page.dart';
import 'package:kinship_mobile/pages/home-page/home-page.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/create-post-page/create-post-page.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/post-detalhe-page/post-detalhe-page.dart';
import 'package:kinship_mobile/pages/introduction-page/introduction-page.dart';
import 'package:kinship_mobile/pages/login-page/login-page.dart';

final appRoutes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    IntroductionPage.tag: (context) => IntroductionPage(),
    CreatePostPage.tag: (context) => CreatePostPage(),
    PostDetalhePage.tag: (context) => PostDetalhePage(),
    ChatDetalhePage.tag: (context) => ChatDetalhePage(),
};
