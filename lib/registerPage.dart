import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:libartory_management/Screen/Address.dart';
import 'package:libartory_management/Screen/home.dart';
import 'package:libartory_management/Screen/registerSplash.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey = new GlobalKey<FormState>();
  var email = '';
  var password = '';
  var name = '';
  var CNIC = '';
  var phone = '';
  var address = '';
  var conformPassword = '';
  var setvalue;
  List<String> bloodGroup = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String selected = '';
  bool _categorySelected = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final conformPasswordController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final CNICController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final setvalueController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    conformPasswordController.dispose();
    bloodGroupController.dispose();
    CNICController.dispose();
    phoneController.dispose();
    addressController.dispose();
    setvalueController.dispose();
    super.dispose();
  }

  Future<void> addUser() async {
    print("UserEmail is :" + email);
    print('Values are ' + name + email + phone);
  }

  Future<User?> registration() async {
    if (password == conformPassword) {
      try {
        User user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: email, password: password))
            .user;
        user.updateProfile(displayName: name);
        await FirebaseFirestore.instance
            .collection('LabortarySystem')
            .doc()
            .set({
              'name': name,
              'email': email,
              'phone': phone,
              'CNIC': CNIC,
              'Adddress': address,
              'Blood Group': setvalue,
              'Profession': "",
              'Age': "",
              'Gender': "",
              "uid": FirebaseAuth.instance.currentUser.uid,
            })
            .then((value) => print('User Added'))
            .catchError((error) => print('Falied to add user: $error'));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Rwaiting(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Password Provided is too weak',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Account already exists',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ));
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "Password and Conform Password Does'nt match",
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ));
    }
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //top bar color
      systemNavigationBarColor: Colors.black, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Colors.teal[700],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Register",
          style: TextStyle(
            fontSize: 45.0,
            fontFamily: "Lato-Bold",
            color: Colors.white,
          ),
        ),
      ),
      body: ClipRRect(
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(40.0),
          topRight: const Radius.circular(40.0),
        ),
        child: Container(
          height: 800.0,
          width: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
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
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
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
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Email';
                              } else if (!value.contains('@')) {
                                return 'Please Enter Valid Email';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Phone',
                              icon: Icon(
                                FontAwesomeIcons.phone,
                                color: Colors.teal[700],
                              ),
                            ),
                            controller: phoneController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your Phone No.';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'CNIC',
                              icon: Icon(
                                FontAwesomeIcons.idCard,
                                color: Colors.teal[700],
                              ),
                            ),
                            controller: CNICController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter CNIC';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          //width: size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: 'Address',
                                icon: Icon(
                                  FontAwesomeIcons.addressBook,
                                  color: Colors.teal[700],
                                ),
                              ),
                              controller: addressController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Your Address';
                                }
                                return null;
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              errorStyle: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15.0,
                              ),
                              icon: Icon(
                                FontAwesomeIcons.lock,
                                color: Colors.teal[700],
                              ),
                            ),
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Password';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Confrom Password',
                              errorStyle: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15.0,
                              ),
                              icon: Icon(
                                FontAwesomeIcons.userLock,
                                color: Colors.teal[700],
                              ),
                            ),
                            controller: conformPasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Conform your Password';
                              }
                              return null;
                            }),
                      ),
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
                                value: setvalue,
                                onChanged: (newValue) {
                                  setState(() {
                                    setvalue = newValue;
                                  });
                                },
                                items: bloodGroup.map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
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
                      // ignore: deprecated_member_use
                      Container(
                        height: 40.0,
                        width: 320.0,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.teal[700],
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              setState(() {
                                name = nameController.text;
                                email = emailController.text;
                                password = passwordController.text;
                                conformPassword =
                                    conformPasswordController.text;
                                CNIC = CNICController.text;
                                address = addressController.text;
                                phone = phoneController.text;
                                // addUser();
                              });
                              registration();
                            }
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Already Have an Accound? "),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.teal[700],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
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
