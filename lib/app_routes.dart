import 'package:firebase_auth_newsApp/pages/code_page.dart';
import 'package:firebase_auth_newsApp/pages/login_page.dart';
import 'package:firebase_auth_newsApp/pages/main_feed.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppRouts {
  GoRouter route = GoRouter(
    initialLocation: '/auth',
    routes: [
      GoRoute(
        path: '/auth',
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginPage());
        },
      ),
      GoRoute(
        path: '/code_page',
        pageBuilder: (context, state) {
          return const MaterialPage(child: CodePage());
        },
      ),
      GoRoute(
        path: '/main_feed',
        pageBuilder: (context, state) {
          return const MaterialPage(child: MainFeed());
        },
      ),
    ],
  );
}
