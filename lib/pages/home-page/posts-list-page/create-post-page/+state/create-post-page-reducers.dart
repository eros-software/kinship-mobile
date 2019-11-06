import 'package:kinship_mobile/pages/home-page/posts-list-page/create-post-page/+state/create-post-page-actions.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/create-post-page/+state/create-post-page-state.dart';
import 'package:redux/redux.dart';

final createPostPageReducers = combineReducers<CreatePostPageState>([
  TypedReducer<CreatePostPageState, CreatePost>(_createPost),
  TypedReducer<CreatePostPageState, CreatePostSuccess>(_createPostSuccess),
]);

CreatePostPageState _createPost(CreatePostPageState state, CreatePost action) => state;

CreatePostPageState _createPostSuccess(CreatePostPageState state, CreatePostSuccess action) => state;
