import 'package:alerta_push_app/config/router/routes.dart';
import 'package:alerta_push_app/presentation/screens/home_screen.dart';
import 'package:alerta_push_app/presentation/screens/inicio_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.inicio,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (BuildContext context, GoRouterState state) {
        // final user = state.extra as UserModel;
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: Routes.inicio,
      builder: (BuildContext context, GoRouterState state) {
        return const InicioPage();
      },
    ),
  ],
);
