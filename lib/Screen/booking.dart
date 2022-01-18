import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:libartory_management/Screen/checkoutpage.dart';
import 'package:libartory_management/Screen/drawer.dart';
import 'package:libartory_management/Screen/home.dart';
import 'package:libartory_management/Screen/notificationdetail.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  Widget list() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Booking")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection("MyTest")
          .snapshots(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot dc = snapshot.data!.docs[index];
                  return SingleChildScrollView(
                    child: Container(
                      height: 300,
                      width: 100,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          child: Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 10, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(100, 20, 0, 0),
                                    child: Text(
                                      dc['Name'],
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.teal[700],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 20, 0, 0),
                                        child: Text(
                                          'Sample Required',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.teal[700],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 20, 0, 0),
                                        child: Text(
                                          dc['Sample Required'],
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.teal[700],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 20, 0, 0),
                                        child: Text(
                                          'Result In',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.teal[700],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 61,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 20, 0, 0),
                                        child: Text(
                                          dc['Result Time'],
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.teal[700],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 20, 0, 0),
                                        child: Text(
                                          'Actual Price',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.teal[700],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 61,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 20, 0, 0),
                                        child: Text(
                                          dc['Actual Price'],
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.teal[700],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 20, 0, 0),
                                        child: Text(
                                          'Discount Price',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.teal[700],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 45,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 20, 0, 0),
                                        child: Text(
                                          dc['Discount Price'],
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.teal[700],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(240, 10, 0, 0),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage()));
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_outlined,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "My Booking",
          style: TextStyle(
            fontSize: 40.0,
            fontFamily: "Lato-BoldItalic",
            color: Colors.white,
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: list(),
      ),
    );
  }
}
