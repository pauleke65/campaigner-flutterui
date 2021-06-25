import 'package:campaigner/configuration.dart';
import 'package:campaigner/custom/election_list_widget.dart';
import 'package:flutter/material.dart';

class ConductScreen extends StatefulWidget {
  const ConductScreen({Key key}) : super(key: key);

  @override
  _ConductScreenState createState() => _ConductScreenState();
}

class _ConductScreenState extends State<ConductScreen> {
  Color unselected = Colors.grey[400];
  Color selected = Colors.white;
  int _selectedIndex = 0;
  String conductTitle = "Ongoing Elections";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List<ElectionListWidget> elections = [
      ElectionListWidget(
        color: infoColorGreen,
        width: width,
        elections: ongoingElections,
      ),
      ElectionListWidget(
        color: infoColorRed,
        width: width,
        elections: previousElections,
      ),
      ElectionListWidget(
        color: primaryColor,
        width: width,
        elections: draftElections,
      ),
      ElectionListWidget(
        color: infoColorYellow,
        width: width,
        elections: suspendedElections,
      ),
    ];

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
          conductTitle,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          ),
        ],
      ),
      extendBody: false,
      body: elections[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: primaryColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 7,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                  conductTitle = "Ongoing Elections";
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.sync,
                    size: 30,
                    color: _selectedIndex == 0 ? selected : unselected,
                  ),
                  Text(
                    "Ongoing",
                    style: TextStyle(
                      color: _selectedIndex == 0 ? selected : unselected,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                  conductTitle = "Previous Elections";
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.restore_rounded,
                    size: 30,
                    color: _selectedIndex == 1 ? selected : unselected,
                  ),
                  Text(
                    "Previous",
                    style: TextStyle(
                      color: _selectedIndex == 1 ? selected : unselected,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(width: 30),
            MaterialButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                  conductTitle = "Drafts";
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.insert_drive_file_outlined,
                    size: 30,
                    color: _selectedIndex == 2 ? selected : unselected,
                  ),
                  Text(
                    "Drafts",
                    style: TextStyle(
                      color: _selectedIndex == 2 ? selected : unselected,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
                  conductTitle = "Suspended Elections";
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.pause,
                    size: 30,
                    color: _selectedIndex == 3 ? selected : unselected,
                  ),
                  Text(
                    "Suspended",
                    style: TextStyle(
                      color: _selectedIndex == 3 ? selected : unselected,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
