import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body:  Center(child: Text('Progress', style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.w900),)));
  }
}
