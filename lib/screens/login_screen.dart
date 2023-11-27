import 'package:flutter/material.dart';
import 'package:zuri_task/screens/forgotPassword_screen.dart';
import 'package:zuri_task/screens/home_screen.dart';
import 'package:zuri_task/screens/registration_screen.dart';
import 'package:zuri_task/screens/resetPassword_screen.dart';
import 'package:zuri_task/styles/styles.dart';

import '../resources/auth_methods.dart';
import '../utils/utils.dart';
import '../widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/log-in';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (res == 'success') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }
 // bool _isObscure = true;
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
            TextFieldInput(
              hintText: 'Enter your email',
              textInputType: TextInputType.emailAddress,
              textEditingController: _emailController,
            ),
            SizedBox(height: 20),
            TextFieldInput(
              hintText: 'Enter your password',
              textInputType: TextInputType.text,
              textEditingController: _passwordController,
              isPass: true,
            ),

            SizedBox(height: 20),
            //Button
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                child: _isLoading
                    ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ) : Text(
                  'Log in',
                  textAlign: TextAlign.center,
                  style: Styles.buttonTextStyle,
                ),
                onPressed: loginUser,
                style: Styles.buttonStyle,
              ),
            ),
            SizedBox(height: 20),
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
            SizedBox(height: 11),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ResetPasswordScreen.routeName,
                );
              },
              child: Text(
                'Forgot password?',
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
