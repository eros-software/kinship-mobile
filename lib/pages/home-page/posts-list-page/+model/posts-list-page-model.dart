
import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/+state/posts-list-page-actions.dart';
import 'package:redux/redux.dart';

class PostsListPageModel{

  final bool firstBuild;
  final List<Map<String, dynamic>> posts;
  final int offset;
  final Function() getMorePosts;
  final Function() refreshPosts;
  

  PostsListPageModel({
    this.firstBuild,
    this.posts,
    this.offset,
    this.getMorePosts,
    this.refreshPosts,

  });

  static PostsListPageModel fromStore(Store<AppState> store) =>
    new PostsListPageModel(
      firstBuild: store.state.postsListPageState.firstBuild,
      posts: store.state.postsListPageState.posts,
      offset: store.state.postsListPageState.offset,
      getMorePosts: () => store.dispatch(new GetMorePosts()),
      refreshPosts: () => store.dispatch(new RefreshPosts()),
    );

}
