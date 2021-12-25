import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:libartory_management/Screen/LabTest.dart';
import 'package:libartory_management/Screen/newsfeed.dart';

class LabTestwaiting extends StatefulWidget {
  const LabTestwaiting({Key? key}) : super(key: key);

  @override
  _LabTestwaitingState createState() => _LabTestwaitingState();
}

class _LabTestwaitingState extends State<LabTestwaiting> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LabTestPage()));
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
            SpinKitDancingSquare(
              color: Colors.teal[700],
              size: 100.0,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Booking Test',
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
