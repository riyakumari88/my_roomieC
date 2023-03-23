import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart' as model;
import 'package:flutter_application_1/provider/user_provider.dart';
import 'package:flutter_application_1/resources/auth_methods.dart';
import 'package:provider/provider.dart';

import 'chatpage.dart';

class UserInformation extends StatefulWidget {
  //final model.User userdata;
  String uid;
  UserInformation({Key? key, required this.uid}) : super(key: key);
  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  // final String uid;
  String email = '';
  String uid = '';
  String photoUrl = '';
  String username = '';
  String bio = '';
  String age = '';
  String gender = '';
  String budget = '';
  String language = '';
  String specifier = '';
  String uid21 = '';
  // String get uid1 => uid!;
  // String get getspecifier => specifier!;

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  void getUsername() async {
    var uid1 = widget.uid;
    DocumentSnapshot snap =
        await FirebaseFirestore.instance.collection('users').doc(uid1).get();
    setState(() {
      username = (snap.data() as Map<String, dynamic>)["username"];
      email = (snap.data() as Map<String, dynamic>)["email"];
      age = (snap.data() as Map<String, dynamic>)["age"];
      bio = (snap.data() as Map<String, dynamic>)["bio"];
      photoUrl = (snap.data() as Map<String, dynamic>)["photoUrl"];
      gender = (snap.data() as Map<String, dynamic>)["gender"];
      budget = (snap.data() as Map<String, dynamic>)["budget"];
      language = (snap.data() as Map<String, dynamic>)["language"];
      uid21 = (snap.data() as Map<String, dynamic>)["uid"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: Center(
          child: SafeArea(
              minimum: const EdgeInsets.only(top: 100),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(photoUrl),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    username,
                    style: TextStyle(
                      fontSize: 35.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Pacifico",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    bio,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueGrey[200],
                        letterSpacing: 2,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Source Sans Pro"),
                  ),
                  SizedBox(
                    height: 20,
                    width: 200,
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.left,
                    'Age: ' + age,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueGrey[200],
                        letterSpacing: 2.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Source Sans Pro"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.left,
                    'Gender: ' + gender,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueGrey[200],
                        letterSpacing: 2.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Source Sans Pro"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.left,
                    'E-mail: ' + email,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueGrey[200],
                        letterSpacing: 2.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Source Sans Pro"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.left,
                    'Budget in Thousands: ' + budget,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueGrey[200],
                        letterSpacing: 2.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Source Sans Pro"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.left,
                    'Language: ' + language,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueGrey[200],
                        letterSpacing: 2.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Source Sans Pro"),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                    // ignore: prefer_const_constructors
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(255, 0, 0, 60),
                    ),
                    //textColor: Colors.white,
                    autofocus: true,

                    onPressed: () {
                      print(uid21);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Chat_Screen(uid: uid21),
                          ));
                    },
                    child: Text('Chat'),
                    //shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
                  ),
                  // we will be creating a new widget name info carrd

                  //   InfoCard(text: phone, icon: Icons.phone, onPressed: () async {}),
                  //   InfoCard(text: url, icon: Icons.web, onPressed: () async {}),
                  //   InfoCard(
                  //       text: location,
                  //       icon: Icons.location_city,
                  //       onPressed: () async {}),
                  //   InfoCard(text: email, icon: Icons.email, onPressed: () async {}),
                ],
              )),
        ));
  }
}
