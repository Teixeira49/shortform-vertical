import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:venetiktok/src/routes/branches/base_branch.dart';
import 'package:venetiktok/src/routes/indexes/stamps_index.dart';
import 'package:venetiktok/src/routes/shell_branches.dart';

class StampsShellBranch implements AppBaseShellBranch {
  StampsShellBranch() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  StatefulShellBranch get branch => StatefulShellBranch(
        initialLocation: AppShellBranch.stamps.path,
        navigatorKey: navigatorKey,
        routes: routes,
      );

  @override
  GlobalKey<NavigatorState> navigatorKey;

  @override
  List<RouteBase> get routes => <RouteBase>[
        GoRoute(
          name: AppShellBranch.stamps.routeName,
          path: AppShellBranch.stamps.path,
          pageBuilder: (_, __) => const NoTransitionPage(child: IndexStamps()),
        ),
      ];

  @override
  List<RouteBase> rootRoutes(GlobalKey<NavigatorState> rootNavigatorKey) {
    return [];
  }
}
