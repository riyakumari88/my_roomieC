import 'dart:io';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../models/firebase_constant.dart';
import '../models/mediaquery.dart';
import '../models/message_chat.dart';
import '../provider/chat_provider.dart';
import '../provider/user_provider.dart';
import '../resources/encrypt.dart';
import '../utils/colors.dart';
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
import 'package:flutter_application_1/screens/user_info.dart';

import 'chatpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ChatProvider chatProvider = ChatProvider();
  String seek = 'RoomSeeker';
  String prov = 'RoomProvider';
  @override
  void initState() {
    // chatProvider.registerNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(FirebaseAuth.instance.currentUser!.uid);
    model.User user = Provider.of<UserProvider>(context).getUser;
    if (user.specifier == 'RoomProvider') {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: SvgPicture.asset(
            'assets/logo.svg',
            //color: Colors.white,
            height: 32,
          ),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users")
                // .where('uid',
                //     isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .where('specifier', isEqualTo: seek)
                //.orderBy('budget')
                .snapshots(),
            builder: ((context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                print('waiting');
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                print('dont have data');
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
                    //  onTap: () => Navigator.of(context).push(
                    //       MaterialPageRoute(
                    //         builder: (context) => const UserInfo(),
                    //       ),
                    //     )
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserInformation(
                              uid: user1.uid,
                            ),
                          ));
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => UserInfo(uid: user1.uid),
                      //     ));
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
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(236, 153, 75, 1),
          centerTitle: true,
          title: SvgPicture.asset(
            'assets/logo.svg',
            //color: Colors.white,
            height: 32,
          ),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users")
                // .where('uid',
                //     isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
                //.orderBy("budget")
                .where('specifier', isEqualTo: 'RoomProvider')
                //.orderBy("budget")
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
                          builder: (context) => UserInformation(
                            uid: user1.uid,
                          ),
                        ),
                      );
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
}
