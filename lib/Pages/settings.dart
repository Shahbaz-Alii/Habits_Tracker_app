import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Settings', style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.w900),)),
    );
  }
}
