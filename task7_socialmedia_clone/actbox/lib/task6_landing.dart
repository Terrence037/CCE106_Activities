
import 'package:flutter/material.dart';

import 'task3_pavlova.dart';
import 'task4_edgeinsets.dart';
import 'task5_alignment.dart';
import 'task6_login.dart';

class LandingPage extends StatelessWidget {
  final String username;
  final String password;

  const LandingPage({
    super.key,
    required this.username,
    required this.password,
  });

  Widget _taskButton(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Widget page,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 75,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => page,
              ),
            );
          },
          child: Row(
            children: [
              Icon(icon, size: 32),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Congson Activity 2'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 25),

          const Icon(
            Icons.dashboard,
            size: 70,
            color: Colors.teal,
          ),

          const SizedBox(height: 10),

          const Center(
            child: Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Center(
            child: Text(
              'Username: $username',
              style: const TextStyle(fontSize: 18),
            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(20, 25, 20, 5),
            child: Text(
              'SELECT A TASK',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),

          _taskButton(
            context,
            'TASK 3',
            'Mango Pavlova Recipe',
            Icons.restaurant_menu,
            const PavlovaPage(),
          ),

          _taskButton(
            context,
            'TASK 4',
            'EdgeInsets Demonstration',
            Icons.crop_square,
            const Task4EdgeInsets(),
          ),

          _taskButton(
            context,
            'TASK 5',
            'MainAxisAlignment and CrossAxisAlignment',
            Icons.view_quilt,
            const Task5Menu(),
          ),

          _taskButton(
            context,
            'TASK 6',
            'Login and Registration',
            Icons.person,
            const LoginPage(),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
