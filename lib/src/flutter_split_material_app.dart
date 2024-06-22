import 'package:flutter/material.dart';
import 'package:flutter_split_layout/src/flutter_split_primary.dart';

import 'flutter_split_controller.dart';
import 'flutter_split_secondary.dart';

class FlutterSplitMaterialApp extends StatefulWidget {
  final MaterialApp primaryApp;
  final MaterialApp secondaryApp;
  final FlutterSplitController controller;

  const FlutterSplitMaterialApp({
    super.key,
    required this.primaryApp,
    required this.secondaryApp,
    required this.controller,
  });

  @override
  State<FlutterSplitMaterialApp> createState() =>
      _FlutterSplitMaterialAppState();
}

class _FlutterSplitMaterialAppState extends State<FlutterSplitMaterialApp> {
  // Size _primarySize = Size.zero;

  @override
  Widget build(BuildContext context) {
    final primaryApp = widget.primaryApp;
    final secondaryApp = widget.secondaryApp;
    final controller = widget.controller;

    // final isEmptySize = _primarySize == Size.zero;

    final primaryWidget = FlutterSplitPrimary(
      controller: controller,
      app: primaryApp,
    );

    final secondaryWidget = FlutterSplitSecondary(
      controller: controller,
      app: secondaryApp,
    );

    return MaterialApp(
      // title: title,
      // theme: theme,
      home: Row(
        children: [
          Expanded(
            flex: 1,
            child: primaryWidget,
          ),
          Expanded(
            flex: 2,
            child: secondaryWidget,
          ),
        ],
      ),
    );

    // return MaterialApp(
    //   title: title,
    //   theme: theme,
    //   home: Stack(
    //     children: [
    //       Row(
    //         children: [
    //           Expanded(
    //             flex: 1,
    //             child: isEmptySize
    //                 ? MeasureSize(
    //                     onChange: (size) {
    //                       if (_primarySize != Size.zero) return;
    //                       _primarySize = size;
    //                     },
    //                     child: primaryWidget,
    //                   )
    //                 : Container(),
    //           ),
    //           Expanded(
    //             flex: 2,
    //             child: secondaryWidget,
    //           ),
    //         ],
    //       ),
    //       Positioned(
    //         left: 0.0,
    //         top: 0.0,
    //         bottom: 0.0,
    //         child: Visibility(
    //           visible: !isEmptySize,
    //           child: Row(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               SizedBox(
    //                 width: _primarySize.width,
    //                 child: primaryWidget,
    //               ),
    //               const VerticalDivider(
    //                 width: 0.5,
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
