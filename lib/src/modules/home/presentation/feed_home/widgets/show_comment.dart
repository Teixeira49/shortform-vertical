import 'package:flutter/material.dart';
import 'package:flutter_animated_icon_button/tap_fill_icon.dart';
import 'package:gap/gap.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../../../variables/values/values.dart';

SliverWoltModalSheetPage showComments(context) {
  return SliverWoltModalSheetPage(
    hasSabGradient: false,
    topBarTitle: Text(
      'Comments',
      style: TextStyle(color: Colors.red),
    ),
    isTopBarLayerAlwaysVisible: true,
    trailingNavBarWidget: IconButton(
      padding: const EdgeInsets.all(16),
      icon: const Icon(Icons.close),
      onPressed: Navigator.of(context).pop,
    ),
    stickyActionBar: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: 5,
        decoration: InputDecoration(
          hintText: 'Add a comment...',
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              // Handle send action
            },
          ),
        ),
      ),
    ),
    mainContentSliversBuilder: (BuildContext context) => [
      SliverList(
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return ListTile(
              title: Text('User $index'),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://yt3.ggpht.com/yti/ANjgQV8D_mFWkZ6j3O5Sp_c48DVnNJEb2HHs5M3Vh6s5uIErEjQ=s108-c-k-c0x00ffffff-no-rj'), //user.profilePictureUrl
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TapFillIcon(
                    onTap: () {
                      print("cambia cantidad de likes backend");
                    },
                    fillIcon: Icon(
                      Icons.favorite,
                      size: 20,
                    ),
                    borderIcon: Icon(
                      Icons.favorite_border,
                      size: 20,
                    ),
                  ),
                  Gap(WidthValues.spacingXs),
                  Text(
                    '100k',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(WidthValues.spacingXs),
                  Text(
                    'Comment $index',
                    textAlign: TextAlign.justify,
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            print('responde');
                          },
                          child: Text('Responder')),
                      TextButton(
                          onPressed: () {
                            print('responde');
                          },
                          child: Text('Reportar'))
                    ],
                  )
                ],
              ),
            );
          },
          childCount: 20,
        ),
      ),
    ],
  );
}