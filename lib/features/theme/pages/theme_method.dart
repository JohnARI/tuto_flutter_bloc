import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/themes.dart';
import '../blocs/theme_bloc.dart';

class ThemeMethod {
  static Widget buildThemeList(BuildContext context) {
    return ListView.builder(
      itemCount: AppTheme.values.length,
      itemBuilder: (BuildContext context, int index) {
        final AppTheme theme = AppTheme.values[index];
        return buildThemeCard(context, theme);
      },
    );
  }

  static Widget buildThemeCard(BuildContext context, AppTheme theme) {
    return Card(
      color: theme.themeData.primaryColor,
      child: ListTile(
        title: Text(theme.toString().split('.').last),
        onTap: () =>
            BlocProvider.of<ThemeBloc>(context).add(ChangeThemeEvent(theme)),
      ),
    );
  }
}
