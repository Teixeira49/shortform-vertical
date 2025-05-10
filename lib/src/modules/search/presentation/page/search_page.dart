
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static const path = '/$routeName';

  /// The route name of ProfilePage. Use to navigate
  /// with named routes.
  static const routeName = 'search';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('SearchPage'),
      ),
    );
  }
}
