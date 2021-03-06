import 'dart:async';
import 'package:flutter/material.dart';
import 'package:libartory_management/Screen/bloodhub.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:libartory_management/Screen/newsfeed.dart';

class NewsFeedwaiting extends StatefulWidget {
  const NewsFeedwaiting({Key? key}) : super(key: key);

  @override
  _NewsFeedwaitingState createState() => _NewsFeedwaitingState();
}

class _NewsFeedwaitingState extends State<NewsFeedwaiting> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NewsFeed()));
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
            SpinKitFadingFour(
              color: Colors.teal[700],
              size: 100.0,
            ),
            Text(
              'Sending to News Feed',
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
