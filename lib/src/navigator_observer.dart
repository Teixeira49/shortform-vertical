import 'dart:developer';
import 'package:flutter/material.dart';

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('🛣️➡️ You did push route $previousRoute named: ${previousRoute?.
    settings.name} 📌');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('🛣️⬅️ You did pop route $previousRoute named: ${previousRoute?.
    settings.name} 📌');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('🛣️⬅️ You did remove route $previousRoute named: ${previousRoute?.
    settings.name} 📌');
  }

  @override
  void didReplace({
    Route<dynamic>? newRoute,
    Route<dynamic>? oldRoute,
  }) {
    log('🛣️↔️ You did replace route $oldRoute named: ${oldRoute?.settings.
    name} with $newRoute named: ${newRoute?.settings.name} 📌');
  }
}
