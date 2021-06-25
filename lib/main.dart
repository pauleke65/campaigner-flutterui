import 'package:campaigner/screens/candidates_screen.dart';
import 'package:campaigner/screens/conduct_screen.dart';
import 'package:campaigner/screens/home_screen.dart';
import 'package:campaigner/screens/participate.dart';
import 'package:campaigner/screens/sign_in.dart';
import 'package:campaigner/screens/sign_up.dart';
import 'package:campaigner/screens/verification_screen.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'SF Pro Text',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/signin': (context) => SigninScreen(),
        '/home': (context) => HomeScreen(),
        '/participate': (context) => ParticipateScreen(),
        '/conduct': (context) => ConductScreen(),
        '/signup': (context) => SignupScreen(),
        'verification': (context) => VerificationScreen(),
        '/candidates': (context) => CandidatesScreen(),
      },
    );
  }
}
