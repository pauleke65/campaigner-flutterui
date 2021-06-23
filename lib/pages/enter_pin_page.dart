import 'package:flutter/material.dart';

class EnterPinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
