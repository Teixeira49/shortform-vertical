import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:venetiktok/l10n/l10n.dart';

import '../../../../../theme/extended_text_theme.dart';
import '../../../../../variables/values/values.dart';
import '../../../entities/enums/custom_dialog_type.dart';
import '../../../widgets/base_layout.dart';
import '../bloc/bloc.dart';

part '../widgets/notifications_body.dart';
part '../widgets/notifications_widgets.dart';

/// {@template success_page}
/// A description for SuccessPage
/// {@endtemplate}
class NotificationsPage extends StatelessWidget {
  /// {@macro success_page}
  const NotificationsPage({
    super.key,
  });

  /// The path name of SuccessPage. Use for navigation.
  static const path = '/$routeName';

  /// The route name of SuccessPage. Use to navigate
  /// with named routes.
  static const routeName = 'notifications';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsPageBloc(),
      child: Scaffold(
        appBar: AppBar(
            title: Text(context.l10n.notificationsLabel),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black,),
              onPressed: () {
                Navigator.pop(context);
              },
            )
        ),
        body: _NotificationsView(),
      ),
    );
  }
}

// NOTE: Declare all BlocListeners of Success here to handle navigation,
//showing dialogs, etc.
/// {@template success_view}
/// Displays the Body of SuccessView
/// {@endtemplate}
///
class _NotificationsView extends StatelessWidget {
  /// {@macro success_view}
  const _NotificationsView();

  @override
  Widget build(BuildContext context) {
    return const _NotificationsBody();
  }
}
