import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:venetiktok/l10n/l10n.dart';
import 'package:venetiktok/src/shared/features/widgets/movie_target.dart';

import '../../../../shared/features/entities/entities/entities.dart';
import '../../../../variables/values/values.dart';

part '../widgets/search_body.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static const path = '/$routeName';

  /// The route name of ProfilePage. Use to navigate
  /// with named routes.
  static const routeName = 'search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.searchLabel), actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.download_outlined)),
      ],actionsPadding: EdgeInsets.only(right: WidthValues.padding),),
      body: SearchView(),
    );
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
