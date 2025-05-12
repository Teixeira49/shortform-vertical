part of '../page/login_page.dart';

class _LoginBody extends StatelessWidget {

  const _LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return BaseLayout(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(WidthValues.spacing6xl),
                TextPageHeaderWidget(
                  title: context.l10n.welcomeToKudoLabel,
                  description: context.l10n.loginEnterYourUserInfoText,
                  showAppIsotype: true,
                ),
                Gap(WidthValues.spacing2xl),
                const _LoginInputs(),
                Gap(WidthValues.spacingSm),
                const Align(
                  alignment: Alignment.centerRight,
                  child: _LoginForgotPasswordTextButton(),
                ),
                Gap(WidthValues.spacing2Md),
                const _LoginButton(),
                Gap(WidthValues.spacing2Md),
                const _LoginSignUpTextButton(),
              ],
            ),
          ),
        ).animate().slideY(delay: 200.ms, begin: 1).fade(delay: 300.ms);
      },
    );
  }
}