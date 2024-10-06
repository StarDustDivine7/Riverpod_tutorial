import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/main.dart';

import '../model_and_stateNotifier/user_model.dart';

class StateNotifierProviderExample extends StatelessWidget {
  const StateNotifierProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    void changeNotifierUpdate(WidgetRef ref, String name) {
      // now i am using change notifier so that why i don t need to use the .notifier i can access the function
      // directly
      ref.read(changeNotifierProvider).updateName(name); // here is that
    }

    void nowName(WidgetRef ref, textfeildValue) {
      // here what is heppnening the updateName function or methode is coming from the  stateNotifier class which
      // i am created on the [model_and_stateNotifier] folder  and inside that i have created the user_model.dart file
      ref.read(stateNotifierProvider.notifier).updateName(textfeildValue);
      // and the update the value of the name value
    }

    void updateAgeNew(WidgetRef ref, textfeildAgeValue) {
      ref
          .read(stateNotifierProvider.notifier)
          .updateAge(int.parse(textfeildAgeValue));
    }

    return Scaffold(
      body: Column(
        children: [
          Consumer(builder: (context, WidgetRef ref, child) {
            // final userStateNotifier = ref.watch(stateNotifierProvider) as User;
            // As i am  using that way but when project is big that is  not good practice
            // so we can use another way that is in the main file where i am implement the state notifier provider variable
            // in there i can use there as a type  and that is good practice so do that
            final userStateNotifier = ref.watch(stateNotifierProvider);
            // in that select its only heppend perticular that value is chage then else is not rebuild
            final userNotifierState =
                ref.watch(stateNotifierProvider.select((value) => value.name));
            // so here when the name  is change then only this widget is rebuild
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    onChanged: (v) => nowName(ref, v),
                  ),
                ),
                Text(userStateNotifier.name),
                // here i am initiallize that
                Text(userNotifierState),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    onChanged: (v) => updateAgeNew(ref, v),
                  ),
                ),
                Text(userStateNotifier.age.toString()),
              ],
            );
          })
        ],
      ),
    );
  }
}
