import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/models/page.dart';
import 'package:kinship_mobile/pages/home-page/+model/home-page-model.dart';
import 'package:kinship_mobile/pages/home-page/+state/home-page-actions.dart';
import 'package:kinship_mobile/pages/home-page/activities-list-page/activities-list-page.dart';
import 'package:kinship_mobile/pages/home-page/chats-list-page/chats-list-page.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/posts-list-page.dart';

class HomePage extends StatefulWidget  {
  static String tag = 'home-page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final List<Page> _pages = <Page>[
    Page(
      index: 0,
      title: 'ACTIVITIES',
      widget: ActivitiesListPage(),
    ),
    Page(
      index: 1,
      title: 'POSTS',
      widget: PostsListPage(),
    ),
    Page(
      index: 2,
      title: 'CHATS',
      widget: ChatsListPage(),
    ),
  ];


  Iterable<Tab> _tabBarItens() => _pages.map((page) => Tab(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: AutoSizeText(
            page.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  ));


  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageModel>(
      distinct: true,
      converter: (store) => HomePageModel.fromStore(store),
      onInit: (store) => store.dispatch(new InitTabController(new TabController(length: _pages.length, vsync: this, initialIndex: 1))),
      onDispose: (store) {
        store.dispatch(new DisposeTabController());
      },
      builder: (context, homePageModel) {
        return Scaffold(
          drawer: Text('drawer'),
          appBar: AppBar(
            backgroundColor: Colors.pink[900],
            title: Text(
              'Kinship',
              style: TextStyle(
                fontFamily: 'DancingScript',
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            bottom: TabBar(
              labelPadding: EdgeInsets.all(0),
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              controller: homePageModel.tabController,
              onTap: (index) => homePageModel.selectPage(index),
              labelStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
              unselectedLabelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
              ),
              tabs: [..._tabBarItens()],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: homePageModel.tabController,
            children: _pages.map((Page page) {
              return page.widget;
            }).toList(),
          ),
        );
      }
    );
  }
}
