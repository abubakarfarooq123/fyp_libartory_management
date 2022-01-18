import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:libartory_management/Screen/LabTest.dart';
import 'package:libartory_management/Screen/labassistant.dart';
import 'package:path/path.dart';

class notification_detail extends StatefulWidget {
  var dc;
  notification_detail({this.dc});

  @override
  _notification_detailState createState() => _notification_detailState();
}

class _notification_detailState extends State<notification_detail> {
  final _formkey = GlobalKey<FormState>();
  var email = '';
  var name = '';
  var CNIC = '';
  var phone = '';
  var address = '';
  checkout() async {
    await FirebaseFirestore.instance
        .collection('Checkout')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .set({
          'name': widget.dc.get('Name'),
          'Name': name,
          'email': email,
          'CNIC': CNIC,
          'Phone': phone,
          'Address': address,
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Falied to add user: $error'));
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
            "Detail",
            style: TextStyle(
              fontSize: 45.0,
              fontFamily: "Lato-BoldItalic",
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('LabortarySystem')
                .doc(FirebaseAuth.instance.currentUser.uid)
                .get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                print('somthing went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var data = snapshot.data;
              email = data!['email'];
              name = data['name'];
              phone = data['phone'];
              CNIC = data['CNIC'];
              address = data['Adddress'];
              return Form(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: TextFormField(
                            initialValue: name,
                            autofocus: false,
                            onChanged: (value) => name = value,
                            decoration: InputDecoration(
                              hintText: 'Name',
                              icon: Icon(
                                FontAwesomeIcons.user,
                                color: Colors.teal[700],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: TextFormField(
                            initialValue: email,
                            autofocus: false,
                            onChanged: (value) => email = value,
                            decoration: InputDecoration(
                              hintText: 'Email ID',
                              errorStyle: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15.0,
                              ),
                              icon: Icon(
                                FontAwesomeIcons.envelope,
                                color: Colors.teal[700],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: TextFormField(
                            initialValue: phone,
                            autofocus: false,
                            onChanged: (value) => phone = value,
                            decoration: InputDecoration(
                              hintText: 'Phone',
                              icon: Icon(
                                FontAwesomeIcons.phone,
                                color: Colors.teal[700],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: TextFormField(
                            initialValue: CNIC,
                            autofocus: false,
                            onChanged: (value) => CNIC = value,
                            decoration: InputDecoration(
                              hintText: 'CNIC',
                              icon: Icon(
                                FontAwesomeIcons.idCard,
                                color: Colors.teal[700],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            //width: size.width * 0.8,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: TextFormField(
                              initialValue: address,
                              autofocus: false,
                              onChanged: (value) => address = value,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: 'Address',
                                icon: Icon(
                                  FontAwesomeIcons.home,
                                  color: Colors.teal[700],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            //width: size.width * 0.8,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: TextFormField(
                              initialValue: widget.dc.get('Name'),
                              autofocus: false,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: 'Lab Test Name',
                                icon: Icon(
                                  FontAwesomeIcons.notesMedical,
                                  color: Colors.teal[700],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        Center(
                          child: Container(
                            height: 40.0,
                            width: 340.0,
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              onPressed: () {
                                setState(() {
                                  checkout();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LabAssistant()));
                                });
                              },
                              color: Colors.teal[700],
                              child: Text(
                                'OK',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ]),
                ),
              );
            },
          ),
        ));
  }
}
