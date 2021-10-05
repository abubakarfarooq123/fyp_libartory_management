import 'dart:async';
import 'package:flutter/material.dart';
import 'package:libartory_management/Screen/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Waiting extends StatefulWidget {
  const Waiting({Key? key}) : super(key: key);

  @override
  _WaitingState createState() => _WaitingState();
}

class _WaitingState extends State<Waiting> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
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
          SpinKitCircle(
            color: Colors.teal[700],
            size: 100.0,
          ),
          Text(
            'Loging In',
            style: TextStyle(
              color: Colors.teal[700],
              fontSize: 20.0,
            ),
          ),
        ],
      )),
    );
  }
}
