import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zuri_task/screens/registration_screen.dart';
import 'package:zuri_task/styles/styles.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashscreen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, RegistrationScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 300),
            Center(
              child: Text(
                'ZURI TASK V2.0',
                style: Styles.splashStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
