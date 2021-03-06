import 'package:campaigner/models/candidates.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../configuration.dart';

class CandidatesScreen extends StatefulWidget {
  const CandidatesScreen({Key key, this.post, this.locality}) : super(key: key);
  final String post;
  final String locality;

  @override
  _CandidatesScreenState createState() => _CandidatesScreenState();
}

class _CandidatesScreenState extends State<CandidatesScreen> {
  int _selectedIndex;
  List<Candidates> rejectedCandidates = [candidates[0]];

  void rejectFunction() {
    setState(() {
      rejectedCandidates.insert(0, candidates[_selectedIndex]);
      candidates.removeAt(_selectedIndex);
    });
  }

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
                        "You have selected ${candidates[index].name} for the post of ${widget.post} at ${widget.locality}"),
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
            : rejectFunction();
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

  Widget candidateCard(BuildContext context, int index, Candidates candidate) {
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
              //  behavior: HitTestBehavior.opaque,
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
          contentPadding: EdgeInsets.all(1),
          leading: CircleAvatar(
            radius: 30,
          ),
          title: Text(
            candidate.name,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Team: ${candidate.team}',
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: candidates.length,
            itemBuilder: (builder, index) {
              return _selectedIndex == index
                  ? ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          Colors.blue[100], BlendMode.softLight),
                      child: candidateCard(context, index, candidates[index]),
                    )
                  : candidateCard(context, index, candidates[index]);
            },
          ),
          ColorFiltered(
            colorFilter:
                ColorFilter.mode(Colors.grey[200], BlendMode.softLight),
            child: AbsorbPointer(
              absorbing: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  rejectedCandidates.length == 0
                      ? SizedBox()
                      : Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "Rejected Candidates",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      itemCount: rejectedCandidates.length,
                      itemBuilder: (builder, index) {
                        return candidateCard(
                            context, index, rejectedCandidates[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
