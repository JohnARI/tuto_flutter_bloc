part of 'post_bloc.dart';

///! Cette classe est la classe mère de tous les événements de la feature
///! Elle permet de gérer les changements d'état du bloc
///! On y mettra tous les événements liés à la feature
abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => <Object>[];
}


class PostInitialFetchEvent extends PostEvent{}


class PostAddEvent extends PostEvent{
  final int postAddEventId;
  final String title;
  final String body;

  const PostAddEvent({required this.postAddEventId, required this.title, required this.body});

  @override
  List<Object> get props => <Object>[postAddEventId];
}

class PostLoadMoreEvent extends PostEvent {}

class PostNavigateThemeEvent extends PostEvent {
  final int postNavigateThemeEventId;

  const PostNavigateThemeEvent({required this.postNavigateThemeEventId});

  @override
  List<Object> get props => <Object>[postNavigateThemeEventId];
}