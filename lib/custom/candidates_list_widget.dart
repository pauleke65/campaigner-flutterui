import 'package:campaigner/models/candidates.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../configuration.dart';

class CandidatesList extends StatefulWidget {
  const CandidatesList({Key key, this.candidates, this.post, this.locality})
      : super(key: key);
  final List<Candidates> candidates;
  final String post;
  final String locality;

  @override
  _CandidatesListState createState() => _CandidatesListState();
}

class _CandidatesListState extends State<CandidatesList> {
  int _selectedIndex;

  Widget styledButton({
    BuildContext context,
    String text,
    Color backColor,
    Color color,
    int callFunction,
    int index,
  }) {
    return MaterialButton(
      onPressed: () {
        callFunction == 1
            ? showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text(
                      "Confirm your selection?",
                    ),
                    content: Text(
                        "You have selected ${widget.candidates[index].name} for the post of ${widget.post} at ${widget.locality}"),
                    actions: [
                      CupertinoDialogAction(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            _selectedIndex = null;
                          });
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: Text('Yes'),
                        onPressed: () {
                          //Navigator.pop(context);
                          showCupertinoDialog(
                            context: context,
                            builder: (builder) => CupertinoAlertDialog(
                              title: Text("Vote submitted successfully!!"),
                              content: Text(
                                  "Turn on notifications for the results?"),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text('No'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      _selectedIndex = null;
                                    });
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: Text('Yes'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      _selectedIndex = null;
                                    });
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  );
                })
            : {};
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50,
        decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: primaryColor, width: 2)),
        child: Text(
          text,
          style: TextStyle(color: color, fontSize: 17),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.candidates.length,
        itemBuilder: (builder, index) {
          return _selectedIndex == index
              ? ColorFiltered(
                  colorFilter:
                      ColorFilter.mode(Colors.blue[100], BlendMode.softLight),
                  child: candidateCard(context, index),
                )
              : candidateCard(context, index);
        });
  }

  Widget candidateCard(BuildContext context, int index) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(top: 5),
      child: MaterialButton(
        onPressed: () {
          setState(() {
            _selectedIndex = index;
          });
          showModalBottomSheet(
            isScrollControlled: true,
            barrierColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (builder) => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                setState(() {
                  _selectedIndex = null;
                });
                Navigator.pop(context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  styledButton(
                    text: "Reject",
                    color: primaryColor,
                    backColor: Colors.transparent,
                    callFunction: 0,
                    index: index,
                    context: context,
                  ),
                  SizedBox(height: 20),
                  styledButton(
                    text: "Select",
                    color: Colors.white,
                    backColor: primaryColor,
                    callFunction: 1,
                    index: index,
                    context: context,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
          ),
          title: Text(
            widget.candidates[index].name,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Team: ${widget.candidates[index].team}',
            style: TextStyle(
              color: textColorDark,
              fontSize: 15,
            ),
          ),
          trailing: Icon(
            Icons.info_outline,
            color: primaryColor,
            size: 30,
          ),
        ),
      ),
    );
  }
}
