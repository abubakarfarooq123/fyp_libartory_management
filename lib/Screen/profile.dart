import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:libartory_management/registerPage.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  final _formkey = GlobalKey<FormState>();
  var email = '';
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
  }

  Widget build(BuildContext context) {
    // ignore: dead_code
    return Scaffold(
      backgroundColor: Colors.teal[700],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Profile",
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
              .doc(FirebaseAuth.instance.currentUser.email)
              .get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              print('somthing went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            var data = snapshot.data;
            var name = data!['name'];
            email = data['email'];
            var phone = data['phone'];
            return Container(
              height: 800.0,
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
                    padding: EdgeInsets.only(top: 20.0),
                    child: new Stack(
                      fit: StackFit.loose,
                      children: <Widget>[
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                                width: 140.0,
                                height: 140.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                  image: new DecorationImage(
                                    image: new ExactAssetImage(
                                        'assets/images/fyp-logo.png'),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 90.0, right: 100.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 25.0,
                                child: new Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: TextFormField(
                      initialValue: name,
                      autofocus: false,
                      onChanged: (value) => {},
                      decoration: InputDecoration(
                        labelText: "Name: ",
                        labelStyle: TextStyle(fontSize: 14.0),
                        icon: Icon(
                          FontAwesomeIcons.user,
                          color: Colors.teal[700],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: TextFormField(
                      initialValue: email,
                      autofocus: false,
                      onChanged: (value) => {},
                      decoration: InputDecoration(
                        labelText: "Email: ",
                        labelStyle: TextStyle(fontSize: 14.0),
                        icon: Icon(
                          FontAwesomeIcons.envelope,
                          color: Colors.teal[700],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: TextFormField(
                      initialValue: phone,
                      autofocus: false,
                      onChanged: (value) => {},
                      decoration: InputDecoration(
                        labelText: "Phone: ",
                        labelStyle: TextStyle(fontSize: 14.0),
                        icon: Icon(
                          FontAwesomeIcons.phone,
                          color: Colors.teal[700],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
