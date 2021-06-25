import 'package:campaigner/configuration.dart';
import 'package:campaigner/custom/election_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParticipateScreen extends StatefulWidget {
  @override
  _ParticipateScreenState createState() => _ParticipateScreenState();
}

class _ParticipateScreenState extends State<ParticipateScreen>
    with TickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
          "Ongoing Elections",
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
        // bottom:
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              unselectedLabelColor: Colors.grey[600],
              labelColor: primaryColor,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w400,
              ),
              controller: _controller,
              tabs: [
                Tab(text: 'Ongoing Elections'),
                Tab(text: 'Previously Participated'),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: TabBarView(
              controller: _controller,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'verification');
                  },
                  child: ElectionListWidget(
                      color: infoColorGreen,
                      width: width,
                      elections: ongoingParticipate),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: ElectionListWidget(
                      color: primaryColor,
                      width: width,
                      elections: previouslyParticipated),
                ),
              ],
            ),
          )
        ],
      ),
      // body: TabBarView(
      //   controller: _controller,
      //   children: [
      //     ElectionWidget(width: width),
      //     Switch(value: true, onChanged: (_) {}),
      //   ],
      // ),
    );
  }
}
