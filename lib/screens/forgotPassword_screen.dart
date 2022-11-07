import 'package:flutter/material.dart';
import 'package:zuri_task/styles/styles.dart';

import 'login_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = 'forgotpassword';
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        backgroundColor: Color.fromRGBO(28, 107, 164, 1),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              'Type in the email address linked to your account to reset password.',
              style: Styles.inkbuttonTextStyle,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email Address*',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: Styles.textTextStyle,
            ),
            SizedBox(height: 20),
            //Button
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                child: Text(
                  'Reset Password',
                  textAlign: TextAlign.center,
                  style: Styles.buttonTextStyle,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    LoginScreen.routeName,
                  );
                },
                style: Styles.buttonStyle,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
