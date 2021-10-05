import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'drawer.dart';

class BloodBank extends StatefulWidget {
  @override
  _BloodBankState createState() => _BloodBankState();
}

class _BloodBankState extends State<BloodBank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "BloodBank",
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Blood Bank THQ'),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.message),
                          onPressed: () {},
                          color: Colors.teal[700],
                        ),
                      ),
                    ],
                  ),
                  leading: CircleAvatar(
                    child: Text(
                      'A',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.teal[700],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.phone),
                    onPressed: () {},
                    color: Colors.teal[700],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Excel Lab Burewala'),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.message),
                          onPressed: () {},
                          color: Colors.teal[700],
                        ),
                      ),
                    ],
                  ),
                  leading: CircleAvatar(
                    child: Text(
                      'E',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.teal[700],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.phone),
                    onPressed: () {},
                    color: Colors.teal[700],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Albaraka Bank'),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.message),
                          onPressed: () {},
                          color: Colors.teal[700],
                        ),
                      ),
                    ],
                  ),
                  leading: CircleAvatar(
                    child: Text(
                      'A',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.teal[700],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.phone),
                    onPressed: () {},
                    color: Colors.teal[700],
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
