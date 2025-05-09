// ignore_for_file: inference_failure_on_function_invocation

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:venetiktok/l10n/l10n.dart';

import '../../../theme/extended_text_theme.dart';
import '../../../variables/constants/styles_constants.dart';
import '../../../variables/values/values.dart';
import '../entities/enums/custom_dialog_type.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({
    required this.type,
    required this.titleText,
    this.descriptionText,
    this.popOnPressed = true,
    this.showCancelButton = true,
    this.onPressed,
    this.mainButtonLabel,
    super.key,
  });

  final CustomDialogType type;
  final String titleText;
  final String? descriptionText;
  final bool popOnPressed;
  final bool showCancelButton;
  final Function? onPressed;
  final String? mainButtonLabel;

  static Future<void> show(
    BuildContext context, {
    required CustomDialog dialog,
    Key? key,
  }) async {
    await showDialog(
      context: context,
      builder: (context) => dialog,
    );
  }

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(WidthValues.spacing2Md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: widget.type.color(context).withOpacity(0.2),
                )
                    .animate(
                      onComplete: (controller) =>
                          controller.repeat(reverse: true),
                      autoPlay: true,
                    )
                    .scaleXY(
                      begin: 0.95,
                      end: 1.1,
                      duration: 2.5.seconds,
                      curve: Curves.easeInOut,
                    ),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: widget.type.color(context),
                  child: Icon(
                    widget.type.icon,
                    size: 40,
                    color: widget.type.iconColor(context),
                  ),
                ),
              ],
            ),
            // Icono de error

            Gap(WidthValues.spacing2Md),
            // Title
            Text(
              widget.titleText,
              style: ExtendedTextTheme.textExtraLarge(context).copyWith(
                fontWeight: FontWeight.bold,
                color: ColorValues.textBrandPrimary(context),
              ),
              textAlign: TextAlign.center,
            ),
            if (widget.descriptionText != null) ...[
              Gap(WidthValues.spacingSm),
              Text(
                widget.descriptionText!,
                style: ExtendedTextTheme.textSmall(context).copyWith(
                  color: ColorValues.textQuaternary(context),
                ),
                textAlign: TextAlign.center,
              ),
            ],
            Gap(WidthValues.spacing2Md),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (widget.showCancelButton) ...[
                  Expanded(
                    child: TextButton(
                      style: StylesConstants.textButtonStyle(context, false),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        context.l10n.cancelButtonLabel,
                        style: ExtendedTextTheme.textMedium(context).copyWith(
                          color: ColorValues.textBrandPrimary(context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Gap(WidthValues.spacing2Md),
                ],
                // Botón Confirmar
                Expanded(
                  child: TextButton(
                    style: StylesConstants.textButtonStyle(context, true),
                    onPressed: () {
                      if (widget.onPressed != null) {
                        widget.onPressed!();
                      }
                      if (widget.popOnPressed) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      widget.mainButtonLabel ?? context.l10n.acceptButtonLabel,
                      style: ExtendedTextTheme.textMedium(context).copyWith(
                        color: ColorValues.textWhite(context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
