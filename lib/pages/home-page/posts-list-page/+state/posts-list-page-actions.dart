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

