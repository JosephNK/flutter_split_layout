import 'package:flutter/material.dart';

class FlutterSplitController {
  static final FlutterSplitController instance =
      FlutterSplitController._internal();
  factory FlutterSplitController() => instance;
  FlutterSplitController._internal();

  GlobalKey<NavigatorState>? primaryNavigatorKey;
  GlobalKey<NavigatorState>? secondaryNavigatorKey;

  BuildContext? get primaryContext {
    return primaryNavigatorKey?.currentContext;
  }

  BuildContext? get secondaryContext {
    return secondaryNavigatorKey?.currentContext;
  }

  int get primaryHash => primaryNavigatorKey.hashCode;
  int get secondaryHash => secondaryNavigatorKey.hashCode;

  // void pushPrimary(Widget page) {
  //   primaryNavigatorKey?.currentState!.push(
  //     MaterialPageRoute(builder: (context) => page),
  //   );
  // }
  //
  // void popPrimary() {
  //   primaryNavigatorKey?.currentState!.pop();
  // }
  //
  // void pushSecondary(Widget page) {
  //   secondaryNavigatorKey?.currentState!.push(
  //     MaterialPageRoute(builder: (context) => page),
  //   );
  // }
  //
  // void popSecondary() {
  //   secondaryNavigatorKey?.currentState!.pop();
  // }
}
