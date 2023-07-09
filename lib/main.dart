import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<Counter>(
                builder: (context, counter, child) {
                  return Text(
                    'Count: ${counter.count}',
                    style: const TextStyle(fontSize: 24),
                  );
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: Provider.of<Counter>(context).decrement,
                    child: const Text('-', style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: Provider.of<Counter>(context).increment,
                    child: const Text('+', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Provider.of<Counter>(context, listen: false).reset();
                },
                child: const Text('Reset', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterProvider extends StatelessWidget {
  final Widget child;

  const CounterProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (_) => Counter(),
      child: child,
    );
  }
}

void main() {
  runApp(
    const CounterProvider(
      child: MyApp(),
    ),
  );
}
