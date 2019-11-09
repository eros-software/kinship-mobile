
import 'package:collection/collection.dart';
import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/+state/posts-list-page-actions.dart';
import 'package:redux/redux.dart';

class PostsListPageModel{

  final bool firstBuild;
  final List<Map<String, dynamic>> posts;
  final int offset;
  final int userId;
  final Function() getMorePosts;
  final Function() refreshPosts;
  final Function(Map<String, dynamic> post) likePost;
  final Function(Map<String, dynamic> post) dislikePost;

  PostsListPageModel({
    this.firstBuild,
    this.posts,
    this.offset,
    this.userId,
    this.getMorePosts,
    this.refreshPosts,
    this.likePost,
    this.dislikePost,
  });

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is PostsListPageModel &&
          runtimeType == other.runtimeType &&
          firstBuild == other.firstBuild &&
          userId == other.userId &&
          ListEquality<Map<String, dynamic>>().equals(posts, other.posts) &&
          offset == other.offset;

  @override
  int get hashCode => 
    firstBuild.hashCode ^
    posts.hashCode ^
    userId.hashCode ^
    offset.hashCode;

  static PostsListPageModel fromStore(Store<AppState> store) =>
    new PostsListPageModel(
      firstBuild: store.state.postsListPageState.firstBuild,
      posts: store.state.postsListPageState.posts,
      offset: store.state.postsListPageState.offset,
      userId: store.state.loginPageState.user.id,
      getMorePosts: () => store.dispatch(new GetMorePosts()),
      refreshPosts: () => store.dispatch(new RefreshPosts()),
      likePost: (dynamic post) => store.dispatch(new LikePost(post)),
      dislikePost: (dynamic post) => store.dispatch(new DislikePost(post)),
    );

}
