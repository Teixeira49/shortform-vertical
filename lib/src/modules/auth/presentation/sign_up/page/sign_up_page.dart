
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  /// The path name of SuccessPage. Use for navigation.
  static const path = '/$routeName';

  /// The route name of SuccessPage. Use to navigate
  /// with named routes.
  static const routeName = 'sign-up';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Sign Up Page'),
      ),
    );
  }
}