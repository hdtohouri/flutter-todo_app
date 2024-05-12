import 'package:flutter/material.dart';
import './forgot_password.dart';
import './register.dart';
import './login.dart';
import './home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Register();
  }
}