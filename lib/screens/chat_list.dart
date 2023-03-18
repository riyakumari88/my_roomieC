import 'dart:io';
import '../models/firebase_constant.dart';
import '../models/mediaquery.dart';
import '../models/message_chat.dart';
import '../provider/chat_provider.dart';
import '../resources/encrypt.dart';
import '../widgets/chatbubble.dart';
//import 'package:chat_app/constants/Firebasae_constant.dart';
// import 'package:chat_app/models/user.dart';
// import 'package:chat_app/pages/chat_screen.dart';
// import 'package:chat_app/providers/chatProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_application_1/models/user.dart' as model;

import 'chatpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ChatProvider chatProvider = ChatProvider();
  @override
  void initState() {
    // chatProvider.registerNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(FirebaseAuth.instance.currentUser!.uid);
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(226, 97, 231, 124),
        centerTitle: true,
        actions: <Widget>[
          ElevatedButton(
            //textColor: Colors.white,
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            child: Text("Signout"),
            //shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .where('uid',
                  isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: ((context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                model.User user1 =
                    model.User.fromSnap(snapshot.data!.docs[index]);

                return InkWell(
                  autofocus: true,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Chat_Screen(uid: user1.uid),
                        ));
                  },
                  child: ListTile(
                    title: Text(user1.username),
                    subtitle: Text(user1.email),
                  ),
                );
              },
            );
          })),
    );
  }
}
