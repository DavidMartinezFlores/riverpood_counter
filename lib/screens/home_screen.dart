import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpood_counter/conf/providers/counter_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);

    return Scaffold(
      floatingActionButton: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
          ),
          FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                ref.read(counterProvider.notifier).state++;
              },
              child: const Text("+",
                  style: TextStyle(
                      color: Color.fromARGB(255, 2, 176, 57),
                      fontSize: 30,
                      fontWeight: FontWeight.bold))),
          FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                ref.read(counterProvider.notifier).state--;
              },
              child: const Text("-",
                  style: TextStyle(
                      color: Color.fromARGB(255, 176, 2, 2),
                      fontSize: 30,
                      fontWeight: FontWeight.bold))),
        ],
      ),
      body: Center(
        child: clickCounter > 0
            ? Text("$clickCounter",
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.green))
            : Text("$clickCounter",
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)),
      ),
    );
  }
}
