part of '../page/login_page.dart';

class _LoginInputs extends StatelessWidget {
  const _LoginInputs();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _LoginEmailInput(),
        Gap(WidthValues.spacingLg),
        const _LoginPasswordInput(),
      ],
    );
  }
}

class _LoginEmailInput extends StatelessWidget {
  const _LoginEmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
      previous.emailInput.value != current.emailInput.value,
      builder: (context, state) {
        return CustomField(
          title: Text(context.l10n.emailLabel),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                onChanged: (email) =>
                    context.read<LoginBloc>().add(LoginEmailChanged(email)),
                decoration: InputDecoration(
                  errorText: state.emailInput.displayError != null
                      ? context.l10n.emailErrorText
                      : null,
                  hintText: context.l10n.emailHintText,
                ),
                keyboardType: TextInputType.emailAddress,
                enabled: !state.status.isLoading,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(
                    RegExp(emojiRegex),
                  ),
                ],
                autofillHints: const [AutofillHints.email],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LoginPasswordInput extends StatelessWidget {
  const _LoginPasswordInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
      previous.passwordInput.value != current.passwordInput.value ||
          previous.showPassword != current.showPassword,
      builder: (context, state) {
        final showPassword = state.showPassword;

        return CustomField(
          title: Text(context.l10n.passwordLabel),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                obscureText: !showPassword,
                onChanged: (password) => context
                    .read<LoginBloc>()
                    .add(LoginPasswordChanged(password)),
                decoration: InputDecoration(
                  hintText: context.l10n.passwordHintText,
                  suffixIcon: IconButton(
                    icon: Icon(
                      showPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      context
                          .read<LoginBloc>()
                          .add(LoginShowPasswordButtonPressed());
                    },
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.deny(
                    RegExp(emojiRegex),
                  ),
                ],
                enabled: !state.status.isLoading,
                autofillHints: const [AutofillHints.password],
              ),
            ],
          ),
        );
      },
    );
  }
}
