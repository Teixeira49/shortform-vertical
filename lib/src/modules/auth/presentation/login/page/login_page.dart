
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:venetiktok/l10n/l10n.dart';
import 'package:venetiktok/src/routes/shell_branches.dart';
import 'package:venetiktok/src/shared/features/widgets/base_layout.dart';
import 'package:venetiktok/src/shared/features/widgets/custom_field.dart';
import 'package:venetiktok/src/shared/features/widgets/text_page_header_widget.dart';

import '../../../../../global/core/extensions/string_extension.dart';
import '../../../../../variables/variables.dart';
import '../../../domain/use_cases/sign_in_user.dart';
import '../bloc/bloc.dart';

part '../widgets/login_body.dart';
part '../widgets/login_button.dart';
part '../widgets/login_inputs.dart';
part '../widgets/login_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String path = '/login';
  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        signInUserUseCase: SignInUserUseCase(authRepository: context.read()),
      ),
      child: const Scaffold(
        body: _LoginView(),
      ),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          context.go(AppShellBranch.values.first.path);
        }
        /*if (state.status == LoginStatus.error) {
          final error = state.error;
          if (error is InvalidCredentialsException) {
            // Handle invalid credentials error
          } else if (error is NetworkException) {
            // Handle network error
          } else {
            // Handle other errors
          }
        }*/
      },
      child: const _LoginBody(),
    );
  }
}