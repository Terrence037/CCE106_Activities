import 'package:flutter/material.dart';
import 'auth/login.dart';
import 'model/userdata.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Userdata.instance.load(); // load saved comments before the UI starts
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chirpy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const LoginForm(),
    );
  }
}