import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/responsive/responsive_layout.dart';
import 'package:flutter_application_1/provider/user_provider.dart';
import 'package:flutter_application_1/screens/addpic.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:provider/provider.dart';

import 'responsive/mobile_screen_layout.dart';
import 'responsive/web_screen_layout.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/addpicbycameraandgallery.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyBwfUoWqcsBrd6pcBoaxHFz1KHVQJtM-xE',
          appId: '1:88123645807:web:66f5f8b68cee64ae28129a',
          messagingSenderId: "88123645807",
          projectId: "my-roomie-f996f",
          storageBucket: "my-roomie-f996f.appspot.com"),
    );
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyRoomie',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        // home: const ResponsiveLayout(
        //   mobileScreenLayout: MoblieScreenLayout(),
        //   webScreenLayout: WebScreenLayout(),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // Checking if the snapshot has any data or not
              if (snapshot.hasData) {
                // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }

            // means connection to future hasnt been made yet
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return const LoginScreen();
          },
        ),
        // ),
      ),
    );
  }
}
