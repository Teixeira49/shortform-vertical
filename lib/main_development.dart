import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:venetiktok/app.dart';
import 'package:venetiktok/bootstrap.dart';
import 'package:venetiktok/src/global/core/dependencies/core_dependencies.dart';
import 'package:venetiktok/src/router.dart';

void main() async {
  GoRouter.optionURLReflectsImperativeAPIs = true; // TODO Check utility
  await dotenv.load(
      // If your .env file is named other than ".env", specify it here like:
      // fileName: 'other.env'
      );
  final apiHost = dotenv.env['DEV_API_URL'] ?? '';
  log('apiHost $apiHost');

  await bootstrap(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return App(
      router: AppRouter.router(debug: true),
      coreDependencies: CoreDependencies.development(
        authApiUrl: apiHost,
        userApiUrl: apiHost,
        mediaApiUrl: apiHost,
        profileApiUrl: apiHost,
      ),
    );
  });
}
