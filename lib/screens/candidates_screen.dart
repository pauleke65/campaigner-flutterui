import 'package:flutter/material.dart';

import '../configuration.dart';

class CandidatesScreen extends StatefulWidget {
  const CandidatesScreen({Key key}) : super(key: key);

  @override
  _CandidatesScreenState createState() => _CandidatesScreenState();
}

class _CandidatesScreenState extends State<CandidatesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          "Select Candidate",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.grey[300], fontSize: 17),
              ),
            ),
          ),
        ],
        // bottom:
      ),
    );
  }
}
