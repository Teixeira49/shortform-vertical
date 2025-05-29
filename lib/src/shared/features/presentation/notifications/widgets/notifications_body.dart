part of '../page/notifications_page.dart';

// NOTE: Declare all the UI widgets here, including BlocBuilders.

/// {@template success_body}
/// Body of the SuccessPage.
/// {@endtemplate}
class _NotificationsBody extends StatefulWidget {
  /// {@macro success_body}
  const _NotificationsBody();

  @override
  State<_NotificationsBody> createState() => _NotificationsBodyState();
}

class _NotificationsBodyState extends State<_NotificationsBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseLayout(
        automaticallyImplyLeading: false,
        showAppBar: false,
        margins: EdgeInsets.zero,
        child:  Column(
              spacing: WidthValues.spacingMd,
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
          Icon(Icons.notifications_off_outlined, size: 64),
          Text(context.l10n.notificationsHaveNotNotificationsLabel, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium,),
                  Gap(WidthValues.padding)
        ]),
      ),
    );
  }
}

class _ContinueButton extends StatelessWidget {
  const _ContinueButton({required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: WidthValues.spacingMd,
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => onPressed.call(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(context.l10n.continueButtonLabel),
                  Gap(WidthValues.spacingXxs),
                  const Icon(
                    Icons.arrow_forward_outlined,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
