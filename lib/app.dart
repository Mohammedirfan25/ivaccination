import 'package:flutter/material.dart';
import 'package:ivaccination/login/views/registration.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistrationForm(),
      theme:ThemeData(
        primarySwatch: Colors.teal,
      ),
    );
  }
}
