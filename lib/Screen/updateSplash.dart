import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:libartory_management/Screen/profile.dart';

class updatesplash extends StatefulWidget {
  const updatesplash({Key? key}) : super(key: key);

  @override
  _updatesplashState createState() => _updatesplashState();
}

class _updatesplashState extends State<updatesplash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => profile()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitCubeGrid(
              color: Colors.teal[700],
              size: 100.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Updating Profile',
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
