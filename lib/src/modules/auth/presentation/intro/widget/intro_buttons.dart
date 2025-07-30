part of '../page/intro_page.dart';

class _IntroPremiumPlansButton extends StatelessWidget {
  const _IntroPremiumPlansButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorValues.fgBrandSecondary(context),
        ),
        onPressed: () => context.push(LoginPage.path),
        child: Text(context.l10n.getPremiumButton),
      ),
    );
  }
}

class _IntroLoginButton extends StatelessWidget {
  const _IntroLoginButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => context.push(LoginPage.path),
        child: Text(context.l10n.loginButtonLabel),
      ),
    );
  }
}
