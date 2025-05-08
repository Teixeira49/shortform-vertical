//TODO: Add
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import '../indexes/notifications_index.dart';
// import '../branches/base_branch.dart';
// import '../shell_branches.dart';

// class NotificationsShellBranch implements AppBaseShellBranch {
//   NotificationsShellBranch() : navigatorKey = GlobalKey<NavigatorState>();

//   @override
//   StatefulShellBranch get branch => StatefulShellBranch(
//         initialLocation: AppShellBranch.notifications.path,
//         navigatorKey: navigatorKey,
//         routes: routes,
//       );

//   @override
//   GlobalKey<NavigatorState> navigatorKey;

//   @override
//   List<RouteBase> get routes => <RouteBase>[
//         GoRoute(
//           name: AppShellBranch.notifications.routeName,
//           path: AppShellBranch.notifications.path,
//           pageBuilder: (_, __) =>
//               const NoTransitionPage(child: IndexNotifications()),
//         ),
//       ];

//   @override
//   List<RouteBase> rootRoutes(GlobalKey<NavigatorState> rootNavigatorKey) {
//     // TODO: implement getRootRoutes
//     throw UnimplementedError();
//   }
// }