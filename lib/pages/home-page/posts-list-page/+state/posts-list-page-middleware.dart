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
          comentarios {
            texto
          }
        }
      }
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
    
    next(action);

  }
}