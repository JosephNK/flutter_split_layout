# flutter_split_layout

This plugin is `Flutter Split Layout` plugin.

This plugin was created in Flutter, referring to the iOS Split Style.

Note: that it is not the same as iOS Split Style!

## Usage

`FlutterSplitController` is a Singleton object.

Please refer to the `example` folder for more details.

### How to initialize

```dart
main.dart

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
  switch (getDeviceType()) {
    case DeviceType.phone:
      ...
    case DeviceType.tablet:
      return FlutterSplitMaterialApp(
          controller: splitController,
          primaryApp: MaterialApp(
              title: title,
              theme: themeData,
              home: const MyPrimaryPage(),
          ),
          secondaryApp: MaterialApp(
              title: title,
              theme: themeData,
              home: const MySecondaryPage(),
          ),
      ); 
}
```

### How to navigate to a new screen only on secondary.

If `secondaryContext` is Null, Navigator push is performed using the context of the relevant screen. 
This is for use with both `phone` and `tablet`.

In the example, the `my_primary_page.dart` file is used simultaneously on phone and tablet. 
The code below is for Navigator push with one code.


```dart
my_primary_page.dart

final controller = FlutterSplitController();
Navigator.push(
    controller.secondaryContext ?? context,
    MaterialPageRoute(
      builder: (context) => const MySecondaryDetailPage(),
    ),
);
```

## Contributors

Thank you for your interest in the source and for your help :)
