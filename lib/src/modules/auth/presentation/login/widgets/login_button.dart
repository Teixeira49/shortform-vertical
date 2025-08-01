part of '../page/login_page.dart';

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.isFormValid != current.isFormValid ||
          previous.status != current.status,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: (state.emailInput.value ==
                                "brocolisoftware@gmail.com" ||
                            state.emailInput.value == "andrea.lopez@gmail.com" ||
                    state.emailInput.value == "alana.garcia@gmail.com")
                    ? () => context
                        .read<LoginBloc>()
                        .add(LoginSubmitButtonPressed())
                    : null,
                child: Text(context.l10n.loginButtonLabel),
              ),
            ),
          ],
        );
      },
    );
  }
}
