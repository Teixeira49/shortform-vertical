import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:venetiktok/src/routes/branches/base_branch.dart';
import 'package:venetiktok/src/routes/indexes/home_index.dart';
import 'package:venetiktok/src/routes/shell_branches.dart';

class HomeShellBranch implements AppBaseShellBranch {
  HomeShellBranch() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  StatefulShellBranch get branch => StatefulShellBranch(
        initialLocation: AppShellBranch.home.path,
        navigatorKey: navigatorKey,
        routes: routes,
      );

  @override
  GlobalKey<NavigatorState> navigatorKey;

  @override
  List<RouteBase> get routes => <RouteBase>[
        GoRoute(
          name: AppShellBranch.home.routeName,
          path: AppShellBranch.home.path,
          pageBuilder: (_, __) => const NoTransitionPage(child: IndexHome()),
          //routes: [], Try to add rewards route again here
        ),
      ];

  @override
  List<RouteBase> rootRoutes(GlobalKey<NavigatorState> rootNavigatorKey) {
    return [];
  }
}
