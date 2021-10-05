import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'drawer.dart';

class RequestBlood extends StatefulWidget {
  @override
  _RequestBloodState createState() => _RequestBloodState();
}

class _RequestBloodState extends State<RequestBlood> {
  final formkey = new GlobalKey<FormState>();
  List<String> _bloodGroup = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String _selected = '';
  // String _qty;
  // String _phone;
  // String _address;
  bool _categorySelected = false;
  DateTime selectedDate = DateTime.now();
  var formattedDate;
  int flag = 0;

  @override
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
            child: Column(
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
                              padding: EdgeInsets.only(top: 20.0),
                              child: DropdownButton(
                                hint: Text(
                                  'Please choose a Blood Group',
                                  style: TextStyle(
                                    color: Colors.teal[700],
                                  ),
                                ),
                                iconSize: 40.0,
                                items: _bloodGroup.map((val) {
                                  return new DropdownMenuItem<String>(
                                    value: val,
                                    child: new Text(val),
                                  );
                                }).toList(),
                                onChanged: (newValue) {},
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              _selected,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.teal[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Quantity(L)',
                            icon: Icon(
                              FontAwesomeIcons.prescriptionBottle,
                              color: Colors.teal[700],
                            ),
                          ),
                          validator: (value) => value!.isEmpty
                              ? "Quantity field can't be empty"
                              : null,
                          //onSaved: (value) => _qty = value,
                          keyboardType: TextInputType.number,
                        ),
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
                                        color: Colors.black54, fontSize: 15.0),
                                  )
                                : Text(formattedDate),
                          ],
                        ),
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
                          validator: (value) => value!.isEmpty
                              ? "CNIC field can't be empty"
                              : null,
                          //  onSaved: (value) => _phone = value,
                          maxLength: 15,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(18.0, 1.0, 18.0, 18.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            icon: Icon(
                              FontAwesomeIcons.mobile,
                              color: Colors.teal[700],
                            ),
                          ),
                          validator: (value) => value!.isEmpty
                              ? "Phone Number field can't be empty"
                              : null,
                          //  onSaved: (value) => _phone = value,
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      RaisedButton(
                        onPressed: () {},
                        textColor: Colors.white,
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        color: Colors.teal[700],
                        child: Text("SUBMIT"),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
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
