// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:venetiktok/l10n/l10n.dart';
import 'package:venetiktok/src/routes/branches/base_branch.dart';
import 'package:venetiktok/src/routes/branches/search_branch.dart';
import 'package:venetiktok/src/routes/branches/home_branch.dart';
import 'package:venetiktok/src/routes/branches/profile_branch.dart';
import 'package:venetiktok/src/variables/variables.dart';

/// Defines all the branches for the app, including navigator keys for each
/// branch.
///
/// [AppStatefulShellBranches.branches] returns the [StatefulShellBranch] of
/// each [AppShellBranch] value.
///
/// To add a new branch (a new tab in the bottom navigation bar), you
/// must:
///
/// 1. Declare a new entry for [AppShellBranch].
/// 2. Create a implementation of [AppBaseShellBranch] for the new branch.
///
class AppStatefulShellBranches {
  /// The list of [AppShellBranch] for each [AppShellBranch] value.
  static List<StatefulShellBranch> get branches =>
      AppShellBranch.values.map(_branch).toList();

  static StatefulShellBranch _branch(AppShellBranch page) {
    final home = HomeShellBranch();
    final search = SearchShellBranch();
    final profile = ProfileShellBranch();

    switch (page) {
      case AppShellBranch.home:
        return home.branch;
      case AppShellBranch.search:
        return search.branch;
      case AppShellBranch.profile:
        return profile.branch;
    }
  }
}

/// {@template app_branches}
/// Defines all the branches for the app. This is used to build the bottom
/// navigation bar, and declares the route name for each branch, aswell as
/// the title and icon for each branch (tab) in the bottom navigation bar.
///
/// The order of each branch in this enum will be the same order it will be
/// displayed in the bottom navigation bar.
/// {@endtemplate}
enum AppShellBranch {
  home('home'),
  search('search'),
  profile('profile'),
  ;

  /// {@macro app_branches}
  const AppShellBranch(this.routeName);

  /// The name of this branch initial route. Used to set the [GoRoute.name]
  /// parameter.
  final String routeName;

  /// The path to this branch initial route. Used to set the [GoRoute.path]
  /// parameter, aswell as [StatefulShellBranch.initialLocation]
  ///
  /// This is the same as [routeName], but with a leading `/` i.e.:
  /// `/wallet`.
  String get path => '/$routeName';

  /// Returns the localized title for this branch.
  String title(BuildContext context) {
    switch (this) {
      case AppShellBranch.home:
        return context.l10n.homeLabel;
      case AppShellBranch.search:
        return context.l10n.searchLabel;
      case AppShellBranch.profile:
        return context.l10n.profileLabel;
    }
  }

  /// Returns the icon for this branch.
  Widget icon({
    required BuildContext context,
    required bool isSelected,
  }) {
    final colorFilter = ColorFilter.mode(
      isSelected
          ? ColorValues.fgBrandPrimary(context)
          : ColorValues.fgDisabled(context),
      BlendMode.srcIn,
    );

    const size = Constants.defaultBottomNavigationBarIconSize;

    switch (this) {
      case AppShellBranch.home:
        return Icon(
          Icons.home,
          color: isSelected
              ? ColorValues.fgBrandPrimary(context)
              : ColorValues.fgDisabled(context),
          size: size,
        );

      case AppShellBranch.search:
        return Icon(
          Icons.search,
          color: isSelected
              ? ColorValues.fgBrandPrimary(context)
              : ColorValues.fgDisabled(context),
          size: size,);

      case AppShellBranch.profile:
        return Icon(
          Icons.person,
          color: isSelected
              ? ColorValues.fgBrandPrimary(context)
              : ColorValues.fgDisabled(context),
          size: size,
        );
    }
  }

  /// Returns the index of the given `name` from [AppShellBranch.values] list,
  /// by comparing it to the [routeName] of each branch.
  /// ---
  /// #### Note:
  /// `name` must not be a path, it must be the name of the route. For example,
  /// if you want to get the index of the `loans` branch, you must pass
  /// `loans` as the `name` parameter, not `/loans`.
  static int indexFromName(String name) {
    assert(!name.startsWith('/'), 'name cannot be a path');

    final index = AppShellBranch.values.indexWhere(
      (element) => element.routeName == name,
    );

    if (index == -1) {
      return 0;
    }

    return index;
  }
}
