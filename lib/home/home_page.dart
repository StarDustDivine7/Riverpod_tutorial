// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../main.dart';

// // Now if i want to access the main.dart file nameProvider variable then we can use two ways
// //  1. Using Consumer widget for stateless  widget
// // if i want to access in statefull then  i can use ConsumerStatefulWidget
// //  2. Using context.read() method
// //  3. Using context.watch() method
// //  4. Using context.select() method

// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // here Widget ref is help yo to comunicate with the other provider
//     // and the main.dart file Ther provider ref is help you to contact with the provider ref

//     // Here we can access  the nameProvider variable using ref.watch()
//     final name = ref.watch(nameProvider);
//     // now i can use that that way to watch the  nameProvider variable

//     return Scaffold(
//       body: Column(
//         children: [
//           Center(child: Text(name)),
//         ],
//       ),
//     );
//   }
// }
//============================================================================================================
// Now i am using stateless widget and using consumer for read the value

// If i dont want to use the cosumer widget the i have to wraped the widget Consumer for the for
// getting the value
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // We can acces  the nameProvider variable by using the Consumer  widget
    // and the consumer widget take the context , ref, and child
    // abd the ref widget  is help to comunicate with the other provider
    //  and the main.dart file Ther provider ref is help you to contact with the provider ref
    return Scaffold(
      body: Column(
        children: [
          Consumer(builder: (context, ref, child) {
            final name = ref.watch(nameProvider);
            //  now i can use that that way to watch the  nameProvider variable
            return Text(name);
          })
        ],
      ),
    );
  }
}
