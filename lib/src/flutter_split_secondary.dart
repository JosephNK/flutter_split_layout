import 'package:flutter/material.dart';

import 'flutter_split_controller.dart';

class FlutterSplitSecondary extends StatelessWidget {
  final Widget child;
  final ThemeData? theme;
  final FlutterSplitController controller;

  const FlutterSplitSecondary({
    super.key,
    required this.child,
    required this.theme,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter_Split_Secondary',
      navigatorKey: controller.secondaryNavigatorKey,
      theme: theme,
      home: child,
    );
  }
}
