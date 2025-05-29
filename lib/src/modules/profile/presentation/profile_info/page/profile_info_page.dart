import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:venetiktok/l10n/l10n.dart';
import 'package:venetiktok/src/shared/features/widgets/custom_snackbar.dart';
import 'package:venetiktok/src/variables/constants/constants.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../../../shared/core/utils/asset_icons.dart';
import '../../../../../shared/features/blocs/get_current_user_bloc/bloc.dart';
import '../../../../../shared/features/entities/entities/entities.dart';
import '../../../../../shared/features/entities/enums/custom_dialog_type.dart';
import '../../../../../shared/features/presentation/notifications/notifications.dart';
import '../../../../../shared/features/presentation/premium_payments/page/premium_page.dart';
import '../../../../../shared/features/use_cases/get_current_user.dart';
import '../../../../../shared/features/widgets/base_layout.dart';
import '../../../../../shared/features/widgets/custom_dialog.dart';
import '../../../../../shared/features/widgets/custom_loading_dialog.dart';
import '../../../../../shared/features/widgets/custom_modal.dart';
import '../../../../../shared/features/widgets/custom_tag.dart';
import '../../../../../shared/features/widgets/movie_target.dart';
import '../../../../../shared/features/widgets/on_error_widget.dart';
import '../../../../../theme/extended_text_theme.dart';
import '../../../../../variables/values/values.dart';
import '../../../../auth/domain/use_cases/sign_out_user.dart';
import '../../../../auth/presentation/login/login.dart';
import '../../../domain/use_cases/delete_account_use_case.dart';
import '../../profile_history/page/profile_history_page.dart';
import '../bloc/bloc.dart';

part '../widgets/profile_info_body.dart';

part '../widgets/views_carousel.dart';

/// {@template profile_page}
/// A description for ProfilePage
/// {@endtemplate}
class ProfilePage extends StatelessWidget {
  /// {@macro profile_page}
  const ProfilePage({super.key});

  /// The path name of ProfilePage. Use for navigation.
  static const path = '/$routeName';

  /// The route name of ProfilePage. Use to navigate
  /// with named routes.
  static const routeName = 'profile-home';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignOutBloc(
            signOutUserUseCase: SignOutUserUseCase(
              userRepository: context.read(),
              authRepository: context.read(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => GetCurrentUserBloc(
            getCurrentUserUseCase: GetCurrentUserUseCase(
              userRepository: context.read(),
              authRepository: context.read(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => DeleteAccountBloc(
            deleteUserUseCase: DeleteUserUseCase(
              profileRepository: context.read(),
            ),
          ),
        ),
      ],
      child: BlocListener<SignOutBloc, SignOutState>(
          listenWhen: (previous, current) =>
          previous.status != current.status,
          listener: (context, state) {
            if (state.status.isLoading) {
              CustomLoadingDialog.show(context);
            }
            if (state.status.isFailure) {
              CustomLoadingDialog.hide(context);
              CustomSnackBar.showWarningBar(context, "Fallo cierre de sesion");
            }
            if (state.status.isSuccess) {
              CustomLoadingDialog.hide(context);
              context.go(LoginPage.path);
            }
          },
          child: Scaffold(
              appBar: AppBar(
                title: Text(context.l10n.profileLabel),
                actions: [
                  IconButton(
                    onPressed: () => context.push(NotificationsPage.path),
                    icon: const Icon(Icons.notifications_outlined),
                  ),
                  IconButton(
                    onPressed: () => showModal(
                      context,
                      <SliverWoltModalSheetPage>[
                        selectOption(context), //context.read<SignOutBloc>().add(SignOutButtonPressed())
                      ],
                    ),
                    icon: const Icon(Icons.more_vert_outlined),
                  ),
                ],
                actionsPadding: EdgeInsets.only(right: WidthValues.padding),
              ),
              body: const _ProfileView(),
            ),
          ),
    );
  }

  SliverWoltModalSheetPage selectOption(context) {
    return SliverWoltModalSheetPage(
        hasSabGradient: false,
        //topBarTitle: Text(
        //  'Options',
        //  style: TextStyle(color: Colors.black),
        //),
        isTopBarLayerAlwaysVisible: true,
        mainContentSliversBuilder: (BuildContext context) => [
              SliverList(
                delegate: SliverChildListDelegate([
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text('Edit Profile'),
                    leading: Icon(Icons.edit_outlined),
                    onTap: () => CustomSnackBar.showWarningBar(
                        context, context.l10n.snackBarWarningDemo),
                  ),
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text('About my account'),
                    leading: Icon(Icons.account_circle_outlined),
                    onTap: () => CustomSnackBar.showWarningBar(
                        context, context.l10n.snackBarWarningDemo),
                  ),
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text('Settings'),
                    leading: Icon(Icons.settings_outlined),
                    onTap: () => CustomSnackBar.showWarningBar(
                        context, context.l10n.snackBarWarningDemo),
                  ),
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text('Help'),
                    leading: Icon(Icons.help_outline),
                    onTap: () => CustomSnackBar.showWarningBar(
                        context, context.l10n.snackBarWarningDemo),
                  ),
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text('Get Premium'),
                    leading: Icon(Icons.star_border_outlined),
                    onTap: () => context.push(PremiumPaywallPage.path),
                  ),
                  ListTile(
                        trailing: Icon(Icons.arrow_forward_ios),
                        title: Text('Log out'),
                        leading: Icon(Icons.logout),
                        onTap: () async {
                        }),
                ]),
              ),
            ]);
  }
}

// ----------------------------------------------------------------------
// NOTE: Declare all BlocListeners of Profile here to handle navigation,
//       showing dialogs, etc.
// ----------------------------------------------------------------------
/// {@template profile_view}
/// Displays the Body of ProfileView
/// {@endtemplate}

class _ProfileView extends StatelessWidget {
  /// {@macro profile_view}
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SignOutBloc, SignOutState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status.isLoading) {
              CustomLoadingDialog.show(context);
            }

            if (state.status.isFailure) {
              CustomLoadingDialog.hide(context);

              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => CustomDialog(
                  type: CustomDialogType.error,
                  titleText: context.l10n.kudoErrorText,
                  descriptionText:
                      state.errorMessage ?? context.l10n.pleaseTryAgainLabel,
                  showCancelButton: false,
                ),
              );
            }

            if (state.status.isSuccess) {
              CustomLoadingDialog.hide(context);
              //context.go(LoginPage.path);
            }
          },
        ),
        BlocListener<DeleteAccountBloc, DeleteAccountState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status.isLoading) {
              CustomLoadingDialog.show(context);
            }

            if (state.status.isFailure) {
              CustomLoadingDialog.hide(context);

              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => CustomDialog(
                  type: CustomDialogType.error,
                  titleText: context.l10n.kudoErrorText,
                  descriptionText:
                      state.errorMessage ?? context.l10n.pleaseTryAgainLabel,
                  showCancelButton: false,
                ),
              );
            }

            if (state.status.isSuccess) {
              CustomLoadingDialog.hide(context);
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => CustomDialog(
                  type: CustomDialogType.success,
                  titleText: context.l10n.profileDeleteAccountSuccessLabel,
                  showCancelButton: false,
                  onPressed: () => print('go'), //context.go(LoginPage.path),
                ),
              );
            }
          },
        ),
      ],
      child: _ProfileInfoBody(),
    );
  }
}
