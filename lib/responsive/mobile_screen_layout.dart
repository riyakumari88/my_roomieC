import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart' as model;
import 'package:flutter_application_1/provider/user_provider.dart';
import 'package:flutter_application_1/utils/global_variables.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  _MobileScreenLayoutState createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  // String specifier = UserProvider().getspecifier;

  // @override
  // void initState() {
  //   super.initState();
  //   getUsername();
  // }

  // void getUsername() async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();
  //   setState(() {
  //     username = (snap.data() as Map<String, dynamic>)["username"];
  //   });
  // }
  int _page = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    if (user.specifier == 'RoomProvider') {
      return Scaffold(
        body: PageView(
          children: homeScreenItemsprovider,
          // physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: CupertinoTabBar(
          //height: 50,
          iconSize: 25,
          height: 70,
          backgroundColor: Colors.white30,
          activeColor: Colors.black,
          items: [
            // BottomNavigationBarItem(
            //     icon: Icon(
            //       Icons.home,
            //       color:
            //           _page == 0 ? Color.fromRGBO(0, 0, 0, 1) : secondaryColor,
            //     ),
            //     label: '',
            //     backgroundColor: Color.fromRGBO(0, 0, 255, 60)),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.messenger_rounded,
                  color:
                      _page == 0 ? Color.fromRGBO(0, 0, 0, 1) : secondaryColor,
                ),
                label: '',
                backgroundColor: Color.fromRGBO(0, 0, 255, 60)),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.upload_file_rounded,
                  color:
                      _page == 1 ? Color.fromRGBO(0, 0, 0, 1) : secondaryColor,
                ),
                label: '',
                backgroundColor: Color.fromRGBO(0, 0, 255, 60)),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color:
                      _page == 2 ? Color.fromRGBO(0, 0, 0, 1) : secondaryColor,
                ),
                label: '',
                backgroundColor: Color.fromRGBO(0, 0, 255, 60)),
          ],
          onTap: navigationTapped,
        ),
      );
    } else {
      return Scaffold(
        body: PageView(
          children: homeScreenItemsSeecker,
          // physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: CupertinoTabBar(
          //height: 50,
          iconSize: 25,
          height: 70,
          backgroundColor: Colors.white30,
          activeColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color:
                      _page == 0 ? Color.fromRGBO(0, 0, 0, 1) : secondaryColor,
                ),
                label: '',
                backgroundColor: Color.fromRGBO(0, 0, 255, 60)),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.messenger_rounded,
                  color:
                      _page == 1 ? Color.fromRGBO(0, 0, 0, 1) : secondaryColor,
                ),
                label: '',
                backgroundColor: Color.fromRGBO(0, 0, 255, 60)),
            // BottomNavigationBarItem(
            //     icon: Icon(
            //       Icons.upload_file_rounded,
            //       color:
            //           _page == 2 ? Color.fromRGBO(0, 0, 0, 1) : secondaryColor,
            //     ),
            //     label: '',
            //     backgroundColor: Color.fromRGBO(0, 0, 255, 60)),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color:
                      _page == 2 ? Color.fromRGBO(0, 0, 0, 1) : secondaryColor,
                ),
                label: '',
                backgroundColor: Color.fromRGBO(0, 0, 255, 60)),
          ],
          onTap: navigationTapped,
        ),
      );
    }
  }
}
