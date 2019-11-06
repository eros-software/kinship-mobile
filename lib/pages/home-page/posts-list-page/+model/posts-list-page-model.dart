
import 'package:collection/collection.dart';
import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/+state/posts-list-page-actions.dart';
import 'package:redux/redux.dart';

class PostsListPageModel{

  final bool firstBuild;
  final List posts;
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

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is PostsListPageModel &&
          runtimeType == other.runtimeType &&
          firstBuild == other.firstBuild &&
          ListEquality().equals(posts, other.posts) &&
          offset == other.offset;

  @override
  int get hashCode => 
    firstBuild.hashCode ^
    posts.hashCode ^
    offset.hashCode;

  static PostsListPageModel fromStore(Store<AppState> store) =>
    new PostsListPageModel(
      firstBuild: store.state.postsListPageState.firstBuild,
      posts: store.state.postsListPageState.posts,
      offset: store.state.postsListPageState.offset,
      getMorePosts: () => store.dispatch(new GetMorePosts()),
      refreshPosts: () => store.dispatch(new RefreshPosts()),
    );

}
