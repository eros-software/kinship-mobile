import 'package:kinship_mobile/graphql/graphql.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/+state/posts-list-page-actions.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/create-post-page/+state/create-post-page-actions.dart';
import 'package:redux/redux.dart';


class CreatePostPageMiddleware extends MiddlewareClass {
  String createPostMutation =
  """
    mutation createPost(\$createPostInput: CreatePostInput){
      createPost(createPostInput: \$createPostInput) {
        code
        data {
          id
        }
      }
    }
  """.replaceAll('\n', ' ');

  @override
  Future call(Store store, action, NextDispatcher next) async {
    if(action is CreatePost) {
      try {
        await mutation(
          createPostMutation,
          variables: {
            'createPostInput': {
              'texto': action.postText,
            } 
          },
        );
        store.dispatch(CreatePostSuccess());
      } catch(e) {
        print(e);
      }
    }

    if(action is CreatePostSuccess) {
      store.dispatch(new RefreshPosts());
    }

    next(action);
  }
}

