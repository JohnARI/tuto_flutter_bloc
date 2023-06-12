import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tuto_flutter_bloc/features/post/data/repositories/post_repository.dart';

import '../data/models/post.dart';

part 'post_event.dart';
part 'post_state.dart';

///! Le bloc permettant de gérer les événements liés aux posts
///! On précise le type de l'événement et de l'état
///! On précise l'état initial du bloc
///! On implémente les méthodes qui permettent de gérer les changements de l'état
class PostBloc extends Bloc<PostEvent, PostState> {
  late int currentPage;
  late List<Post> posts;
  PostBloc() : super(PostInitial()) {
    currentPage = 1;
    posts = <Post>[];
    on<PostInitialFetchEvent>(_handlePostsInitialFetchEvent);
    on<PostAddEvent>(_handlePostAddEvent);
    on<PostLoadMoreEvent>(_handlePostLoadMoreEvent);
    on<PostNavigateThemeEvent>(_handlePostThemeButtonNavigationEvent);
  }

  FutureOr<void> _handlePostAddEvent(
      PostAddEvent event, Emitter<PostState> emit) async {
    bool success = await PostRepository.createPost(event.title, event.body);

    if (success) {
      emit(PostCreateSuccessState(
          postAdditionSuccessStateId: event.postAddEventId));
    } else {
      emit(PostCreateErrorState());
    }
  }

  FutureOr<void> _handlePostsInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostState> emit) async {
    emit(PostFetchingLoadingState());
    List<Post> posts = await PostRepository.fetchPosts(currentPage);

    emit(PostFetchingSuccessfulState(posts: posts));
  }

  Future<void> _handlePostLoadMoreEvent(
      PostLoadMoreEvent event, Emitter<PostState> emit) async {
    emit(PostFetchingLoadingState());

    try {
      int nextPage = currentPage + 1;
      List<Post> newPosts = await PostRepository.fetchPosts(nextPage);

      if (newPosts.isNotEmpty) {
        currentPage = nextPage;
        posts.addAll(newPosts);
      }

      emit(PostFetchingSuccessfulState(
          posts: List<Post>.from(
              posts))); // Crée une nouvelle instance de la liste des postes pour que le widget puisse détecter le changement
    } catch (e) {
      emit(PostFetchingErrorState());
    }
  }

  FutureOr<void> _handlePostThemeButtonNavigationEvent(
      PostNavigateThemeEvent event, Emitter<PostState> emit) {
    emit(PostNavigateThemeActionState(
        postNavigateThemeActionStateId: DateTime.now().millisecondsSinceEpoch));
  }
}
