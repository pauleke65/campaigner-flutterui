import 'package:campaigner/models/elections.dart';
import 'package:flutter/material.dart';

//Colors
Color primaryColor = Color(0xFF007AFF);
Color textColorLight = Color(0xFFF8F8F8);
Color textColorDark = Color(0xFF727272);
Color infoColorGreen = Color(0xFF4CD964);
Color infoColorRed = Color(0xFFFF2D55);
Color infoColorYellow = Color(0xFFFFCC00);

//Text
String createAccText =
    "Fill all the required details. All the details must be same as on the ID proof.";
String setPinText =
    "You will have to enter this PIN whenever you will enter the app.  Learn more";
String confirmPinText = "Re-Enter your unique PIN, to confirm.";

//data

List<Election> ongoingParticipate = [
  Election(
    name: "President of Student Gymkhana",
    locality: 'LNMIIT, JAIPUR',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
  Election(
    name: "Senator Y16",
    locality: 'LNMIIT, JAIPUR',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
  Election(
    name: "Product Manager",
    locality: 'Xylino, New Delhi',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
  Election(
    name: "Secretary",
    locality: 'Gokuldham Society, Mumbai',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
];

List<Election> previouslyParticipated = [
  Election(
    name: "President of Student Gymkhana",
    locality: 'LNMIIT, JAIPUR',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
  Election(
    name: "Secretary",
    locality: 'Gokuldham Society, Mumbai',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
  Election(
    name: "Senator Y16",
    locality: 'LNMIIT, JAIPUR',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
  Election(
    name: "Product Manager",
    locality: 'Xylino, New Delhi',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
];

List<Election> ongoingElections = [
  Election(
    name: "President of Student Gymkhana",
    locality: 'anjnsjdn, Delhi',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
  Election(
    name: "G. Sec Sports",
    locality: 'anjnsjdn, Delhi',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
  Election(
    name: "General Body Member",
    locality: 'jhbsjk, Haryana',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
];

List<Election> previousElections = [
  Election(
    name: "President",
    locality: 'LNMIIT Jaipur',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
  Election(
    name: "G. Sec Science and Technology",
    locality: 'DAV School, Delhi',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
];

List<Election> draftElections = [
  Election(
    name: "G. Sec Cultural",
    locality: 'DU',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
  Election(
    name: "Class Monitor",
    locality: 'NIT, Agartala',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
  Election(
    name: "G. Sec Cultural",
    locality: 'Xylino, Delhi',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
  Election(
    name: "Class Monitor",
    locality: 'DAV school, Delhi',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
];

List<Election> suspendedElections = [
  Election(
    name: "G. Sec Science and Technology",
    locality: 'anjnsjdn, Delhi',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
  Election(
    name: "Senetor Y16",
    locality: 'LNMIIT, JAIPUR',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
  Election(
    name: "Senator Y16",
    locality: 'anjnsjdn, Delhi',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
  Election(
    name: "G. Sec Science and Technology",
    locality: 'DU',
    from: '10-Oct-2019',
    to: '13-oct-2019',
    startTime: '8:00 AM',
    endTime: '9:00 PM',
  ),
];
