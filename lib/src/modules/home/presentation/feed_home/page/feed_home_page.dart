import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animated_icon_button/tap_fill_icon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';
import 'package:venetiktok/l10n/l10n.dart';
import 'package:venetiktok/src/shared/features/widgets/base_layout.dart';
import 'package:venetiktok/src/shared/features/widgets/text_page_header_widget.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:better_player_plus/better_player_plus.dart';

import '../../../../../routes/shell_branches.dart';
import '../../../../../shared/core/utils/asset_icons.dart';
import '../../../../../shared/features/blocs/get_current_user_bloc/bloc.dart';
import '../../../../../shared/features/presentation/premium_payments/page/premium_page.dart';
import '../../../../../shared/features/use_cases/get_current_user.dart';
import '../../../../../shared/features/widgets/custom_modal.dart';
import '../../../../../shared/features/widgets/custom_snackbar.dart';
import '../../../../../shared/features/widgets/custom_tag.dart';
import '../../../../../variables/constants/constants.dart';
import '../../../../../variables/values/values.dart';
import '../../../../profile/presentation/profile_info/page/profile_info_page.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/use_cases/get_new_videos_use_case.dart';
import '../bloc/bloc.dart';

part '../widgets/feed_home_body.dart';

part '../widgets/video_player.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const path = '/$routeName';

  /// The route name of ProfilePage. Use to navigate
  /// with named routes.
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => GetCurrentUserBloc(
            getCurrentUserUseCase: GetCurrentUserUseCase(
              userRepository: context.read(),
              authRepository: context.read(),
            ),
          ),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => UpdateFeedBloc(
            getNewVideosUseCase: GetNewVideosUseCase(
              mediaRepository: context.read(),
            ),
          )..add(FetchFeedVideosEvent(userId: 1)),
        ),
      ],
      child: Scaffold(
        body: _HomeView(),
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return //MultiBlocListener(
      //listeners: [],
      //child:
      _HomeBody();
    //);
  }
}
