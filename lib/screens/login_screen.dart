import 'package:flutter/material.dart';
import 'package:zuri_task/screens/forgotPassword_screen.dart';
import 'package:zuri_task/screens/home_screen.dart';
import 'package:zuri_task/screens/registration_screen.dart';
import 'package:zuri_task/styles/styles.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/log-in';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              'Log in to continue',
              textAlign: TextAlign.start,
              style: Styles.titleTextStyle,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: Styles.textTextStyle,
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
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
                  'Log in',
                  textAlign: TextAlign.center,
                  style: Styles.buttonTextStyle,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    Home.routeName,
                  );
                },
                style: Styles.buttonStyle,
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ForgotPasswordScreen.routeName,
                );
              },
              child: Text(
                'Forgot password?',
                textAlign: TextAlign.center,
                style: Styles.inkbuttonTextStyle,
              ),
            ),
            SizedBox(height: 11),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  RegistrationScreen.routeName,
                );
              },
              child: Text(
                'Don\'t have an account? Signup',
                textAlign: TextAlign.center,
                style: Styles.inkbuttonTextStyle,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
