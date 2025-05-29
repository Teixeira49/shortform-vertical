import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:venetiktok/l10n/l10n.dart';
import 'package:venetiktok/src/shared/features/widgets/movie_target.dart';

import '../../../../shared/features/presentation/notifications/notifications.dart';
import '../../../../shared/features/widgets/custom_snackbar.dart';
import '../../../../variables/values/values.dart';
import '../../domain/entities/entities.dart';
import '../../domain/use_cases/get_recomended_videos_use_case.dart';
import '../bloc/bloc.dart';

part '../widgets/search_body.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static const path = '/$routeName';

  /// The route name of ProfilePage. Use to navigate
  /// with named routes.
  static const routeName = 'search';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RecommendationStackBloc(
              getRecommendedVideosUseCase: GetRecommendedVideosUseCase(
                searchRepository: context.read(),
              ),
            )..add(
                FetchFeedVideosEvent(userId: 1),
              ),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.searchLabel),
            actions: [
              IconButton(
                  onPressed: () => context.push(NotificationsPage.path),
                  icon: const Icon(Icons.notifications_outlined)),
              IconButton(
                  onPressed: () => CustomSnackBar.showWarningBar(
                      context, context.l10n.snackBarWarningDemo),
                  icon: const Icon(Icons.download_outlined)),
            ],
            actionsPadding: EdgeInsets.only(right: WidthValues.padding),
          ),
          body: SearchView(),
        ));
  }
}

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: _SearchBody(),
    );
  }
}
