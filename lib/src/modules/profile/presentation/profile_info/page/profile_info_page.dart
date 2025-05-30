import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:venetiktok/l10n/l10n.dart';
import 'package:venetiktok/src/modules/profile/domain/entities/entities.dart';
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
import '../../../../../shared/features/utils/responsive.dart';
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
import '../../../domain/use_cases/get_videos_history_use_case.dart';
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
          create: (context) => FetchHistoryBloc(
            getVideosHistoryUseCase: GetVideosHistoryUseCase(
              profileRepository: context.read(),
            ),
          )..add(FetchFeedVideosEvent(userId: 1)),
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
      child: const _ProfileView(),
    );
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
              context.go(LoginPage.path);
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
                  onPressed: () => context.go(LoginPage.path),
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
