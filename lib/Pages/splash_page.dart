import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page.dart';


class SplashPage extends StatefulWidget{
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2,),
        (){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
            builder: (context) => const HomePage(),));});
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body:  Center(
        child: Text(
          // 'Jasoos',
          'Tracker',
          style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: Colors.white ),))
    );
  }
}