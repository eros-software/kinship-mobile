import 'package:kinship_mobile/graphql/graphql.dart';
import 'package:kinship_mobile/keys.dart';
import 'package:kinship_mobile/models/chat-arguments.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/post-detalhe-page/+state/post-detalhe-page-actions.dart';
import 'package:redux/redux.dart';

class PostDetalhePageMiddleware extends MiddlewareClass {
  String getPostQuery =
  """
  query getPost(\$id: Int!) {
    getPost(id: \$id) {
      code
      data {
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
  """.replaceAll('\n', ' ');

  String getPostComentarios =
  """
  query getPostComentarios(\$id_post: Int!) {
    getPostComentarios(id_post: \$id_post) {
      code
      data {
        texto
        usuario {
          id
          nome
          foto_perfil
        }
      }
    }
  }
  """.replaceAll('\n', ' ');

  String getUniqueChat =
  """
  query getUniqueChat(\$id_post: Int!, \$id_criador: Int!, \$id_receptor: Int!) {
    getUniqueChat(id_post: \$id_post, id_criador: \$id_criador, id_receptor: \$id_receptor) {
      code
      chat {
        id
      }
    }
  }
  """.replaceAll('\n', ' ');

  String createChat = 
  """
  mutation createChat(\$id_post: Int!, \$id_criador: Int!, \$id_receptor: Int!) {
    createChat(id_post: \$id_post, id_criador: \$id_criador, id_receptor: \$id_receptor) {
      code
      message
      chat {
        id
      }
    }
  }
  """.replaceAll('\n', ' ');

  String createComentarioPostMutation = 
  """
  mutation createComentarioPost(\$id_post: Int!, \$texto: String! ) {
    createComentarioPost(id_post: \$id_post, texto: \$texto) {
      code
      message
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

    if (action is LoadPost) {
      try {
        final getPostResponse = await query(
          getPostQuery,
          variables: {
            'id': action.postId,
          }
        );
        final getComentariosresponse = await query(
          getPostComentarios,
          variables: {
            'id_post': action.postId,
          }
        );
        store.dispatch(new LoadPostSuccess(getPostResponse['getPost']['data'], getComentariosresponse['getPostComentarios']['data']));
      } catch (e) {
        print(e);
      }
    }

    if (action is LoadPostSuccess) {

    }

    if (action is CreateComentario) {
      try {
        await mutation(
          createComentarioPostMutation,
          variables: {
            'id_post': action.post['id'],
            'texto': action.texto,
          }
        );
        store.dispatch(new CreateComentarioSuccess(store.state.loginPageState.user, action.texto));
      } catch(e) {
        print(e);
      }
    }
  
    if(action is CreateComentarioSuccess) {

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

    if(action is GetChat) {
      final getChatResponse = await query(
        getUniqueChat,
        variables: {
          'id_post': store.state.postDetalhePageState.post['id'],
          'id_criador': action.userId,
          'id_receptor': action.receptorId,
        }
      );
      (getChatResponse['getUniqueChat']['chat']['id'] != null)
        ? store.dispatch(new GetChatSuccess(getChatResponse['getUniqueChat']['chat']))
        : store.dispatch(new CreateChat(action.receptorId, action.userId));
    }

    if(action is GetChatSuccess) {
      Keys.navKey.currentState.pushNamed(
        'chat-detalhe-page',
        arguments: ChatArguments(action.chat)
      );
    }

    if(action is CreateChat) {
      final createChatResponse = await mutation(
        createChat,
        variables: {
          'id_post': store.state.postDetalhePageState.post['id'],
          'id_criador': action.userId,
          'id_receptor': action.receptorId,
        }
      );
      store.dispatch(new CreateChatSuccess(createChatResponse['createChat']['chat']));
    }

    if(action is CreateChatSuccess) {
      Keys.navKey.currentState.pushNamed(
        'chat-detalhe-page',
        arguments: ChatArguments(action.chat)
      );
    }
    
    next(action);

  }
}