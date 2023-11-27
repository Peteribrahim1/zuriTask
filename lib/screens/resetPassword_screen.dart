import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zuri_task/styles/styles.dart';

import '../resources/auth_methods.dart';
import '../utils/utils.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = 'resetpassword';

  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _isLoading = false;

  var newPassword = '';

  final newPasswordController = TextEditingController();

  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }

  // final currentUser = FirebaseAuth.instance.currentUser;

  void changePassword() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().resetPassword(
      newPassword: newPasswordController.text,
    );

    if (res == 'success') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black,
          content: Text('Your password has been changed. Login again!'),
        ),
      );
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Reset Password'),
      backgroundColor: Color.fromRGBO(28, 107, 164, 1),
    ),
    body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          SizedBox(height: 100),
          Text(
            'Enter new password.',
            style: Styles.inkbuttonTextStyle,
          ),
          SizedBox(height: 20),
          TextField(
            controller: newPasswordController,
            decoration: InputDecoration(
              labelText: 'Enter new password*',
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
              child: _isLoading
                  ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ) : Text(
                'Reset Password',
                textAlign: TextAlign.center,
                style: Styles.buttonTextStyle,
              ),
              onPressed: () {
                setState(() {
                  newPassword = newPasswordController.text;
                });
                changePassword();
              },
              style: Styles.buttonStyle,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    ),
  );
}}
