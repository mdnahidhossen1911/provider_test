import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/counterModel.dart';
import 'package:provider_test/slider_model.dart';
import 'package:provider_test/test_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider( // multiple provider
      providers: [
        ChangeNotifierProvider(create: (context) => CounterModel()),
        ChangeNotifierProvider(create: (context) => SliderModel()),
      ],
      child: MaterialApp(title: 'Flutter Demo', home: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterModel>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(title: Text('data')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Consumer<CounterModel>(
              builder: (context, value, child) => Text(
                counter.count.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestScreen()),
                );
              },
              child: Text('Move'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
