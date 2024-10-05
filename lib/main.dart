import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home/home_page.dart';

// In Provider is three types :
//  1. Provider
// That provider used for ther dart , It is only reade only the widget its cant be the update the value
final nameProvider = Provider<String>((ref) {
  // Or you can pass the datatype aloso ther
  // return null;  // if i dont to return anything then  it will return null
  return "debabrata"; // if i am pass any value then the (provider ref) automaticaly detact that the type of the value
}); // its  only read only and the ref is known as a Provider ref
//and the proveder ref is allow us to talk with other provider
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage());
  }
}
