

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shadow_overlay/shadow_overlay.dart';
import 'package:venetiktok/l10n/l10n.dart';
import 'package:venetiktok/src/theme/extended_text_theme.dart';
import 'package:venetiktok/src/variables/variables.dart';

import '../../../../../variables/values/color_values.dart';
import '../../../../../variables/values/values.dart';
import '../../login/login.dart';


part '../widget/intro_body.dart';

part '../widget/intro_buttons.dart';

part '../widget/intro_widgets.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  
  /// The path name of IntroPage. Use for navigation.
  static const path = '/$routeName';

  /// The route name of IntroPage. Use to navigate
  /// with named routes.
  static const routeName = 'intro';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: _IntroView(),
    );
  }
}

class _IntroView extends StatelessWidget {
  const _IntroView();

  @override
  Widget build(BuildContext context) {
    return _IntroBody();
  }
}