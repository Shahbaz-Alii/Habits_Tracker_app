import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Challenge extends StatelessWidget {
  const Challenge({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Challenges', style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.w900),)));
  }
}
