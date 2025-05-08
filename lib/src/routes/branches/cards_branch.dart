import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:venetiktok/src/routes/branches/base_branch.dart';
import 'package:venetiktok/src/routes/indexes/cards_index.dart';
import 'package:venetiktok/src/routes/shell_branches.dart';

class CardsShellBranch implements AppBaseShellBranch {
  CardsShellBranch() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  StatefulShellBranch get branch => StatefulShellBranch(
        initialLocation: AppShellBranch.cards.path,
        navigatorKey: navigatorKey,
        routes: routes,
      );

  @override
  GlobalKey<NavigatorState> navigatorKey;

  @override
  List<RouteBase> get routes => <RouteBase>[
        GoRoute(
          name: AppShellBranch.cards.routeName,
          path: AppShellBranch.cards.path,
          pageBuilder: (_, __) =>
              NoTransitionPage(key: UniqueKey(), child: const IndexCards()),
        ),
      ];

  @override
  List<RouteBase> rootRoutes(GlobalKey<NavigatorState> rootNavigatorKey) {
    return [];
  }
}
