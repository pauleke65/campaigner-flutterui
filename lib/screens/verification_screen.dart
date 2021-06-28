import 'package:campaigner/screens/candidates_screen.dart';
import 'package:flutter/material.dart';

import '../configuration.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key key, this.post, this.locality})
      : super(key: key);
  final String post;
  final String locality;
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
          "Verification",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              "Either scan the document using camera or\n select the document from phone",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColorDark,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 30),
            Image.asset('assets/undraw_upload_87y9 1.png', scale: 0.8),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: primaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Scan using camera',
                  style: TextStyle(color: primaryColor, fontSize: 17),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "or",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColorDark,
              ),
            ),
            SizedBox(height: 10),
            MaterialButton(
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: primaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Select a file from phone',
                  style: TextStyle(color: primaryColor, fontSize: 17),
                ),
              ),
            ),
            SizedBox(height: 50),
            rowList("Maximum file size: 20 MB"),
            rowList("Acceptable file format; PNG, JPEG and PDF"),
            rowList(
                "Uploaded document must be approved by\n authorities and up-to-date"),
            SizedBox(height: 50),
            MaterialButton(
              onPressed: () {
                print('verify $post');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => CandidatesScreen(
                              locality: locality,
                              post: post,
                            )));
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
                  'Verify',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget rowList(String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: 50,
      ),
      Container(
        margin: EdgeInsets.only(top: 3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: primaryColor,

          //  color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
      SizedBox(
        width: 15,
      ),
      Text(
        text,
        style: TextStyle(
          color: textColorDark,
        ),
      ),
      SizedBox(height: 25)
    ],
  );
}
