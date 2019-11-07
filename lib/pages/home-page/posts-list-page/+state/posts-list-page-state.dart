import 'package:meta/meta.dart';

@immutable
class PostsListPageState{

  final List posts;
  final int offset;
  final bool firstBuild;

  PostsListPageState({
    @required this.posts,
    @required this.offset,
    @required this.firstBuild,
  });

  factory PostsListPageState.initial(){
    return new PostsListPageState(
      posts: null,
      offset: 0,
      firstBuild: true,
    );
  }

  PostsListPageState copyWith({
    posts,
    total,
    offset,
    firstBuild,
  }) {
    return new PostsListPageState(
      posts: posts ?? this.posts,
      offset: offset ?? this.offset,
      firstBuild: firstBuild ?? this.firstBuild,
    );
  }
}