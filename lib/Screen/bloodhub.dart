import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:libartory_management/Screen/Drecord.dart';
import 'package:libartory_management/Screen/newsfeed.dart';

import 'drawer.dart';

class BloodHub extends StatefulWidget {
  @override
  _BloodHubState createState() => _BloodHubState();
}

class _BloodHubState extends State<BloodHub> {
  var value;
  getLabortararyData() async {
    value = await FirebaseFirestore.instance
        .collection('LabortarySystem')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();
    if (value.exists) {
      return print('Success');
    }
  }

  var donorValue;
  getDonorData() async {
    donorValue = await FirebaseFirestore.instance
        .collection('DonorRecord')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();
    if (donorValue.exists) {
      return print('Success Donor Record');
    } else {
      donorValue = "No Data";
    }
  }

  @override
  Widget build(BuildContext context) {
    getLabortararyData();
    getDonorData();
    return Scaffold(
      backgroundColor: Colors.teal[700],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Donor",
          style: TextStyle(
            fontSize: 45.0,
            fontFamily: "Lato-BoldItalic",
            color: Colors.white,
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Container(
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
              SizedBox(
                height: 20.0,
              ),
              CarouselSlider(
                items: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/2-blood-hub.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/2.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayCurve: Curves.easeInOut,
                  enlargeCenterPage: true,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                child: Text(
                  'What are you looking for ?',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsFeed()));
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
                        child: Container(
                          height: 100.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.feed,
                                    color: Colors.teal[700],
                                    size: 40.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'News Feed',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal[700],
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Donor_Record(
                                      value: value,
                                      donorValue: donorValue,
                                    )));
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
                        child: Container(
                          height: 100.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.description,
                                    color: Colors.teal[700],
                                    size: 40.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Donor Record',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal[700],
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
