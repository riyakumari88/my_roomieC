import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/global_variables.dart';

class NextPage extends StatelessWidget {
  final snap;
  const NextPage({
    Key? key,
    required this.snap,
  }) : super(key: key);
  // List data = [
  @override
  Widget build(BuildContext context) {
    return Container(
      // boundary needed for web
      decoration: BoxDecoration(
          border: Border.all(
            color: primaryColor,
          ),
          color: primaryColor,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(children: [
        // HEADER SECTION OF THE POST
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 16,
          ).copyWith(right: 0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                  snap['profImage'],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        snap['username'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //widget.snap['uid'].toString() == user.uid
              IconButton(
                onPressed: () {
                  showDialog(
                    useRootNavigator: false,
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: ListView(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shrinkWrap: true,
                            children: [
                              'Delete',
                            ]
                                .map(
                                  (e) => InkWell(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 16),
                                        child: Text(e),
                                      ),
                                      onTap: () {
                                        // deletePost(
                                        //   widget.snap['postId']
                                        //       .toString(),
                                        // );
                                        // remove the dialog box
                                        Navigator.of(context).pop();
                                      }),
                                )
                                .toList()),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.more_vert),
              )
              // : Container(),
            ],
          ),
        ),
        // IMAGE SECTION OF THE POST
        GestureDetector(
          //onDoubleTap: () {
          //   FireStoreMethods().likePost(
          //     widget.snap['postId'].toString(),
          //     user.uid,
          //     widget.snap['likes'],
          //   );
          //   setState(() {
          //     isLikeAnimating = true;
          //   });
          // },
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                child: Image.network(
                  snap['postUrl'],
                  fit: BoxFit.cover,
                ),
              ),
              // AnimatedOpacity(
              //   duration: const Duration(milliseconds: 200),
              //   opacity: isLikeAnimating ? 1 : 0,
              //   child: LikeAnimation(
              //     isAnimating: isLikeAnimating,
              //     child: const Icon(
              //       Icons.favorite,
              //       color: Colors.white,
              //       size: 100,
              //     ),
              //     duration: const Duration(
              //       milliseconds: 400,
              //     ),
              //     onEnd: () {
              //       setState(() {
              //         isLikeAnimating = false;
              //       });
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ]),
    );
    //   double screenHeight = MediaQuery.of(context).size.height;
    //   double screenWidth = MediaQuery.of(context).size.width;
    //   return MaterialApp(
    //     home: Scaffold(
    //       body: Column(
    //         children: [
    //           Container(
    //             height: screenHeight,
    //             width: screenWidth,
    //             color: Colors.grey.withOpacity(.1),
    //             child: Padding(
    //               padding: EdgeInsets.only(
    //                 left: screenWidth * .03,
    //                 right: screenWidth * .03,
    //                 top: screenHeight * .08,
    //               ),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   SizedBox(
    //                     height: screenHeight * .07,
    //                     width: screenWidth,
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.center,
    //                       children: [
    //                         Container(
    //                           height: screenHeight * .014,
    //                           width: screenWidth * .01,
    //                           decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(10),
    //                               color: Colors.black),
    //                         ),
    //                         Container(
    //                           width: screenWidth * .02,
    //                         ),
    //                         const Text(
    //                           "Check out these",
    //                           style: TextStyle(
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.black,
    //                             fontSize: 15,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: screenHeight * .6,
    //                     width: screenWidth,
    //                     child: ListView.builder(
    //                         physics: const BouncingScrollPhysics(),
    //                         itemCount: data.length,
    //                         itemBuilder: (BuildContext context, index) {
    //                           return Container(
    //                             height: screenHeight * .3,
    //                             width: screenWidth,
    //                             decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(10),
    //                             ),
    //                             child: Stack(
    //                               children: [
    //                                 Container(
    //                                   height: screenHeight * .25,
    //                                   width: screenWidth,
    //                                   decoration: BoxDecoration(
    //                                     borderRadius: BorderRadius.circular(10),
    //                                   ),
    //                                   child: ClipRRect(
    //                                     borderRadius: BorderRadius.circular(25),
    //                                     child: Image.network(
    //                                       data[index]["image"],
    //                                       fit: BoxFit.cover,
    //                                     ),
    //                                   ),
    //                                 ),
    //                                 Container(
    //                                   height: screenHeight * .25,
    //                                   width: screenWidth,
    //                                   decoration: BoxDecoration(
    //                                     borderRadius: BorderRadius.circular(25),
    //                                   ),
    //                                   child: Column(
    //                                     mainAxisAlignment: MainAxisAlignment.end,
    //                                     crossAxisAlignment:
    //                                         CrossAxisAlignment.center,
    //                                     children: [
    //                                       ClipRRect(
    //                                         borderRadius:
    //                                             BorderRadius.circular(8),
    //                                         child: BackdropFilter(
    //                                           filter: ImageFilter.blur(
    //                                               sigmaX: 3, sigmaY: 3),
    //                                           child: Container(
    //                                             height: screenHeight * .06,
    //                                             width: screenWidth * .8,
    //                                             decoration: BoxDecoration(
    //                                                 borderRadius:
    //                                                     BorderRadius.circular(10),
    //                                                 color: Colors.white
    //                                                     .withOpacity(.3)),
    //                                             child: Padding(
    //                                               padding: EdgeInsets.only(
    //                                                   left: screenWidth * .015,
    //                                                   right: screenWidth * .015),
    //                                               child: Row(
    //                                                 mainAxisAlignment:
    //                                                     MainAxisAlignment
    //                                                         .spaceBetween,
    //                                                 crossAxisAlignment:
    //                                                     CrossAxisAlignment.center,
    //                                                 children: [
    //                                                   SizedBox(
    //                                                     height:
    //                                                         screenHeight * .06,
    //                                                     width: screenWidth * .4,
    //                                                     child: Row(
    //                                                       mainAxisAlignment:
    //                                                           MainAxisAlignment
    //                                                               .start,
    //                                                       crossAxisAlignment:
    //                                                           CrossAxisAlignment
    //                                                               .center,
    //                                                       children: [
    //                                                         Container(
    //                                                           height:
    //                                                               screenHeight *
    //                                                                   .01,
    //                                                           width: screenWidth *
    //                                                               .01,
    //                                                           decoration: BoxDecoration(
    //                                                               borderRadius:
    //                                                                   BorderRadius
    //                                                                       .circular(
    //                                                                           15),
    //                                                               color: Colors
    //                                                                   .black),
    //                                                         ),
    //                                                         Container(
    //                                                           width: screenWidth *
    //                                                               .02,
    //                                                         ),
    //                                                         Text(
    //                                                           data[index]
    //                                                               ["title"],
    //                                                           style: const TextStyle(
    //                                                               fontWeight:
    //                                                                   FontWeight
    //                                                                       .bold,
    //                                                               color: Colors
    //                                                                   .black,
    //                                                               fontSize: 12),
    //                                                         ),
    //                                                       ],
    //                                                     ),
    //                                                   ),
    //                                                   SizedBox(
    //                                                     height:
    //                                                         screenHeight * .04,
    //                                                     width: screenWidth * .2,
    //                                                     child: ElevatedButton(
    //                                                       onPressed: () {},
    //                                                       style: ButtonStyle(
    //                                                           backgroundColor:
    //                                                               MaterialStateProperty
    //                                                                   .all(Colors
    //                                                                       .black),
    //                                                           elevation:
    //                                                               MaterialStateProperty
    //                                                                   .all(0),
    //                                                           shape: MaterialStateProperty.all(
    //                                                               RoundedRectangleBorder(
    //                                                                   borderRadius:
    //                                                                       BorderRadius.circular(
    //                                                                           10)))),
    //                                                       child: const Text(
    //                                                         "continue",
    //                                                         style: TextStyle(
    //                                                             fontSize: 10,
    //                                                             color:
    //                                                                 Colors.white),
    //                                                       ),
    //                                                     ),
    //                                                   ),
    //                                                 ],
    //                                               ),
    //                                             ),
    //                                           ),
    //                                         ),
    //                                       ),
    //                                       Container(
    //                                         height: screenHeight * .02,
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           );
    //                         }),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
  }
}
