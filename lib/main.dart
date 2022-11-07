import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zuri_task/screens/forgotPassword_screen.dart';
import 'package:zuri_task/screens/home_screen.dart';
import 'package:zuri_task/screens/login_screen.dart';
import 'package:zuri_task/screens/registration_screen.dart';
import 'package:zuri_task/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // home: Home(),
        initialRoute: '/',
        routes: {
          '/': (ctx) => SplashScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          Home.routeName: (ctx) => Home(),
          ForgotPasswordScreen.routeName: (ctx) => ForgotPasswordScreen(),
          RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
          SplashScreen.routeName: (ctx) => SplashScreen(),
        }

        );
  }
}

