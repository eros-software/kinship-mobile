class LoadPosts {
  LoadPosts();
}

class LoadPostsSuccess {
  final List<Map<String, dynamic>> posts;
  LoadPostsSuccess(this.posts);
}

class GetMorePosts {
  GetMorePosts();
}

class GetMorePostsSuccess {
  final List<Map<String, dynamic>> posts;
  GetMorePostsSuccess(this.posts);
}

class RefreshPosts {
  RefreshPosts();
}

class RefreshPostsSuccess {
  final List<Map<String, dynamic>> posts;
  RefreshPostsSuccess(this.posts);
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
