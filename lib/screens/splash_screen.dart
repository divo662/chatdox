import 'dart:async';

import 'package:chatdox/screens/home.dart';
import 'package:chatdox/screens/main_page.dart';
import 'package:chatdox/screens/onBoard.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => const OnboardPage()
          )
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Chatdox",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 34,
            color: Colors.blue
          ),
        ),
      ),
    );
  }
}
