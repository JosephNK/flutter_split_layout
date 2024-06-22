import 'package:flutter/material.dart';
import 'package:flutter_split_layout/flutter_split_layout.dart';

import 'src/my_primary_page.dart';
import 'src/my_secondary_page.dart';

enum DeviceType { phone, tablet }

DeviceType getDeviceType() {
  final data = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.single);
  return data.size.shortestSide < 550 ? DeviceType.phone : DeviceType.tablet;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FlutterSplitController splitController;

  @override
  void initState() {
    super.initState();

    splitController = FlutterSplitController();

    switch (getDeviceType()) {
      case DeviceType.phone:
        splitController.primaryNavigatorKey = null;
        splitController.secondaryNavigatorKey = null;
        break;
      case DeviceType.tablet:
        splitController.primaryNavigatorKey = GlobalKey<NavigatorState>();
        splitController.secondaryNavigatorKey = GlobalKey<NavigatorState>();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Flutter Demo';
    final themeData = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );

    switch (getDeviceType()) {
      case DeviceType.phone:
        return MaterialApp(
          title: title,
          theme: themeData,
          home: const MyPrimaryPage(),
        );
      case DeviceType.tablet:
        return FlutterSplitMaterialApp(
          title: title,
          theme: themeData,
          controller: splitController,
          primary: const MyPrimaryPage(),
          secondary: const MySecondaryPage(),
        );
    }
  }
}
