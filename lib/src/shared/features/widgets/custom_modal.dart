import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../utils/responsive.dart';

void showModal(BuildContext context, List<SliverWoltModalSheetPage> pages) {
  WoltModalSheet.show<void>(
    context: context,
    pageListBuilder: (modalSheetContext) {
      return pages;
    },
    modalTypeBuilder: (context) {
      if (Responsive.isMobile(context)) {
        return WoltModalType.bottomSheet();
      } else {
        return WoltModalType.dialog();
      }
    },
    onModalDismissedWithBarrierTap: () {
      debugPrint('Closed modal sheet with barrier tap');
      Navigator.of(context).pop();
    },
  );
}
