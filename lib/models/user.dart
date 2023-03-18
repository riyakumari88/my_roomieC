import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final String age;
  final String gender;
  final String budget;
  final String language;
  final String specifier;

  const User({
    required this.username,
    required this.uid,
    required this.photoUrl,
    required this.email,
    required this.bio,
    required this.age,
    required this.gender,
    required this.budget,
    required this.language,
    required this.specifier,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      bio: snapshot["bio"],
      age: snapshot["age"],
      gender: snapshot["gender"],
      budget: snapshot["budget"],
      language: snapshot["language"],
      specifier: snapshot["specifier"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "bio": bio,
        "age": age,
        "gender": gender,
        "budget": budget,
        "language": language,
        "specifier": specifier,
      };
}
