import 'package:flutter/material.dart';
import 'package:zuri_task/screens/login_screen.dart';
import 'package:zuri_task/screens/registration_screen.dart';
import 'package:zuri_task/screens/splash_screen.dart';
import 'package:zuri_task/styles/styles.dart';

class Home extends StatelessWidget {
  static const routeName = 'home';

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(28, 107, 164, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 200),
            Center(
              child: Text(
                'This is the home page',
                style: Styles.inkbuttonTextStyle,
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              child: Text(
                'Restart App',
                textAlign: TextAlign.center,
                style: Styles.buttonTextStyle,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  SplashScreen.routeName,
                );
              },
              style: Styles.buttonStyle,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
