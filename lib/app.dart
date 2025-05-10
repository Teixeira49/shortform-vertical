// ignore_for_file: inference_failure_on_function_invocation, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:venetiktok/l10n/l10n.dart';
import 'package:venetiktok/src/global/core/dependencies/core_dependencies.dart';
import 'package:venetiktok/src/modules/auth/domain/use_cases/get_current_token.dart';
import 'package:venetiktok/src/modules/auth/presentation/splash/bloc/bloc.dart';
import 'package:venetiktok/src/theme/app_theme.dart';
import 'package:venetiktok/src/variables/variables.dart';

class App extends StatelessWidget {
  const App({
    required this.router,
    required this.coreDependencies,
    super.key,
  });

  final GoRouter router;

  final CoreDependencies coreDependencies;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GoRouter.optionURLReflectsImperativeAPIs = true; // TODO Check utility
    return MultiRepositoryProvider(
      providers: [
        ...coreDependencies.repositoryProviders(),
      ],
      child: ResponsiveSizer(
        builder: (_, __, ___) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SplashBloc(
                getCurrentTokenUseCase: GetCurrentTokenUsecase(
                  authRepository: context.read(),
                ),
              ),
            ),
          ],
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Builder(
              builder: (context) {
                final mediaQueryData = MediaQuery.of(context);

                final constrainedTextScaleFactor = mediaQueryData.textScaler
                    .clamp(maxScaleFactor: 1.2, minScaleFactor: 1);
                return MediaQuery(
                  // This is to ensure that the textScaleFactor is always
                  //between 0.5 and 1
                  data: mediaQueryData.copyWith(
                    textScaler: constrainedTextScaleFactor,
                  ),
                  child: MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    title: Constants.appName,
                    theme: AppTheme.theme(context),
                    supportedLocales: AppLocalizations.supportedLocales,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    routerConfig: router,
                    // TODO impl shared preferences and settings screemn
                    locale: const Locale('es'),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
