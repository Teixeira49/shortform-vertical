import 'package:flutter/material.dart';

import '../../../theme/extended_text_theme.dart';
import '../../../variables/values/values.dart';

class MovieTarget extends StatelessWidget {
  const MovieTarget({super.key, required this.url, required this.title, required this.author});

  final String url;
  final String title;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: WidthValues.spacingXxs,
      children: [
        Expanded(
          flex: 3,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorValues.utilityGray700(context).withOpacity(0.5),
                  borderRadius:
                      BorderRadius.all(Radius.circular(WidthValues.radiusSm)),
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(WidthValues.radiusSm)),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: Icon(
                  Icons.more_vert_outlined,
                  color: ColorValues.utilityGray50(context),
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            textAlign: TextAlign.justify,
            maxLines: 2,
            style: ExtendedTextTheme.textMedium(context).copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            author,
            textAlign: TextAlign.justify,
            maxLines: 1,
            style: ExtendedTextTheme.textSmall(context),
          ),
        ),
      ],
    );
  }
}
