import 'package:flutter/material.dart';
import 'package:zuri_task/screens/login_screen.dart';
import 'package:zuri_task/styles/styles.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = '/registration';
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _isObscure = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(height: 100),
            Center(
              child: Text(
                'Registration Form',
                textAlign: TextAlign.start,
                style: Styles.titleTextStyle,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: Styles.textTextStyle,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: Styles.textTextStyle,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: Styles.textTextStyle,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: Styles.textTextStyle,
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
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
                  'Register',
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
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  LoginScreen.routeName,
                );
              },
              child: Text(
                'Already have an account? Login',
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
