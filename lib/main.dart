import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/home/change_notifier_provider.dart';
import 'package:riverpod_tutorial/model_and_stateNotifier/user_model.dart';

// import 'home/home_page.dart';
import 'home/state_notifier_provider.dart';
import 'home/state_provider.dart';

// In Provider is three types :
//  1. Provider
// That provider used for the dart , It is only reade only the widget its cant be the update / change the value
final nameProvider = Provider<String>((ref) {
  // Or you can pass the datatype also ther
  // return null;  // if i dont to return anything then  it will return null
  return "debabrata"; // if i am pass any value then the (provider ref) automaticaly detact that the type of the value
}); // its  only read only and the ref is known as a Provider ref
//and the proveder ref is allow us to talk with other provider

//======================================================================================================
//  2.  StateProvider
// Now i am using a state provider
// State provider is used for the state management
// Now if we are using a state provider then i can update/ change the value itself
// Here what am i do initialy i dont want to pass any value so that after when i am
// using tha state provider then i can chage the value
final stateProvider = StateProvider((ref) => "");

// ======================================================================================================
//  3.  StateNotifierProvider
// in above case  we are using a state provider but its defficiult  to manage the state when i ahve complex data
// which come in the model object so that i have to implement state notifier provider , you can watch model folder
// Inportent Note : I cant pass any data type here its only take an a State Notifier class only
final stateNotifierProvider = StateNotifierProvider<UserProvider, User>(
    // here what am i do  i am passing a UserProvider class first  and User class second for the state of the  user
    (ref) => UserProvider(User(name: "Debabrata Dutta", age: 0)));
// Here i have to pass the the initial state
// here i am using the User class so thet i am passing the value of the user name and age

//=============================================================================================
// Now i am implement of the change notifier provider
// 3. Change Notifier Provider
// Here we are using the Change Notifier Provider for the state management
final changeNotifierProvider =
    ChangeNotifierProvider((ref) => ChangeNotifierProviderExample());

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // That is variable call state
      //  home: const HomePage();
      // Call the state provider
      // home: const StateProverExample(),
      home: StateNotifierProviderExample(),
    );
  }
}
