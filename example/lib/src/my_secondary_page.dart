import 'package:flutter/material.dart';

import 'my_secondary_detail_page.dart';

class MySecondaryPage extends StatefulWidget {
  const MySecondaryPage({super.key});

  @override
  State<MySecondaryPage> createState() => _MySecondaryPageState();
}

class _MySecondaryPageState extends State<MySecondaryPage> {
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
        title: const Text('Flutter Demo Secondary Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MySecondaryDetailPage(),
                ),
              );
            },
            heroTag: null,
            tooltip: 'Push',
            child: const Icon(Icons.arrow_forward_outlined),
          ),
          const SizedBox(width: 10.0),
          FloatingActionButton(
            heroTag: null,
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
