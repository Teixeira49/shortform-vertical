part of '../page/downloads_page.dart';

// NOTE: Declare all the UI widgets here, including BlocBuilders.


/// {@template success_body}
/// Body of the SuccessPage.
/// {@endtemplate}
class _SuccessBody extends StatefulWidget {
  /// {@macro success_body}
  const _SuccessBody();

  @override
  State<_SuccessBody> createState() => _SuccessBodyState();
}

class _SuccessBodyState extends State<_SuccessBody> {
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
    final params = context.read<SuccessPageBloc>().params;

    return BaseLayout(
      automaticallyImplyLeading: false,
      showAppBar: false,
      margins: EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: -0.5,
              numberOfParticles: 15,
              shouldLoop: true,
              particleDrag: 0.025,
              gravity: 0.1,
              emissionFrequency: 0.05,

              colors: [
                ColorValues.fgBrandPrimary(context),
                ColorValues.fgBrandPrimary(context),
                ColorValues.fgWhite(context),
                ColorValues.fgSuccessPrimary(context),
                ColorValues.fgSuccessPrimary(context),
                ...ColorValues.confettiColorList,
              ],
              child: Column(
                children: [
                  CustomPaint(
                    size: Size(
                      context.mediaQuery.size.width,
                      context.mediaQuery.size.height * 0.2,
                    ), // Ajusta el tamaño
                    painter: _SemiCirclePainter(
                      color: ColorValues.fgSuccessPrimary(context)
                          .withOpacity(0.15),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(WidthValues.padding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Gap(WidthValues.spacing3xl),
                        params.body ?? const _SucessCircleWidget(),
                        Gap(WidthValues.spacing3xl),
                        Text(
                          params.titleText,
                          style:
                              ExtendedTextTheme.displaySmall(context).copyWith(
                            color: ColorValues.textBrandPrimary(context),
                            fontWeight: TextValues.medium,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        if (params.subtitleText != null) ...[
                          Gap(WidthValues.spacingMd),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: WidthValues.spacingXl,
                            ),
                            child: Text(
                              params.subtitleText!,
                              style: ExtendedTextTheme.textSmall(context)
                                  .copyWith(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                        Gap(WidthValues.spacing3xl),
                        _ContinueButton(
                          onPressed: params.onPressed,
                        ),
                      ],
                    ),
                  ),
                ],
              ), // Your widget here
            ),
          ],
        ),
      ),
    );
  }
}

class _SemiCirclePainter extends CustomPainter {
  _SemiCirclePainter({required this.color});

  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height * 0.6) // Inicia en el medio
      ..quadraticBezierTo(
        size.width / 2, // El punto de control sigue en el centro del ancho
        size.height *
            1.5, // Este valor aumenta para estirar la altura, creando el óvalo
        size.width, size.height * 0.6, // Termina en el otro extremo
      )
      ..lineTo(size.width, 0) // Línea hasta la esquina superior derecha
      ..lineTo(0, 0) // Línea hasta la esquina superior izquierda
      ..close(); // Cierra el camino

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
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
