import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:lottie/lottie.dart';


class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Container(
          color: Color.fromRGBO(241, 238, 233, 1),
          child: Column(
          
          children: [ 
            const Spacer(),
            Lottie.network("https://assets7.lottiefiles.com/packages/lf20_56Jc5o.json"
            ), //Animation
            // Spacer(flex: 1,),
            Text(
            "We've got you covered!",
            textAlign: TextAlign.center,
            style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(fontWeight: FontWeight.w600),
            
          ),
          const Spacer(flex: 3,),
          ],
          
        ))
      ),
    );
  }
}