import 'package:flutter/material.dart';

import '../../../theme/extended_text_theme.dart';
import '../../../variables/values/values.dart';

class MovieTarget extends StatelessWidget {
  const MovieTarget({super.key, required this.url, required this.title});

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: WidthValues.spacingMd,
        children: [
          Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(WidthValues.radiusSm)),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              )),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
            child: Text(
              title,
              textAlign: TextAlign.justify,
              maxLines: 2,
              style: ExtendedTextTheme.textMedium(context),
            ),
          ),
        ],
      ),
      Positioned(top: 4, right: 4, child: Icon(Icons.more_vert_outlined))
    ]);
  }
}
