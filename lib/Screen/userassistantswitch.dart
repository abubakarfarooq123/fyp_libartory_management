import 'package:flutter/material.dart';
import 'package:libartory_management/Screen/LabTest.dart';
import 'package:libartory_management/Screen/bloodhub.dart';
import 'package:libartory_management/Screen/labassistant.dart';
import 'package:libartory_management/Screen/requestor.dart';

class SwitchUserButton extends StatefulWidget {
  const SwitchUserButton({Key? key}) : super(key: key);

  @override
  _SwitchUserButtonState createState() => _SwitchUserButtonState();
}

class _SwitchUserButtonState extends State<SwitchUserButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.teal[700],
        title: Text(
          "User Assistant Switch",
          style: TextStyle(
            fontSize: 25.0,
            fontFamily: "Lato-BoldItalic",
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter as User",
                style: TextStyle(
                  color: Colors.teal[700],
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                color: Colors.teal[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LabTestPage()));
                },
                child: Text(
                  "Click here",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Enter as Lab Assistant",
                style: TextStyle(
                  color: Colors.teal[700],
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                color: Colors.teal[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LabAssistant()));
                },
                child: Text(
                  "Click here",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
