import 'package:flutter/material.dart';

class TestText extends StatelessWidget {
  const TestText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Text'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: <Widget>[
                //
                // ---------------- display ------------------
                Text(
                  "Test",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  "Test",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  "Test",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                //
                const Text("\n------------------------------------------\n"),
                // ---------------- headline ------------------
                Text(
                  "Test",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "Test",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  "Test",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                //
                const Text("\n------------------------------------------\n"),
                // ---------------- title ------------------
                Text(
                  "Test",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "Test",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "Test",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                //
                const Text("\n------------------------------------------\n"),
                // ---------------- label ------------------
                Text(
                  "Test",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  "Test",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(
                  "Test",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                //
                const Text("\n------------------------------------------\n"),
                // ---------------- body ------------------
                Text(
                  "Test",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "Test",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Test",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
