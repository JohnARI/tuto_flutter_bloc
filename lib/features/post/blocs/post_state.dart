part of 'post_bloc.dart';

///! Cette classe est la classe mère de tous les états de la feature
///! On y mettra tous les états liés à la feature
abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => <Object>[];
}

///! Cette classe permet de gérer les états liés aux actions
///! On y mettra tous les états liés aux actions
abstract class PostActionState extends PostState {}

class PostInitial extends PostState {}

class PostFetchingLoadingState extends PostState {}

class PostFetchingErrorState extends PostState {}

class PostFetchingSuccessfulState extends PostState {
  final List<Post> posts;
  const PostFetchingSuccessfulState({
    required this.posts,
  });
}

class PostCreateSuccessState extends PostActionState {
  final int postAdditionSuccessStateId;

  PostCreateSuccessState({required this.postAdditionSuccessStateId});

  @override
  List<Object> get props => <Object>[postAdditionSuccessStateId];
}

class PostCreateErrorState extends PostActionState {}

class PostLoadMoreSuccessState extends PostActionState {
  final List<Post> posts;
  PostLoadMoreSuccessState({
    required this.posts,
  });
}

class PostLoadMoreErrorState extends PostActionState {}

class PostLoadMoreEndState extends PostActionState {
  final List<Post> posts;

  PostLoadMoreEndState({required this.posts});

  @override
  List<Object> get props => <Object>[posts];
}

class PostNavigateThemeActionState extends PostActionState {
  // Puisque Equatable vérifie l'égalité entre les objets, on doit initialiser la navigation avec un timestamp pour que l'état soit différent à chaque fois
  final int postNavigateThemeActionStateId;

  PostNavigateThemeActionState({required this.postNavigateThemeActionStateId});

  @override
  List<Object> get props => <Object>[postNavigateThemeActionStateId];
}
