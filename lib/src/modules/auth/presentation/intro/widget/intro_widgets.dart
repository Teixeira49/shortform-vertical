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

class _IntroTermAndConditionsMessage extends StatelessWidget {
  const _IntroTermAndConditionsMessage();

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

class _IntroAppMainIcon extends StatelessWidget {
  const _IntroAppMainIcon();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icons/logos/stream_lite_full_logo-removebg-preview.png',
      height: Adaptive.h(16),
    );
  }
}

class _IntroText extends StatelessWidget {
  const _IntroText();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: WidthValues.spacingSm,
      children: [
        Text(
          'Welcome User!',
          style: ExtendedTextTheme.displayTitleSmall(context).copyWith(
            color: ColorValues.fgBrandPrimary(context),
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Get ready to dive into the greatest stories in TV and Film',
          style: ExtendedTextTheme.textLarge(context),
          textAlign: TextAlign.center,
        ),
        Gap(WidthValues.padding),
      ],
    );
  }
}
