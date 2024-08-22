import 'package:fitfy/cubit/counter_cubid.dart';
import 'package:fitfy/other_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubid>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: const Color.fromARGB(255, 234, 154, 177),
              ),
              child: Center(
                child: BlocBuilder<CounterCubid, int>(
                    bloc: counterCubit,
                    builder: (context, count) {
                      return Text(
                        '$count',
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      );
                    }),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubid>().increment(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubid>().decrement(),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const IncrementDecrementPage(),
                ),
              );
            },
            child: const Icon(Icons.abc),
          )
        ],
      ),
    );
  }
}
