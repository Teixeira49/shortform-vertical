import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../modules/profile/presentation/profile_info/page/profile_info_page.dart';
import '../indexes/profile_index.dart';
import '../branches/base_branch.dart';
import '../shell_branches.dart';

class ProfileShellBranch implements AppBaseShellBranch {
  ProfileShellBranch() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  StatefulShellBranch get branch => StatefulShellBranch(
        initialLocation: AppShellBranch.profile.path,
        navigatorKey: navigatorKey,
        routes: routes,
      );

  @override
  GlobalKey<NavigatorState> navigatorKey;

  @override
  List<RouteBase> get routes => <RouteBase>[
        GoRoute(
          name: AppShellBranch.profile.routeName,
          path: AppShellBranch.profile.path,
          pageBuilder: (_, __) => const NoTransitionPage(child: IndexProfile()),
        ),
      ];

  @override
  List<RouteBase> rootRoutes(GlobalKey<NavigatorState> rootNavigatorKey) {
    return [
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: ProfilePage.path,
        name: ProfilePage.routeName,
        builder: (context, state) {
          return const ProfilePage();
        },
      ),
    ];
  }
}
