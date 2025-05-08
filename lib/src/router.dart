// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:venetiktok/src/index.dart';
import 'package:venetiktok/src/modules/auth/presentation/forgot_password/forgot_password.dart';
import 'package:venetiktok/src/modules/auth/presentation/login/login.dart';
import 'package:venetiktok/src/modules/auth/presentation/sign_up/sign_up.dart';
import 'package:venetiktok/src/modules/auth/presentation/splash/splash.dart';
import 'package:venetiktok/src/modules/commerce/presentation/commerce_detail/commerce_detail.dart';
import 'package:venetiktok/src/modules/home/presentation/new_rewards/view/new_rewards_page.dart';
import 'package:venetiktok/src/navigation_controller.dart';
import 'package:venetiktok/src/navigator_observer.dart';
import 'package:venetiktok/src/routes/branches/cards_branch.dart';
import 'package:venetiktok/src/routes/branches/commerce_branch.dart';
import 'package:venetiktok/src/routes/branches/home_branch.dart';
import 'package:venetiktok/src/routes/branches/profile_branch.dart';
import 'package:venetiktok/src/routes/branches/stamps_branch.dart';
import 'package:venetiktok/src/routes/shell_branches.dart';
import 'package:venetiktok/src/shared/presentation/success/success.dart';
import 'package:venetiktok/src/shared/widgets/widgets.dart';

/// {@template app_router}
/// The root router for the app. Call [AppRouter.router] to get the router.
/// {@endtemplate}
class AppRouter {
  /// The root navigator key for the app. Use this to navigate from the root
  /// of the router (i.e. out of the bottom navigation bar).
  static final rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root_navigator');

  static final rootScaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'root_scaffold');

  /// The root router for the app. Set [debug] to true to enable debug logging
  /// diagnostics.
  static GoRouter router({bool debug = false}) => GoRouter(
        navigatorKey: rootNavigatorKey,
        debugLogDiagnostics: debug,
        initialLocation: SplashPage.path,
        observers: [
          MyNavigatorObserver(),
        ],
        routes: [
          GoRoute(
            path: SplashPage.path,
            name: SplashPage.routeName,
            builder: (context, state) => BlocListener<SplashBloc, SplashState>(
              listenWhen: (previous, current) =>
                  previous.status != current.status,
              listener: (context, state) async {
                if (state.status.isSuccess) {
                  if (state.isAlreadySignedIn) {
                    context.go(AppShellBranch.values.first.path);
                  } else {
                    context.go(LoginPage.path);
                  }
                }
              },
              child: const SplashPage(),
            ),
          ),
          GoRoute(
            path: LoginPage.path,
            name: LoginPage.routeName,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              transitionDuration: const Duration(milliseconds: 500),
              child: const LoginPage(),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) =>
                  CustomPageTransition(animation: animation, child: child),
            ),
            routes: [
              GoRoute(
                path: ForgotPasswordPage.routeName,
                name: ForgotPasswordPage.routeName,
                builder: (context, state) => const ForgotPasswordPage(),
              ),
            ],
          ),

          /// StatefulShellRoute.indexedStack handles the stack of routes of
          /// the bottom navigation bar.
          StatefulShellRoute.indexedStack(
            parentNavigatorKey: rootNavigatorKey,
            branches: AppStatefulShellBranches.branches,
            builder: (_, routerState, child) {
              // NOTE: Here, you might want to check if the user is authenticated and route to the correct page. By default, we're routing to the index page that handles the bottom navigation bar routing.
              return NavigationController(
                child: IndexNavigationPage(
                  routerState: routerState,
                  child: child,
                ),
              );
            },
          ),

          GoRoute(
            path: SignUpPage.path,
            name: SignUpPage.routeName,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: const SignUpPage(),
                // child: BlocListener<UserBloc, UserState>(
                //   listenWhen: (previous, current) => previous != current,
                //   listener: (context, state) {
                //     if (state is UserAuthenticated) {
                //       context.go(AppShellBranch.values.first.path);
                //     }
                //   },
                //   child: const SignUpPage(),
                // ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        CustomPageTransition(
                  animation: animation,
                  child: child,
                ),
              );
            },
          ),
          GoRoute(
            path: SuccessPage.path,
            name: SuccessPage.routeName,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: SuccessPage(
                params: state.extra! as SuccessPageParams,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      CustomPageTransition(animation: animation, child: child),
            ),
          ),
          GoRoute(
            path: NewRewardsPage.path,
            name: NewRewardsPage.routeName,
            builder: (context, state) {
              return const NewRewardsPage();
            },
          ),
          GoRoute(
            path: CommerceDetailPage.path,
            name: CommerceDetailPage.routeName,
            builder: (context, state) {
              return CommerceDetailPage(
                commerceId: state.extra! as int,
              );
            },
          ),

          ...HomeShellBranch().rootRoutes(rootNavigatorKey),
          ...CardsShellBranch().rootRoutes(rootNavigatorKey),
          ...CommerceShellBranch().rootRoutes(rootNavigatorKey),
          ...ProfileShellBranch().rootRoutes(rootNavigatorKey),
          ...StampsShellBranch().rootRoutes(rootNavigatorKey),
        ],
      );
}
