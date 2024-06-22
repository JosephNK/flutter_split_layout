import 'package:flutter/material.dart';

import 'flutter_split_controller.dart';

class FlutterSplitSecondary extends StatelessWidget {
  final FlutterSplitController controller;
  final MaterialApp app;

  const FlutterSplitSecondary({
    super.key,
    required this.controller,
    required this.app,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(),
      child: MaterialApp(
        title: app.title,
        navigatorKey: controller.secondaryNavigatorKey,
        localizationsDelegates: app.localizationsDelegates,
        supportedLocales: app.supportedLocales,
        locale: app.locale,
        navigatorObservers:
            app.navigatorObservers ?? const <NavigatorObserver>[],
        theme: app.theme,
        builder: app.builder,
        onGenerateRoute: app.onGenerateRoute,
        onUnknownRoute: app.onUnknownRoute,
        initialRoute: app.initialRoute,
        home: app.home,
      ),
    );
  }
}
