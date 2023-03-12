import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/addpicbycameraandgallery.dart';
//import 'package:flutter_application_1/profile.dart';
import 'package:image_picker/image_picker.dart';

//import 'main.dart';

//the add picture page
class picAdd extends StatefulWidget {
  const picAdd({super.key});

  @override
  State<picAdd> createState() => _picAddState();
}

class _picAddState extends State<picAdd> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: IconButton(
      icon: const Icon(Icons.upload),
      onPressed: () {},
    ));
  }
}
