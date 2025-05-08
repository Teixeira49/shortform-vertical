import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:venetiktok/src/routes/indexes/commerce_index.dart';
import 'package:venetiktok/src/routes/branches/base_branch.dart';
import 'package:venetiktok/src/routes/shell_branches.dart';

class CommerceShellBranch implements AppBaseShellBranch {
  CommerceShellBranch() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  StatefulShellBranch get branch => StatefulShellBranch(
        initialLocation: AppShellBranch.commerce.path,
        navigatorKey: navigatorKey,
        routes: routes,
      );

  @override
  GlobalKey<NavigatorState> navigatorKey;

  @override
  List<RouteBase> get routes => <RouteBase>[
        GoRoute(
          name: AppShellBranch.commerce.routeName,
          path: AppShellBranch.commerce.path,
          pageBuilder: (_, __) =>
              const NoTransitionPage(child: IndexCommerce()),
          //routes: [], Try to add commerce details route again here
        ),
      ];

  @override
  List<RouteBase> rootRoutes(GlobalKey<NavigatorState> rootNavigatorKey) {
    return [];
  }
}
