import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Container(
          color: Color.fromRGBO(236, 153, 75, 1),
          child: Column(
          
          children: [ 
            const Spacer(),
            Text(
            "Find your perfect roommate match with",
            textAlign: TextAlign.center,
            style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontWeight: FontWeight.w500),
            

          ),
            //const Spacer(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Lottie.network("https://assets5.lottiefiles.com/private_files/lf30_LOw4AL.json"
              ),
            ), //Animation
            //const Spacer(),
            Text(
            " MyRoomie",
            //style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
            style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(fontWeight: FontWeight.w800),
            
          ),
          Text(
            " your key to hassle-free co-living!",
            textAlign: TextAlign.center,
            style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: FontWeight.w600),
            
          ),

           
          const Spacer(flex: 2,),
          
          ],
          
        ))
      ),
    );
  }
}