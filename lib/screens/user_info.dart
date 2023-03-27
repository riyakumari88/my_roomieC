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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFEC994B),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 60.0, bottom: 30),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Container(
                                    width: 300,
                                    height: 90,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        'https://user-images.githubusercontent.com/88928888/227541608-5058e499-d594-4f17-9ffd-8ed9f95a8deb.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 70.0, left: 120),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(photoUrl),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 150, right: 10),
                            child: Column(
                              children: [
                                Text(
                                  username,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Color(0xFF15133C),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Pacifico",
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 10,
                                  width: 200,
                                  child: Divider(
                                    color: Color(0xFF15133C),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  'Age: ' + age,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF15133C),
                                      letterSpacing: .5,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Source Sans Pro"),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  'Gender: ' + gender,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF15133C),
                                      letterSpacing: .5,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Source Sans Pro"),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  textAlign: TextAlign.left,
                                  'Language: ' + language,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF15133C),
                                      letterSpacing: .5,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Source Sans Pro"),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50.0),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.person)),
                                      Text('Person'),
                                      SizedBox(width: 30),
                                      IconButton(
                                          onPressed: () {},
                                          icon:
                                              const Icon(Icons.more_outlined)),
                                      Text('More'),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  bio,
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Color(0xFF15133C),
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "Source Sans Pro"),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20),
              child: Card(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      height: 20,
                      child: const Text(
                        textAlign: TextAlign.left,
                        'Information',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0, left: 20),
                          child: Icon(Icons.email_outlined),
                        ),
                        Text(
                          textAlign: TextAlign.left,
                          'E-mail: ' + email,
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF15133C),
                              fontWeight: FontWeight.bold,
                              fontFamily: "Source Sans Pro"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0, left: 20),
                          child: Icon(Icons.money_off_sharp),
                        ),
                        Text(
                          'Budget in Thousands: ' + budget,
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF15133C),
                              fontWeight: FontWeight.bold,
                              fontFamily: "Source Sans Pro"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0, left: 20),
                          child: Icon(Icons.call),
                        ),
                        Text(
                          'Phone number : 9134567890',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF15133C),
                              fontWeight: FontWeight.bold,
                              fontFamily: "Source Sans Pro"),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      // ignore: prefer_const_constructors
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(25, 0, 255, 0.769),
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
