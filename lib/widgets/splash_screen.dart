import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intenshala_assessment/screens/internship_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateToNextScreen();
    super.initState();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return InternshipsPage();
      },
    ), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            'assets/internshala_company_logo.png',
            width: 300,
          ),
        ));
  }
}
