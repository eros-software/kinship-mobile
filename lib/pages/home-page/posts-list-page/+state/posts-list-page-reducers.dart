import 'package:kinship_mobile/pages/home-page/posts-list-page/+state/posts-list-page-actions.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/+state/posts-list-page-state.dart';
import 'package:redux/redux.dart';

final postsListPageReducers = combineReducers<PostsListPageState>([
  TypedReducer<PostsListPageState, LoadPosts>(_loadPosts),
  TypedReducer<PostsListPageState, LoadPostsSuccess>(_loadPostsSuccess),
  TypedReducer<PostsListPageState, GetMorePosts>(_getMorePosts),
  TypedReducer<PostsListPageState, GetMorePostsSuccess>(_getMorePostsSuccess),
  TypedReducer<PostsListPageState, RefreshPosts>(_refreshPosts),
  TypedReducer<PostsListPageState, RefreshPostsSuccess>(_refreshPostsSuccess),
]);

PostsListPageState _loadPosts(PostsListPageState state, LoadPosts action) => state;

PostsListPageState _loadPostsSuccess(PostsListPageState state, LoadPostsSuccess action) => state.copyWith(posts: action.posts, offset: state.offset + 5, firstBuild: false);

PostsListPageState _getMorePosts(PostsListPageState state, GetMorePosts action) => state;

PostsListPageState _getMorePostsSuccess(PostsListPageState state, GetMorePostsSuccess action) {
  final List newPostList = List.from(state.posts);
  newPostList.addAll(action.posts);
  return state.copyWith(posts: newPostList, offset: state.offset + 5);
}

PostsListPageState _refreshPosts(PostsListPageState state, RefreshPosts action) => state;

PostsListPageState _refreshPostsSuccess(PostsListPageState state, RefreshPostsSuccess action) => state.copyWith(posts: action.posts, offset: 5);