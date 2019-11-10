import 'package:kinship_mobile/models/usuario.dart';

class CreateComentario {
  final dynamic post;
  final String texto;
  CreateComentario(this.post, this.texto);
}

class CreateComentarioSuccess {
  final Usuario user;
  final String texto;
  CreateComentarioSuccess(this.user, this.texto);
}

class LoadPost {
  int postId;
  LoadPost(this.postId);
}

class LoadPostSuccess {
  final dynamic post;
  final List comentarios;
  LoadPostSuccess(this.post, this.comentarios);
}

class DisposePostDetalhePage {
  DisposePostDetalhePage();
}

class LikePost {
  final Map<String, dynamic> post;
  LikePost(this.post);
}

class LikePostSuccess {
  final Map<String, dynamic> post;
  final int userId;
  LikePostSuccess(this.post, this.userId);
}

class DislikePost {
  final Map<String, dynamic> post;
  DislikePost(this.post);
}

class DislikePostSuccess {
  final Map<String, dynamic> post;
  final int userId;
  DislikePostSuccess(this.post, this.userId);
}

