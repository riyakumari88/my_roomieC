import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_1/appratmentlayout.dart';
//import 'package:flutter_application_1/profileupdatepage.dart';
import 'package:image_picker/image_picker.dart';

//import 'main.dart';
//import 'profile.dart';

//finally adding
class AddPaages extends StatefulWidget {
  const AddPaages({super.key});

  @override
  State<AddPaages> createState() => _AddPaagesState();
}

class _AddPaagesState extends State<AddPaages> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                      height: 60,
                      child: IconButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const NextPaage()),
                          // );
                        },
                        icon: Icon(Icons.home),
                        color: Colors.black,
                        iconSize: 22,
                        splashRadius: 20,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, right: 0, left: 230),
                  child: Container(
                      height: 10,
                      child: IconButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const NextPage()),
                          // );
                        },
                        icon: Icon(Icons.location_pin),
                        color: Colors.black,
                        iconSize: 23,
                      )),
                ),
                Container(
                    height: 10,
                    child: IconButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const ProfilePaage()),
                        // );
                      },
                      icon: Icon(Icons.contact_emergency),
                      color: Colors.black,
                      iconSize: 20,
                      splashRadius: 20,
                    )),
              ],
            ),
            Container(
                height: 400,
                width: 600,
                child: Image.asset('assets/images/room2.png')),
            Container(
              height: 50,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 5),
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Roomy Name',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(15),
                color: Color.fromRGBO(99, 89, 232, 1),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 5),
                child: TextField(
                    decoration: InputDecoration.collapsed(
                  hintText: 'Details',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(15),
                color: Color.fromRGBO(99, 89, 232, 1),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        final cameras = await availableCameras();
                        final camera = cameras.first;
                        final controllers =
                            CameraController(camera, ResolutionPreset.medium);
                        await controllers.initialize();

                        final image = await controllers.takePicture;

                        // yhn image mil jayega;
                      },
                      icon: Icon(Icons.camera_alt_outlined, size: 20)),
                  SizedBox(width: 40),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        child: Center(
                            child: Text('ADD',
                                style: TextStyle(color: Colors.white))),
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(99, 89, 232, 1))),
                  ),
                  SizedBox(width: 40),
                  IconButton(
                      onPressed: () async {
                        final image = await ImagePicker()
                            .getImage(source: ImageSource.gallery);
                        if (image != null) {
                          // image mil jayega
                        }
                      },
                      icon: Icon(Icons.file_copy_outlined, size: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
