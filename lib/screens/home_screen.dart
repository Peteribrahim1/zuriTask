import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zuri_task/screens/login_screen.dart';
import 'package:zuri_task/screens/registration_screen.dart';
import 'package:zuri_task/screens/resetPassword_screen.dart';
import 'package:zuri_task/screens/splash_screen.dart';
import 'package:zuri_task/styles/styles.dart';

class Home extends StatefulWidget {
  static const routeName = 'home';

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = false;

  String name = '';
  String email = '';
  String address = '';
  String occupation = '';

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  void getUsername() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      name = (snap.data() as Map<String, dynamic>)['name'];
      email = (snap.data() as Map<String, dynamic>)['email'];
      address = (snap.data() as Map<String, dynamic>)['address'];
      occupation = (snap.data() as Map<String, dynamic>)['occupation'];
    });
  }

  final currentUser = FirebaseAuth.instance.currentUser;

  void logOut() async {
    setState(() {
      _isLoading = true;
    });
    FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.black,
        content: Text('You are logged out!'),
      ),
    );
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(28, 107, 164, 1),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Center(
              child: Text(
                'Welcome! $name',
                style: Styles.welcomeTextStyle,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'See full profile details below',
              style: Styles.subtitle,
            ),
            SizedBox(height: 10),
            Text(
              'Name: $name',
              style: Styles.normalTextStyle,
            ),
            SizedBox(height: 10),
            Text(
              'Address: $address',
              style: Styles.normalTextStyle,
            ),
            SizedBox(height: 10),
            Text(
              'Occupation: $occupation',
              style: Styles.normalTextStyle,
            ),
            SizedBox(height: 10),
            Text(
              'Email: $email',
              style: Styles.normalTextStyle,
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: _isLoading
                      ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ) : Text(
                    'Logout',
                    textAlign: TextAlign.center,
                    style: Styles.buttonTextStyle,
                  ),
                  onPressed: () {
                    logOut();
                  },
                  style: Styles.buttonStyle,
                ),

                ElevatedButton(
                  child: Text(
                    'Edit Password',
                    textAlign: TextAlign.center,
                    style: Styles.buttonTextStyle,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      ResetPasswordScreen.routeName,
                    );
                  },
                  style: Styles.buttonStyle,
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
