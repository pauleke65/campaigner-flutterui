import 'package:campaigner/configuration.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  int currentScreen = 0;
  String title = 'Create Account';
  String subTitle = createAccText;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget signupPage() {
      bool showPass = false;
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 70),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Full name",
                      labelStyle: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[600]),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Phone",
                      labelStyle: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[600]),
                    ),
                  ),
                  SizedBox(height: 30),
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
                  SizedBox(height: 170),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  title = 'Set the PIN';
                  subTitle = setPinText;
                  currentScreen = 1;
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
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(color: Colors.black54),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                  child: Text(
                    'Sign in',
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

    Widget setPINPage() {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              "Set your six digit unique PIN.",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(height: 50),
            TextField(
              onSubmitted: (_) {
                setState(() {
                  title = 'Confirm the PIN';
                  subTitle = confirmPinText;

                  currentScreen = 2;
                });
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

    Widget confirmPINPage() {
      _controller.text = '';
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              "Re-Enter you six digit unique PIN.",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(height: 50),
            TextField(
              controller: _controller,
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

    Widget renderPage() {
      switch (currentScreen) {
        case 0:
          setState(() {
            title = 'Create Account';
            subTitle = createAccText;
          });
          return signupPage();

          break;
        case 1:
          setState(() {
            title = 'Set the PIN';
            subTitle = setPinText;
          });
          return setPINPage();

          break;
        case 2:
          setState(() {
            title = 'Confirm the PIN';
            subTitle = confirmPinText;
          });
          return confirmPINPage();

          break;
        default:
          setState(() {
            title = 'Create Account';
            subTitle = createAccText;
          });
          return signupPage();
      }
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
                          color:
                              currentScreen > 0 ? Colors.white : primaryColor,
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          //  color: Colors.white,
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
                          color:
                              currentScreen > 1 ? Colors.white : primaryColor,
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          //color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SF Pro Display',
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    subTitle,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            renderPage(),
          ],
        ),
      ),
    );
  }
}
