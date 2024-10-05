// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../main.dart';

// // Now if i want to access the main.dart file nameProvider variable then we can use two ways
// //  1. Using Consumer widget for stateless  widget
// //  if i want to access in statefull then  i can use ConsumerStatefulWidget
// //  2. Using ref.read() method     (1.)
// //  3. Using ref.watch() method    (2.)
// //  4. Using ref.select() method   // That is another way to access the state

// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // here Widget ref is help yo to comunicate with the other provider
//     // and the main.dart file Ther provider ref is help you to contact with the provider ref

//     // Here we can access  the nameProvider variable using ref.watch()  method cause nameProvider is
//        a global variable

//     final name = ref.watch(nameProvider);
//     // now i can use that way to watch the nameProvider variable

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
// If i dont want to use the cosumer widget the i have to wraped the widget Consumer for the
// getting value
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // We can access the nameProvider variable by using the Consumer  widget
    // and the consumer widget take the context , ref, and child ( Here ref is Widget ref )
    // and the ref widget is help to comunicate with the other provider
    // and the main.dart file Ther provider ref is help you to contact with the provider ref
    // If we are using then the one variable wajasa full widget tree are rebuild
    // and if i am using that way then the big project it will be very slow the widget life circle shoude be distroy
    // so its better we can use the Consumer Builder for perticular  widget shoude be rebuild
// final name = ref.watch(nameProvider);  If i am using that way

// ref.watch
// Used to display data and automatically rebuild widgets when the state changes. This is typically
// used in the build method of a widget or in the body of a provider. For example,
// a provider could use ref.watch to combine multiple providers into a new value.
// Its  like a alltime watch that variable so that if the variable any chages  then it will
// be rebuild the widget

// ref.read
// Used to access the current state or notifier without rebuilding the widget. This is often used inside
// functions triggered by user interactions. For example, you can use ref.read to increment a
//counter when a user clicks a button.
// But the read can only one time update so its better if we are using any button action

// ref.select
// A function that uses refs to access the DOM from components. You can attach a ref to an element in your application to access it from anywhere within your component.

    return Scaffold(
      body: Column(
        children: [
          // That is perfet way to hendel the app life circle
          Consumer(builder: (context, ref, child) {
            final name = ref.watch(nameProvider);
            //  now i can use that that way to watch the  nameProvider variable
            return Text(name);
          }),
          const MyWidget(),
        ],
      ),
    );
  }
}

// That is Consumer State full widget
// Thst Consumer state i dont have to use the WidgetRef ref cause of that
// the consumerStateFullWidget is already call the ref when i am useing ConsumerState for the state change

class MyWidget extends ConsumerStatefulWidget {
  const MyWidget({super.key});
  @override
  ConsumerState<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<MyWidget> {
  @override
  void initState() {
    // now i am using the  ConsumerState so i dont have to use the WidgetRef ref
    // so its better we can use the Consumer State for perticular  widget shoude be rebuild
    // when the state change
    ref.read(nameProvider);
    super.initState();
  }

  getData() {
    // if i am using any methode  that is not rebuild the widget then i can use the ref.read
    //  so its better we can use the Consumer State for perticular  widget shoude
    ref.read(nameProvider);
    // in that way
  }

  @override
  Widget build(BuildContext context) {
    //  That is perfet way to hendel the app life circle
    //   That is ConsumerStateFullWidget so that why i dont have to use the WidgetRef ref in the build methode
    final nameProvider1 = ref.watch(nameProvider);
    return Column(
      children: [
        Text(nameProvider1),
      ],
    );
  }
}
