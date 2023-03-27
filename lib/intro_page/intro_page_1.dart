import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Container(
          color: Color.fromRGBO(236, 153, 75, 1),
          child: Column(
          
          children: [ 
             Spacer(flex: 2,),
            Lottie.network("https://assets4.lottiefiles.com/packages/lf20_k8n414ip.json"
            
            ),
             //Animation
            Spacer(flex: 1,),
            Text(
            "In search of a cool roommate?",
            textAlign: TextAlign.center,
            style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(fontWeight: FontWeight.w500),
            
          ),
            Spacer(flex: 3,),
          ],
          
        ))
      ),
    );
  }
}