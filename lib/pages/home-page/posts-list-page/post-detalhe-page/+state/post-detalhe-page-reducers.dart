import 'package:kinship_mobile/pages/home-page/posts-list-page/post-detalhe-page/+state/post-detalhe-page-actions.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/post-detalhe-page/+state/post-detalhe-page-state.dart';
import 'package:redux/redux.dart';

final postDetalhePageReducers = combineReducers<PostDetalhePageState>([
  TypedReducer<PostDetalhePageState, LoadPost>(_loadPost),
  TypedReducer<PostDetalhePageState, LoadPostSuccess>(_loadPostSuccess),
  TypedReducer<PostDetalhePageState, CreateComentario>(_createComentario),
  TypedReducer<PostDetalhePageState, CreateComentarioSuccess>(__createComentarioSuccess),
  TypedReducer<PostDetalhePageState, DisposePostDetalhePage>(_disposePostDetalhePage),
  TypedReducer<PostDetalhePageState, LikePost>(_likePost),
  TypedReducer<PostDetalhePageState, LikePostSuccess>(_likePostSuccess),
  TypedReducer<PostDetalhePageState, DislikePost>(_dislikePost),
  TypedReducer<PostDetalhePageState, DislikePostSuccess>(_dislikePostSuccess),
]);

PostDetalhePageState _loadPost(PostDetalhePageState state, LoadPost action) => state;

PostDetalhePageState _loadPostSuccess(PostDetalhePageState state, LoadPostSuccess action) => state.copyWith(post: action.post, isLoading: false, comentarios: action.comentarios);

PostDetalhePageState _createComentario(PostDetalhePageState state, CreateComentario action) => state;

PostDetalhePageState __createComentarioSuccess(PostDetalhePageState state, CreateComentarioSuccess action) {
  final dynamic newComentarios = List<Map<String, dynamic>>.from(state.comentarios);
  final Map<String,dynamic> newComentario = Map<String,dynamic>.from(
    {
      'usuario': {
        'id': action.user.id,
        'nome': action.user.nome,
        'foto_perfil': action.user.fotoPerfil,
      },
      'texto': action.texto 
    }
  );
  newComentarios.insert(newComentarios.length, newComentario);
  return state.copyWith(comentarios: newComentarios);
}

PostDetalhePageState _disposePostDetalhePage(PostDetalhePageState state, DisposePostDetalhePage action) => PostDetalhePageState.initial();

PostDetalhePageState _likePost(PostDetalhePageState state, LikePost action) => state;

PostDetalhePageState _likePostSuccess(PostDetalhePageState state, LikePostSuccess action) {
  final dynamic newPost = Map<String, dynamic>.from(action.post);
  newPost['likes'].insert(0, { 'id_usuario': action.userId });
  return state.copyWith(post: newPost);
}

PostDetalhePageState _dislikePost(PostDetalhePageState state, DislikePost action) => state;

PostDetalhePageState _dislikePostSuccess(PostDetalhePageState state, DislikePostSuccess action) {
  final dynamic newPost = Map<String, dynamic>.from(action.post); 
  newPost['likes'].removeWhere((like) => like['id_usuario'] == action.userId);
  return state.copyWith(post: newPost);
}
