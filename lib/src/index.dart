// ignore_for_file: lines_longer_than_80_chars, use_build_context_synchronously, inference_failure_on_instance_creation

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:venetiktok/src/router.dart';
import 'package:venetiktok/src/routes/shell_branches.dart';
import 'package:venetiktok/src/variables/variables.dart';

/// {@template index_page}
/// The index page of the app. This page is responsible for displaying the
/// scaffold with the bottom navigation bar.
/// {@endtemplate}
class IndexNavigationPage extends StatelessWidget {
  /// {@macro index_page}
  const IndexNavigationPage({
    required this.child,
    required this.routerState,
    this.scaffoldKey,
    super.key,
  });

  final StatefulNavigationShell child;
  final GoRouterState routerState;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AppRouter.rootScaffoldKey,
      body: child,
      bottomNavigationBar: bottomBarVisibility()
          ? const SizedBox.shrink()
          : Container(
              height: 70,
              decoration: BoxDecoration(
                color: ColorValues.bgPrimary(context),
              ),
              child: BottomNavigationBar(
                currentIndex: child.currentIndex,
                items: AppShellBranch.values
                    .map(
                      (e) => BottomNavigationBarItem(
                        label: e.title(context),
                        icon: e.icon(
                          context: context,
                          isSelected: child.currentIndex == e.index,
                        ),
                      ),
                    )
                    .toList(),
                onTap: onTap,
              ),
            ),
    );
  }

  void onTap(int i) {
    final currentIndex = AppShellBranch.indexFromName(
      routerState.fullPath?.split('/')[1] ?? '',
    );

    /// If the current index is the same as the tapped index,
    /// navigate back to the root of the current branch.
    ///
    /// This is the expected behavior from apps in both iOS and
    /// Android.
    if (currentIndex == i) {
      return child.goBranch(i, initialLocation: true);
    }
    return child.goBranch(i);
  }

  bool bottomBarVisibility() {
    final bannedList = []; // TODO refactor this list in a util class
    for (final i in bannedList) {
      if (routerState.uri.toString().contains(i)) {
        return true;
      }
    }
    return false;
  }
}
