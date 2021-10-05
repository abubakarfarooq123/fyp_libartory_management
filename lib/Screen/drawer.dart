import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:libartory_management/Screen/LabTest.dart';
import 'package:libartory_management/Screen/requestBlood.dart';
import 'package:libartory_management/Screen/trackorder.dart';
import 'package:libartory_management/login.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal[700],
            ),
            accountName: Text(
              "Abu Bakar",
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
            accountEmail: Text('Abubakar@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'A+',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black54,
                  fontFamily: 'SouthernAire',
                ),
              ),
            ),
          ),
          ListTile(
            title: Text("Home"),
            leading: Icon(
              FontAwesomeIcons.home,
              color: Colors.teal[700],
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            title: Text("Lab Test"),
            leading: Icon(
              FontAwesomeIcons.bookMedical,
              color: Colors.teal[700],
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LabTest()));
            },
          ),
          ListTile(
            title: Text("Blood Requests"),
            leading: Icon(
              FontAwesomeIcons.burn,
              color: Colors.teal[700],
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RequestBlood()));

              //
            },
          ),
          ListTile(
            title: Text("Track Order"),
            leading: Icon(
              FontAwesomeIcons.searchengin,
              color: Colors.teal[700],
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Track()));
            },
          ),
          ListTile(
            title: Text("Notifications"),
            leading: Icon(
              FontAwesomeIcons.bell,
              color: Colors.teal[700],
            ),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => CampaignsPage()));
            },
          ),
          ListTile(
            title: Text("Rate Us"),
            leading: Icon(
              FontAwesomeIcons.solidThumbsUp,
              color: Colors.teal[700],
            ),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => CampaignsPage()));
            },
          ),
          ListTile(
            title: Text("About Us"),
            leading: Icon(
              FontAwesomeIcons.solidAddressCard,
              color: Colors.teal[700],
            ),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => CampaignsPage()));
            },
          ),
          ListTile(
            title: Text("Share App"),
            leading: Icon(
              FontAwesomeIcons.share,
              color: Colors.teal[700],
            ),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => CampaignsPage()));
            },
          ),
          ListTile(
            title: Text("Logout"),
            leading: Icon(
              FontAwesomeIcons.signOutAlt,
              color: Colors.teal[700],
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Login()));

              (route) => false;
            },
          ),
        ],
      ),
    );
  }
}
