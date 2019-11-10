
import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/pages/home-page/posts-list-page/post-detalhe-page/+state/post-detalhe-page-actions.dart';
import 'package:redux/redux.dart';

class PostDetalhePageModel{

  final bool isLoading;
  final dynamic post;
  final List comentarios;
  final int userId;
  final Function(dynamic post) likePost;
  final Function(dynamic post) dislikePost;
  final Function(dynamic post, String texto) createComentario;

  PostDetalhePageModel({
    this.isLoading,
    this.post,
    this.comentarios,
    this.userId,
    this.likePost,
    this.dislikePost,
    this.createComentario,
  });

  static PostDetalhePageModel fromStore(Store<AppState> store) =>
    new PostDetalhePageModel(
      isLoading: store.state.postDetalhePageState.isLoading,
      post: store.state.postDetalhePageState.post,
      comentarios: store.state.postDetalhePageState.comentarios,
      userId: store.state.loginPageState.user.id,
      likePost: (dynamic post) => store.dispatch(new LikePost(post)),
      dislikePost: (dynamic post) => store.dispatch(new DislikePost(post)),
      createComentario: (dynamic post, String texto) => store.dispatch(new CreateComentario(post, texto)),
    );

}
