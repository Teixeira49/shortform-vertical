import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:venetiktok/src/shared/core/utils/asset_images.dart';

import '../../../theme/extended_text_theme.dart';
import '../../../variables/values/values.dart';


class TextPageHeaderWidget extends StatelessWidget {
  const TextPageHeaderWidget(
      {required this.title,
      required this.description,
      this.showAppIsotype = false,
      super.key});

  final String title;
  final String description;
  final bool showAppIsotype;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (showAppIsotype) ...[
          Image.asset(AssetImages.mainLogo, height: 200),
          Gap(WidthValues.spacingMd),
        ],
        Text(
          title,
          style: ExtendedTextTheme.textExtraLarge(context)
              .copyWith(fontWeight: FontWeight.w600),
        ),
        Gap(WidthValues.spacingXs),
        Text(
          description,
          style: ExtendedTextTheme.textMedium(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
