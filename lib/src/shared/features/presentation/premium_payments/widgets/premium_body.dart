part of '../page/premium_page.dart';

// NOTE: Declare all the UI widgets here, including BlocBuilders.

/// {@template success_body}
/// Body of the SuccessPage.
/// {@endtemplate}
class _PremiumPaywallBody extends StatefulWidget {
  /// {@macro success_body}
  const _PremiumPaywallBody();

  @override
  State<_PremiumPaywallBody> createState() => _PremiumPaywallBodyState();
}

class _PremiumPaywallBodyState extends State<_PremiumPaywallBody> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 10));

    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final params = context.read<PremiumPageBloc>().params;

    return BaseLayout(
      automaticallyImplyLeading: false,
      showAppBar: false,
      margins: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            Text(
              context.l10n.premiumMessageLabel,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Gap(WidthValues.spacingMd),
            Row(
              children: [
                Text(context.l10n.premiumAvailablePlans,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              ],
            ),
            Gap(WidthValues.spacingMd),
            CardPlanWidget(
              planName: 'PLUS',
              price: 'USD 2.99',
              features: [
                "Premium plus content",
                "NO ADS",
              ],
              color: ColorValues.fgBrandPrimary(context),
            ),
            CardPlanWidget(
              planName: 'PRO',
              price: 'USD 5.99',
              features: [
                "Premium plus content",
                "Faster Download videos",
                "NO ADS",
              ],
              color: ColorValues.fgBrandSecondary(context),
            ),
            CardPlanWidget(
              planName: 'MAX',
              price: 'USD 19.99',
              features: [
                "Premium plus content",
                "Faster Download videos",
                "Access to content before its release",
                "NO ADS",
              ],
              color: ColorValues.utilityBrandThird500(context),
            ),
            WhyPremiumCard(
              features: [
                context.l10n.premiumReason1,
                context.l10n.premiumReason2,
                context.l10n.premiumReason3,
              ],
            ),
          ])),
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

class CardPlanWidget extends StatelessWidget {
  const CardPlanWidget(
      {super.key,
      required this.planName,
      required this.price,
      required this.features,
      required this.color});

  final String planName;
  final String price;
  final List<String> features;
  final Color color;

  List<Widget> _buildFeatures(BuildContext context) {
    final List<Widget> widgets = [];
    for (final feature in features) {
      widgets.add(ListTile(
        leading: Icon(
          Icons.star_border,
          color: color,
        ),
        title: Text(feature),
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: WidthValues.spacingSm,
          children: [
            Row(
              spacing: WidthValues.spacingSm,
              children: [
                Image.asset(
                  AssetIcons.appIcon,
                  height: 40,
                ),
                Text(context.l10n.premiumLabel,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
              ],
            ),
            Text(
              planName,
              style: TextStyle(
                  color: color, fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text(
              "$price ${context.l10n.premiumRateMonthLabel}",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            Divider(
              color: ColorValues.utilityGray400(context),
            ),
            Column(
              spacing: WidthValues.spacingNone,
              children: _buildFeatures(context),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: color),
                onPressed: () {
                  Navigator.pop(context);
                  CustomSnackBar.showWarningBar(
                      context, context.l10n.snackBarWarningDemo);
                },
                child: Text(context.l10n.getPremiumButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WhyPremiumCard extends StatelessWidget {
  const WhyPremiumCard({super.key, required this.features});

  final List<String> features;

  List<Widget> _buildFeatures(BuildContext context) {
    final List<Widget> widgets = [];
    for (final feature in features) {
      widgets.add(ListTile(
        leading: Icon(
          Icons.star_border,
          color: ColorValues.utilityGray500(context),
        ),
        title: Text(feature),
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: WidthValues.spacingSm,
          children: [
            Text(
              context.l10n.premiumWhyLabel,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            Divider(
              color: ColorValues.utilityGray400(context),
            ),
            ..._buildFeatures(context),
          ],
        ),
      ),
    );
  }
}
