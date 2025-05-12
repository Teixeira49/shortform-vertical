part of '../page/login_page.dart';

class _LoginForgotPasswordTextButton extends StatelessWidget {
  const _LoginForgotPasswordTextButton();

  @override
  Widget build(BuildContext context) {
    final brandColor = ColorValues.fgBrandPrimary(context);

    return TextButton(
      onPressed: () => print('No disponible'),//context.goNamed(ForgotPasswordPage.routeName),
      child: Text(
        context.l10n.forgotPasswordLabel,
        style: ExtendedTextTheme.textSmall(context).copyWith(
          decoration: TextDecoration.underline,
          decorationColor: brandColor,
          color: brandColor,
        ),
      ),
    );
  }
}

class _LoginSignUpTextButton extends StatelessWidget {
  const _LoginSignUpTextButton();

  @override
  Widget build(BuildContext context) {
    final brandColor = ColorValues.fgBrandPrimary(context);

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: '${context.l10n.dontHaveAnAccountLabel} ',
              style: ExtendedTextTheme.textSmall(context)),
          TextSpan(
            text: context.l10n.signUpLabel,
            style: ExtendedTextTheme.textSmall(context).copyWith(
              color: brandColor,
              decoration: TextDecoration.underline,
              decorationColor: brandColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('No disponible');//context.push(SignUpPage.path);
              },
          ),
        ],
      ),
    );
  }
}
