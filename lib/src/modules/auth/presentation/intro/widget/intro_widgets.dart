part of '../page/intro_page.dart';

class _IntroSignUpTextButton extends StatelessWidget {
  const _IntroSignUpTextButton();

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
                print('No disponible'); //context.push(SignUpPage.path);
              },
          ),
        ],
      ),
    );
  }
}

class _TermAndConditionsMessage extends StatelessWidget {
  const _TermAndConditionsMessage();

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: 'By creating an account, you agree to our to our',
            style: ExtendedTextTheme.textSmall(context),
          ),
          TextSpan(
              text: ' Terms of Service',
              style: ExtendedTextTheme.titleSmall(context)),
          TextSpan(
            text: ' and ',
            style: ExtendedTextTheme.textSmall(context),
          ),
          TextSpan(
              text: 'Privacy Policy',
              style: ExtendedTextTheme.titleSmall(context)),
        ]));
  }
}
