import 'package:flutter/material.dart';

import 'flutter_split_controller.dart';

class FlutterSplitPrimary extends StatelessWidget {
  final Widget child;
  final ThemeData? theme;
  final FlutterSplitController controller;

  const FlutterSplitPrimary({
    super.key,
    required this.child,
    required this.theme,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter_Split_Primary',
      navigatorKey: controller.primaryNavigatorKey,
      theme: theme,
      home: child,
    );
  }
}
