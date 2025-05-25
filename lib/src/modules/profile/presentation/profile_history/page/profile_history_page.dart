
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:venetiktok/l10n/l10n.dart';

import '../../../../../shared/features/blocs/get_current_user_bloc/bloc.dart';
import '../../../../../shared/features/entities/entities/entities.dart';
import '../../../../../shared/features/use_cases/get_current_user.dart';
import '../../../../../shared/features/widgets/base_layout.dart';
import '../../../../../shared/features/widgets/movie_target.dart';
import '../../../../../shared/features/widgets/on_error_widget.dart';
import '../../../../../variables/values/values.dart';

part '../widgets/profile_history_body.dart';

class ProfileHistoryPage extends StatelessWidget {
  /// {@macro profile_page}
  const ProfileHistoryPage({required this.searchKey, super.key});

  final int searchKey;

  /// The path name of ProfilePage. Use for navigation.
  static const path = '/$routeName';

  /// The route name of ProfilePage. Use to navigate
  /// with named routes.
  static const routeName = 'profile-history';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetCurrentUserBloc(
            getCurrentUserUseCase: GetCurrentUserUseCase(
              userRepository: context.read(),
              authRepository: context.read(),
            ),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(selectTitle(searchKey, context)),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black,),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ),
        body: const _ProfileView(),
      ),
    );
  }

  String selectTitle (int searchKey, BuildContext context) {
    switch (searchKey) {
      case 1:
        return context.l10n.historyLabel;
      case 2:
        return context.l10n.likedLabel;
      case 3:
        return context.l10n.bookmarksLabel;
      default:
        return context.l10n.profileLabel;
    }
  }
}

class _ProfileView extends StatelessWidget {
  /// {@macro profile_view}
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    return  _ProfileHistoryBody();
  }
}