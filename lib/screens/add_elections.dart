import 'package:campaigner/models/elections.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../configuration.dart';

class AddElectionsScreen extends StatefulWidget {
  const AddElectionsScreen({Key key}) : super(key: key);

  @override
  _AddElectionsScreenState createState() => _AddElectionsScreenState();
}

class _AddElectionsScreenState extends State<AddElectionsScreen> {
  String title = "Add Election";
  int currentScreen = 0;
  bool liveResults = true;
  bool publicLink = false;

  TextEditingController _designation = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _locality = TextEditingController();
  TextEditingController _from = TextEditingController();
  TextEditingController _to = TextEditingController();
  TextEditingController _start = TextEditingController();
  TextEditingController _end = TextEditingController();
  TextEditingController _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget addElection() {
      return Column(
        children: [
          TextField(
            controller: _designation,
            decoration: InputDecoration(
              labelText: "Your designation",
              labelStyle: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600]),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _name,
            decoration: InputDecoration(
              labelText: "Election name/title",
              labelStyle: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600]),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _locality,
            decoration: InputDecoration(
              labelText: "Locality",
              labelStyle: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600]),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 120,
                child: TextField(
                  controller: _from,
                  decoration: InputDecoration(
                    labelText: "From",
                    labelStyle: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[600]),
                  ),
                ),
              ),
              SizedBox(width: 20),
              SizedBox(
                width: 120,
                child: TextField(
                  controller: _to,
                  decoration: InputDecoration(
                    labelText: "To",
                    labelStyle: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[600]),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                child: TextField(
                  controller: _start,
                  decoration: InputDecoration(
                    labelText: "Start time",
                    labelStyle: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[600]),
                  ),
                ),
              ),
              SizedBox(width: 120),
              SizedBox(
                width: 100,
                child: TextField(
                  controller: _end,
                  decoration: InputDecoration(
                    labelText: "End time",
                    labelStyle: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[600]),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          TextField(
            controller: _description,
            minLines: 4,
            maxLines: 4,
            decoration: InputDecoration(
              labelText: "Description (max: 100 characters)",
              labelStyle: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600]),
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Show live results',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              CupertinoSwitch(
                value: liveResults,
                onChanged: (_) {
                  setState(() {
                    liveResults = !liveResults;
                  });
                },
                activeColor: primaryColor,
              )
            ],
          ),
          SizedBox(height: 40),
          MaterialButton(
            onPressed: () {
              setState(() {
                currentScreen = 1;
                title = "Add Candidates";
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
                'Next',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
        ],
      );
    }

    Widget addCandidates() {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Image.asset('assets/undraw_add_content_d1tf 1.png', scale: 0.8),
            SizedBox(height: 50),
            Text(
              "Upload an Excel file having all the required details\n of all the candidates or add the candidate details\n manually",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColorDark,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 50),
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
                  'Upload Excel File',
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
                  'Add Candidates Manually',
                  style: TextStyle(color: primaryColor, fontSize: 17),
                ),
              ),
            ),
            SizedBox(height: 100),
            MaterialButton(
              onPressed: () {
                setState(() {
                  currentScreen = 2;
                  title = "Add Voters";
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
                  'Next',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget addVoters() {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Image.asset('assets/undraw_add_file_4gfw 1.png', scale: 0.8),
            SizedBox(height: 50),
            Text(
              "Upload an Excel file to add voters or send invitation\n via mail to participate in the election.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColorDark,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Generate a Public Link',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                CupertinoSwitch(
                  value: publicLink,
                  onChanged: (_) {
                    setState(() {
                      publicLink = !publicLink;
                    });
                  },
                  activeColor: primaryColor,
                )
              ],
            ),
            SizedBox(height: 35),
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
                  'Upload Excel File',
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
                  'Send invitation via mail',
                  style: TextStyle(color: primaryColor, fontSize: 17),
                ),
              ),
            ),
            SizedBox(height: 100),
            MaterialButton(
              onPressed: () {
                ongoingElections.insert(
                  0,
                  Election(
                    designation: _designation.text,
                    name: _name.text,
                    locality: _locality.text,
                    from: _from.text,
                    to: _to.text,
                    startTime: _start.text,
                    endTime: _end.text,
                    description: _description.text,
                  ),
                );
                Navigator.pop(context);
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
                  'Finish',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
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
            title = 'Add Election';
          });
          return addElection();

          break;
        case 1:
          setState(() {
            title = 'Add Candidates';
          });
          return addCandidates();

          break;
        case 2:
          setState(() {
            title = 'Add Voters';
          });
          return addVoters();

          break;
        default:
          setState(() {
            title = 'Add Election';
          });
          return addElection();
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          title,
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 13,
                  height: 13,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: primaryColor,
                      width: 1,
                    ),
                    color: primaryColor,
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
                    color: currentScreen > 0 ? primaryColor : Colors.white,
                    border: Border.all(
                      color: primaryColor,
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
                    color: currentScreen > 1 ? primaryColor : Colors.white,
                    border: Border.all(
                      color: primaryColor,
                      width: 1,
                    ),
                    //color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            renderPage()
          ],
        ),
      ),
    );
  }
}
