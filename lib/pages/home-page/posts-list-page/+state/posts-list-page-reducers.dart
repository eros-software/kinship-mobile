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
  TypedReducer<PostsListPageState, LikePost>(_likePost),
  TypedReducer<PostsListPageState, LikePostSuccess>(_likePostSuccess),
  TypedReducer<PostsListPageState, DislikePost>(_dislikePost),
  TypedReducer<PostsListPageState, DislikePostSuccess>(_dislikePostSuccess),
]);

PostsListPageState _loadPosts(PostsListPageState state, LoadPosts action) => state;

PostsListPageState _loadPostsSuccess(PostsListPageState state, LoadPostsSuccess action) => state.copyWith(posts: action.posts, offset: state.offset + 5, firstBuild: false);

PostsListPageState _getMorePosts(PostsListPageState state, GetMorePosts action) => state;

PostsListPageState _getMorePostsSuccess(PostsListPageState state, GetMorePostsSuccess action) {
  final List newPostList = List<Map<String, dynamic>>.from(state.posts);
  newPostList.addAll(action.posts);
  return state.copyWith(posts: newPostList, offset: state.offset + 5);
}

PostsListPageState _refreshPosts(PostsListPageState state, RefreshPosts action) => state;

PostsListPageState _refreshPostsSuccess(PostsListPageState state, RefreshPostsSuccess action) => state.copyWith(posts: action.posts, offset: 5);

PostsListPageState _likePost(PostsListPageState state, LikePost action) => state;

PostsListPageState _likePostSuccess(PostsListPageState state, LikePostSuccess action) {
  final List<dynamic> listPosts = List<Map<String, dynamic>>.from(state.posts);
  final dynamic newPost = Map.from(action.post);
  newPost['likes'].insert(0, { 'id_usuario': action.userId });
  final int index = listPosts.indexOf(action.post);
  listPosts.removeAt(index);
  listPosts.insert(index, newPost);
  return state.copyWith(posts: listPosts);
}

PostsListPageState _dislikePost(PostsListPageState state, DislikePost action) => state;

PostsListPageState _dislikePostSuccess(PostsListPageState state, DislikePostSuccess action) {
  final List<dynamic> listPosts = List<Map<String, dynamic>>.from(state.posts);
  final dynamic newPost = Map.from(action.post); 
  newPost['likes'].removeWhere((like) => like['id_usuario'] == action.userId);
  final int index = listPosts.indexOf(action.post);
  listPosts.removeAt(index);
  listPosts.insert(index, newPost);
  return state.copyWith(posts: listPosts);
}