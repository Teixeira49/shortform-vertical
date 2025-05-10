import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:venetiktok/src/routes/branches/base_branch.dart';
import 'package:venetiktok/src/routes/indexes/search_index.dart';
import 'package:venetiktok/src/routes/shell_branches.dart';

class SearchShellBranch implements AppBaseShellBranch {
  SearchShellBranch() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  StatefulShellBranch get branch => StatefulShellBranch(
        initialLocation: AppShellBranch.search.path,
        navigatorKey: navigatorKey,
        routes: routes,
      );

  @override
  GlobalKey<NavigatorState> navigatorKey;

  @override
  List<RouteBase> get routes => <RouteBase>[
        GoRoute(
          name: AppShellBranch.search.routeName,
          path: AppShellBranch.search.path,
          pageBuilder: (_, __) =>
              NoTransitionPage(key: UniqueKey(), child: const IndexSearch()),
        ),
      ];

  @override
  List<RouteBase> rootRoutes(GlobalKey<NavigatorState> rootNavigatorKey) {
    return [];
  }
}
