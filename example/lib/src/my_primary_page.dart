import 'package:flutter/material.dart';
import 'package:flutter_split_layout/flutter_split_layout.dart';

import 'my_secondary_detail_page.dart';

class MyPrimaryPage extends StatefulWidget {
  const MyPrimaryPage({super.key});

  @override
  State<MyPrimaryPage> createState() => _MyPrimaryPageState();
}

class _MyPrimaryPageState extends State<MyPrimaryPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Primary Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20.0),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.map),
                    title: const Text('Map'),
                    onTap: () {
                      final controller = FlutterSplitController();
                      Navigator.push(
                        controller.secondaryContext ?? context,
                        MaterialPageRoute(
                          builder: (context) => const MySecondaryDetailPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_album),
                    title: const Text('Album'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: const Text('Phone'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
