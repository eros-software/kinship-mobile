import 'package:kinship_mobile/graphql/graphql.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/+state/posts-list-page-actions.dart';
import 'package:redux/redux.dart';

class PostsListPageMiddleware extends MiddlewareClass {
  String getAllPostsQuery =
  """
  query getAllPosts(\$limit: Int!, \$offset: Int!) {
    getAllPosts(limit: \$limit, offset: \$offset) {
      code
      data {
        list {
          texto
          id
          usuario {
            id
            nome
          }
          likes {
            id_usuario
          }
        }
      }
    }
  }
  """.replaceAll('\n', ' ');

  String likePost = 
  """
  mutation likePost(\$id_post: Int!) {
    likePost(id_post: \$id_post) {
      code
      message
    }
  }
  """.replaceAll('\n', ' ');

  String dislikePost = 
  """
  mutation dislikePost(\$id_post: Int!) {
    dislikePost(id_post: \$id_post) {
      code
      message
    }
  }
  """.replaceAll('\n', ' ');

  @override
  Future call(Store store, action, NextDispatcher next) async {

    if (action is LoadPosts) {
      try {
        final response = await query(
          getAllPostsQuery,
          variables: {
            'limit': 10,
            'offset': store.state.postsListPageState.offset,
          }
        );
        store.dispatch(new LoadPostsSuccess(List<Map<String,dynamic>>.from(response['getAllPosts']['data']['list'])));
      } catch (e) {
        print(e);
      }
    }

    if (action is LoadPostsSuccess) {

    }

    if (action is GetMorePosts) {
      try {
        final response = await query(
          getAllPostsQuery,
          variables: {
            'limit': 10,
            'offset': store.state.postsListPageState.offset,
          }
        );
        store.dispatch(new GetMorePostsSuccess(List<Map<String,dynamic>>.from(response['getAllPosts']['data']['list'])));
      } catch (e) {
        print(e);
      }
    }

    if (action is GetMorePostsSuccess) {

    }


    if (action is RefreshPosts) {
      try {
        final response = await query(
          getAllPostsQuery,
          variables: {
            'limit': 10,
            'offset': 0,
          }
        );
        store.dispatch(new RefreshPostsSuccess(List<Map<String,dynamic>>.from(response['getAllPosts']['data']['list'])));
      } catch (e) {
        print(e);
      }
    }

    if (action is RefreshPostsSuccess) {

    }

    if (action is LikePost) {
      try {
        await mutation(
          likePost,
          variables: {
            'id_post': action.post['id'],
          }
        );
        store.dispatch(new LikePostSuccess(action.post, store.state.loginPageState.user.id));
      } catch(e) {
        print(e);
      }
    }
  
    if(action is LikePostSuccess) {

    }

    if (action is DislikePost) {
      try {
        await mutation(
          dislikePost,
          variables: {
            'id_post': action.post['id'],
          }
        );
        store.dispatch(new DislikePostSuccess(action.post, store.state.loginPageState.user.id));
      } catch(e) {
        print(e);
      }
    }

    if(action is DislikePostSuccess) {
      
    }
    
    next(action);

  }
}