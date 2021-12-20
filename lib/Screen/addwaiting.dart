import 'dart:async';
import 'package:flutter/material.dart';
import 'package:libartory_management/Screen/Drecord.dart';
import 'package:libartory_management/Screen/bloodhub.dart';
import 'package:libartory_management/Screen/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:libartory_management/login.dart';

class addwaiting extends StatefulWidget {
  const addwaiting({Key? key}) : super(key: key);

  @override
  _addwaitingState createState() => _addwaitingState();
}

class _addwaitingState extends State<addwaiting> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BloodHub()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitDoubleBounce(
              color: Colors.teal[700],
              size: 100.0,
            ),
            Text(
              'Adding Data',
              style: TextStyle(
                color: Colors.teal[700],
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
