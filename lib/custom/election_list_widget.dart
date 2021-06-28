import 'package:campaigner/models/elections.dart';
import 'package:campaigner/screens/verification_screen.dart';
import 'package:flutter/material.dart';

import '../configuration.dart';

class ElectionListWidget extends StatelessWidget {
  const ElectionListWidget({
    Key key,
    this.width,
    this.color,
    this.elections,
  }) : super(key: key);

  final double width;
  final Color color;
  final List<Election> elections;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: elections.length,
      itemBuilder: (builder, index) {
        return MaterialButton(
          onPressed: () {
            print('e list ${elections[index].name}');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => VerificationScreen(
                          post: elections[index].name,
                          locality: elections[index].locality,
                        )));
          },
          child: ElectionWidget(
              width: width,
              color: color,
              name: elections[index].name,
              locality: elections[index].locality,
              from: elections[index].from,
              startTime: elections[index].startTime,
              to: elections[index].to,
              endTime: elections[index].endTime),
        );
      },
    );
  }
}

class ElectionWidget extends StatelessWidget {
  const ElectionWidget({
    Key key,
    @required this.width,
    @required this.color,
    @required this.name,
    @required this.locality,
    @required this.from,
    @required this.startTime,
    @required this.to,
    @required this.endTime,
  }) : super(key: key);

  final double width;
  final Color color;
  final String name;
  final String locality;
  final String from;
  final String startTime;
  final String to;
  final String endTime;

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
                    color: color,
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
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                      Text(
                        locality,
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "From: $from at $startTime",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "To: $to till $endTime",
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
