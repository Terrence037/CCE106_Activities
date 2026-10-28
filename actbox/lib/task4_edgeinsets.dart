
import 'package:flutter/material.dart';

class Task4EdgeInsets extends StatelessWidget {
  const Task4EdgeInsets({super.key});

  Widget _box(Color color, EdgeInsets margin, String label) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.all(12),
      color: color,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TASK 4 - Congson'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _box(
            Colors.red,
            const EdgeInsets.all(30),
            'EdgeInsets.all(30)',
          ),
          _box(
            Colors.yellow.shade700,
            const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 10,
            ),
            'EdgeInsets.symmetric(horizontal: 40, vertical: 10)',
          ),
          _box(
            Colors.blue,
            const EdgeInsets.only(
              left: 30,
              top: 10,
              right: 5,
              bottom: 20,
            ),
            'EdgeInsets.only(left: 30, top: 10, right: 5, bottom: 20)',
          ),
          _box(
            Colors.green,
            const EdgeInsets.fromLTRB(10, 20, 30, 40),
            'EdgeInsets.fromLTRB(10, 20, 30, 40)',
          ),
        ],
      ),
    );
  }
}
