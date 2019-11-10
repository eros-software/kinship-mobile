import 'package:meta/meta.dart';

@immutable
class PostDetalhePageState{

  final dynamic post;
  final List comentarios;
  final bool isLoading;

  PostDetalhePageState({
    @required this.post,
    @required this.isLoading,
    @required this.comentarios,
  });

  factory PostDetalhePageState.initial(){
    return new PostDetalhePageState(
      post: null,
      isLoading: true,
      comentarios: null,
    );
  }

  PostDetalhePageState copyWith({
    post,
    isLoading,
    comentarios,
  }) {
    return new PostDetalhePageState(
      post: post ?? this.post,
      isLoading: isLoading ?? this.isLoading,
      comentarios: comentarios ?? this.comentarios,
    );
  }
}