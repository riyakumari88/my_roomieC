// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/models/user.dart' as model;
// import 'package:flutter_application_1/resources/auth_methods.dart';

// class UserProfile extends StatelessWidget {
//   const UserProfile({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String _auth = FirebaseAuth.instance.currentUser!.uid;
//     DocumentSnapshot<Map<String, dynamic>> snap =
//         FirebaseFirestore.instance.collection("users").doc(_auth).snapshots();
//     model.User user = model.User.fromSnap(snap as DocumentSnapshot<Object?>);
//     return Container(
//       child: CircleAvatar(
//         radius: 16,
//         backgroundImage: NetworkImage(
//           user['photoUrl'],
//         ),
//       ),
//     );
//   }
// }
