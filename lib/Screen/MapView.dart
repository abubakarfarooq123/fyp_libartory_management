import 'package:flutter/material.dart';

import 'drawer.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> with TickerProviderStateMixin {
  late TabController tb;
  @override
  void initState() {
    tb = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
        centerTitle: true,
        title: Text(
          'Near by',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
            fontFamily: 'Lato-BoldItalic',
          ),
        ),
        //TODO Tab Bar
        bottom: TabBar(
          tabs: [
            Text('MapView'),
            Text('ListView'),
          ],
          controller: tb,
          labelStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'Times New Roman',
          ),
          labelPadding: EdgeInsets.only(bottom: 10.0),
          unselectedLabelColor: Colors.white60,
        ),
      ),
      drawer: MyDrawer(),
      //TODO Tab Bar View
      body: TabBarView(
        children: [
          //TODO Caller Timer Function
          mapiew(),
          //TODO Caller Stopwatch Function
          Listview(),
        ],
        // here below we also give/write controller
        // bcz it will work only when both controller would be same
        controller: tb,
      ),
    );
  }

  Widget mapiew() {
    return Center(child: Text('AbuBakar'));
  }

  Widget Listview() {
    return Center(child: Text('ListView'));
  }
}
