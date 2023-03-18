import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/add_post_screen.dart';
import 'package:flutter_application_1/screens/chat_list.dart';
import 'package:flutter_application_1/screens/chatpage.dart';
import 'package:flutter_application_1/screens/home.dart';

import '../screens/user_profile.dart';
// import 'package:flutter_application_1/screens/feed_screen.dart';
// import 'package:flutter_application_1/screens/profile_screen.dart';
// import 'package:flutter_application_1/screens/search_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItemsProvider = [
  //const FeedScreen(),
  //const SearchScreen(),
  //Home(),
  HomePage(),
  AddPostScreen(),
  UserProfile(),

  //const Text('notifications'),
  // ProfileScreen(
  //   uid: FirebaseAuth.instance.currentUser!.uid,
  // ),
];
List<Widget> homeScreenItemsSeecker = [
  //const FeedScreen(),
  //const SearchScreen(),
  Home(),
  HomePage(),
  // AddPostScreen(),
  UserProfile(),

  //const Text('notifications'),
  // ProfileScreen(
  //   uid: FirebaseAuth.instance.currentUser!.uid,
  // ),
];
