import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:venetiktok/l10n/l10n.dart';

import '../../../variables/values/values.dart';


class OnErrorWidget extends StatelessWidget {
  const OnErrorWidget({
    required this.onRetry,
    this.iconBackgroundColor,
    this.icon,
    this.iconSize = 45,
    super.key,
  });

  final VoidCallback onRetry;
  final IconData? icon;
  final Color? iconBackgroundColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null && iconBackgroundColor != null) ...[
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: iconSize + 5,
                  backgroundColor: iconBackgroundColor!.withOpacity(0.2),
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
                  radius: iconSize,
                  backgroundColor: iconBackgroundColor,
                  child: Icon(
                    icon,
                    size: iconSize - 5,
                    color: ColorValues.fgWhite(context),
                  ),
                ),
              ],
            ),
            Gap(WidthValues.spacingMd),
          ],
          Text(context.l10n.appStandardErrorMessage),
          TextButton(
            onPressed: onRetry,
            child: Text(context.l10n.appRetryButtonLabel),
          ),
        ],
      ),
    );
  }
}
