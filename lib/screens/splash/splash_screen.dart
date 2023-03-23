import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_task/layout/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 400.0,
                  width: 300.0,
                ),
              ],
            ),
            const Text(
              'Welcome Back !',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'cairo',
                  fontSize: 30),
            ),
            const SizedBox(height:50,width:50,child: CircularProgressIndicator(color: Colors.amber,strokeWidth: 10,)),
          ],
        ),
      ),
    );
  }
}
