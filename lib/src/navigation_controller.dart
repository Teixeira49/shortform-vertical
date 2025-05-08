// ignore_for_file: inference_failure_on_function_invocation, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationController extends StatelessWidget {
  const NavigationController({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
      ],
      child: child,
    );
  }
}
