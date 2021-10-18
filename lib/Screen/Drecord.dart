import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:libartory_management/Screen/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Donor_Record extends StatefulWidget {
  const Donor_Record({Key? key}) : super(key: key);

  @override
  _Donor_RecordState createState() => _Donor_RecordState();
}

class _Donor_RecordState extends State<Donor_Record> {
  final _formkey = GlobalKey<FormState>();
  var name = '';
  var age = '';
  var CNIC = '';
  var setvalue = '';
  var phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Donor Record",
          style: TextStyle(
            fontSize: 40.0,
            fontFamily: "Lato-BoldItalic",
            color: Colors.white,
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: ClipRRect(
        borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(40.0),
            topRight: const Radius.circular(40.0)),
        child: Container(
          height: 1000.0,
          width: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                          autofocus: false,
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
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Age',
                            icon: Icon(
                              FontAwesomeIcons.child,
                              color: Colors.teal[700],
                              size: 25.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'CNIC',
                            icon: Icon(
                              FontAwesomeIcons.idCard,
                              color: Colors.teal[700],
                              size: 25.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Blood Group',
                            icon: Icon(
                              Icons.bloodtype,
                              color: Colors.teal[700],
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Phone',
                            icon: Icon(
                              Icons.phone,
                              color: Colors.teal[700],
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                          maxLines: 7,
                          maxLength: 1000,
                          keyboardType: TextInputType.multiline,
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            icon: Icon(
                              Icons.description,
                              color: Colors.teal[700],
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 40.0,
                        width: 320.0,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.teal[700],
                          onPressed: () {},
                          child: Text(
                            'Post',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
