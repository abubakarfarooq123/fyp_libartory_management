import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'drawer.dart';

class RequestBlood extends StatefulWidget {
  @override
  _RequestBloodState createState() => _RequestBloodState();
}

class _RequestBloodState extends State<RequestBlood> {
  final formkey = new GlobalKey<FormState>();
  List<String> bloodGroup = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String selected = '';
  bool _categorySelected = false;
  var CNIC = '';
  var phone = '';
  var quantity = '';
  var setvalue1;
  var description = '';
  DateTime selectedDate = DateTime.now();
  var formattedDate;
  int flag = 0;
  final setvalue1Controller = TextEditingController();
  final quantityController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  void dispose() {
    descriptionController.dispose();
    quantityController.dispose();
    setvalue1Controller.dispose();
    super.dispose();
  }

  submit() async {
    await FirebaseFirestore.instance
        .collection('BloodRequets')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .set({
          'phone': phone,
          'CNIC': CNIC,
          'Blood Group': setvalue1,
          'quantity': quantity,
          'description': description,
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Falied to add user: $error'));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Request Blood",
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
          height: 800.0,
          width: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
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
                  CNIC = data!['CNIC'];
                  phone = data['phone'];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Form(
                        key: formkey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(top: 20.0),
                                          child: DropdownButton(
                                            hint: Text(
                                              'Please choose a Blood Group',
                                              style: TextStyle(
                                                color: Colors.teal[700],
                                              ),
                                            ),
                                            iconSize: 40.0,
                                            value: setvalue1,
                                            onChanged: (newValue) {
                                              setState(() {
                                                setvalue1 = newValue;
                                              });
                                            },
                                            items:
                                                bloodGroup.map((String value) {
                                              return new DropdownMenuItem<
                                                  String>(
                                                value: value,
                                                child: new Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          selected,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            color: Colors.teal[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  18.0, 0, 18.0, 18.0),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Quantity(ML)',
                                    icon: Icon(
                                      FontAwesomeIcons.prescriptionBottle,
                                      color: Colors.teal[700],
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  controller: quantityController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Quantity';
                                    }
                                    return null;
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(FontAwesomeIcons.calendar),
                                    color: Colors.teal[700],
                                  ),
                                  flag == 0
                                      ? Text(
                                          "<< Pick up a Due Date",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15.0),
                                        )
                                      : Text(formattedDate),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: TextFormField(
                                initialValue: CNIC,
                                decoration: InputDecoration(
                                  hintText: 'CNIC',
                                  icon: Icon(
                                    FontAwesomeIcons.idCard,
                                    color: Colors.teal[700],
                                  ),
                                ),
                                maxLength: 15,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  18.0, 1.0, 18.0, 18.0),
                              child: TextFormField(
                                initialValue: phone,
                                decoration: InputDecoration(
                                  hintText: 'Phone',
                                  icon: Icon(
                                    FontAwesomeIcons.mobile,
                                    color: Colors.teal[700],
                                  ),
                                ),
                                maxLength: 14,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 3,
                                  maxLength: 1000,
                                  autofocus: false,
                                  onChanged: (value) {
                                    setState(() {
                                      description = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Description",
                                    icon: Icon(
                                      Icons.description,
                                      color: Colors.teal[700],
                                      size: 30.0,
                                    ),
                                  ),
                                  controller: descriptionController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Description';
                                    }
                                    return null;
                                  }),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            // ignore: deprecated_member_use
                            RaisedButton(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  setState(() {
                                    quantity = quantityController.text;
                                    description = descriptionController.text;
                                    // addUser();
                                  });
                                  submit();
                                }
                              },
                              textColor: Colors.white,
                              padding: EdgeInsets.only(left: 5.0, right: 5.0),
                              color: Colors.teal[700],
                              child: Text("Submit"),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
