import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuto_flutter_bloc/shared/themes.dart';

import 'app_routes.dart';
import 'features/theme/blocs/theme_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (BuildContext context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            title: 'My App',
            theme: _buildThemeData(state),
          );
        },
      ),
    );
  }

  ThemeData _buildThemeData(ThemeState state) {
    return state.theme.themeData;
  }
}
