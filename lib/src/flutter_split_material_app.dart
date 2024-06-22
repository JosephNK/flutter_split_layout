import 'package:flutter/material.dart';
import 'package:flutter_split_layout/src/flutter_split_primary.dart';

import 'flutter_split_controller.dart';
import 'flutter_split_secondary.dart';
import 'helper/measure_size.dart';

class FlutterSplitMaterialApp extends StatefulWidget {
  final String title;
  final Widget primary;
  final Widget secondary;
  final ThemeData? theme;
  final FlutterSplitController controller;

  const FlutterSplitMaterialApp({
    super.key,
    required this.title,
    required this.primary,
    required this.secondary,
    required this.controller,
    this.theme,
  });

  @override
  State<FlutterSplitMaterialApp> createState() =>
      _FlutterSplitMaterialAppState();
}

class _FlutterSplitMaterialAppState extends State<FlutterSplitMaterialApp> {
  Size _primarySize = Size.zero;

  @override
  Widget build(BuildContext context) {
    final title = widget.title;
    final theme = widget.theme;
    final primary = widget.primary;
    final secondary = widget.secondary;
    final controller = widget.controller;

    final isEmptySize = _primarySize == Size.zero;

    final primaryWidget = FlutterSplitPrimary(
      theme: theme,
      controller: controller,
      child: primary,
    );

    final secondaryWidget = FlutterSplitSecondary(
      theme: theme,
      controller: controller,
      child: secondary,
    );

    return MaterialApp(
      title: title,
      theme: theme,
      home: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: isEmptySize
                    ? MeasureSize(
                        onChange: (size) {
                          if (_primarySize != Size.zero) return;
                          _primarySize = size;
                        },
                        child: primaryWidget,
                      )
                    : Container(),
              ),
              Expanded(
                flex: 2,
                child: secondaryWidget,
              ),
            ],
          ),
          Positioned(
            left: 0.0,
            top: 0.0,
            bottom: 0.0,
            child: Visibility(
              visible: !isEmptySize,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: _primarySize.width,
                    child: primaryWidget,
                  ),
                  const VerticalDivider(
                    width: 0.5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
