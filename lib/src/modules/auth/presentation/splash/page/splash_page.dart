import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:venetiktok/l10n/l10n.dart';

import '../../../../../shared/core/utils/asset_icons.dart';
import '../../../../../shared/features/entities/enums/custom_dialog_type.dart';
import '../../../../../shared/features/widgets/custom_dialog.dart';
import '../../../../../variables/values/color_values.dart';
import '../../../domain/use_cases/get_current_token.dart';
import '../bloc/bloc.dart';

part '../widgets/splash_body.dart';

/// {@template splash_page}
/// A description for SplashPage
/// {@endtemplate}
class SplashPage extends StatelessWidget {
  /// {@macro splash_page}
  const SplashPage({super.key});

  /// The path name of SplashPage. Use for navigation.
  static const path = '/$routeName';

  /// The route name of SplashPage. Use to navigate
  /// with named routes.
  static const routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SplashBloc(
            getCurrentTokenUseCase:
                GetCurrentTokenUsecase(authRepository: context.read())),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                ColorValues.utilityBrand500(context),
                ColorValues.utilityBrandThird500(context),
                ColorValues.utilityBrandSecond500(context),
              ])),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: const SplashView(),
          ),
        ));
  }
}

// NOTE: Declare all BlocListeners of Splash here to handle navigation, showing dialogs, etc.
/// {@template splash_view}
/// Displays the Body of SplashView
/// {@endtemplate}
///
class SplashView extends StatelessWidget {
  /// {@macro splash_view}
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state.status.isFailure) {
              if (state.error.isNone) return;

              if (state.error.isNoInternet) {
                showErrorDialog(
                  context,
                  title: context.l10n.appConnectionErrorTitle,
                  content:
                      context.l10n.appConnectionErrorNoInternetDescription,
                );
              } else if (state.error.isUsingVPN) {
                showErrorDialog(
                  context,
                  title: context.l10n.appConnectionErrorVpnDetectedTitle,
                  content: context.l10n.appConnectionErrorActiveVPNDescription,
                );
              } else if (state.error.isInMaintainance) {
                showErrorDialog(
                  context,
                  title: context.l10n.appMaintenanceModeTitle,
                  content: context.l10n.appMaintenanceModeDescription,
                );
              } else if (state.error.isUpdateRequired) {
                //TODO: Implement this
                // showErrorDialog(
                //   context,
                //   title: context.l10n.appUpdateRequiredTitle,
                //   content: context.l10n.appUpdateRequiredDescription,
                //   actions: [
                //     DialogAction(
                //       isPrimaryAction: true,
                //       onPressed: () async {
                //         final settings =
                //             context.read<RemoteSettingsBloc>().settings;

                //         try {
                //           if (Platform.isIOS) {
                //             await openUrl(settings.appStoreUrl);
                //           } else {
                //             await openUrl(settings.playStoreUrl);
                //           }
                //         } catch (e) {
                //           log('❌ Error opening app store URL', error: e);
                //           showErrorDialog(
                //             context,
                //             title: context.l10n.appErrorOpeningUpdateUrlTitle,
                //             content: S
                //                 .of(context)
                //                 .appErrorOpeningUpdateUrlDescription,
                //             actions: [
                //               DialogAction(
                //                 isPrimaryAction: true,
                //                 onPressed: () {
                //                   exit(0);
                //                 },
                //                 child: Text(context.l10n.close),
                //               ),
                //             ],
                //           );
                //         }
                //       },
                //       child: Text(context.l10n.appUpdateAppButton),
                //     ),
                //   ],
                // );
              } else if (state.error.isServerError) {
                showErrorDialog(
                  context,
                  title: context.l10n.appConnectionErrorTitle,
                  content: context.l10n.appServerErrorMessage,
                );
              } else if (state.error.isUnknownError) {
                showErrorDialog(
                  context,
                  title: context.l10n.appConnectionErrorTitle,
                  content: context.l10n.appUnknownErrorMessage,
                );
              } else {
                log('❌ Unimplemented SplashState.error ${state.error}');
                log('If you encounter this error, please implement it in SplashPage.dart');
                throw UnimplementedError();
              }
            }
          },
        ),
      ],
      child: const _SplashBody(),
    );
  }
}

Future<void> showErrorDialog(
  BuildContext context, {
  required String title,
  required String content,
}) async {
  CustomDialog.show(
    context,
    dialog: CustomDialog(
      type: CustomDialogType.error,
      titleText: title,
      descriptionText: content,
      showCancelButton: false,
      onPressed: () {
        context.read<SplashBloc>().add(const SplashRetry());
      },
      mainButtonLabel: context.l10n.appUpdateAppButton,
    ),
  );
}
