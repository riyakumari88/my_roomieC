import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart' as model;
import 'package:flutter_application_1/provider/user_provider.dart';
import 'package:flutter_application_1/resources/auth_methods.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: SafeArea(
            minimum: const EdgeInsets.only(top: 100),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user.photoUrl),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  user.username,
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
                  user.bio,
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
                  'Age: ' + user.age,
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
                  'Gender: ' + user.gender,
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
                  'E-mail: ' + user.email,
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
                  'Budget in Thousands: ' + user.budget,
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
                  'Language: ' + user.language,
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
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                  child: Text("Signout"),
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
            )));
  }
}
