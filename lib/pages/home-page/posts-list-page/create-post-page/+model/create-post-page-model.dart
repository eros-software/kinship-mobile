
import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/create-post-page/+state/create-post-page-actions.dart';
import 'package:redux/redux.dart';

class CreatePostPageModel{

  final Function(String postText) createPost;
  final Function() refreshPosts;

  CreatePostPageModel({
    this.createPost,
    this.refreshPosts,
  });

  static CreatePostPageModel fromStore(Store<AppState> store) =>
    new CreatePostPageModel(
      createPost: (String postText) => store.dispatch(new CreatePost(postText)),
      refreshPosts: () => store.dispatch(new CreatePostSuccess()),
    );

}
