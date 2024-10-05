import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/main.dart';

class StateProverExample extends ConsumerWidget {
  const StateProverExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // If i am using that way its full widget tree reduild every time

    // final state = ref.watch(stateProvider) ??
    //     ""; // That is meains if  state is null then it will return empty string

    // nowUpdate(WidgetRef ref, String value) {
    //   // NOW that methode what i am geeting the text feild value i am updating the value with help of the
    //   // stateProvider
    //   // in the current case the null sefty wise i cant pass the null value in the state provider so that
    //   // why i am using there a empty string value

    //   ref.read(stateProvider.notifier).update((state) => value);
    // }

    // print("Rebuild");
    // That is all time rebuild full widget tree
    return Scaffold(
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 15),
          //   // Now what am i do i want to update the value of the state provider
          //   child: TextField(
          //     onChanged: (v) => nowUpdate(ref, v),
          //   ),
          // ),
          // Text(state),
          SecondWayMyside(),
        ],
      ),
    );
  }
}

class SecondWayMyside extends ConsumerWidget {
  const SecondWayMyside({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
// That is the perfet way to avoid the full widget tree rebuld
    print("Rebuild2");
    nowUpdate(WidgetRef ref, String value) {
      // NOW that methode what i am geeting the text feild value i am updating the value with help of the
      // stateProvider
      // in the current case the null sefty wise i cant pass the null value in the state provider so that
      // why i am using there a empty string
      ref.read(stateProvider.notifier).update((state) => value);
      // I am using read cause of that it s at a time value check and not everytime watch
    }

    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            // Now what am i do i want to update the value of the state provider
            child: Consumer(builder: (context, WidgetRef ref, child) {
              return TextField(
                onChanged: (v) => nowUpdate(ref, v),
              );
            })),
        Consumer(builder: (context, WidgetRef ref, child) {
          final state = ref.watch(stateProvider);
          // here i am using watch cause of that i want to watch everytime
          return Text(state);
        }),
      ],
    );
  }
}
