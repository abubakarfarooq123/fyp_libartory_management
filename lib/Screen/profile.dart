import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:libartory_management/Screen/updateSplash.dart';

class profile extends StatefulWidget {
  profile({
    Key? key,
  }) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  File? imageFile;
  Future getImage(ImageSource source) async {
    await ImagePicker.pickImage(source: source).then((xFile) {
      if (xFile != null) {
        imageFile = File(xFile.path);
        uploadImage();
      }
    });
  }

  Future uploadImage() async {
    var ref = FirebaseStorage.instance.ref().child('images');

    var uploadTask = await ref.putFile(imageFile!);

    String imageUrl = await uploadTask.ref.getDownloadURL();
  }

  final _formkey = GlobalKey<FormState>();
  var email = '';
  var name = '';
  var CNIC = '';
  var phone = '';
  var address = '';
  var setvalue;
  var Profession;
  var Age;
  var Gender;
  Future updateUser(
    name,
    email,
    phone,
    CNIC,
    address,
    setvalue,
    Profession,
    Age,
    Gender,
  ) async {
    await FirebaseFirestore.instance
        .collection("LabortarySystem")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({
      'name': name,
      'email': email,
      'phone': phone,
      'CNIC': CNIC,
      'Adddress': address,
      'Blood Group': setvalue,
      'Profession': Profession,
      'Age': Age,
      'Gender': Gender,
    });
  }

  @override
  void dispose() {
    super.dispose();
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
              .doc(FirebaseAuth.instance.currentUser.uid)
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
            email = data!['email'];
            name = data['name'];
            phone = data['phone'];
            CNIC = data['CNIC'];
            address = data['Adddress'];
            setvalue = data['Blood Group'];
            Profession = data['Profession'];
            Age = data['Age'];
            Gender = data['Gender'];

            return Form(
              key: _formkey,
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
                      padding: EdgeInsets.only(top: 20.0),
                      child: new Stack(
                        fit: StackFit.loose,
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new CircleAvatar(
                                radius: 80.0,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 120.0, right: 100.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new CircleAvatar(
                                  backgroundColor: Colors.teal[700],
                                  radius: 25.0,
                                  child: GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: ((builder) => bottomSheet()),
                                      );
                                    },
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
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
                              initialValue: setvalue,
                              autofocus: false,
                              onChanged: (value) => setvalue = value,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: 'Blood Group',
                                icon: Icon(
                                  Icons.bloodtype,
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
                              initialValue: Profession,
                              autofocus: false,
                              onChanged: (value) => Profession = value,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: 'Profession',
                                icon: Icon(
                                  FontAwesomeIcons.businessTime,
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
                              initialValue: Age,
                              autofocus: false,
                              onChanged: (value) => Age = value,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: 'Age',
                                icon: Icon(
                                  FontAwesomeIcons.child,
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
                              initialValue: Gender,
                              autofocus: false,
                              onChanged: (value) => Gender = value,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: 'Gender',
                                icon: Icon(
                                  FontAwesomeIcons.neuter,
                                  color: Colors.teal[700],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            height: 40.0,
                            width: 340.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  updateUser(name, email, phone, CNIC, address,
                                      setvalue, Profession, Age, Gender);
                                }
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => updatesplash()));
                              },
                              color: Colors.teal[700],
                              child: Text(
                                'Update',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
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
            );
          },
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 7.0,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.camera,
                color: Colors.teal[700],
                size: 30.0,
              ),
              onPressed: () {
                getImage(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            SizedBox(
              width: 40.0,
            ),
            FlatButton.icon(
              icon: Icon(
                Icons.image,
                color: Colors.teal[700],
                size: 30.0,
              ),
              onPressed: () {
                getImage(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }
}
