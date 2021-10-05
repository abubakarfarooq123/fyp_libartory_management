import 'dart:async';
import 'package:flutter/material.dart';
import 'package:libartory_management/Screen/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:libartory_management/login.dart';

class Rwaiting extends StatefulWidget {
  const Rwaiting({Key? key}) : super(key: key);

  @override
  _RwaitingState createState() => _RwaitingState();
}

class _RwaitingState extends State<Rwaiting> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
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
              'Registrating ID',
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
