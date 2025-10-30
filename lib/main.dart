import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(
    // //Ex1
    // const MaterialApp(
    //   home: Scaffold(
    //     body: Center(
    //       child: Text(
    //         'Hello my name is Thyrak',
    //         style: TextStyle(fontSize: 30),
    //       ),
    //     ),
    //   ),
    // ),

    //Ex2
    // MaterialApp(
    //   home: Container(
    //     padding: const EdgeInsets.all(30),
    //     margin: const EdgeInsets.all(30),
    //     color: Colors.blue[300],
    //     child: Container(
    //       decoration: BoxDecoration(
    //         color: Colors.blue[600],
    //         borderRadius: const BorderRadius.all(Radius.circular(10)),
    //       ),
    //       child: const Center(
    //         child: Text(
    //           'CADT Student',
    //           style: TextStyle(fontSize: 30, color: Colors.black),
    //         ),
    //       ),
    //     ),
    //   ),
    // ),

    // //Ex3
    // MaterialApp(
    //   home: Container(
    //     padding: const EdgeInsets.all(30),
    //     child: Column(
    //       children: [
    //         Container(
    //           width: double.infinity,
    //           decoration: BoxDecoration(
    //             color: Colors.blue[100],
    //             borderRadius: BorderRadius.all(Radius.circular(50)),
    //           ),
    //           margin: const EdgeInsets.all(20),
    //           child: const Center(
    //             child: Text(
    //               'OOP',
    //               style: TextStyle(fontSize: 30, color: Colors.white),
    //             ),
    //           ),
    //         ),

    //         Container(
    //           width: double.infinity,
    //           decoration: BoxDecoration(
    //             color: Colors.blue[300],
    //             borderRadius: const BorderRadius.all(Radius.circular(50)),
    //           ),
    //           margin: const EdgeInsets.all(20),
    //           child: const Center(
    //             child: Text(
    //               'Dart',
    //               style: TextStyle(fontSize: 30, color: Colors.white),
    //             ),
    //           ),
    //         ),

    //         Container(
    //           width: double.infinity,
    //           decoration: const BoxDecoration(
    //             gradient: LinearGradient(
    //               colors: [
    //                 Color.fromRGBO(100, 181, 246, 1),
    //                 Color.fromRGBO(30, 136, 229, 1),
    //                 Color.fromRGBO(11, 66, 148, 1),
    //                 Color.fromARGB(255, 6, 45, 103),
    //               ],
    //               stops: [0.1, 0.5, 0.75, 0.95],
    //             ),
    //             borderRadius: BorderRadius.all(Radius.circular(50)),
    //           ),
    //           margin: const EdgeInsets.all(20),
    //           child: const Center(
    //             child: Text(
    //               'Flutter',
    //               style: TextStyle(fontSize: 30, color: Colors.white),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ),

    // Ex4
    MaterialApp(
      home: Container(
        padding: const EdgeInsets.all(30),
        child: const Column(
          children: [
            CustomCard(title: 'OOP', color: Color.fromRGBO(187, 222, 251, 1)),
            CustomCard(title: 'DART', color: Color.fromRGBO(100, 181, 246, 1)),
            CustomCard.gradient(
              title: 'FLUTTER',
              gradientColor: [
                    const Color.fromRGBO(100, 181, 246, 1),
                    const Color.fromRGBO(30, 136, 229, 1),
                    const Color.fromRGBO(11, 66, 148, 1),
                    const Color.fromARGB(255, 6, 45, 103),
                  ],
              stops: [0.1, 0.5, 0.75, 0.95],
            ),
          ],
        ),
      ),
    ),
  );
}

class CustomCard extends StatelessWidget {
  final String title;
  final Color? color;
  final List<Color>? gradientColor;
  final List<double>? stops;

  const CustomCard({required this.title, this.color = Colors.blue})
    : gradientColor = null,
      stops = null;

  const CustomCard.gradient({
    required this.title,
    required this.gradientColor,
    required this.stops,
  }) : color = null;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: gradientColor != null
            ? LinearGradient(colors: gradientColor!, stops: stops)
            : null,

        color: gradientColor == null ? color : null,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      margin: const EdgeInsets.all(20),
      child: Center(
        child: Text(title, style: TextStyle(fontSize: 30, color: Colors.white)),
      ),
    );
  }
}
