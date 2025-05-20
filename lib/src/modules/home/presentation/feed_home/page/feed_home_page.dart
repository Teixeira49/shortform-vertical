
import 'package:flutter/material.dart';
import 'package:flutter_animated_icon_button/tap_fill_icon.dart';
import 'package:gap/gap.dart';
import 'package:share_plus/share_plus.dart';
import 'package:venetiktok/l10n/l10n.dart';
import 'package:venetiktok/src/shared/features/widgets/base_layout.dart';
import 'package:venetiktok/src/shared/features/widgets/text_page_header_widget.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../../../shared/features/widgets/custom_modal.dart';
import '../../../../../variables/values/values.dart';

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
    return Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return _HomeBody();
  }
}