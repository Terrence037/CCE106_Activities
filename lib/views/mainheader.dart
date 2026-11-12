import 'package:flutter/material.dart';
import '../model/userdata.dart';
import 'appimage.dart';

class Mainheader extends StatelessWidget {
  const Mainheader({super.key, required this.userdata});

  final Userdata userdata;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Avatar(userdata.myUserAccount.img, radius: 40),
        const SizedBox(height: 8),
        Text(
          userdata.myUserAccount.name,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        Text(userdata.myUserAccount.email),
        const SizedBox(height: 20),
      ],
    );
  }
}