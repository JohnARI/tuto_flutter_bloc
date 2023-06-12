part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final AppTheme theme;

  const ThemeState(this.theme);

  @override
  List<Object> get props => <Object>[theme];
}

class ThemeInitial extends ThemeState {
  const ThemeInitial() : super(AppTheme.lightGreen);
}
