import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../shared/themes.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitial()) {
    on<ChangeThemeEvent>((ChangeThemeEvent event, Emitter<ThemeState> emit) {
      emit(ThemeState(event.theme));
    });
  }
}
