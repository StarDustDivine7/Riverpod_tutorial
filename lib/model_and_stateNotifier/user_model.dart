// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// For the crete a model i am using the extension that calles a dart data class generator
class User {
  final String name;
  final int age;
  User({
    required this.name,
    required this.age,
  });

  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());
  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, age: $age)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

// In above case i am created a user model
// now i am implement in the User provider and that i am using a StateNotifier
//
class UserProvider extends StateNotifier<User> {
// in the state  notifer we are passing the User model or i
//  can say the type of the state Like String , list , map, bool, ect.
// and after state notifier class is created then i have to created the constructur
  UserProvider(
      // here the constructur
      super.state); // when i am created the constructor that time the class error will be gone
  // now i am created the update state function or i an say methode
  void updateName(String userTypeOntheTextfeild) {
    // state = User(name: userTypeOntheTextfeild, age: state.age);  // that is i am initially update the data
    // but now what i am do oin the above case the created model class which i am created in the in the generator
    // i want to pass the  data to the model class so that i can use the model class in the provider
    // so that i can use the model class in the provider
    state = state.copyWith(name: userTypeOntheTextfeild);
    // the copy With is the method of the model class
  }

  void updateAge(int ageType) {
    state = state.copyWith(age: ageType);
  }
}
