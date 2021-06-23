import 'package:flutter/material.dart';

import '../configuration.dart';

class ElectionWidget extends StatelessWidget {
  const ElectionWidget({Key key, this.width}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: InkWell(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            width: width,
            height: 130,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[300],
                    blurRadius: 30,
                    offset: Offset(0, 10))
              ],
            ),
            child: Row(
              //mainAxisSize: ,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width * 0.015,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Product Manager",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                      Text(
                        "Xylino, New Delhi",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "From: 10-Oct-2019 at 8:00AM",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "To: 13-Oct-2019 till 9:00PM",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.bookmark_border,
                      color: primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
