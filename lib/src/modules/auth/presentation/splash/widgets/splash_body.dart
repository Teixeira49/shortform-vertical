part of '../page/splash_page.dart';

// NOTE: Declare all the UI widgets here, including BlocBuilders.
/// {@template splash_body}
/// Body of the SplashPage.
/// {@endtemplate}
class _SplashBody extends StatelessWidget {
  /// {@macro splash_body}
  const _SplashBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        return Center(child: Icon(Icons.warning, size: 100, color: Colors.red));
      },
    );
  }
}
