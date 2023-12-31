import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'SplashScreen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConstants.bgColor,
        body: Center(
          child: Text(
            'XO',
            style: AppConstants.customFontWhite.copyWith(fontSize: 200),
          ),
        ));
  }
}
