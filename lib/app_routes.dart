import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/post/page/post_page.dart';
import 'features/theme/pages/theme_page.dart';
import 'pages/error/error_page.dart';
import 'shared/constants.dart';

//Shell route pour garder un élément de navigation

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      name: AppRouteConstants.postRouteName,
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const PostPage(),
    ),
    GoRoute(
      name: AppRouteConstants.themeRouteName,
      path: '/theme',
      builder: (BuildContext context, GoRouterState state) => const ThemePage(),
    ),
  ],
  errorPageBuilder: (BuildContext context, GoRouterState state) {
    return const MaterialPage<dynamic>(child: ErrorPage());
  },
);
