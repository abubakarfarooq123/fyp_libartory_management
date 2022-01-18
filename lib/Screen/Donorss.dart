import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:libartory_management/Screen/ChatRoom.dart';
import 'package:libartory_management/Screen/chat.dart';
import 'drawer.dart';

class DonorsPage extends StatefulWidget {
  @override
  _DonorsPageState createState() => _DonorsPageState();
}

class _DonorsPageState extends State<DonorsPage> {
  Widget list() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("DonorRecord").snapshots(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot dc = snapshot.data!.docs[index];
                  return SingleChildScrollView(
                    child: Container(
                      height: 300,
                      width: 100,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          child: Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 10, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(200, 0, 0, 0),
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.teal[700],
                                      child: Text(
                                        dc['Blood Group'],
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    dc['name'],
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    dc['phone'],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    dc['description'],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Stack(
                                    fit: StackFit.loose,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 15.0, left: 220),
                                        child: new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            new CircleAvatar(
                                              backgroundColor: Colors.teal[700],
                                              radius: 20.0,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              chatroom(
                                                                userMap: {},
                                                                chatRoomId: '',
                                                              )));

                                                  (route) => false;
                                                },
                                                child: Icon(
                                                  Icons.message,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

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
      body: SingleChildScrollView(
        child: list(),
      ),
    );
  }
}
