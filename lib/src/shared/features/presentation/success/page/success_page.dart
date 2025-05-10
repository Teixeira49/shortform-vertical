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

part '../widgets/success_body.dart';
part '../widgets/success_widgets.dart';

class SuccessPageParams {
  SuccessPageParams({
    required this.titleText,
    required this.onPressed,
    this.subtitleText,
    this.body,
  });
  final String titleText;
  final String? subtitleText;
  final Function onPressed;
  final Widget? body;
}

/// {@template success_page}
/// A description for SuccessPage
/// {@endtemplate}
class SuccessPage extends StatelessWidget {
  /// {@macro success_page}
  const SuccessPage({
    required this.params,
    super.key,
  });

  final SuccessPageParams params;

  /// The path name of SuccessPage. Use for navigation.
  static const path = '/$routeName';

  /// The route name of SuccessPage. Use to navigate
  /// with named routes.
  static const routeName = 'success';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SuccessPageBloc(params: params),
      child: const Scaffold(
        body: _SuccessView(),
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
class _SuccessView extends StatelessWidget {
  /// {@macro success_view}
  const _SuccessView();

  @override
  Widget build(BuildContext context) {
    return const _SuccessBody();
  }
}
