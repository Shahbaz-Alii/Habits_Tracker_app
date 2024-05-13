import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Journal extends StatelessWidget {
  const Journal({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Journal', style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.w900),)));
  }
}
