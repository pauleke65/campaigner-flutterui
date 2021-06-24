import 'package:campaigner/configuration.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Welcome to',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Campaigner',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.bold,
                  fontSize: 50),
            ),
            SizedBox(height: 20),
            Text(
              'An online voting app',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 50),
            Image.asset(
              'assets/sign-up-3 2.png',
              scale: 0.9,
            ),
            SizedBox(height: 70),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Sign up',
                  style: TextStyle(color: primaryColor, fontSize: 17),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(color: Colors.white),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
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
