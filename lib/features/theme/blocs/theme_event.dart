part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => <Object>[];
}

class ChangeThemeEvent extends ThemeEvent {
  const ChangeThemeEvent(this.theme);

  final AppTheme theme;

  @override
  List<Object> get props => <Object>[theme];
}
