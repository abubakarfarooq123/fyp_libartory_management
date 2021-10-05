import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'drawer.dart';

class DonorsPage extends StatefulWidget {
  @override
  _DonorsPageState createState() => _DonorsPageState();
}

class _DonorsPageState extends State<DonorsPage> {
  List<String> donors = [];
  List<String> bloodgroup = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Donors",
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
                      Text('AbuBakar'),
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
                      'A+',
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
                      Text('NabeelRamzan'),
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
                      'A+',
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
                      Text('AbuBakar'),
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
                      'A+',
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
                      Text('NabeelRamzan'),
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
                      'A+',
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
                      Text('AbuBakar'),
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
                      'A+',
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
                      Text('NabeelRamzan'),
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
                      'A+',
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
                      Text('AbuBakar'),
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
                      'A+',
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
                      Text('NabeelRamzan'),
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
                      'A+',
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
