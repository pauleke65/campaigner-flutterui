import 'package:campaigner/configuration.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool isPinPage = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget signinPage() {
      bool showPass = false;
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Phone/ Email Id",
                      labelStyle: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[600]),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    obscureText: !showPass,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            showPass = !showPass;
                          });
                        },
                        child: Text(
                          showPass ? 'Hide' : 'Show',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[600]),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  isPinPage = true;
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account? ',
                  style: TextStyle(color: Colors.black54),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget enterPinPage() {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              "Enter you six digit unique PIN.",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(height: 50),
            TextField(
              onSubmitted: (_) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              },
              obscureText: true,
              showCursor: false,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
              keyboardType: TextInputType.phone,
              maxLength: 6,
              decoration: InputDecoration(
                hintText: "Enter PIN here",
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 30, top: 35, right: 50),
              width: width,
              height: height * 0.2,
              color: primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 13,
                        height: 13,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 13,
                        height: 13,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          color: isPinPage ? Colors.white : primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    isPinPage ? 'Enter your PIN' : 'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SF Pro Display',
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    isPinPage
                        ? 'You will have to enter your unique Pin, to enter the app'
                        : 'Enter all the required details, to enter the app',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            isPinPage ? enterPinPage() : signinPage(),
          ],
        ),
      ),
    );
  }
}
