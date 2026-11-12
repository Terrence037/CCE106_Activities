import 'package:flutter/material.dart';
import '../../socialmedia.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String errormessage = '';
  bool isError = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void checkLogin(String username, String password) {
    setState(() {
      if (username.trim().isEmpty) {
        errormessage = 'Please input your username!';
        isError = true;
      } else if (password.isEmpty) {
        errormessage = 'Please input your password!';
        isError = true;
      } else {
        errormessage = '';
        isError = false;
      }
    });
  }

  var txtstyle = const TextStyle(
      fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 38);
  var registertxtstyle = const TextStyle(
      fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 14);
  var errortxtstyle = const TextStyle(
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
      fontSize: 14,
      color: Colors.red);
  var txtstyle2 = const TextStyle(
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
      fontSize: 24,
      color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // scroll view so the keyboard never overflows on a real phone
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.chat_bubble, size: 48, color: Colors.teal),
                    const SizedBox(width: 12),
                    Text('CHIRPY', style: txtstyle),
                  ],
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Username',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Password',
                    prefixIcon: Icon(Icons.password),
                  ),
                ),
                const SizedBox(height: 10),
                if (isError) Text(errormessage, style: errortxtstyle),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.teal,
                  ),
                  onPressed: () {
                    checkLogin(usernameController.text, passwordController.text);
                    if (!isError) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Socialmedia()),
                      );
                    }
                  },
                  child: Text('LOGIN', style: txtstyle2),
                ),
                const SizedBox(height: 10),
                Text("Don't have an account? Register", style: registertxtstyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}