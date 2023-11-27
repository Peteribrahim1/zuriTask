import 'package:flutter/material.dart';
import 'package:zuri_task/screens/login_screen.dart';
import 'package:zuri_task/styles/styles.dart';

import '../resources/auth_methods.dart';
import '../utils/utils.dart';
import '../widgets/text_field_input.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = '/registration';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _occupationController.dispose();
    _addressController.dispose();
  }

  // bool _isObscure = true;

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
      address: _addressController.text,
      occupation: _occupationController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
      //test run
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black,
          content: Text('Account created successfully!'),
        ),
      );
    }
  }

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
            TextFieldInput(
              hintText: 'Enter your name',
              textInputType: TextInputType.text,
              textEditingController: _nameController,
            ),
            SizedBox(height: 20),
            TextFieldInput(
              hintText: 'Enter your address',
              textInputType: TextInputType.text,
              textEditingController: _addressController,
            ),
            SizedBox(height: 20),
            TextFieldInput(
              hintText: 'Enter your occupation',
              textInputType: TextInputType.text,
              textEditingController: _occupationController,
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
                      )
                    : Text(
                        'Register',
                        textAlign: TextAlign.center,
                        style: Styles.buttonTextStyle,
                      ),
                onPressed: signUpUser,

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
