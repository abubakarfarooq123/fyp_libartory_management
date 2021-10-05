import 'package:flutter/material.dart';

import 'MapView.dart';
import 'drawer.dart';

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    drawer:
    MyDrawer();
    return Scaffold(
      backgroundColor: Colors.teal[700],
      body: MapView(),
    );
  }
}
