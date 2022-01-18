import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:libartory_management/Screen/LabTest.dart';
import 'package:libartory_management/Screen/addwaiting.dart';
import 'package:libartory_management/Screen/drawer.dart';

class AddLabTest extends StatefulWidget {
  var dc;
  AddLabTest({this.dc});

  @override
  _AddLabTestState createState() => _AddLabTestState();
}

class _AddLabTestState extends State<AddLabTest> {
  final _formkey = GlobalKey<FormState>();
  var name = '';
  var sample = '';
  var actualPrice = '';
  var Discount = '';
  final nameController = TextEditingController();
  final sampleController = TextEditingController();
  final actualPriceController = TextEditingController();
  final DiscountController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    sampleController.dispose();
    actualPriceController.dispose();
    DiscountController.dispose();
    super.dispose();
  }

  add() async {
    await FirebaseFirestore.instance
        .collection('AddLabTest')
        .doc()
        .set({
          'Name': name,
          'Sample': sample,
          'Result Time': '3-7 Days',
          'Home Sampling': 'Home Sampling Available',
          'Actual Price': actualPrice,
          'Discount Price': Discount,
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Falied to add user: $error'));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AddLabTest(),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Add Lab Test",
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
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Name';
                              }
                              return null;
                            }),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(
                              hintText: 'Sample',
                              icon: Icon(
                                FontAwesomeIcons.box,
                                color: Colors.teal[700],
                              ),
                            ),
                            controller: sampleController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Sample Can not be Empty';
                              }
                              return null;
                            }),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                          initialValue: '3-7 Days',
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Result Time',
                            icon: Icon(
                              FontAwesomeIcons.clock,
                              color: Colors.teal[700],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                          initialValue: 'Home Sampling Available',
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Home Sampling',
                            icon: Icon(
                              FontAwesomeIcons.fileMedical,
                              color: Colors.teal[700],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(
                              hintText: 'Actual Price',
                              icon: Icon(
                                Icons.price_check_outlined,
                                color: Colors.teal[700],
                              ),
                            ),
                            controller: actualPriceController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Price';
                              }
                              return null;
                            }),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(
                              hintText: 'Discount Price',
                              icon: Icon(
                                Icons.price_change_rounded,
                                color: Colors.teal[700],
                              ),
                            ),
                            controller: DiscountController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Price';
                              }
                              return null;
                            }),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 40.0,
                        width: 320.0,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.teal[700],
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                name = nameController.text;
                                sample = sampleController.text;
                                actualPrice = actualPriceController.text;
                                Discount = DiscountController.text;
                                add();
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => addwaiting()));

                              (route) => false;
                            }
                          },
                          child: Text(
                            'Add Test',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
